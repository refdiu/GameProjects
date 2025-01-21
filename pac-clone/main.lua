f = love.graphics.newImage("flower.jpg")
love.window.setMode(1366, 768)
local v = 380
local u = -1
function love.draw()
  love.graphics.draw(f, 500, v, -1.57, 0.1, 0.1)
  love.graphics.print(v)
  love.graphics.print("\n"..u)
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end

function love.update(dt)
  v = v + u
  if u == 0 then
    u = u - dt
  elseif u > 3 then
    u = 3
    u = -(u - dt)
  else
    u = u + dt
  end
end