v1 = 360
v2 = 360
function love.load()  
  require('p1')
  player_1 = P1
  player_2 = P1
  ground = P1
  love.window.setTitle("FootHeadBall")
  	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
  u = 1.5
  s1 = -20
  s2 = 650
  player1canjump = false
end

function love.draw()
  ground:drawground()
  player_1:drawplayer(s1, v1, 0, 1, 1)
  player_2:drawplayer(s2, v2, 0, -1, 1)
  love.graphics.print({{0, 0, 0, 255}, v1}, 0, 0)
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
  
  if player1canjump == false and key == "up" then
    player1canjump = true
  end
end


function love.update(dt)
  if playercanjump then
    v1 = v1 + u
    if u > 1.5 then
      u = 1.5
      u = -(u - (1.5)*dt)
    else
      u = u + (1.5)*dt
    end
    if v1 < 360 then
      player1canjump = false
    end
  end
  
  if v1 > 360 or v2 > 360 then
    v1 = 360
    v2 = 360
  end
  
  if love.keyboard.isDown("left") then
    s1 = s1 - 90*dt
  elseif love.keyboard.isDown("right") then
    s1 = s1 + 90*dt
  end
  
  if s1 < -20 then
    s1 = -20
  elseif s1 > 600 then
    s1 = 600
  end
end