local tiny = require "tiny"

local homingSystem = tiny.processingSystem()
homingSystem.filter = tiny.requireAll("body", "homing_target", "fly_speed")

function homingSystem:process(e, dt)
	local target_x, target_y = e.homing_target.body:getPos()
	local target_w, target_h = e.homing_target.body:getSize()
	target_x, target_y = target_x + target_w / 2, target_y + target_h / 2

	local current_x, current_y = e.body:getPos()
	local target_a = math.atan2(target_x - current_x, target_y - current_y)
	local current_a = math.atan2(e.body.speed.x, e.body.speed.y)
	target_a = current_a + math.abs(target_a - current_a) * 3 * dt
	e.body.speed.x = math.sin(target_a) * e.fly_speed
	e.body.speed.y = math.cos(target_a) * e.fly_speed
end

return homingSystem