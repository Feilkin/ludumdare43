local tiny = require "tiny"

local lifetimeSystem = tiny.processingSystem()
lifetimeSystem.filter = tiny.requireAll("time_left")

function lifetimeSystem:process(e, dt)
	e.time_left = e.time_left - dt

	if e.time_left <= 0 then
		self.world:removeEntity(e)
	end
end

return lifetimeSystem