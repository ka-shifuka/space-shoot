local Player = {}

---@param options EntityMetaNewOptions
Player.new = function(options)
	local instance = Entity.new(EntityType.PLAYER, Z.PLAYER)
	instance.x = options.x
	instance.y = options.y

	return instance
end

return Player
