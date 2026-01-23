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

	local f = nil

	m = j.new({
			x = 100,
			y = love.graphics.getHeight() - 120,
			width = 80,
			height = 80,
			background_image = love.graphics.newImage("assets/ui/control/joystick.png")
		})
		---@diagnostic disable-next-line : unused-local
		:on_press(function(T)
			if f then
				f:destroy()
				f = nil
			end

			player.state__move = MoveState.MOVE
			f = Entities.Effect__Fire.new({
				x = player.fire_anchor.x,
				y = player.fire_anchor.y,
				anchor = player.fire_anchor
			})
			Engine.add(f)
		end)
		---@diagnostic disable-next-line : unused-local
		:on_move(function(T, dx, dy)
			player:set_v_angle(dx, dy)
		end)
		---@diagnostic disable-next-line : unused-local
		:on_release(function(T)
			player.state__move = MoveState.IDLE
			f:destroy()
		end)

	tt = love.graphics.newImage("assets/thea.png")
	l = {}

	for _ = 1, 800, 1 do
		local rt = {}
		rt.x = math.random(0, 5000)
		rt.y = math.random(0, 5000)
		rt.width = math.random(20, 100)
		rt.height = math.random(20, 100)
		table.insert(l, rt)
	end

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
	for _, value in ipairs(l) do
		love.graphics.rectangle("line", value.x, value.y, value.width, value.height)
	end

	love.graphics.draw(tt, 5000,0)

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
