---@type Entity[]
local EntityList = {}

local Engine = {}

---@param ... Entity
Engine.add = function(...)
	for _, entity in ipairs({ ... }) do
		table.insert(EntityList, entity)
	end

	table.sort(EntityList, function(a, b)
		if a.entity__priority == b.entity__priority then
			return a.entity__index < b.entity__index
		else
			return a.entity__priority < b.entity__priority
		end
	end)
end

Engine.update = function(dt)
	for i, entity in ipairs(EntityList) do
		entity.entity__index = i
		entity:update(dt)
	end
end

Engine.draw = function()
	for _, entity in ipairs(EntityList) do
		entity:draw()
	end
end

return Engine
