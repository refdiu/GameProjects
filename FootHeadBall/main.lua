v = 360
function love.load()  
  player_1 = require('p1')
  player_1 = P1
  	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
  u = 1.5
  s = -20
  playercanjump = false
end

function love.draw()
  player_1:draw(s, v)
  love.graphics.print({{0, 0, 0, 255}, v}, 0, 0)
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
  
  if playercanjump == false and key == "up" then
    playercanjump = true
  end
end


function love.update(dt)
  if playercanjump then
    v = v + u
    if u > 1.5 then
      u = 1.5
      u = -(u - (1.5)*dt)
    else
      u = u + (1.5)*dt
    end
    if v < 360 and v > 358.8 then
      playercanjump = false
    end
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