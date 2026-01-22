---@class Player : Player__Field
local Player = {}
Player.__index = Player

Player.update = function(self, dt)
	local new_angle = math.atan2(m.dy, m.dx) + math.rad(90)
	self.physics:setLinearVelocity(self.velocity__x, self.velocity__y)
	self.physics:setAngle(new_angle)

	local cos = math.cos(new_angle)
	local sin = math.sin(new_angle)

	self.velocity__x = self.speed * cos * dt
	self.velocity__y = self.speed * sin * dt

	self.x = self.physics:getX()
	self.y = self.physics:getY()
	self.angle = self.physics:getAngle()
end

local love_graphics = love.graphics
Player.draw = function(self)
	love_graphics.push()
	love_graphics.translate(self.x, self.y)
	love_graphics.rotate(self.angle)

	love_graphics.translate(-24, -24)
	love_graphics.draw(Sprites.Player.rocket, 0, 0)
	love_graphics.pop()
end

---@param options EntityMetaNewOptions
Player.new = function(options)
	---@class Player__Field : Entity
	local instance = Entity.new(EntityType.PLAYER, Z.PLAYER)
	instance.x = options.x
	instance.y = options.y
	instance.width = 10
	instance.height = 36
	instance.angle = 0

	instance.velocity__x = 0
	instance.velocity__y = 100
	instance.speed = 100

	---@type Windfield.Collider
	instance.physics = World_WF:newBSGRectangleCollider(
		instance.x,
		instance.y,
		instance.width,
		instance.height,
		5
	)
	instance.physics:setCollisionClass(CollisionClass.PLAYER)
	instance.physics:setObject(instance)

	setmetatable(instance, Player)
	return instance ---@type Player
end

return Player
