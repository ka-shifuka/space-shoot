---@class EntityMetaNewOptions
---@field x number
---@field y number

local Entity = {}

Entity.new = function(type, priority)
	--- This is superclass for every Entity
	---@class Entity
	---
	--- This field is auto generated for meta class
	---@field _KEY string
	---
	--- This field need to redefine in meta class
	---@field update fun(self, dt:number)
	--- This field need to redefine in meta class
	---@field draw fun(self)
	local T = {}
	T.x = 0
	T.y = 0
	T.width = 0
	T.height = 0

	T.visible__physics = true
	T.visible__render = true

	T.entity__priority = priority
	T.entity__type = type
	T.entity__index = 0

	return T
end

return Entity
