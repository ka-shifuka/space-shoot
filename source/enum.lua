---@class Enum.Options
---@field is_skip_value boolean

---@class Enum
local Enum = {}

---@generic T
---@param name string
---@param values T
---@param options? Enum.Options
---@return T
Enum.new = function(name, values, options)
	options = options or {}

	for key, value in pairs(values) do
		assert(type(key) == "string", "Enum key must be string")

		if not options.is_skip_value then
			assert(type(value) == "string", "Enum value must be string")
			assert(key == value, "Enum key and value must be the same")
		end
	end

	return setmetatable(values, {
		__index = function(_, k)
			if rawget(values, k) then
				return rawget(values, k)
			end

			return error(string.format("There are no %s key on enum %s", k, name))
		end,
		__newindex = function(_, k, v)
			return error(string.format("Cannot modified Enum %s, %s -> %s", name, k, v))
		end
	})
end

return Enum
