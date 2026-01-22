---@class Mumo.Color
local Color = {}

Color.hex_to_rgba = function(hex)
	hex = hex:gsub("#", "")

	local r = tonumber(hex:sub(1, 2), 16) / 255
	local g = tonumber(hex:sub(3, 4), 16) / 255
	local b = tonumber(hex:sub(5, 6), 16) / 255

	local a = 1
	if #hex == 8 then
		a = tonumber(hex:sub(7, 8), 16) / 255
	end

	return { r, g, b, a }
end

Color.hex_to_trgba = function(hex)
	hex = hex:gsub("#", "")

	local r = tonumber(hex:sub(1, 2), 16) / 255
	local g = tonumber(hex:sub(3, 4), 16) / 255
	local b = tonumber(hex:sub(5, 6), 16) / 255

	local a = 1
	if #hex == 8 then
		a = tonumber(hex:sub(7, 8), 16) / 255
	end

	return { r = r, g = g, b = b, a = a }
end

Color.rgba_table_to_list = function(rgba_table)
	return { rgba_table.r, rgba_table.g, rgba_table.b, rgba_table.a }
end

return Color
