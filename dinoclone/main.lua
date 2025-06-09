	--some presets
love.window.setMode(700, 300, {fullscreen = false, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Oh my Gotto boy')
require("t")
t = trees
background = love.graphics.newImage("Background.png")

function love.load()
  tx = 701
end

function love.draw()
  t:draw(tx)
end

function love.update(dt)
  tx = tx - 90*dt
  if tx < 0 then
    tx = 701
  end
end