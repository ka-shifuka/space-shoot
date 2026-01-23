require "source.preload"

local j = require "source.ui.mumo.joystik"

---@diagnostic disable-next-line : duplicate-set-field
love.load = function()
	love.graphics.setDefaultFilter("nearest", "nearest")
	require "source.load"

	---@diagnostic disable-next-line : lowercase-global
	player = Entities.Player.new({
		x = 100,
		y = 100
	})
	Engine.add(player)
	Cam.mechanic:set_follow(player)

	m = j.new({
			x = 100,
			y = love.graphics.getHeight() - 120,
			width = 80,
			height = 80,

			no_riset = true
		})
		:on_press(function(T)
			player.state__move = MoveState.MOVE
		end)
		:on_release(function(T)
			player.state__move = MoveState.IDLE
		end)
		:set_no_riset()

	l = love.graphics.newImage("assets/Untitled107_20260119185154.png")

	love.graphics.setBackgroundColor(Color.hex_to_rgba("#281e22"))
end
---@diagnostic disable-next-line : duplicate-set-field
love.update = function(dt)
	World_WF:update(dt)
	Engine.update(dt)

	Cam.mechanic:update(dt)
end
---@diagnostic disable-next-line : duplicate-set-field
love.draw = function()
	love.graphics.setFont(Font.proto_bold_sm)
	love.graphics.printf("Mumo joystic component test", 0, 10, love.graphics.getWidth(), "center")

	Cam:attach()
	love.graphics.draw(l)

	Engine.draw()
	Cam:detach()

	m:draw()
end

---@diagnostic disable-next-line : duplicate-set-field
love.touchpressed = function(id, x, y)
	m:pressed(id, x, y)
end
---@diagnostic disable-next-line : duplicate-set-field
love.touchmoved = function(id, x, y)
	m:moved(id, x, y)
end
---@diagnostic disable-next-line : duplicate-set-field
love.touchreleased = function(id, x, y)
	m:release(id, x, y)
end
