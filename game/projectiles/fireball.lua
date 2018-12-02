local class = require "middleclass"
local vector = require "hump.vector"

local Animation = require "animation"
local Projectile = require "projectile"

local Fireball = class("Fireball", Projectile)

function Fireball:initialize()
	self.lifetime = 5
	Projectile.initialize(self, vector(3, 3), "fireball_1")
	self.body.acceleration.y = 0
	self.team = "goblin"
	self.damage = 3
	self.animation = Animation("res/animations/fireball.lua", "idle")
end

function Fireball:onCollide(col, world)
	Projectile.onCollide(self, col, world)
	self.time_left = 0
end

function Fireball:filter(other)
	if other.team == self.team or other.is_particle or other.is_projectile then
		return nil
	end

	if other.properties then
		if other.properties.collision_type then
			return other.properties.collision_type == "slide"
		end

		if other.properties.ladder then
			return nil
		end
		if other.type == "voice_trigger" then
			return nil
		end
	end

	if (other.type == "door") and other.properties.open then
		return nil
	end
	
	if other.type == "checkpoint" then
		return "cross"
	end

	if other.type == "exit" then
		return "cross"
	end

	return "touch"
end

return Fireball