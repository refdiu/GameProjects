local v = 360

local u = 1.5
function love.load()  
  player_1 = require('p1')
  player_1 = P1
  	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
end

function love.draw()
  love.graphics.print("Hewll")
  player_1:draw(0, v)
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
  elseif u > 1.5 then
    u = 1.5
    u = -(u - dt)
  else
    u = u + dt
  end
  
  if u < 0 then
    u = 0
  end
  
  if v > 360 then
    v = 360
  end
end