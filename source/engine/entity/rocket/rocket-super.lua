local Rocket = {}

Rocket.new = function(x, y, width, height)
	---@class Rocket : Entity
	local T = Entity.new(EntityType.ROCKET, Z.ROCKET)
	T.x = x
	T.y = y
	T.width = width
	T.height = height

	T.render__offset_x = 0
	T.render__offset_y = 0

	return T
end

return Rocket
