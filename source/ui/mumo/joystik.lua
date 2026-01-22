---@class Mumo.JoystickOptions
---@field x number
---@field y number
---@field width number
---@field height number

---@class Mumo.Joystick : Mumo.Joystick__Field
local Joystick = {}
Joystick.__index = Joystick

Joystick.pressed = function(self, id, x, y)
	if self.id then return end
	if
		x > self.x and x < self.x + self.width and
		y > self.y and y < self.y + self.height
	then
		self.id = id
		self.joy__x = x - self.joy__width / 2
		self.joy__y = y - self.joy__height / 2

		self.joy__center_x = self.joy__x + self.joy__width / 2
		self.joy__center_y = self.joy__y + self.joy__height / 2

		self.dx = (self.joy__center_x - self.center__x) / self.radius__x
		self.dy = (self.joy__center_y - self.center__y) / self.radius__y

		if self.handler__on_press then
			self.handler__on_press(self)
		end
	end
end
Joystick.moved = function(self, id, x, y)
	if self.id == id then
		self.joy__x = x - self.joy__width / 2
		self.joy__y = y - self.joy__height / 2

		--- need this for self feedback
		self.joy__center_x = self.joy__x + self.joy__width / 2
		self.joy__center_y = self.joy__y + self.joy__height / 2

		--- X axis correction
		if self.joy__center_x > self.x + self.width then
			self.joy__x = self.x + self.width - self.joy__width / 2
		elseif self.joy__center_x < self.x then
			self.joy__x = self.x - self.joy__width / 2
		end
		--- Y axis correction
		if self.joy__center_y > self.y + self.height then
			self.joy__y = self.y + self.height - self.joy__height / 2
		elseif self.joy__center_y < self.y then
			self.joy__y = self.y - self.joy__height / 2
		end
		--- set correction
		self.joy__center_x = self.joy__x + self.joy__width / 2
		self.joy__center_y = self.joy__y + self.joy__height / 2

		self.dx = (self.joy__center_x - self.center__x) / self.radius__x
		self.dy = (self.joy__center_y - self.center__y) / self.radius__y

		if self.handler__on_move then
			self.handler__on_move(self)
		end
	end
end
---@diagnostic disable-next-line : unused-local
Joystick.release = function(self, id, x, y)
	if self.id == id then
		self.id = nil
		self.joy__x = self.center__x - self.joy__width / 2
		self.joy__y = self.center__y - self.joy__height / 2
		self.joy__center_x = self.center__x
		self.joy__center_y = self.center__y

		self.dx = (self.joy__center_x - self.center__x) / self.radius__x
		self.dy = (self.joy__center_y - self.center__y) / self.radius__y

		if self.handler__on_release then
			self.handler__on_release(self)
		end
	end
end

Joystick.get_relative = function(self)
	return math.max(math.abs(self.dx), math.abs(self.dy))
end

local love_graphics = love.graphics
Joystick.draw = function(self, opacity)
	opacity = opacity or 1

	love_graphics.push()
	love_graphics.translate(self.x, self.y)
	love_graphics.rectangle("line", 0, 0, self.width, self.height)
	love_graphics.print(string.format("dx: %f, dy: %f", self.dx, self.dy), self.width + 10)
	love_graphics.print(string.format("relative: %f", self:get_relative()), self.width + 10, 20)
	love_graphics.pop()

	love_graphics.push()
	love_graphics.translate(self.joy__x, self.joy__y)
	love_graphics.rectangle("line", 0, 0, self.joy__width, self.joy__height)
	love_graphics.pop()
end

---@param options Mumo.JoystickOptions
Joystick.new = function(options)
	---@class Mumo.Joystick__Field
	local instance = {}
	instance.id = nil

	instance.x = options.x
	instance.y = options.y
	instance.width = options.width
	instance.height = options.height

	instance.center__x = instance.x + instance.width / 2
	instance.center__y = instance.y + instance.height / 2

	instance.joy__width = instance.width / 2
	instance.joy__height = instance.height / 2
	instance.joy__x = instance.center__x - instance.joy__width / 2
	instance.joy__y = instance.center__y - instance.joy__height / 2

	--- Need keep track of this
	instance.joy__center_x = instance.joy__x + instance.joy__width / 2
	instance.joy__center_y = instance.joy__y + instance.joy__height / 2

	instance.radius__x = math.abs(instance.center__x - instance.x)
	instance.radius__y = math.abs(instance.center__y - instance.y)

	--- This is actualy just zero but i need to remember the order
	--- because is matter
	instance.dx = (instance.joy__center_x - instance.center__x) / instance.radius__x
	instance.dy = (instance.joy__center_y - instance.center__y) / instance.radius__y

	---@type fun(self: Mumo.Joystick)
	instance.handler__on_press = nil
	---@type fun(self: Mumo.Joystick)
	instance.handler__on_release = nil
	---@type fun(self: Mumo.Joystick)
	instance.handler__on_move = nil

	setmetatable(instance, Joystick)
	return instance ---@type Mumo.Joystick
end

return Joystick
