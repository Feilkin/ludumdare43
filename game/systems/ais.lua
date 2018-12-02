local tiny = require "tiny"
local vector = require "hump.vector"

local aiSystem = tiny.processingSystem()
aiSystem.filter = tiny.requireAll("ai", "ai_state", "body")

function aiSystem:process(e, dt)
	if e.attack_cooldown and e.attack_cooldown > 0 then
		e.attack_cooldown = e.attack_cooldown - dt
	end

	if e.ai_state.current == "idle" and not e.ai_state.patrol_path then
		-- start patrol, find route
		e.ai_state:start_patrol(true)
		return
	end

	if e.ai_state.current == "patrol" then
		-- get next point in route
		local x, y = e.body:getPos()
		local min = e.patrol_min_x
		local max = e.patrol_max_x
		local min_dist = math.abs(min - x)
		local max_dist = math.abs(max - x)
		local target_point
		if max_dist < 1 or (min_dist > 1 and min_dist < max_dist) then
			-- min point is closer
			target_point = min
		else
			-- max point is closer
			target_point = max
		end

		e.ai_state:patrol_walk(target_point)
	end

	if e.ai_state.current == "walk" then
		local ex, ey = e.body:getPos()
		local tx = e.ai_state.walk_target
		local dir = (tx - ex) < 0 and -1 or 1
		local dist = math.abs(tx - ex)

		if dist < 1 then
			e.body.speed.x = 0
			e.ai_state.walk_target = nil
			e.animation:switch("idle")
			-- get next move target
			e.ai_state:idle()
			Timer.after(1, function()
				e.ai_state:continue_patrol()
			end)
			return
		end

		local speed = e.walk_speed --math.min(e.walk_speed, dist / dt)
		e.body.speed.x = speed * dir
		e.flip_x = dir < 0 and true or false
	end
end

return aiSystem