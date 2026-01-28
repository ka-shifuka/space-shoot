local as = {}
local as2 = {}

--- background cluster maker
function cl(startx)
	for i = 1, 10, 1 do
		local star = startx / Cam:get_background_l2_sfactor()
		local width = 1000
		local height = 1000

		local a = {}
		a.x = math.random(star, star + width / Cam:get_background_l3_sfactor())
		a.y = math.random(0, height / Cam:get_background_l2_sfactor())
		a.a = math.random(0, 360)
		a.s = math.random(60, 100) / 100
		a.vx = 0
		a.vy = 0
		a.va = math.random(-10, 10)

		table.insert(as, a)
	end
	for i = 1, 10, 1 do
		local star = startx / Cam:get_background_l3_sfactor()
		local width = 1000
		local height = 1000

		local a = {}
		a.x = math.random(star, star + width / Cam:get_background_l3_sfactor())
		a.y = math.random(0, height / Cam:get_background_l3_sfactor())
		a.a = math.random(0, 360)
		a.s = math.random(60, 100) / 100
		a.vx = 0
		a.vy = 0
		a.va = math.random(-10, 10)

		table.insert(as2, a)
	end
end

cl(1000)
cl(2000)
cl(3000)

cl(6000)
cl(7000)
cl(8000)

local m_canvas = love.graphics.newCanvas()
local function draw_all_background()
	Cam:draw_background_l1(function()
		love.graphics.draw(Sprites.Ui.Background__planet, 40, 30)
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
end

function DrawAll()
	love.graphics.setCanvas(m_canvas)
	love.graphics.clear()

	love.graphics.setColor(Color.BLACK)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	love.graphics.setColor(Color.ABSOLUTE_WHITE)

	draw_all_background()
	Cam:draw(function()
		Engine.draw()

		if Setting.debug__ShowPhysics then
			World_WF:draw()
		end
	end)

	Ui:draw()
	love.graphics.setCanvas()

	love.graphics.setShader(Shaders.main)
	Shaders.main:send("uIsCrtEnable", Setting.CrtEnable)
	Shaders.main:send("uWarp", Setting.CrtWarp)
	Shaders.main:send("uScan", Setting.CrtScan)
	love.graphics.draw(m_canvas)
	love.graphics.setShader()
	Slab.Draw()
end
