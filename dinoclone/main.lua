	--some presets
love.window.setMode(700, 300, {fullscreen = false, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Oh my Gotto boy')
require("t")
t = trees
character = love.graphics.newImage("idle.png")
charquad = love.graphics.newQuad(10, 0, 126, 39, character)

function love.load()
  tx = 701
end

function love.draw()
  t:draw(tx)
  love.graphics.draw(character, charquad, 0, 183, 0, 2, 2)  
end

function love.update(dt)
  tx = tx - 320*dt
  if tx < 0 then
    tx = 701
  end
end