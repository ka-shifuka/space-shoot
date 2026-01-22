---@diagnostic disable-next-line : duplicate-doc-alias
---@enum Z
local Z = {

}

---@diagnostic disable-next-line : duplicate-doc-alias
---@enum Z
return require("source.enum").new("Z", Z, {
	is_skip_value = true
})
