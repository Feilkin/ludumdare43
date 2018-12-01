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
	self.body.speed.y = 0
	self.body.speed.x = 0
end

function Particle:filter(other)
	if other.is_particle or other.is_entity or other.is_projectile or other.is_player then
		return nil
	end

	if other.properties then
		if other.properties.ladder then
			return nil
		end
		if other.type == "voice_trigger" then
			return nil
		end
	end

	return "cross"
end

return Particle