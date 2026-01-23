---@class Effect.FireOptions
---@field x number
---@field y number
---@field anchor Effect.FireAnchor | any

---@class Effect.Fire : Effect.Fire__Field
local Fire = {}
Fire.__index = Fire

local grid = Anim8.newGrid(16, 16, 32, 16)

Fire.crete_anchor = function()
	---@class Effect.FireAnchor
	local new_anchor = {}
	new_anchor.x = 0
	new_anchor.y = 0

	return new_anchor
end

Fire.crete_particle = function(self)
	---@class Effect.FireParticle
	local particle = {}
	particle.x = self.x
	particle.y = self.y
	particle.scale = 1

	table.insert(self.render, particle)
end

Fire.destroy = function(self)
	self.is_destroy = true
end

Fire.update = function(self, dt)
	if not self.is_destroy then
		self:crete_particle()
	end

	for i, p in ipairs(self.render) do
		p.scale = p.scale - 5 * dt
		if p.scale <= 0 then
			table.remove(self.render, i)
		end
	end

	if self.anchor then
		self.x = self.anchor.x
		self.y = self.anchor.y
	end

	if #self.render == 0 and self.is_destroy then Engine.remove(self) end
end

local love_graphics = love.graphics
Fire.draw = function(self)
	for _, p in ipairs(self.render) do
		love_graphics.push()
		love_graphics.translate(p.x, p.y)
		love_graphics.scale(p.scale)
		self.anim:gotoFrame(1)
		self.anim:draw(Sprites.Effect.fire, -8, -8)
		love_graphics.pop()
	end
	for _, p in ipairs(self.render) do
		love_graphics.push()
		love_graphics.translate(p.x, p.y)
		love_graphics.scale(p.scale)
		self.anim:gotoFrame(2)
		self.anim:draw(Sprites.Effect.fire, -8, -8)
		love_graphics.pop()
	end
end

---@param options Effect.FireOptions
Fire.new = function(options)
	---@class Effect.Fire__Field : Entity
	local instance = Entity.new(EntityType.EFFECT__FIRE, Z.EFFECT__FIRE)
	instance.x = options.x
	instance.y = options.y
	instance.anchor = options.anchor

	---@type Effect.FireParticle[]
	instance.render = {}
	instance.anim = Anim8.newAnimation(grid("1-2", 1), 1)
	instance.anim:pause()

	instance.is_destroy = false

	setmetatable(instance, Fire)
	return instance ---@type Effect.Fire
end

return Fire
