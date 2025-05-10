love.window.setMode(1366, 768, {fullscreen = true, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Nascent Cold')
require("assets/player")
require("assets/bullet")
bt = {}

function love.load()
  u = 2
  d = 100
  mp_can_jump = false
  bullet = {b, b, b, b, b, b}
  mc = m_p
  bullet_count = 1
  aniform = 1
  bx = -237
  by = -590
  can_shoot = false
  mouse_x, mouse_y = 0
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
  love.graphics.print(mouse_x.."\n"..mouse_y)
  love.graphics.draw(psystem, love.graphics.getWidth()- 140, -100, 0, 0.2, 0.2)
  m_p:draw(100, 480, 2, 2, aniform)
  bullet[1]:draw(bx, by)
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

function love.mousemoved(mx, my)
  mouse_x = mx
  mouse_y = my
end

function love.mousereleased(x, y, button)
  if button == 2 then
    aniform = 1
  end
end

function love.update(dt)
  if love.mouse.isDown(2) and love.mouse.isDown(1) then
    aniform = 3
    can_shoot = true
    if by < 0 then
      by = -by
    end
    if bx < 0 then
      bx = -bx
    end
    bullet_shot()
  end
  
  if can_shoot then
    bx = bullet[1]:traverse(bx, dt)
  end
  
  function bullet_shot()
    if bx >= 1366 then
      can_shoot = false
      bx = -237
    end
  end
  psystem:update(dt)
end
