-- the player entity

local class = require "middleclass"
local vector = require "hump.vector"
local machine = require "statemachine"

local Body = require "body"
local Entity = require "entity"
local Animation = require "animation"
local Fireball = require "projectiles.fireball"

local Singoblisa = class("Singoblisa", Entity)

function Singoblisa:initialize(world)
	Entity.initialize(self, vector(30, 46), world)
	self.team = "goblin"
	self.animation = Animation("res/animations/singoblisa.lua", "idle")
	self.sprite = self.animation:getFrame()
	self.health = 10
	self.souls = 100
	self.invulnerable = true

	Timer.script(function(wait)
		-- prefight
		wait(1)
		Signal.emit("play_sound", "boss", "boss_prefight")
		wait(8)
		self.body:teleport(vector(248, 386))
		Signal.emit("play_sound", "boss", "you_die_now")
		wait(5)
		self.invulnerable = false

		-- combat sequence
		while self.health > 1 do
			if love.math.random() < 0.2 then
				Signal.emit("play_sound", "boss", "turnip_theheat")
			end
			wait(2)
			self.animation:switch("cast")
			-- shoot fireballs everywhere
			for i = 60, 290, 5 do
				local a = math.rad(i)
				local sx = math.sin(a) * 100
				local sy = math.cos(a) * 100

				local fireball = Fireball()
				local px, py = self.body:getPos()
				fireball.body:setPos(px + 16, py - 3)
				fireball.body.speed.x = sx
				fireball.body.speed.y = sy

				world:addEntity(fireball)
				Signal.emit("play_sound", "effects", "fireball_shoot")
				wait(0.01)
			end

			self.animation:switch("idle")
			do
				local tx, ty = world.player.body:getPos()
				self.flip_x = self.body.position.x > tx
			end
			wait(3)
			self.body:teleport(vector(248, 54)) -- go up
			wait(2)

			if love.math.random() < 0.2 then
				Signal.emit("play_sound", "boss", "OBLIVION")
			end

			-- drop teh bomb
			self.animation:switch("cast")
			for x = 37, 474, 7 do
				local fireball = Fireball()
				fireball.body:setPos(x, 175)
				fireball.body.speed.x = 0
				fireball.body.speed.y = 300

				world:addEntity(fireball)
				Signal.emit("play_sound", "effects", "fireball_shoot")
				wait(0.02)
			end
			self.animation:switch("idle")
			do
				local tx, ty = world.player.body:getPos()
				self.flip_x = self.body.position.x > tx
			end
			wait(4)

			-- try something cool
			self.animation:switch("cast")
			for i = 1, 10 do
				local fireball = Fireball()
				local px, py = self.body:getPos()
				fireball.body:setPos(px + 16, py - 3)
				fireball.body.speed.x = 0
				fireball.body.speed.y = 0
				fireball.fly_speed = 100
				fireball.homing_target = world.player
				fireball.time_left = 5

				fireball.filter = function(item)
					if item.is_player then
						return "cross"
					end

					return nil
				end

				world:addEntity(fireball)
				Signal.emit("play_sound", "effects", "fireball_shoot")
				wait(0.1)
			end
			self.animation:switch("idle")
			do
				local tx, ty = world.player.body:getPos()
				self.flip_x = self.body.position.x > tx
			end

			wait(2)

			self.body:teleport(vector(248, 386))
		end

			self.body:teleport(vector(248, 386))
	end)
end

function Singoblisa:onCollide(col)
end

function Singoblisa:spawn(point)
	self.body:teleport(point)
end

function Singoblisa:onDeath()
	Signal.emit("enemy_died", self)
	Timer.after(10, function()
		Gamestate.switch(GAMESTATES.victory)
	end)
end

return Singoblisa