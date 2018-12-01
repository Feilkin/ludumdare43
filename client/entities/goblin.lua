-- the player entity

local class = require "middleclass"
local vector = require "hump.vector"

local Body = require "body"
local Entity = require "entity"
local Animation = require "animation"

local Goblin = class("Goblin", Entity)

function Goblin:initialize()
	Entity.initialize(self, vector(15, 26))
	self.team = "goblin"
	self.animation = Animation("res/animations/goblin.lua", "idle")
	self.sprite = self.animation:getFrame()
	self.health = 3
	self.souls = 10
end

function Goblin:getQuadName()
	return self.animation:getFrame()
end

function Goblin:spawn(point)
	self.body:teleport(point)
end

return Goblin