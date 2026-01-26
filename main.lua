math.randomseed(os.time())
require "source.preload"

---@diagnostic disable-next-line : duplicate-set-field
love.load = function(args)
	love.graphics.setDefaultFilter("nearest", "nearest")
	require "source.load"
	InitAll()

	--- Debug Slab
	Slab.Initialize(args)

	love.graphics.setBackgroundColor(Color.BLACK)
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
	Ui:pressed(id, x, y)
end
---@diagnostic disable-next-line : duplicate-set-field
love.touchmoved = function(id, x, y)
	Ui:moved(id, x, y)
end
---@diagnostic disable-next-line : duplicate-set-field
love.touchreleased = function(id, x, y)
	Ui:released(id, x, y)
end
