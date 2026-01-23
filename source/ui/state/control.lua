local joystick = require "source.ui.mumo.joystik"

local T = {}

---@type Effect.Fire | nil
local fire = nil

T.joy = joystick.new({
		x = 100,
		y = love.graphics.getHeight() - 120,
		width = 80,
		height = 80,
	})
	---@diagnostic disable-next-line : unused-local
	:on_press(function(self)
		if fire then
			fire:destroy()
			fire = nil
		end

		fire = Entities.Effect__Fire.new({
			x = player.fire_anchor.x,
			y = player.fire_anchor.y,
			anchor = player.fire_anchor
		})
		Engine.add(fire)
		player.state__move = MoveState.MOVE
	end)
	:on_move(function(self, dx, dy)
		player:set_v_angle(dx, dy)
		player:set_relative_speed(self:get_relative())
	end)
	---@diagnostic disable-next-line : unused-local
	:on_release(function(self)
		if fire then
			fire:destroy()
			fire = nil
		end
		player.state__move = MoveState.IDLE
	end)

T.draw = function(self)
	self.joy:draw()
end

T.pressed = function(self, id, x, y)
	self.joy:pressed(id, x, y)
end
T.moved = function(self, id, x, y)
	self.joy:moved(id, x, y)
end
T.released = function(self, id, x, y)
	self.joy:release(id, x, y)
end

return T
