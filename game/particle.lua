local class = require "middleclass"

local Body = require "body"

local Particle = class("Particle")

function Particle:initialize(size, sprite)
	self.spritesheet = "particles"
	self.is_particle = true
	self.body = Body(size)
	self.sprite = sprite
	self.time_left = 10
end

function Particle:getQuadName()
	return self.sprite
end

function Particle:onCollide(col)
end

function Particle:filter(other)
	if other.is_particle or other.is_entity or other.is_projectile or other.is_player then
		return nil
	end

	if other.properties then
		if other.properties.collision_type then
			return other.properties.collision_type
		end

		if other.properties.ladder then
			return nil
		end
		if other.type == "voice_trigger" then
			return nil
		end
	end

	if (other.type == "door") and other.properties.open then
		return "cross"
	end
	
	if other.type == "checkpoint" then
		return "cross"
	end

	return "bounce"
end

return Particle