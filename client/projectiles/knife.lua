local class = require "middleclass"
local vector = require "hump.vector"

local Projectile = require "projectile"

local Knife = class("Knife", Projectile)

function Knife:initialize()
	self.lifetime = 5
	Projectile.initialize(self, vector(10, 4), "knife")
	self.team = "player"
end

return Knife