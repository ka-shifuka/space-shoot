---@diagnostic disable-next-line : duplicate-doc-alias
---@enum Z
local Z = {
	PLAYER = 1000,
	EFFECT__FIRE = 1001,
	BULLET = 1002,
}

---@diagnostic disable-next-line : duplicate-doc-alias
---@enum Z
return require("source.enum").new("Z", Z, {
	is_skip_value = true
})
