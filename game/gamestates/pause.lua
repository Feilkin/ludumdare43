local pause = {}

function pause:init()

end

function pause:enter(previous, ...)
	self.from = previous
end

function pause:leave()

end

function pause:resume()

end

function pause:update(dt)

end

function pause:draw()
	local w, h = love.graphics.getDimensions()
	self.from:draw()
	love.graphics.setColor(0, 0, 0, 0.5)
	love.graphics.rectangle("fill", 0, 0, w, h)
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.printf("PAUSED", 0, h / 4 - 16, w / 2, "center")
	love.graphics.printf("[p] to continue, [esc] to quit", 0, h / 4 + 16, w / 2, "center")
	love.graphics.printf("Hint: you can press [r] to restart the level", 0, h / 4 + 35, w / 2, "center")
end

function pause:focus(focus) end

function pause:keypressed(key, code, isrepeat)
	if key == "p" then
		Gamestate.pop()
	elseif key == "escape" then
		love.event.quit()
	end
end

function pause:keyreleased(key, code) end
function pause:mousepressed(x, y, button, istouch, presses) end
function pause:mousereleased(x, y, button, istouch, presses) end
function pause:joystickpressed(joystick, button) end
function pause:joystickreleased(joystick, button) end
function pause:quit() end

return pause