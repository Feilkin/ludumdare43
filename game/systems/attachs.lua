local tiny = require "tiny"

local attachSystem = tiny.processingSystem()
attachSystem.filter = tiny.requireAll("attach_to", "body")

function attachSystem:process(e, dt)
	if e.attach_to.time_left then
		e.time_left = e.attach_to.time_left
	end
	if e.attach_to.health <= 0 then
		e.time_left = 0
	end

	local target = e.attach_to.body.position:clone()
	if e.attach_offset then
		target = target + e.attach_offset
	end

	if e.attach_to_flipped ~= e.attach_to.flip_x then
		local flip_offset = e.attach_to.body.size.x + e.body.size.x
		e.flip_x = not e.attach_self_flipped
		local dir = e.flip_x and 1 or -1
		target.x = target.x + dir * flip_offset
	end

	e.body:teleport(target)
end

return attachSystem