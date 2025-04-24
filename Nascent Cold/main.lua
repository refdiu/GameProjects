love.window.setMode(1366, 768, {fullscreen = true, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Nascent Cold')
function love.load()
  u = 2
  d = 100
  mp_can_jump = false
end


sfall = love.graphics.newImage('sf.png')
psystem = love.graphics.newParticleSystem(sfall, 10000)
psystem:setParticleLifetime(1, 10)
psystem:setEmissionRate(50)
psystem:setSizeVariation(0.89)
psystem:setLinearAcceleration(-400, -100, 100, 500)
psystem:setColors(1, 1, 1, 1, 1, 1, 1, 0)

function love.draw()
  love.graphics.print("hello")
  love.graphics.draw(psystem, love.graphics.getWidth()- 140, -100, 0, 0.2, 0.2)
end

function love.keypressed(key)
  if mp_can_jump == false and key == "up" then
    mp_can_jump = true
  end
  if key == "escape" then
    love.event.quit()
  end
end

function love.update(dt)
  if mp_can_jump then
    v = v + u
    if u > 1.5 then
      u = 1.5
      u = -(u - (1.5)*dt)
    else
      u = u + (1.5)*dt
    end
  end
  psystem:update(dt)
end
