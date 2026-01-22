require "source.preload"

---@diagnostic disable-next-line : duplicate-set-field
love.load = function()
	love.graphics.setDefaultFilter("nearest", "nearest")
	require "source.load"

	love.graphics.setBackgroundColor(Color.hex_to_rgba("#281e22"))
end
---@diagnostic disable-next-line : duplicate-set-field
love.update = function(dt)
	Engine.update(dt)
end
---@diagnostic disable-next-line : duplicate-set-field
love.draw = function()
	love.graphics.setFont(Font.proto_bold_sm)
	love.graphics.printf("Init Project", 0, 10, love.graphics.getWidth(), "center")

	Engine.draw()
end
