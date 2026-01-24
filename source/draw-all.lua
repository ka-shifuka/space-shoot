local function draw_insede_camera()
	Engine.draw()
end

local as = {}

for i = 1, 50, 1 do
	local a = {}
	a.x = math.random(0, love.graphics.getWidth())
	a.y = math.random(0, love.graphics.getHeight())
	a.a = math.random(0, 360)

	table.insert(as, a)
end

function DrawAll()
	love.graphics.setFont(Font.proto_bold_sm)
	Cam:draw_background_l1(function()
		love.graphics.draw(Sprites.Ui.Background__planet, 5, 6)
	end)
	Cam:draw_background_l2(function()
		for _, value in ipairs(as) do
			love.graphics.push()
			love.graphics.rotate(math.rad(value.a))
			love.graphics.draw(Sprites.Ui.Background__asteroid_1, value.x, value.y)
			love.graphics.pop()
		end
	end)
	Cam:draw(draw_insede_camera)
	Ui:draw()

	love.graphics.setFont(Font.proto_bold_xs)
	love.graphics.printf(string.format("coordiante x: %d, y: %d", player.x, player.y), 0, 10, love.graphics.getWidth(),
		"center")
	love.graphics.printf(string.format("speed: %d", player.velocity__d), 0, 30, love.graphics.getWidth(),
		"center")
end
