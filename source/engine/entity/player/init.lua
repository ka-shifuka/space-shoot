---@class Player : Player__Field
local Player = {}
Player.__index = Player

Player.set_v_angle = function(self, dx, dy)
	self.tween__angle = Tween.new(0.3, self, {
		angle__y = dy,
		angle__x = dx
	})
end

Player.update = function(self, dt)
	if self.tween__angle then self.tween__angle:update(dt) end

	local new_angle = math.atan2(self.angle__y, self.angle__x) + math.rad(90)
	local velox, veloy = self.physics:getLinearVelocity()
	self.velocity__d = math.sqrt(velox ^ 2 + veloy ^ 2)

	if self.state__move == MoveState.MOVE then
		local angle = math.atan2(self.angle__y, self.angle__x)
		if self.velocity__d < 800 * m:get_relative() then
			local cos = math.cos(angle)
			local sin = math.sin(angle)
			self.physics:applyForce(self.speed * cos, self.speed * sin)
		end
	end

	self.x = self.physics:getX()
	self.y = self.physics:getY()
	self.angle = self.physics:getAngle()

	self.physics:setLinearVelocity(velox * 0.96, veloy * 0.96)
	self.physics:setAngle(new_angle)

	self.fire_anchor.x = math.cos(self.angle + math.rad(90)) * self.fire_anchor_distance + self.x
	self.fire_anchor.y = math.sin(self.angle + math.rad(90)) * self.fire_anchor_distance + self.y
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

	instance.angle__x = 0
	instance.angle__y = 0
	instance.tween__angle = nil

	instance.state__move = MoveState.IDLE
	instance.velocity__d = 0
	instance.speed = 600

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

	instance.fire_anchor = Entities.Effect__Fire.crete_anchor()
	instance.fire_anchor_distance = 20

	setmetatable(instance, Player)
	return instance ---@type Player
end

return Player
