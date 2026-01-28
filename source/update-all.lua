local function slab_u(dt)
	Slab.Update(dt)
	Slab.PushFont(Font.proto_bold_sm)
	Slab.BeginWindow("Debug", {
		Title = "Debug",
		TitleAlignX = "left",
		X = 15,
		Y = 15,
	})
	local width = 150

	Slab.PushFont(Font.proto_bold_xxs)
	if Slab.CheckBox(Setting.CrtEnable, "crt shader") then
		Setting.CrtEnable = not Setting.CrtEnable
	end
	if Slab.CheckBox(Setting.debug__ShowPhysics, "show physics") then
		Setting.debug__ShowPhysics = not Setting.debug__ShowPhysics
	end

	Slab.PushFont(Font.proto_bold_xxs)
	Slab.Text("crt wrap and scan")
	Slab.PopFont()
	if
		 Slab.Input("crt wrap", {
			 Text = Setting.CrtWarp,
			 NumbersOnly = true,
		 })
	then
		Setting.CrtWarp = Slab.GetInputNumber()
	end
	if
		 Slab.Input("crt scan", {
			 Text = Setting.CrtScan,
			 NumbersOnly = true,
		 })
	then
		Setting.CrtScan = Slab.GetInputNumber()
	end

	if Slab.Button("reset game", { W = width }) then
		love.event.quit("restart")
	end

	Slab.PushFont(Font.proto_bold_xxs)
	Slab.Text(string.format("x: %d, y: %d", player.x, player.y))
	Slab.Text("entity count: " .. Engine.get_count())
	Slab.Text("refresh rate: " .. Setting.info__RefreshRate)
	Slab.Text("fps: " .. love.timer.getFPS())
	Slab.EndWindow()
end

function UpdateAll(dt)
	if Setting.info__RefreshRate == 0 then
		local _, _, flags = love.window.getMode()
		Setting.info__RefreshRate = flags.refreshrate
	end
	dt = math.min(dt, 1 / Setting.info__RefreshRate)

	World_WF:update(dt)
	Engine.update(dt)
	Cam:update(dt)

	slab_u(dt)
end
