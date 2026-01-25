local c = require "source.ui.mumo.color"

---@diagnostic disable-next-line : duplicate-doc-alias
---@enum Color
local Color = {
	WHITE = c.hex_to_rgba("#f6edd6"),
	BLACK = c.hex_to_rgba("#281e22"),
	ABSOLUTE_WHITE = { 1, 1, 1, 1 },
	ABSOLUTE_BLACK = { 0, 0, 0, 1 },
}

---@diagnostic disable-next-line : duplicate-doc-alias
---@enum Z
return require("source.enum").new("Color", Color, {
	is_skip_value = true
})
