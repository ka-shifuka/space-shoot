---@type Hump.Camera
local private_cam = Camera.new()
local background_l1 = Camera.new()
local background_l2 = Camera.new()

local Cam = {}
Cam.x = 0
Cam.y = 0
Cam.zoom_v = 1.5

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
	private_cam:zoomTo(self.zoom_v - player.velocity__d / 1800)
	background_l1:zoomTo(1 - player.velocity__d / (1800 * 2))
	background_l2:zoomTo(1 - player.velocity__d / (1800 * 2))

	private_cam:lookAt(self.x, self.y)
	background_l1:lookAt(self.x / 100, self.y / 100)
	background_l2:lookAt(self.x / 20, self.y / 20)
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

return Cam
