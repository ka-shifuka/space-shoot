local Entities = {}

Entities.Player = require "source.engine.entity.player"
Entities.Asteroid__Small = require "source.engine.entity.asteroid.small"
Entities.Bullet__Small = require "source.engine.entity.bullet.small"
Entities.Effect__Fire = require "source.engine.entity.effect.fire"

for key, value in pairs(Entities) do
	---@cast value Entity
	value._KEY = key
end

return Entities
