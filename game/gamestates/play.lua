local play = {}

local bump = require "bump"
local sti = require "sti"
local vector = require "hump.vector"
local Camera = require "hump.camera"
local tiny = require "tiny"

local Animation = require "animation"
local Player = require "entities.player"
local Goblin = require "entities.goblin"
local Spritesheet = require "spritesheet"
local Particle = require "particle"
local Knife = require "projectiles.knife"
local Soul = require "particles.soul"

local animationSystem = require "systems.animations"
local lifetimeSystem = require "systems.lifetimes"
local physicsSystem = require "systems.physics"
local spriteRenderer = require "systems.spriterenderer"
local deathSystem = require "systems.deaths"
local homingSystem = require "systems.homings"
local aiSystem = require "systems.ais"
local attachSystem = require "systems.attachs"
local platformSystem = require "systems.platforms"

local monsters = {}
monsters["Goblin"] = Goblin
monsters["Singoblisa"] = require "entities.singoblisa"

local blood_sprites = { "blood_1", "blood_2", "blood_3" }
local dust_sprites = { "dust_1", "dust_2", "dust_3" }

function play:registerSignals()
	local play = self

	Signal.register("spawn_blood", function(e, col, amount)
		local b = e.body
		local sp = vector(1,1)
		for i = 1, amount * (SETTINGS.particles / 10) do
			local sprite = blood_sprites[love.math.random(1, #blood_sprites)]
			local p = Particle(sp, sprite)
			p.body:setPos(b.position.x + (e.flip_x and 0 or b.size.x), b.position.y)
			p.body.speed.y = love.math.random(-50, 50)
			p.body.speed.x = (love.math.random() * 50 - 10) * col.normal.x
			p.time_left = love.math.random() * 1 + 1
			play.world:add(p)
		end
	end)

	Signal.register("projectile_hit", function(p, col)
		if col.other.is_entity then
			Timer.during(1, function()
				Signal.emit("spawn_blood", p, col, love.math.random(1, 5))
			end)
		else
			local b = p.body
			local sp = vector(1,1)
			for i = 1, love.math.random(20, 40) * (SETTINGS.particles / 10) do
				local sprite = dust_sprites[love.math.random(1, #dust_sprites)]
				local pp = Particle(sp, sprite)
				pp.body:setPos(b.position.x + (p.flip_x and 0 or b.size.x), b.position.y)
				pp.body.speed.y = love.math.random(-50, 50)
				pp.body.speed.x = (love.math.random() * 50 - 10) * col.normal.x
				pp.time_left = love.math.random() * 1 + 0.5
				play.world:add(pp)
			end
		end
	end)

	Signal.register("entity_jump", function(entity)
		-- TODO: get right dust particle
		local b = entity.body
		local x, y = b:getPos()
		local w, h = b:getSize()
		for i = 1, love.math.random(15, 30) * (SETTINGS.particles / 10) do
			local sprite = dust_sprites[love.math.random(1, #dust_sprites)]
			local pp = Particle(vector(1,1), sprite)
			pp.time_left = 0.2
			pp.body:setPos(x + w / 2, y + h - 1)
			pp.body.speed.y = love.math.random(-20, -50)
			pp.body.speed.x = love.math.random(-100, 100)
			play.world:add(pp)
		end
	end)

	Signal.register("play_sound", function(slot, sound_name)
		local sound = play.sounds[slot][sound_name]
		sound.source:play()
		if sound.message then
			play.player.message = sound.message

			if sound.message_duration then
				Timer.during(sound.message_duration, function()
					play.player.message = sound.message
				end)
			end
		end
	end)

	Signal.register("player_throw", function()
		play.sounds["effects"]["throw"].source:play()
	end)

	Signal.register("switch_level", function(switch_to)
		play:loadLevel(switch_to)
	end)

	Signal.register("entity_jump", function(entity)
		if entity == play.player then
			play.sounds["effects"]["player_jump"].source:play()
		end
	end)

	Signal.register("projectile_hit", function(p, col)
		local sound
		if col.other.is_entity then
			sound = play.sounds["effects"]["hit"]
		else
			sound = play.sounds["effects"]["hit_ground"]
		end
		sound.source:play()
	end)

	Signal.register("entity_land", function(e, col, speed_y)
		if speed_y > 300 then
			local sound = play.sounds["effects"]["entity_land"]
			sound.source:play()
		end
	end)

	Signal.register("enemy_died", function(e)
		-- spawn souls
		local x, y = e.body:getPos()
		local w, h = e.body:getSize()
		local reward = e.souls
		Timer.every(0.05, function()
			local s = Soul()
			s.time_left = 25
			s.body:setPos(x + w / 2, y + 2)
			Timer.after(0.3, function()
				s.homing_target = play.player
				play.world:addEntity(s)
			end)
			play.world:add(s)
		end, reward)
	end)

	Signal.register("player_respawn", function(e)
		play:loadLevel(self.current_level)
	end)
end

function play:loadSpritesheet(name)
	local data = love.filesystem.load("res/sprites/" .. name ..".lua")
	local sheet = Spritesheet("res/sprites/" .. name ..".png", data())
	local batch = sheet:newSpritebatch( 2048, "stream")

	self.spritesheets[name] = sheet
	self.spritebatches[name] = batch
end

function play:loadSounds()
	self.sounds = {}
	self.sounds.boss = self:loadSound("res/sounds/boss/singoblisa")
	self.sounds.effects = self:loadSound("res/sounds/effects/effects")
end

function play:loadSound(filename)
	local data = require(filename)
	for _, s in pairs(data) do
		s.source = love.audio.newSource(s.file, "static")
	end

	return data
end

function play:init()
	self.spritesheets = {}
	self.spritebatches = {}
	self:loadSpritesheet("entities")
	self:loadSpritesheet("projectiles")
	self:loadSpritesheet("particles")
	self:loadSpritesheet("objects")

	self:loadSounds()

	self:registerSignals()
end

function play:enter(previous, ...)

	self.player = Player()
	self.camera = Camera(0, 0)

	love.mouse.setVisible(false)

	self:loadLevel("level_1")
end

function play:loadMap(filename)
	self.map = sti(filename, { "bump", "navpath" })

    self.map.findObject = function (self, layername, name)
        for _, v in ipairs(self.layers[layername].objects) do
            if v.name == name then return v end
		end
    end

    self.map.findAll = function (self, layername, type)
    	local ret = {}
        for _, v in ipairs(self.layers[layername].objects) do
            if v.type == type then table.insert(ret, v) end
		end

		return ret
	end

	local objectLayer = self.map.layers["objects"]
	local object_sheet = self.spritesheets.objects
	local object_batch = self.spritebatches.objects

	function objectLayer:draw()
		object_batch:clear()
		for _, obj in ipairs(self.objects) do
			if obj.properties.sprite then
				local q = object_sheet:getQuad(obj.properties.sprite)
				object_batch:add(q, obj.x, obj.y)
			end
		end

		love.graphics.draw(object_batch)
	end

	self.map:bump_init(self.world.bump_world)
end

function play:initWorld()
	local world
	if self.world then
		Timer.clear()
		tiny.clearEntities(self.world)
		tiny.clearSystems(self.world)
		tiny.refresh(self.world)
	end

	world = tiny.world()
	local bump_world = bump.newWorld(16)
	world.bump_world = bump_world

	world:add(aiSystem, animationSystem, platformSystem, physicsSystem, homingSystem,
		attachSystem, lifetimeSystem, deathSystem, spriteRenderer)

	world.sheets = self.spritesheets
	world.batches = self.spritebatches

	world:add(self.player)
	world.player = self.player

	self.world = world
end

function play:loadLevel(name)
	self.current_level = name
	self:initWorld()
	self:loadMap("res/maps/" .. name .. ".lua")

	-- find spawn and place player at it
	local spawn
	if self.player.checkpoint then
		spawn = self.player.checkpoint
	else
		spawn = self.map:findObject("objects", "spawn_1")
		self.player.checkpoint = spawn
	end

	self.player:spawn(vector(spawn.x, spawn.y - self.player.body.size.y))

	-- add platforms
	local platforms = self.map:findAll("objects", "platform")
	for _, platform in ipairs(platforms) do
		platform.platform = true
		self.world:addEntity(platform)
	end

	-- add bonfires
	local bonfires = self.map:findAll("objects", "checkpoint")
	for _, bonfire in ipairs(bonfires) do
		bonfire.animation = Animation("res/animations/bonfire.lua", "idle")
		self.world:addEntity(bonfire)
	end

	-- spawn enemies
	local spawners = self.map:findAll("objects", "monster_spawn")
	for _, spawner in ipairs(spawners) do
		local monster = monsters[spawner.properties.monster_type](self.world)
		local w, h = monster.body:getSize()
		monster:spawn(vector(spawner.x, spawner.y - h))
		monster.patrol_min_x = spawner.properties.patrol_min_x
		monster.patrol_max_x = spawner.properties.patrol_max_x
		print(monster.patrol_min_x, monster.patrol_max_x)
		self.world:addEntity(monster)
	end
end

function play:leave()
	love.mouse.setVisible(true)
end

function play:resume()

end

function play:update(dt)
	self.player.on_objects = {}
	self:handle_input(dt)
	self.world:update(dt)
	self.map:update(dt)
	self.player:update(dt)

	-- update camera
	local x, y = self.player.body:getPos()
	self.camera:lookAt(x, y)
	self.camera:zoomTo(2)
end

function play:handle_input(dt)
	local player = self.player
	if love.keyboard.isDown("right") then
		player.body.speed.x = 75
		if player.body.on_ground and
			((player.animation.current_animation == "idle") or
			(player.animation.current_animation == "fall")) then
			player.animation:switch("walk")
		end
		player.flip_x = false
	elseif love.keyboard.isDown("left") then
		player.body.speed.x = -75
		if player.body.on_ground and
			((player.animation.current_animation == "idle") or
			(player.animation.current_animation == "fall")) then
			player.animation:switch("walk")
		end
		player.flip_x = true
	else
		player.body.speed.x = 0
		if (player.animation.current_animation == "walk") or
			(player.animation.current_animation == "fall") then
			player.animation:switch("idle")
		end
	end

	if love.keyboard.isDown("down") and player.body.on_ladder then
		player.body.speed.y = 75
	elseif love.keyboard.isDown("up") and player.body.on_ladder then
		player.body.speed.y = -75
	end

	if love.keyboard.isDown("x") and player:can_throw() then
		local knife = player:throw_knife()
		self.world:addEntity(knife)
	end

	if (player.body.on_ground or (player.air_time < 0.3)) and love.keyboard.isDown("space") then
		player.body.speed.y = -100
		if player.body.on_ground then
			player.air_time = 0
			Signal.emit("entity_jump", player)
		end
	end

end

function play:draw()
	local cx, cy = self.camera:position()
	local gw, gh = love.graphics.getDimensions()
	self.map:draw(-cx + gw/4, -cy + gh/4, 2, 2)

	love.graphics.push()
	love.graphics.origin()
	self.camera:attach()
		self:draw_entities()

		if self.player.message then
			local msg = self.player.message
			local x, y = self.player.body:getPos()
			local w = FONTS.body:getWidth(msg)
			love.graphics.print(msg, x - w / 2, y - 12)
			self.player.message = nil
		end
	self.camera:detach()
	love.graphics.pop()

	love.graphics.print("Souls: " .. self.player.souls, 2, 2)
	love.graphics.print("Health: " .. self.player.health, 2, 12)
end

function play:draw_entities()
	for name, b in pairs(self.spritebatches) do
		love.graphics.draw(b, 0,0)
	end
end

function play:focus(focus) end

function play:keypressed(key, code, isrepeat)
	if key == "c" then
		local on_objects = self.player.on_objects
		for _, obj in ipairs(on_objects) do
			if obj.type == "altar" then
				if self.player.souls >= obj.properties.soul_cost then
					self.player.souls = self.player.souls - obj.properties.soul_cost
					obj.properties.sprite = "altar_filled"

					local door = self.map:findObject("objects", obj.properties.unlocks)
					door.properties.open = true
					door.properties.sprite = "soul_gate_open"
					Signal.emit("play_sound", "effects", "soul_gate_open")
				end
			end
		end
	elseif key == "p" then
		Gamestate.push(GAMESTATES.pause)
	elseif key == "r" then
		self:loadLevel(self.current_level)
	end
end

function play:keyreleased(key, code) end
function play:mousepressed(x, y, button, istouch, presses) end
function play:mousereleased(x, y, button, istouch, presses) end
function play:joystickpressed(joystick, button) end
function play:joystickreleased(joystick, button) end
function play:quit() end

return play