local function draw_insede_camera()
	Engine.draw()
end

function DrawAll()
	love.graphics.setFont(Font.proto_bold_sm)
	love.graphics.printf(string.format("coordiante x: %d, y: %d", player.x, player.y), 0, 10, love.graphics.getWidth(),
		"center")

	Cam:draw_background_l1(function()
		love.graphics.draw(Sprites.Ui.Background__planet, 5, 6)
	end)
	Cam:draw(draw_insede_camera)
	Ui:draw()
end
