---@type Hump.Camera
local private_cam = Camera.new()

--- l1 is for planet
local background_l1 = Camera.new()

--- l2, l3, and l4 if for asteroid
local background_l2 = Camera.new()
local background_l3 = Camera.new()
local background_l2_scale_factor = 3
local background_l3_scale_factor = 2

local background_l2_position = { x = 0, y = 0 }
local background_l3_position = { x = 0, y = 0 }

local Cam = {}
Cam.x = 0
Cam.y = 0
Cam.zoom_v = 1.25

---@diagnostic disable-next-line : unused-local
Cam.get_background_l2_sfactor = function(self)
	return background_l2_scale_factor
end
---@diagnostic disable-next-line : unused-local
Cam.get_background_l2_position = function(self)
	return background_l2_position.x, background_l2_position.y
end

---@diagnostic disable-next-line : unused-local
Cam.get_background_l3_sfactor = function(self)
	return background_l3_scale_factor
end
---@diagnostic disable-next-line : unused-local
Cam.get_background_l3_positiom = function(self)
	return background_l3_position.x, background_l3_position.y
end


---@type Player
Cam.anchor = nil

---@diagnostic disable-next-line : unused-local
Cam.world_coord = function(self, x, y)
	return private_cam:worldCoords(x, y)
end
---@diagnostic disable-next-line : unused-local
Cam.camera_coord = function(self, x, y)
	return private_cam:cameraCoords(x, y)
end

Cam.set_follow = function(self, anchor)
	self.anchor = anchor
	self.x = self.anchor.x
	self.y = self.anchor.y

	private_cam:zoomTo(self.zoom_v)
end

Cam.update = function(self, dt)
	local tween = Tween.new(0.15, self, {
		x = self.anchor.x,
		y = self.anchor.y
	}, TweenEasing.LINEAR)
	tween:update(dt)
	background_l2_position.x = self.x / background_l2_scale_factor
	background_l2_position.y = self.y / background_l2_scale_factor
	background_l3_position.x = self.x / background_l3_scale_factor
	background_l3_position.y = self.y / background_l3_scale_factor

	private_cam:zoomTo(self.zoom_v - player.velocity__d / 1800)
	background_l1:zoomTo(2 - player.velocity__d / (1800 * 2))
	background_l2:zoomTo(1 - player.velocity__d / (1800 * 2))
	background_l3:zoomTo(1 - player.velocity__d / (1800 * 2))

	private_cam:lookAt(self.x, self.y)

	background_l1:lookAt(self.x / 100, self.y / 100)
	background_l2:lookAt(background_l2_position.x, background_l2_position.y)
	background_l3:lookAt(background_l3_position.x, background_l3_position.y)
end

---@param fun fun()
---@diagnostic disable-next-line : unused-local
Cam.draw = function(self, fun)
	private_cam:attach()
	fun()
	private_cam:detach()
end

---@param fun fun()
---@diagnostic disable-next-line : unused-local
Cam.draw_background_l1 = function(self, fun)
	background_l1:attach()
	fun()
	background_l1:detach()
end
---@param fun fun()
---@diagnostic disable-next-line : unused-local
Cam.draw_background_l2 = function(self, fun)
	background_l2:attach()
	fun()
	background_l2:detach()
end
---@param fun fun()
---@diagnostic disable-next-line : unused-local
Cam.draw_background_l3 = function(self, fun)
	background_l3:attach()
	fun()
	background_l3:detach()
end

return Cam
