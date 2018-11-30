local splash = {}

function splash:init()
	self.background_image = love.graphics.newImage("res/images/splash.png")
end

function splash:enter(previous, ...)
	Timer.after(3, function()
		Gamestate.switch(GAMESTATES.menu)
	end)
end

function splash:leave()

end

function splash:resume()

end

function splash:update(dt)

end

function splash:draw()
	love.graphics.draw(self.background_image, 0,0)
end

function splash:focus(focus) end
function splash:keypressed(key, code, isrepeat) end
function splash:keyreleased(key, code) end
function splash:mousepressed(x, y, button, istouch, presses) end
function splash:mousereleased(x, y, button, istouch, presses) end
function splash:joystickpressed(joystick, button) end
function splash:joystickreleased(joystick, button) end
function splash:quit() end

return splash