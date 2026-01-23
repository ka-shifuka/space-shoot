function DrawAll()
	love.graphics.setFont(Font.proto_bold_sm)
	love.graphics.printf(string.format("coordiante x: %d, y: %d", player.x, player.y), 0, 10, love.graphics.getWidth(),
		"center")

	--- Camera
	Cam:draw(function()
		Engine.draw()
	end)

	Ui:draw()
end
