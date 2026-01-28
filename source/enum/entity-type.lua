---@diagnostic disable-next-line : duplicate-doc-alias
---@enum EntityType
local EntityType = {
	PLAYER = 1,
	ROCKET = 2,
	ASTEROID = 3,
	EFFECT__FIRE = 100,
	BULLET = 200,
}

---@diagnostic disable-next-line : duplicate-doc-alias
---@enum EntityType
return require("source.enum").new("EntityType", EntityType, {
	is_skip_value = true
})
