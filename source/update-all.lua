local function slab_u(dt)
	Slab.Update(dt)
	Slab.BeginWindow("Debug Editor", {
		Title = "Debug Editor",
		TitleAlignX = "left"
	})
	local width = 150

	if Slab.Button("crt toggle", { W = width }) then
		Setting.enable_crt_shader = not Setting.enable_crt_shader
	end

	if Slab.Button("reset game", { W = width }) then
		love.event.quit("restart")
	end
	Slab.EndWindow()
end

function UpdateAll(dt)
	World_WF:update(dt)
	Engine.update(dt)
	Cam:update(dt)

	slab_u(dt)
end
