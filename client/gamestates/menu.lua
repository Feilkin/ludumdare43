local menu = {}

function menu:init()

end

function menu:enter(previous, ...)

end

function menu:leave()

end

function menu:resume()

end

function menu:update(dt)

end

function menu:draw()
	love.graphics.print("insert menu here", 4, 4)
end

function menu:focus(focus) end
function menu:keypressed(key, code, isrepeat) end
function menu:keyreleased(key, code) end
function menu:mousepressed(x, y, button, istouch, presses) end
function menu:mousereleased(x, y, button, istouch, presses) end
function menu:joystickpressed(joystick, button) end
function menu:joystickreleased(joystick, button) end
function menu:quit() end

return menu