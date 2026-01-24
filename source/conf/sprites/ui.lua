local new_image = love.graphics.newImage

local Ui = {}

Ui.Control__joystick = new_image("assets/ui/control/joystick.png")
Ui.Control__a = new_image("assets/ui/control/a.png")
Ui.Control__b = new_image("assets/ui/control/b.png")

Ui.Control__click_a = new_image("assets/ui/control/c_a.png")
Ui.Control__click_b = new_image("assets/ui/control/c_b.png")

Ui.Background__planet = new_image("assets/ui/background/planet.png")
Ui.Background__asteroid_1 = new_image("assets/ui/background/asteroid-1.png")

return Ui
