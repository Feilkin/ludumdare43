-- the player entity

local class = require "middleclass"
local vector = require "hump.vector"

local Entity = require "entity"
local Body = require "body"
local Animation = require "animation"
local Knife = require "projectiles.knife"

local Player = class("Player", Entity)

function Player:initialize()
	self.team = "player"
	Entity.initialize(self, vector(15, 32))
	self.animation = Animation("res/animations/player.lua", "idle")
	self.throw_cooldown = 0
	self.sprite = "player_idle_1"
end

function Player:update(dt)
	if self.throw_cooldown > 0 then
		self.throw_cooldown = self.throw_cooldown - dt
	end
end

function Player:getQuadName()
	return self.animation:getFrame()
end

function Player:spawn(point)
	self.body:teleport(point)
end

function Player:can_throw()
	return self.throw_cooldown <= 0
end

function Player:throw_knife()
	local knife = Knife()
	local px, py = self.body:getPos()
	knife.body:setPos(px + (self.flip_x and -1 or 16), py + 8)
	knife.body.speed.x = 300 * (self.flip_x and -1 or 1) + love.math.random() * 10 - 5
	knife.body.speed.y = -50
	knife.flip_x = self.flip_x

	self.throw_cooldown = 1

	Signal.emit("player_throw")

	return knife
end

return Player