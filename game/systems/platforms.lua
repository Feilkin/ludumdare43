local tiny = require "tiny"

local platformSystem = tiny.processingSystem()
platformSystem.filter = tiny.requireAll("platform")

function platformSystem:process(e, dt)
	e.direction = e.direction or 1
	e.speed_x = e.direction * 32
	e.x = e.x + e.speed_x * dt

	local actual_x, actual_y, cols, len = self.world.bump_world:move(e, e.x, e.y)
	e.x, e.y = actual_x, actual_y

	for _, col in ipairs(cols) do
		if col.other.is_entity then
			col.other.body.speed.x = col.other.body.speed.x + e.speed_x
		end
	end

	-- hack to move players
	local cols, len = self.world.bump_world:querySegment(e.x, e.y - 1, e.x + e.width, e.y - 1, function(item)
		return item.is_entity
	end)

	for _, col in ipairs(cols) do
		col.body.speed.x = col.body.speed.x + e.speed_x
	end

	local target_x = (e.direction > 0) and e.properties.max_x or e.properties.min_x
	local distance = math.abs(target_x - e.x)
	if distance < 1 then
		e.direction = e.direction * -1
	end
end

return platformSystem