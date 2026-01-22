---@diagnostic disable-next-line : duplicate-doc-alias
---@enum TweenEasing
local TweenEasing = {
	LINEAR = "linear",

	IN_QUAD = "inQuad",
	OUT_QUAD = "outQuad",
	INOUT_QUAD = "inOutQuad",
	OUTIN_QUAD = "outInQuad",

	IN_CUBIC = "inCubic",
	OUT_CUBIC = "outCubic",
	INOUT_CUBIC = "inOutCubic",
	OUTIN_CUBIC = "outInCubic",

	IN_QUART = "inQuart",
	OUT_QUART = "outQuart",
	INOUT_QUART = "inOutQuart",
	OUTIN_QUART = "outInQuart",

	IN_QUINT = "inQuint",
	OUT_QUINT = "outQuint",
	INOUT_QUINT = "inOutQuint",
	OUTIN_QUINT = "outInQuint",

	IN_EXPO = "inExpo",
	OUT_EXPO = "outExpo",
	INOUT_EXPO = "inOutExpo",
	OUTIN_EXPO = "outInExpo",

	IN_SINE = "inSine",
	OUT_SINE = "outSine",
	INOUT_SINE = "inOutSine",
	OUTIN_SINE = "outInSine",

	IN_CIRC = "inCirc",
	OUT_CIRC = "outCirc",
	INOUT_CIRC = "inOutCirc",
	OUTIN_CIRC = "outInCirc",

	IN_BACK = "inBack",
	OUT_BACK = "outBack",
	INOUT_BACK = "inOutBack",
	OUTIN_BACK = "outInBack",

	IN_BOUNCE = "inBounce",
	OUT_BOUNCE = "outBounce",
	INOUT_BOUNCE = "inOutBounce",
	OUTIN_BOUNCE = "outInBounce",

	IN_ELASTIC = "inElastic",
	OUT_ELASTIC = "outElastic",
	INOUT_ELASTIC = "inOutElastic",
	OUTIN_ELASTIC = "outInElastic"
}

---@diagnostic disable-next-line : duplicate-doc-alias
---@enum TweenEasing
return require("source.enum").new("TweenEasing", TweenEasing, {
	is_skip_value = true
})
