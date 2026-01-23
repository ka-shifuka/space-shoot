---@class Player : Player__Field
local Player = {}
Player.__index = Player

local mq = { x = 0, y = 0 }

Player.update = function(self, dt)
	local tween = Tween.new(0.3, mq, { x = m.dx, y = m.dy })
	tween:update(dt)

	local new_angle = math.atan2(mq.y, mq.x) + math.rad(90)
	local velox, veloy = self.physics:getLinearVelocity()
	self.velocity__d = math.sqrt(velox ^ 2 + veloy ^ 2)

	self.physics:setAngle(new_angle)

	if self.state__move == MoveState.MOVE then
		local angle = math.atan2(mq.y, mq.x)
		if self.velocity__d < 800 then
			local cos = math.cos(angle)
			local sin = math.sin(angle)
			self.physics:applyForce(self.speed * cos, self.speed * sin)
		end
	end

	self.x = self.physics:getX()
	self.y = self.physics:getY()
	self.angle = self.physics:getAngle()
	self.physics:setLinearVelocity(velox * 0.96, veloy * 0.96)
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

	instance.state__move = MoveState.IDLE
	instance.velocity__d = 0
	instance.speed = 1000

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
