-- the player entity

local class = require "middleclass"
local vector = require "hump.vector"
local machine = require "statemachine"

local Body = require "body"
local Entity = require "entity"
local Animation = require "animation"

local Goblin = class("Goblin", Entity)

function Goblin:initialize()
	Entity.initialize(self, vector(15, 24))
	self.team = "goblin"
	self.animation = Animation("res/animations/goblin.lua", "idle")
	self.sprite = self.animation:getFrame()
	self.health = 3
	self.souls = 10
	self.walk_speed = 75
	self.ai = true
	self.ai_state = machine.create {
		initial = "idle",
		events = {
			{ name = "start_patrol", from = "idle", to = "patrol" },
			{ name = "patrol_walk", from = "patrol", to = "walk" },
			{ name = "idle", from = "*", to = "idle" },
			{ name = "continue_patrol", from = { "walk", "idle" }, to = "patrol" },
			{ name = "spot_target", from = { "idle" }, to = "engaging" },
			{ name = "disengage", from = { "engaging" }, to = "patrol" },
		},
		callbacks = {
			onstart_patrol = function(state, event, from, to, path)
				state.patrol_path = path
			end,
			onpatrol_walk = function(state, event, from, to, point)
				state.walk_target = point
				self.animation:switch("walk")
			end
		},
	}
	self.attack_cooldown = 0
end

function Goblin:onCollide(col)
	if col.other.is_player then
		if (self.animation.current_animation == "stab" and self.animation.current_frame == 2) and
			col.other:canTakeDamage() then
			col.other:take_damage(3)
			Signal.emit("spawn_blood", self, col, love.math.random(25, 30))
		elseif self.attack_cooldown <= 0 then
			self.animation:push("stab")
			self.attack_cooldown = 1
		end
	end
end

function Goblin:spawn(point)
	self.body:teleport(point)
end

function Goblin:onDeath()
	Signal.emit("enemy_died", self)
end

return Goblin