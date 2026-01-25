local main = love.filesystem.read("source/shaders/main.glsl")

local Shader = {}
Shader.main = love.graphics.newShader(main)
return Shader
