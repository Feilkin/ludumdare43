local tiny = require "tiny"
local bump = require "bump"

local physicsSystem = tiny.processingSystem()
physicsSystem.filter = tiny.requireAll("body")

function physicsSystem:onAddToWorld(world)
	self.bump_world = world.bump_world
end

function physicsSystem:onAdd(e)
	local x, y = e.body:getPos()
	local w, h = e.body:getSize()
	self.bump_world:add(e, x, y, w, h)
end

function physicsSystem:onRemove(e)
	self.bump_world:remove(e)
end

function physicsSystem:process(e, dt)
	local b = e.body
	local world = self.bump_world

	if b._update then
		world:update(e, b.position.x, b.position.y)
		b._update = nil
	end

	if not b.immobile then

		b.speed.x = b.speed.x + b.acceleration.x * dt

		if (not b.on_ground) and (not b.on_ladder) then
			b.speed.y = b.speed.y + b.acceleration.y * dt
		end

		local goal_x, goal_y = b.position.x + b.speed.x * dt, b.position.y + b.speed.y * dt
		local actual_x, actual_y, cols, len = world:move(e, goal_x, goal_y, e.filter)

		b.on_ground = false
		b.on_ladder = false
		if len > 0 then
			for _, col in ipairs(cols) do
				e:onCollide(col)
				if col.type == "slide" then
					if col.normal.y < 0 then
						b.on_ground = true
						if b.speed.y > 0 and e.is_entity then
							Signal.emit("entity_land", e, col, b.speed.y)
						end
						b.speed.y = 0
					elseif col.normal.y > 0 then
						b.speed.y = 0
					else
						b.speed.x = 0
					end
				elseif col.other.properties and col.other.properties.ladder then
					b.on_ladder = true
					b.speed.y = 0
				end
			end
		end

		b.position.x, b.position.y = actual_x, actual_y
	end
end

return physicsSystem