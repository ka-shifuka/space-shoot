---@enum FontSize
local FontSize = {
	LARGE = 22,
	MEDIUM = 16,
	SMALL = 14,
	EXTRA_SMALL = 12,
	EXTRA_EXTRA_SMALL = 8,
	SUPER_SMALL = 6
}

local new_font = love.graphics.newFont
local Font = {}

local ProtoNerdFontPath = "assets/fonts/0xProtoNerdFont-Bold.ttf"
Font.proto_bold_lg = new_font(ProtoNerdFontPath, FontSize.LARGE)
Font.proto_bold_md = new_font(ProtoNerdFontPath, FontSize.MEDIUM)
Font.proto_bold_sm = new_font(ProtoNerdFontPath, FontSize.SMALL)
Font.proto_bold_xs = new_font(ProtoNerdFontPath, FontSize.EXTRA_SMALL)
Font.proto_bold_xxs = new_font(ProtoNerdFontPath, FontSize.EXTRA_EXTRA_SMALL)
Font.proto_bold_ss = new_font(ProtoNerdFontPath, FontSize.SUPER_SMALL)

love.graphics.setDefaultFilter("nearest", "nearest")
local AroundFontPath = "assets/fonts/Around.ttf"
Font.around_lg = new_font(AroundFontPath, FontSize.LARGE)
Font.around_md = new_font(AroundFontPath, FontSize.MEDIUM)
Font.around_sm = new_font(AroundFontPath, FontSize.SMALL)
Font.around_xs = new_font(AroundFontPath, FontSize.EXTRA_SMALL)
Font.around_xxs = new_font(AroundFontPath, FontSize.EXTRA_EXTRA_SMALL)
Font.around_ss = new_font(AroundFontPath, FontSize.SUPER_SMALL)
love.graphics.setDefaultFilter("linear", "linear")

love.graphics.setDefaultFilter("nearest", "nearest")
local AroundBoldFontPath = "assets/fonts/Around Bold.ttf"
Font.around_bold_lg = new_font(AroundBoldFontPath, FontSize.LARGE, "mono")
Font.around_bold_md = new_font(AroundBoldFontPath, FontSize.MEDIUM, "mono")
Font.around_bold_sm = new_font(AroundBoldFontPath, FontSize.SMALL, "mono")
Font.around_bold_xs = new_font(AroundBoldFontPath, FontSize.EXTRA_SMALL, "mono")
Font.around_bold_xxs = new_font(AroundBoldFontPath, FontSize.EXTRA_EXTRA_SMALL, "mono")
Font.around_bold_ss = new_font(AroundBoldFontPath, FontSize.SUPER_SMALL, "mono")
love.graphics.setDefaultFilter("linear", "linear")

return Font
