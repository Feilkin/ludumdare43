local menu = {}

function menu:init()
	self.buttons = {
		{ "Return to menu", function()
			Gamestate.switch(GAMESTATES.menu)
		end },
		{ "Quit", function()
			love.event.quit()
		end },
	}

	self.flash_timer = 0
	self.flash_color = 1
end

function menu:enter(previous, ...)
	self.selected_index = 1
end

function menu:leave()

end

function menu:resume()

end

function menu:update(dt)
	self.flash_timer = self.flash_timer + dt
	if self.flash_timer >= 0.1 then
		self.flash_timer = 0
		self.flash_color = self.flash_color + 1
		if self.flash_color > #COLORS then
			self.flash_color = 1
		end
	end
end

function menu:draw()
	love.graphics.clear(COLORS[2])
	love.graphics.setColor(COLORS[self.flash_color])
	love.graphics.print("Don't forget to rate :)", 4, 4)
	love.graphics.setColor(1, 1, 1, 1)

	for i, item in ipairs(self.buttons) do
		if i == self.selected_index then
			love.graphics.setColor(COLORS[9])
			love.graphics.print(">", 8, 150 + i * 12)
		end
		love.graphics.print(item[1], 16, 150 + i * 12)
		love.graphics.setColor(1, 1, 1, 1)
	end

	love.graphics.setColor(COLORS[9])
	love.graphics.setFont(FONTS.header)
	love.graphics.printf("You WON!", 0, 130, 400, "center")

	love.graphics.setFont(FONTS.body)
	love.graphics.setColor(1, 1, 1, 1)
end

function menu:focus(focus) end

function menu:keypressed(key, code, isrepeat)
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
	elseif key == "c" or key == "return" then 
		self.buttons[self.selected_index][2]()
	end
end

function menu:keyreleased(key, code) end
function menu:mousepressed(x, y, button, istouch, presses) end

function menu:mousemoved(x, y, dx, dy, istouch)
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

function menu:mousereleased(x, y, button, istouch, presses)
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

function menu:joystickpressed(joystick, button) end
function menu:joystickreleased(joystick, button) end
function menu:quit() end

return menu