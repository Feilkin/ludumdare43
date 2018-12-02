local settings = {}

function settings:init()

end

function settings:enter(previous, ...)

end

function settings:leave()

end

function settings:resume()

end

function settings:update(dt)

end

function settings:draw()

end

function settings:focus(focus) end
function settings:keypressed(key, code, isrepeat) end
function settings:keyreleased(key, code) end
function settings:mousepressed(x, y, button, istouch, presses) end
function settings:mousereleased(x, y, button, istouch, presses) end
function settings:joystickpressed(joystick, button) end
function settings:joystickreleased(joystick, button) end
function settings:quit() end

return settings