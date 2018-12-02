local class = require "middleclass"
local vector = require "hump.vector"

local Projectile = require "projectile"

local Knife = class("Knife", Projectile)

function Knife:initialize()
	self.lifetime = 5
	Projectile.initialize(self, vector(10, 4), "knife")
	self.team = "player"
	self.damage = 1
end

function Knife:onCollide(col, world)
	Projectile.onCollide(self, col, world)

	-- attach to enemy
	if col.other.body then
		self.attach_to = col.other
		local x, y = col.other.body:getPos()
		self.attach_offset = vector(col.touch.x - x, col.touch.y - y)
		self.attach_to_flipped = col.other.flip_x
		self.attach_self_flipped = self.flip_x
		world:addEntity(self)
	end
end

return Knife