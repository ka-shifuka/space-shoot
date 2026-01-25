local as = {}
local as2 = {}
local as3 = {}

for i = 1, 30, 1 do
	local a = {}
	a.x = math.random(0, love.graphics.getWidth())
	a.y = math.random(0, love.graphics.getHeight())
	a.a = math.random(0, 360)
	a.s = math.random(60, 100) / 100
	a.vx = 0
	a.vy = 0
	a.va = math.random(-10, 10)

	table.insert(as, a)
end
for i = 1, 30, 1 do
	local a = {}
	a.x = math.random(0, love.graphics.getWidth())
	a.y = math.random(0, love.graphics.getHeight())
	a.a = math.random(0, 360)
	a.s = math.random(60, 100) / 100
	a.vx = 0
	a.vy = 0
	a.va = math.random(-10, 10)

	table.insert(as2, a)
end
for i = 1, 50, 1 do
	local a = {}
	a.x = math.random(0, love.graphics.getWidth() * 3)
	a.y = math.random(0, love.graphics.getHeight() * 3)
	a.a = math.random(0, 360)
	a.s = math.random(60, 100) / 100
	a.vx = 0
	a.vy = 0
	a.va = math.random(-10, 10)

	table.insert(as3, a)
end

function DrawAll()
	love.graphics.setFont(Font.proto_bold_sm)
	Cam:draw_background_l1(function()
		love.graphics.draw(Sprites.Ui.Background__planet, 5, 6)
	end)
	Cam:draw_background_l2(function()
		for _, a in ipairs(as) do
			a.x = a.x + a.vx * (1 / 60)
			a.y = a.y + a.vy * (1 / 60)
			a.a = a.a + a.va * (1 / 60)

			love.graphics.push()
			love.graphics.translate(a.x, a.y)
			love.graphics.rotate(math.rad(a.a))
			love.graphics.scale(a.s)
			love.graphics.draw(Sprites.Ui.Background__asteroid_1, -32, -32)
			love.graphics.pop()
		end
	end)
	Cam:draw_background_l3(function()
		for _, a in ipairs(as2) do
			a.x = a.x + a.vx * (1 / 60)
			a.y = a.y + a.vy * (1 / 60)
			a.a = a.a + a.va * (1 / 60)

			love.graphics.push()
			love.graphics.translate(a.x, a.y)
			love.graphics.rotate(math.rad(a.a))
			love.graphics.scale(a.s)
			love.graphics.draw(Sprites.Ui.Background__asteroid_1, -32, -32)
			love.graphics.pop()
		end
	end)
	Cam:draw_background_l4(function()
		for _, a in ipairs(as3) do
			a.x = a.x + a.vx * (1 / 60)
			a.y = a.y + a.vy * (1 / 60)
			a.a = a.a + a.va * (1 / 60)

			love.graphics.push()
			love.graphics.translate(a.x, a.y)
			love.graphics.rotate(math.rad(a.a))
			love.graphics.scale(a.s)
			love.graphics.draw(Sprites.Ui.Background__asteroid_1, -32, -32)
			love.graphics.pop()
		end
	end)

	Cam:draw(function()
		Engine.draw()
	end)
	Ui:draw()

	love.graphics.setFont(Font.around_bold_xxs)
	love.graphics.setColor(Color.WHITE)
	love.graphics.printf(string.format("coordiante x: %d, y: %d", player.x, player.y), 0, 10, love.graphics.getWidth(),
		"center")
	love.graphics.printf(string.format("speed: %d", player.velocity__d), 0, 30, love.graphics.getWidth(),
		"center")
	love.graphics.setColor(Color.ABSOLUTE_WHITE)
end
