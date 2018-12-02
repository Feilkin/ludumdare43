local settings = {}

function settings:init()
	self.buttons = {
		{ "Volume", type = "slider", range = {0, 10}, value = "volume" },
		{ "Particles", type = "slider", range = {1, 10}, value = "particles" },
		{ "Back", function()
		Gamestate.pop()
		end, type = "button" },
	}
end

function settings:enter(previous, ...)
	self.selected_index = 1

	self.volume = SETTINGS.volume
	self.particles = SETTINGS.particles
end

function settings:leave()
	love.audio.setVolume(self.volume / 10)
	SETTINGS.volume = self.volume
	SETTINGS.particles = self.particles
end

function settings:resume()

end

function settings:update(dt)

end

function settings:draw()
	love.graphics.clear(COLORS[2])
	love.graphics.print("Don't forget to rate :)", 4, 4)

	for i, item in ipairs(self.buttons) do
		if i == self.selected_index then
			love.graphics.setColor(COLORS[9])
			love.graphics.print(">", 8, 150 + i * 12)
		end

		local text = item[1]
		if item.type == "slider" then
			text = text .. ": " .. self[item.value]
		end

		love.graphics.print(text, 16, 150 + i * 12)
		love.graphics.setColor(1, 1, 1, 1)
	end

	love.graphics.setColor(COLORS[16])
	love.graphics.printf("[left] / [right] to adjust", 0, 288, 400, "center")

	love.graphics.setColor(1, 1, 1, 1)
end

function settings:focus(focus) end

function settings:keypressed(key, code, isrepeat)
	if key == "up" then
		self.selected_index = self.selected_index - 1
		if self.selected_index < 1 then
			self.selected_index = #self.buttons
		end
	elseif key == "down" then
		self.selected_index = self.selected_index + 1
		if self.selected_index > #self.buttons then
			self.selected_index = 1
		end
	end

	local item = self.buttons[self.selected_index]
	if key == "left" then
		if (item.type == "slider") and (self[item.value] > item.range[1]) then
			self[item.value] = self[item.value] - 1
		end
	elseif key == "right" then
		if (item.type == "slider") and (self[item.value] < item.range[2]) then
			self[item.value] = self[item.value] + 1
		end
	elseif key == "c" or key == "return" then 
		if item[2] then
			item[2]()
		end
	end
end

function settings:keyreleased(key, code) end
function settings:mousepressed(x, y, button, istouch, presses) end

function settings:mousemoved(x, y, dx, dy, istouch)
	-- to scaled coords
	x, y = x / 2, y / 2
	-- check if mouse was released over any of the buttons
	for i, item in ipairs(self.buttons) do
		local item_length = FONTS.body:getWidth(item[1])
		if (x > 16) and (x < (16 + item_length)) and (y > 150 + i * 12) and (y < 150 + i * 12 + 12) then
			self.selected_index = i
		end
	end
end

function settings:mousereleased(x, y, button, istouch, presses)
	-- to scaled coords
	x, y = x / 2, y / 2
	-- check if mouse was released over any of the buttons
	if button == 1 then
		for i, item in ipairs(self.buttons) do
			local item_length = FONTS.body:getWidth(item[1])
			if (x > 16) and (x < (16 + item_length)) and (y > 150 + i * 12) and (y < 150 + i * 12 + 12) then
				self.buttons[i][2]()
			end
		end
	end
end

function settings:joystickpressed(joystick, button) end
function settings:joystickreleased(joystick, button) end
function settings:quit() end

return settings