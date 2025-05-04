love.window.setMode(1366, 768, {fullscreen = true, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Nascent Cold')
require("assets/player")
require("assets/bullet")
bt = {}

function love.load()
  u = 2
  d = 100
  mp_can_jump = false
  bullet = b
  mc = m_p
  bullet_count = 1
  aniform = 1
end

bg = love.graphics.newImage("assets/mpbg.png")


sfall = love.graphics.newImage('assets/sf.png')
psystem = love.graphics.newParticleSystem(sfall, 10000)
psystem:setParticleLifetime(1, 10)
psystem:setEmissionRate(50)
psystem:setSizeVariation(0.89)
psystem:setLinearAcceleration(-400, -100, 100, 500)
psystem:setColors(1, 1, 1, 1, 1, 1, 1, 0)

function love.draw()
  love.graphics.setBackgroundColor(100, 0, 0, 200)
  --love.graphics.draw(bg)
  love.graphics.print(timeval)
  love.graphics.draw(psystem, love.graphics.getWidth()- 140, -100, 0, 0.2, 0.2)
  m_p:draw(100, 480, 2, 2, aniform)
  b:draw()
end

function love.keypressed(key)
  if mp_can_jump == false and key == "up" then
    mp_can_jump = true
  end
  if key == "escape" then
    love.event.quit()
  end
end

function love.mousepressed(x, y, button)
  if button == 2 then
    aniform = 3
  end
end

function love.mousereleased(x, y, button)
  if button == 2 then
    aniform = 1
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
  timeval = dt*100 - (dt*100 - 1)
  psystem:update(dt)
end
