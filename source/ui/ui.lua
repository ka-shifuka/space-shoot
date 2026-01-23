local Ui = {}

Ui.Control = require "source.ui.state.control"

Ui.draw = function(self)
	self.Control:draw()
end

Ui.pressed = function(self, id, x, y)
	self.Control:pressed(id, x, y)
end
Ui.moved = function(self, id, x, y)
	self.Control:moved(id, x, y)
end
Ui.released = function(self, id, x, y)
	self.Control:released(id, x, y)
end

return Ui
