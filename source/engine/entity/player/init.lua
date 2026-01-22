---@class Player : Player__Field
local Player = {}
Player.__index = Player

Player.update = function(self, dt)
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
