local class = require "middleclass"

local Body = require "body"

local Entity = class("Entity")

function Entity:initialize(size)
	self.spritesheet = "entities"
	self.is_entity = true
	self.body = Body(size)
	self.flip_x = false
	self.health = 1
end

function Entity:getQuadName()
	return self.sprite
end

function Entity:onCollide(col)
	if col.other.type == "spike" then
		self:take_damage(100)
		Signal.emit("spawn_blood", self, col, love.math.random(50, 75))
	end
end

function Entity:canTakeDamage()
	return not self.invulnerable
end

function Entity:take_damage(damage)
	self.health = self.health - damage
	self.body.speed.y = self.body.speed.y - 25
	self.invulnerable = true
	Timer.after(0.3, function()
		self.invulnerable = false
	end)
end

function Entity:onDeath()

end

function Entity:filter(other)
	if other.is_projectile or other.is_particle then
		return nil
	end

	if other.properties then
		if other.properties.collision_type then
			return other.properties.collision_type
		end

		if other.properties.ladder then
			return "cross"
		end
		if (other.type == "voice_trigger") or
			(other.type == "altar") then
			return "cross"
		end
	end

	if (other.type == "door") and other.properties.open then
		return "cross"
	end

	if other.type == "spike" then
		return "cross"
	end

	if other.type == "checkpoint" then
		return "cross"
	end

	return "slide"
end

return Entity