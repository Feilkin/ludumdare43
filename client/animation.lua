-- animation system stuff

local class = require "middleclass"

local Animation = class("Animation")

function Animation:initialize(filename, initial)
	self.data = love.filesystem.load(filename)()
	self.dt_buffer = 0
	self.current_frame = 1
	self.current_animation = initial
end

function Animation:update(dt)
	if not self.current_animation then return end
	self.dt_buffer = self.dt_buffer + dt
	local anim = self.data[self.current_animation]
	if self.dt_buffer >= (1 / anim.framerate) then
		self.dt_buffer = 0
		self.current_frame = self.current_frame + 1
		if self.current_frame > #anim then
			self.current_frame = 1
		end
	end
end

function Animation:switch(name)
	if not self.data[name] then
		error("No animation named " .. name)
	end
	self.current_frame = 1
	self.dt_buffer = 0
	self.current_animation = name
end

function Animation:getFrame()
	if not self.current_frame then return end
	return self.data[self.current_animation][self.current_frame]
end

return Animation