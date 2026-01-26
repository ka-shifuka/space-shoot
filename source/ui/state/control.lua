local Joystick = require "source.ui.mumo.joystik"
local Button = require "source.ui.mumo.button"

local T = {}

---@type Effect.Fire | nil
local fire = nil

T.joy = Joystick.new({
		x = 100,
		y = love.graphics.getHeight() - 120,
		width = 80,
		height = 80,

		background_image = Sprites.Ui.Control__joystick
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
			anchor = player.fire_anchor,

			scale = 0.7,
			delta_scale = 3,
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

T.boost_btn = Button.new({
		x = love.graphics.getWidth() - 140,
		y = love.graphics.getHeight() - 140,
		width = 52,
		height = 52,
		background_image = Sprites.Ui.Control__b
	})
	:on_press(function(self)
		self.background_image = Sprites.Ui.Control__click_b
		player.is_boost = true
	end)
	:on_release(function(self)
		self.background_image = Sprites.Ui.Control__b
		player.is_boost = false
	end)

T.attack_btn = Button.new({
		x = love.graphics.getWidth() - 220,
		y = love.graphics.getHeight() - 100,
		width = 52,
		height = 52,
		background_image = Sprites.Ui.Control__a
	})
	:on_press(function(self)
		self.background_image = Sprites.Ui.Control__click_a

		local bullet = Entities.Bullet__Small.new({
			x = player.bullet_ancor.x,
			y = player.bullet_ancor.y,
			angle = player.bullet_ancor.angle
		})
		Engine.add(bullet)
	end)
	:on_release(function(self)
		self.background_image = Sprites.Ui.Control__a
	end)

T.draw = function(self)
	self.joy:draw()
	self.boost_btn:draw()
	self.attack_btn:draw()
end

T.pressed = function(self, id, x, y)
	self.joy:pressed(id, x, y)
	self.boost_btn:pressed(id, x, y)
	self.attack_btn:pressed(id, x, y)
end
T.released = function(self, id, x, y)
	self.joy:release(id, x, y)
	self.boost_btn:released(id, x, y)
	self.attack_btn:released(id, x, y)
end
T.moved = function(self, id, x, y)
	self.joy:moved(id, x, y)
end

return T
