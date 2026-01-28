local PlayerBehaviour = require "source.engine.entity.player.behavior"

---@class Player : Player__Field
local Player = {}
Player.__index = Player

Player.set_v_angle = function(self, dx, dy, duration)
	duration = duration or 0.3
	self.tween__angle = Tween.new(duration, self, {
		angle__y = dy,
		angle__x = dx
	}, TweenEasing.LINEAR)
end
Player.set_relative_speed = function(self, relative_speed)
	self.relative_speed = relative_speed
end

Player.update = function(self, dt)
	self.timer:update(dt)
	if self.tween__angle then self.tween__angle:update(dt) end

	local new_angle = math.atan2(self.angle__y, self.angle__x) + math.rad(90)
	local velox, veloy = self.physics:getLinearVelocity()
	self.velocity__d = math.sqrt(velox ^ 2 + veloy ^ 2)

	if self.state__move == MoveState.MOVE then
		local angle = math.atan2(self.angle__y, self.angle__x)
		if self.velocity__d < 1200 * self.relative_speed then
			local cos = math.cos(angle)
			local sin = math.sin(angle)
			self.physics:applyForce(self.speed * cos, self.speed * sin)

			if self.is_boost then
				self.physics:applyForce(self.boost_force * cos, self.boost_force * sin)
			end
		end
	end

	self.x = self.physics:getX()
	self.y = self.physics:getY()
	self.angle = self.physics:getAngle()

	self.physics:setLinearVelocity(velox * 0.96, veloy * 0.96)
	self.physics:setAngle(new_angle)

	self.fire_anchor.x = math.cos(self.angle + math.rad(90)) * self.fire_anchor_distance + self.x
	self.fire_anchor.y = math.sin(self.angle + math.rad(90)) * self.fire_anchor_distance + self.y

	self.bullet_ancor.x = math.cos(self.angle - math.rad(90)) * self.bullet_ancor_distance + self.x
	self.bullet_ancor.y = math.sin(self.angle - math.rad(90)) * self.bullet_ancor_distance + self.y
	self.bullet_ancor.angle = self.angle

	self.laser_anchor.x = math.cos(self.angle - math.rad(90)) * self.laser_anchor_distance + self.x
	self.laser_anchor.y = math.sin(self.angle - math.rad(90)) * self.laser_anchor_distance + self.y
end

local love_graphics = love.graphics
Player.draw = function(self)
	if self.nearset_asteroid then
		love_graphics.setLineWidth(3)
		love_graphics.setColor(Color.WHITE)
		love_graphics.line(
			self.laser_anchor.x, self.laser_anchor.y,
			self.nearset_asteroid.fire_anchor.x, self.nearset_asteroid.fire_anchor.y
		)
		love_graphics.setLineWidth(1)
		love_graphics.setColor(Color.ABSOLUTE_WHITE)
	end

	love_graphics.push()
	love_graphics.translate(self.x, self.y)
	love_graphics.rotate(self.angle)
	love_graphics.translate(-24, -24)

	love_graphics.draw(Sprites.Rocket.Small, 0, 0)
	love_graphics.pop()

	if self.nearset_asteroid then
		love_graphics.push()
		love_graphics.translate(self.nearset_asteroid.x, self.nearset_asteroid.y)
		love_graphics.draw(Sprites.Ui.Control__scan_cursor, -16, -16)
		love_graphics.pop()
	end
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

	---@type Hump.Timer
	instance.timer = Timer.new()
	instance.state__move = MoveState.IDLE

	instance.velocity__d = 0
	instance.speed = 450
	instance.relative_speed = 0
	instance.is_boost = false
	instance.boost_force = 800

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

	---@type Asteroid | nil
	instance.nearset_asteroid = nil

	instance.fire_anchor = Entities.Effect__Fire.crete_anchor()
	instance.fire_anchor_distance = 20
	instance.bullet_ancor = Entities.Bullet__Small.crete_anchor()
	instance.bullet_ancor_distance = 15
	instance.laser_anchor = { x = 0, y = 0 }
	instance.laser_anchor_distance = 15

	instance.behavior = PlayerBehaviour.new(instance)
	instance.behavior:start_task()

	setmetatable(instance, Player)
	return instance ---@type Player
end

return Player
