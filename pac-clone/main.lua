f = love.graphics.newImage("flower.jpg")
love.window.setMode(1366, 768)
local c = 190
function love.draw()
  love.graphics.draw(f, 500, c, -1.57, 0.1, 0.1)
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end

function love.update(dt)
  if c > 768 or c < 768 then
    c = c - dt*30
  elseif c < 200 then
    c = c + dt*30
  end
end