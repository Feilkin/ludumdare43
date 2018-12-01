local class = require "middleclass"

local Body = require "body"

local Projectile = class("Projectile")

function Projectile:initialize(size, sprite)
	self.spritesheet = "projectiles"
	self.is_projectile = true
	self.body = Body(size)
	self.sprite = sprite
	self.time_left = self.lifetime
end

function Projectile:getQuadName()
	return self.sprite
end

function Projectile:onCollide(col)
	self.body.immobile = true
	Signal.emit("projectile_hit", self, col)
end

function Projectile:filter(other)
	if other.team == self.team or other.is_particle then
		return nil
	end

	return "slide"
end

return Projectile