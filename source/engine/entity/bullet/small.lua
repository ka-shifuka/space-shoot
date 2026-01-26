---@class BulletOptions
---@field x number
---@field y number
---@field angle number

---@class SmallBullet : SmallBullet__Field
local SmallBullet = {}
SmallBullet.__index = SmallBullet
SmallBullet.crete_anchor = function()
	local new_anchor = {}
	new_anchor.x = 0
	new_anchor.y = 0
	new_anchor.angle = 0

	return new_anchor
end

SmallBullet.update = function(self, dt)
	self.timer:update(dt)

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
	love_graphics.translate(-24,-24)
	love_graphics.draw(Sprites.Bullet.Small)
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

	---@type Hump.Timer
	instance.timer = Timer.new()

	instance.timer:after(2, function()
		Engine.remove(instance)
	end)

	setmetatable(instance, SmallBullet)
	return instance ---@type SmallBullet
end

return SmallBullet
