local class = require "middleclass"
local vector = require "hump.vector"

local Particle = require "particle"
local Animation = require "animation"

local Soul = class("Soul", Particle)

function Soul:initialize()
	self.lifetime = 25
	Particle.initialize(self, vector(4, 4), "soul_1")
	self.animation = Animation("res/animations/soul.lua", "blink")
	self.animation.dt_buffer = love.math.random() * 1/12

	self.body.speed.y = love.math.random(-100, -150)
	self.body.speed.x = love.math.random(-25, 25)
	self.fly_speed = love.math.random(175, 225)
	self.body.acceleration.y = 0
end

function Soul:filter(other)
	if other.is_player then
		return "cross"
	end

	return nil
end

function Soul:onCollide(col)
	col.other.souls = col.other.souls + 1
	self.time_left = 0
	Signal.emit("play_sound", "effects", "soul_pickup")
end

return Soul