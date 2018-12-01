local tiny = require "tiny"

local animationSystem = tiny.processingSystem()
animationSystem.filter = tiny.requireAll("animation")

function animationSystem:process(e, dt)
	e.animation:update(dt)
	e.sprite = e.animation:getFrame()
end

return animationSystem