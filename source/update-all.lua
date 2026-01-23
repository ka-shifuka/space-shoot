function UpdateAll(dt)
	World_WF:update(dt)
	Engine.update(dt)

	Cam.mechanic:update(dt)
end
