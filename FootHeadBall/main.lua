v = 360
function love.load()  
  player_1 = require('p1')
  player_1 = P1
  	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
  u = 1.5
  s = -20
end

function love.draw()
  love.graphics.print("Hewll")
  player_1:draw(s, v)
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end


function love.update(dt)
  if love.keyboard.isDown("up") then
    u = 1.5
  else
    u = 0
  end
  
  v = v + u
  if u > 1.5 then
    u = 1.5
    u = -(u - dt)
  else
    u = u + dt
  end
  
  if v > 360 then
    v = 360
  end
  
  if love.keyboard.isDown("left") then
    s = s - 90*dt
  elseif love.keyboard.isDown("right") then
    s = s + 90*dt
  end
  
  if s < -20 then
    s = -20
  elseif s > 600 then
    s = 600
  end
end