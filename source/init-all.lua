function InitAll()
	---@diagnostic disable-next-line : lowercase-global
	player = Entities.Player.new({
		x = 100,
		y = 100
	})
	Engine.add(player)
	Cam:set_follow(player)

	for i = 1, 40, 1 do
		local e = Entities.Asteroid__Small.new({
			x = math.random(1500, 3500),
			y = math.random(0, 1000)
		})
		Engine.add(e)
	end
end
