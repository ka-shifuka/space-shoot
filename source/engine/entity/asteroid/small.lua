---@class Asteroid : Asteroid__Field
local Asteroid = {}
Asteroid.__index = Asteroid

Asteroid.update = function(self, dt)
	self.angle = self.angle + self.velocity__angular * dt
end

local love_graphics = love.graphics
Asteroid.draw = function(self)
	love_graphics.push()
	love_graphics.translate(self.x, self.y)
	love_graphics.rotate(self.angle)
	love_graphics.translate(
		-Sprites.Ui.Background__asteroid_1:getWidth() / 2,
		-Sprites.Ui.Background__asteroid_1:getHeight() / 2
	)
	love_graphics.draw(Sprites.Ui.Background__asteroid_1)
	love_graphics.pop()
end

---@param options EntityMetaNewOptions
Asteroid.new = function(options)
	---@class Asteroid__Field : Entity
	local instance = Entity.new(EntityType.ASTEROID, Z.ASTEROID)
	instance.x = options.x
	instance.y = options.y
	instance.angle = 0
	instance.velocity__angular = math.random(10, 20) / 100

	if math.random() > 0.5 then
		instance.velocity__angular = -instance.velocity__angular
	end

	setmetatable(instance, Asteroid)
	return instance
end

return Asteroid
