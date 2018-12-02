local class = require "middleclass"

local Body = require "body"

local Projectile = class("Projectile")

function Projectile:initialize(size, sprite)
	self.spritesheet = "projectiles"
	self.is_projectile = true
	self.body = Body(size)
	self.sprite = sprite
	self.time_left = self.lifetime
	self.damage = 0
end

function Projectile:getQuadName()
	return self.sprite
end

function Projectile:onCollide(col)
	if col.type == "touch" then
		self.body.immobile = true
		Signal.emit("projectile_hit", self, col)
		if col.other.take_damage then
			col.other:take_damage(self.damage)
		end
	end
end

function Projectile:filter(other)
	if other.team == self.team or other.is_particle then
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

return Projectile