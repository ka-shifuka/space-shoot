---@class PlayerBehaviour : PlayerBehaviour__Field
local PlayerBehaviour = {}
PlayerBehaviour.__index = PlayerBehaviour

PlayerBehaviour.search_nearest_asteroid = function(self)
	local elist = Engine.get_list()

	local nearset_asteroid = nil
	local distance = math.huge
	for _, e in ipairs(elist) do
		if e.entity__type == EntityType.ASTEROID then
			---@cast e Asteroid
			local new_distance = math.sqrt((self.parent.x - e.x) ^ 2 + (self.parent.y - e.y) ^ 2)

			if new_distance < distance then
				distance = new_distance
				nearset_asteroid = e
			end
		end
	end

	if distance < 100 then
		self.parent.nearset_asteroid = nearset_asteroid
	else
		self.parent.nearset_asteroid = nil
	end
end

PlayerBehaviour.start_task = function(self)
	self.parent.timer:after(0.2, function()
		self:start_task()
	end)

	self:search_nearest_asteroid()
end

PlayerBehaviour.new = function(parent)
	---@class PlayerBehaviour__Field
	local instance = {}
	---@type Player
	instance.parent = parent
	setmetatable(instance, PlayerBehaviour)
	return instance ---@type PlayerBehaviour
end

return PlayerBehaviour
