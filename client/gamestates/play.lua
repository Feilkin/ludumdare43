local play = {}

local bump = require "bump"
local sti = require "sti"
local vector = require "hump.vector"
local Camera = require "hump.camera"
local tiny = require "tiny"

local Player = require "entities.player"
local Goblin = require "entities.goblin"
local Spritesheet = require "spritesheet"
local Particle = require "particle"
local Knife = require "projectiles.knife"

local animationSystem = require "systems.animations"
local lifetimeSystem = require "systems.lifetimes"
local physicsSystem = require "systems.physics"
local spriteRenderer = require "systems.spriterenderer"

local monsters = {}
monsters["Goblin"] = Goblin

local blood_sprites = { "blood_1", "blood_2", "blood_3" }
local dust_sprites = { "dust_1", "dust_2", "dust_3" }

Signal.register("projectile_hit", function(p, col)
	local b = p.body
	for i = 1, love.math.random(50, 100) do
		local sprite = blood_sprites[love.math.random(1, #blood_sprites)]
		local pp = Particle(vector(1,1), sprite)
		pp.body:setPos(b.position.x + (p.flip_x and 0 or b.size.x), b.position.y)
		pp.body.speed.y = love.math.random(-50, 50)
		pp.body.speed.x = (love.math.random() * 50 - 10) * col.normal.x
		play.world:add(pp)
	end
end)

Signal.register("entity_jump", function(entity)
	-- TODO: get right dust particle
	local b = entity.body
	local x, y = b:getPos()
	local w, h = b:getSize()
	for i = 1, love.math.random(15, 30) do
		local sprite = dust_sprites[love.math.random(1, #dust_sprites)]
		local pp = Particle(vector(1,1), sprite)
		pp.time_left = 0.2
		pp.body:setPos(x + w / 2, y + h - 1)
		pp.body.speed.y = love.math.random(-20, -50)
		pp.body.speed.x = love.math.random(-100, 100)
		play.world:add(pp)
	end
end)

function play:loadSpritesheet(name)
	local data = love.filesystem.load("res/sprites/" .. name ..".lua")
	local sheet = Spritesheet("res/sprites/" .. name ..".png", data())
	local batch = sheet:newSpritebatch()

	self.spritesheets[name] = sheet
	self.spritebatches[name] = batch
end

function play:init()
	self.spritesheets = {}
	self.spritebatches = {}
	self:loadSpritesheet("entities")
	self:loadSpritesheet("projectiles")
	self:loadSpritesheet("particles")
end

function play:enter(previous, ...)

	self.player = Player()
	self.camera = Camera(0, 0)

	love.mouse.setVisible(false)

	self:loadLevel()
end

function play:loadMap(filename)
	self.map = sti(filename, { "bump" })

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

	self.map:bump_init(self.world.bump_world)
end

function play:initWorld()
	local bump_world = bump.newWorld(64)
	local world = tiny.world()

	world.bump_world = bump_world
	world.sheets = self.spritesheets
	world.batches = self.spritebatches

	world:add(animationSystem, physicsSystem, spriteRenderer, lifetimeSystem)
	world:add(self.player)

	self.world = world

	print(self.world.bump_world)
end

function play:loadLevel()
	self:initWorld()

	self:loadMap("res/maps/level_1.lua")

	-- find spawn and place player at it
	local spawn = self.map:findObject("objects", "spawn_1_1")
	self.player.body:teleport(vector(spawn.x, spawn.y))


	-- spawn enemies
	local spawners = self.map:findAll("objects", "monster_spawn")
	for _, spawner in ipairs(spawners) do
		local monster = monsters[spawner.properties.monster_type]()
		local w, h = monster.body:getSize()
		monster.body:teleport(vector(spawner.x, spawner.y - h))
		self.world:addEntity(monster)
	end
end

function play:leave()
	love.mouse.setVisible(true)
end

function play:resume()

end

function play:update(dt)
	self:handle_input(dt)
	self.world:update(dt)

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
		if player.animation.current_animation ~= "walk" then
			player.animation:switch("walk")
		end
		player.flip_x = false
	elseif love.keyboard.isDown("left") then
		player.body.speed.x = -75
		if player.animation.current_animation ~= "walk" then
			player.animation:switch("walk")
		end
		player.flip_x = true
	else
		player.body.speed.x = 0
		if player.animation.current_animation == "walk" then
			player.animation:switch("idle")
		end
	end

	if love.keyboard.isDown("x") and player:can_throw() then
		local knife = player:throw_knife()
		self.world:addEntity(knife)
	end

	if player.body.on_ground and love.keyboard.isDown("space") then
		player.body.speed.y = -150
		Signal.emit("entity_jump", player)
	end

end

function play:draw()
	local cx, cy = self.camera:position()
	local gw, gh = love.graphics.getDimensions()
	self.map:draw(-cx + gw/4, -cy + gh/4, 2, 2)

	love.graphics.push()
	love.graphics.reset() -- hack to get zoom to work because im lazy
	self.camera:attach()
	self:draw_entities()
	self.camera:detach()
	love.graphics.pop()
end

function play:draw_entities()
	for name, b in pairs(self.spritebatches) do
		love.graphics.draw(b, 0,0)
	end
end

function play:focus(focus) end
function play:keypressed(key, code, isrepeat) end
function play:keyreleased(key, code) end
function play:mousepressed(x, y, button, istouch, presses) end
function play:mousereleased(x, y, button, istouch, presses) end
function play:joystickpressed(joystick, button) end
function play:joystickreleased(joystick, button) end
function play:quit() end

return play