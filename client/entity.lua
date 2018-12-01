local class = require "middleclass"

local Body = require "body"

local Entity = class("Entity")

function Entity:initialize(size)
	self.spritesheet = "entities"
	self.is_entity = true
	self.body = Body(size)
	self.flip_x = false
end

function Entity:getQuadName()
	return self.sprite
end

function Entity:onCollide(col)

end

function Entity:filter(other)
	if other.is_projectile or other.is_particle then
		return nil
	end

	return "slide"
end

return Entity