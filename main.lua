require "source.preload"

---@diagnostic disable-next-line : duplicate-set-field
love.load = function()
	love.graphics.setDefaultFilter("nearest", "nearest")
	require "source.load"
	InitAll()

	love.graphics.setBackgroundColor(Color.hex_to_rgba("#281e22"))
end
---@diagnostic disable-next-line : duplicate-set-field
love.update = function(dt)
	UpdateAll(dt)
end
---@diagnostic disable-next-line : duplicate-set-field
love.draw = function()
	DrawAll()
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
