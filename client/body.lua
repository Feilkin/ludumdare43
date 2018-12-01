-- AABB body
local class = require "middleclass"
local vector = require "hump.vector"

local Body = class("Body")

function Body:initialize(size)
	self.position = vector(0, 0)
	self.size = size
	self.speed = vector(0, 0)
	self.acceleration = vector(0, 300)
end

function Body:setPos(x, y)
	self.position.x, self.position.y = x, y
	self._update = true
end

function Body:getPos()
	return self.position.x, self.position.y
end

function Body:getSize()
	return self.size.x, self.size.y
end

function Body:teleport(point)
	self.position = point
	self.speed = vector(0, 0)
	self._update = true
end

return Body