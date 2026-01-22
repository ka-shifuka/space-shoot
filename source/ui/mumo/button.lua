---@class Mumo.ButtonOptions
---@field x number
---@field y number
---@field width number
---@field height number
---
---@field offset_text_x? number
---@field offset_text_y? number
---@field scale? number
---
---@field font? love.graphics.Font
---@field text? string
---
---@field border? boolean
---@field border_radius? number
---@field border_size? number
---@field border_color? table
---
---@field background_color? table
---@field color? table
---
---@field background_image? love.graphics.Image

---@class Mumo.Button : Mumo.Button__Field
local Button = {}

---@param fun fun(self: Mumo.Button)
Button.on_press = function(self, fun)
	self._on_press_handler = fun
	return self
end
---@param fun fun(self: Mumo.Button)
Button.on_release = function(self, fun)
	self._on_release_handler = fun
	return self
end

---@param T Mumo.Button
---@param x number
---@param y number
local function check_touch(T, x, y)
	return (
		x > T.x and x < T.x + T.width and
		y > T.y and y < T.y + T.height
	)
end

Button.pressed = function(self, id, x, y)
	if self.id then return end

	if check_touch(self, x, y) then
		self.id = id
		self._is_clicked = true

		if self._on_press_handler then
			self._on_press_handler(self)
		end
	end
end
---@diagnostic disable-next-line : unused-local
Button.released = function(self, id, x, y)
	if self.id == id then
		self.id = nil
		self._is_clicked = false

		if self._on_release_handler then
			self._on_release_handler(self)
		end
	end
end

local love_graphics = love.graphics

Button.draw = function(self, opacity)
	opacity = opacity or 1

	love_graphics.push()
	love_graphics.translate(self.x + self.width / 2, self.y + self.height / 2)
	love_graphics.scale(self.scale)

	love_graphics.translate(-self.width / 2, -self.height / 2)

	local bg_c = self.background_color
	love_graphics.setColor(bg_c[1], bg_c[2], bg_c[3], bg_c[4] * opacity)
	love_graphics.rectangle("fill", 0, 0, self.width, self.height, self.border_radius,
		self.border_radius)
	love_graphics.setColor(1, 1, 1, 1)

	if self.border then
		local b_c = self.border_color
		love_graphics.setLineWidth(self.border_size)
		love_graphics.setColor(b_c[1], b_c[2], b_c[3], b_c[4] * opacity)
		love_graphics.rectangle("line", 0, 0, self.width, self.height, self.border_radius,
			self.border_radius)
		love_graphics.setColor(1, 1, 1, 1)
		love_graphics.setLineWidth(1)
	end

	local c = self.color
	love_graphics.setColor(c[1], c[2], c[3], c[4] * opacity)
	love_graphics.setFont(self.font)
	love_graphics.printf(self.text, self.offset_text_x,
		self.height / 2 - self.font:getHeight() / 2 + self.offset_text_y,
		self.width,
		"center")
	love_graphics.setColor(1, 1, 1, 1)

	if self.background_image then
		love_graphics.setColor(c[1], c[2], c[3], c[4] * opacity)
		love_graphics.draw(self.background_image, 0, 0, 0,
			self.width / self.background_image:getWidth(),
			self.height / self.background_image:getHeight())
		love_graphics.setColor(1, 1, 1, 1)
	end

	love_graphics.pop()
end

---@param options Mumo.ButtonOptions
---@return Mumo.Button
Button.new = function(options)
	---@class Mumo.Button__Field
	local instance = {}
	instance.x = options.x
	instance.y = options.y
	instance.width = options.width
	instance.height = options.height

	instance.offset_text_x = options.offset_text_x or 0
	instance.offset_text_y = options.offset_text_y or 0
	instance.scale = options.scale or 1

	instance.font = options.font or Fonts.proto_bold_sm
	instance.text = options.text or ""

	instance.border = options.border or false
	instance.border_radius = options.border_radius or 0
	instance.border_size = options.border_size or 1
	instance.border_color = options.border_color or { 1, 1, 1, 1 }

	instance.background_color = options.background_color or { 1, 1, 1, 0 }
	instance.color = options.color or { 1, 1, 1, 1 }
	instance.background_image = options.background_image or nil

	instance._on_press_handler = nil
	instance._on_release_handler = nil
	instance._is_clicked = false

	instance.id = nil

	setmetatable(instance, { __index = Button })
	return instance ---@type Mumo.Button
end

return Button
