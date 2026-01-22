---@enum FontSize
local FontSize = {
	LARGE = 22,
	MEDIUM = 16,
	SMALL = 14,
	EXTRA_SMALL = 12,
	EXTRA_EXTRA_SMALL = 8
}

local new_font = love.graphics.newFont

local Font = {}

Font.proto_bold_lg = new_font("assets/fonts/0xProtoNerdFont-Bold.ttf", FontSize.LARGE)
Font.proto_bold_md = new_font("assets/fonts/0xProtoNerdFont-Bold.ttf", FontSize.MEDIUM)
Font.proto_bold_sm = new_font("assets/fonts/0xProtoNerdFont-Bold.ttf", FontSize.SMALL)
Font.proto_bold_xs = new_font("assets/fonts/0xProtoNerdFont-Bold.ttf", FontSize.EXTRA_SMALL)
Font.proto_bold_xxs = new_font("assets/fonts/0xProtoNerdFont-Bold.ttf", FontSize.EXTRA_EXTRA_SMALL)

return Font
