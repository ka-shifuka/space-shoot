---@class BulletOptions
---@field x number
---@field y number
---@field angle number

---@class SmallBullet : SmallBullet__Field
local SmallBullet = {}
SmallBullet.__index = SmallBullet

SmallBullet.update = function(self, dt)
	local cos = math.cos(self.angle - math.rad(90))
	local sin = math.sin(self.angle - math.rad(90))

	self.x = self.x + (self.speed * cos) * dt
	self.y = self.y + (self.speed * sin) * dt
end

local love_graphics = love.graphics
SmallBullet.draw = function(self)
	love_graphics.push()
	love_graphics.translate(self.x, self.y)
	love_graphics.rotate(self.angle)
	love_graphics.line(0, 0, 0, 10)
	love_graphics.pop()
end

---@param options BulletOptions
SmallBullet.new = function(options)
	---@class SmallBullet__Field : Entity
	local instance = Entity.new(EntityType.BULLET, Z.BULLET)
	instance.x = options.x
	instance.y = options.y
	instance.angle = options.angle
	instance.speed = 1000

	setmetatable(instance, SmallBullet)
	return instance ---@type SmallBullet
end

return SmallBullet
