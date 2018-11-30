local pause = {}

function pause:init()

end

function pause:enter(previous, ...)

end

function pause:leave()

end

function pause:resume()

end

function pause:update(dt)

end

function pause:draw()

end

function pause:focus(focus) end
function pause:keypressed(key, code, isrepeat) end
function pause:keyreleased(key, code) end
function pause:mousepressed(x, y, button, istouch, presses) end
function pause:mousereleased(x, y, button, istouch, presses) end
function pause:joystickpressed(joystick, button) end
function pause:joystickreleased(joystick, button) end
function pause:quit() end

return pause