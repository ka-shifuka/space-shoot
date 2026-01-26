local function slab_u(dt)
	Slab.Update(dt)
	Slab.PushFont(Font.proto_bold_xs)
	Slab.BeginWindow("Debug", {
		Title = "Debug",
		TitleAlignX = "left",
		X = 15,
		Y = 15,
		H = 30
	})
	local width = 150
	SlabD.StyleEditor()

	if Slab.CheckBox(Setting.enable_crt, "crt shader") then
		Setting.enable_crt = not Setting.enable_crt
	end
	if Slab.CheckBox(Setting.debug__show_physics, "show physics") then
		Setting.debug__show_physics = not Setting.debug__show_physics
	end

	Slab.PushFont(Font.proto_bold_ss)
	Slab.Text("crt wrap:")
	Slab.PopFont()
	if
		 Slab.Input("test", {
			 Text = Setting.crt_warp,
			 NumbersOnly = true,
		 })
	then
		Setting.crt_warp = Slab.GetInputNumber()
	end

	if Slab.Button("reset game", { W = width }) then
		love.event.quit("restart")
	end

	Slab.PushFont(Font.proto_bold_ss)
	Slab.Text("entity count: " .. Engine.get_count())
	Slab.Text("refresh rate: " .. Setting.info__refresh_rate)
	Slab.Text("fps: " .. love.timer.getFPS())
	Slab.EndWindow()
end

function UpdateAll(dt)
	if Setting.info__refresh_rate == 0 then
		local _, _, flags = love.window.getMode()
		Setting.info__refresh_rate = flags.refreshrate
	end
	dt = math.min(dt, 1 / Setting.info__refresh_rate)

	World_WF:update(dt)
	Engine.update(dt)
	Cam:update(dt)

	slab_u(dt)
end
