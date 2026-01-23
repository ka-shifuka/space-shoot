---@diagnostic disable-next-line : duplicate-doc-alias
---@enum Z
local MoveState = {
	IDLE = 1,
	MOVE = 2
}

---@diagnostic disable-next-line : duplicate-doc-alias
---@enum Z
return require("source.enum").new("MoveState", MoveState, {
	is_skip_value = true
})
