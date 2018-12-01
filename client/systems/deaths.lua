local tiny = require "tiny"

local deathSystem = tiny.processingSystem()
deathSystem.filter = tiny.requireAll("health")

function deathSystem:process(e, dt)
	if e.health <= 0 then
		self.world:removeEntity(e)

		if not e.is_player then
			Signal.emit("enemy_died", e)
		end
	end
end

return deathSystem