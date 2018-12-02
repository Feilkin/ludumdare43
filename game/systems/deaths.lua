local tiny = require "tiny"

local deathSystem = tiny.processingSystem()
deathSystem.filter = tiny.requireAll("health")

function deathSystem:process(e, dt)
	if e.health <= 0 then
		self.world:removeEntity(e)
		e:onDeath()
	end
end

return deathSystem