function InitAll()
	local j = require "source.ui.mumo.joystik"

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
end
