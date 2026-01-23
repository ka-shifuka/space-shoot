function DrawAll()
	love.graphics.setFont(Font.proto_bold_sm)
	love.graphics.printf("Mumo joystic component test", 0, 10, love.graphics.getWidth(), "center")

	Cam:attach()
	for _, value in ipairs(l) do
		love.graphics.rectangle("line", value.x, value.y, value.width, value.height)
	end
	love.graphics.rectangle("line", 0, 0, 10000, 10000)

	love.graphics.draw(tt, 5000, 0)

	Engine.draw()
	Cam:detach()

	m:draw()
end
