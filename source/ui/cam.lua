---@class Cam : Hump.Camera
local Cam = Camera.new()
Cam.mechanic = {}

Cam.mechanic.x = 0
Cam.mechanic.y = 9
Cam.mechanic.tween = nil
Cam.mechanic.zoom_v = 2
Cam.mechanic.zoom_v_tween = nil

Cam.mechanic.shake_duration = 0

Cam.mechanic.follow = nil

Cam.mechanic.setup = function(self, follow)
	Cam:zoomTo(self.zoom_v)
	self.follow = follow

	self.x = follow.x
	self.y = follow.y
end

Cam.mechanic.shake = function(self, duration)
	self.shake_duration = duration
end
Cam.mechanic.set_follow = function(self, follow)
	self.follow = follow
end
Cam.mechanic.zoom_gradual_to = function(self, duration, tzoom)
	self.zoom_v_tween = Tween.new(duration, self, { zoom_v = tzoom }, TweenEasing.INOUT_QUAD)
end
Cam.mechanic.zoom_gradual_to_default = function(self, duration)
	self.zoom_v_tween = Tween.new(duration, self, { zoom_v = 1.5 }, TweenEasing.INOUT_QUAD)
end

local style = {}
style.target__offset_y = 0
style.target__offset_x = 0

style.tween = Tween.new(0.5, style, {
	target__offset_y = 50
}, TweenEasing.INOUT_QUAD)

local frame_limiter = 0
Cam.mechanic.update = function(self, dt)
	if self.zoom_v_tween then
		Cam:zoomTo(self.zoom_v)
		if self.zoom_v_tween:update(dt) then self.zoom_v_tween = nil end
	end
	Cam:zoomTo(self.zoom_v)

	self.shake_duration = self.shake_duration - dt

	if frame_limiter >= 5 then
		local target_y = self.follow.y + style.target__offset_y
		self.tween = Tween.new(0.13, self, {
			x = self.follow.x,
			y = target_y
		}, TweenEasing.LINEAR)
		frame_limiter = 0
	end
	frame_limiter = frame_limiter + 1
	if self.tween then self.tween:update(dt) end

	if self.shake_duration > 0 then
		local ranx = math.random(-2, 2)
		local rany = math.random(-2, 2)
		Cam:lookAt(self.x + ranx, self.y + rany)
	else
		Cam:lookAt(self.x, self.y)
	end
end

return Cam
