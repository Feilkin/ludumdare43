-- the player entity

local class = require "middleclass"
local vector = require "hump.vector"

local Entity = require "entity"
local Body = require "body"
local Animation = require "animation"
local Knife = require "projectiles.knife"

local Player = class("Player", Entity)

function Player:initialize()
	self.is_player = true
	self.team = "player"
	Entity.initialize(self, vector(14, 32))
	self.animation = Animation("res/animations/player.lua", "idle")
	self.throw_cooldown = 0
	self.sprite = "player_idle_1"
	self.souls = 0
	self.max_health = 10
	self.air_time = 0
end

function Player:update(dt)
	if self.body.on_ground then
		self.air_time = 0
	else
		self.air_time = self.air_time + dt
	end

	if self.throw_cooldown > 0 then
		self.throw_cooldown = self.throw_cooldown - dt
	end

	if (not self.body.on_ground) and
		((self.body.speed.y > 100) or (self.body.speed.y < -100)) and
		(self.animation.current_animation ~= "fall") then
		self.animation:switch("fall")
	end
end

function Player:spawn(point)
	self.animation:switch("idle")
	self.body:teleport(point)
	self.health = self.max_health
	self.souls = 0
end

function Player:can_throw()
	return self.throw_cooldown <= 0
end

function Player:throw_knife()
	local knife = Knife()
	local px, py = self.body:getPos()
	knife.body:setPos(px + (self.flip_x and -1 or 16), py + 16)
	knife.body.speed.x = 300 * (self.flip_x and -1 or 1) + love.math.random() * 10 - 5
	knife.body.speed.y = -50
	knife.flip_x = self.flip_x

	self.throw_cooldown = 1

	Signal.emit("player_throw")
	self.animation:push("throw")

	return knife
end

function Player:onCollide(col)
	Entity.onCollide(self, col)

	if col.other.type == "voice_trigger" then
		if col.other.properties.repeats == "once" and col.other.properties._triggered then
			return
		end

		Signal.emit("play_sound", col.other.properties.slot, col.other.properties.voice)

		if col.other.properties.repeats == "once" then
			col.other.properties._triggered = true
		end
	end

	if col.other.type == "checkpoint" then
		self.checkpoint = col.other
		col.other.animation:switch("lit")
	end

	--if col.other.type == "platform" then
	--	self.body.speed.x = col.other.speed_x
	--end

	if col.other.properties and col.other.properties.message then
		self.message = col.other.properties.message
	end

	table.insert(self.on_objects, col.other)
end

function Player:onDeath()
	Timer.after(2, function()
		Signal.emit("player_respawn")
	end)
end

return Player