local play = {}

function play:init()

end

function play:enter(previous, ...)

end

function play:leave()

end

function play:resume()

end

function play:update(dt)

end

function play:draw()

end

function play:focus(focus) end
function play:keypressed(key, code, isrepeat) end
function play:keyreleased(key, code) end
function play:mousepressed(x, y, button, istouch, presses) end
function play:mousereleased(x, y, button, istouch, presses) end
function play:joystickpressed(joystick, button) end
function play:joystickreleased(joystick, button) end
function play:quit() end

return play