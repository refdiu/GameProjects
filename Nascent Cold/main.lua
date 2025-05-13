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
  revolver = {true, true, true, true, true, true}
  mc = m_p
  bullet_count = 1
  aniform = 1
  bx = {-237, -237, -237, -237, -237, -237}
  by = {-590, -590, -590, -590, -590, -590}
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
  for i, j in ipairs(bullet) do
    bullet[i]:draw(bx, by)
  end
end

function love.keypressed(key)
  if mp_can_jump == false and key == "up" then
    mp_can_jump = true
  end
  if key == "escape" then
    love.event.quit()
  end
  
  if key == "r" then
    for i, j in ipairs(revolver) do
      revolver[i] = true
    end
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
  function shot()
    if can_shoot then
      local k = 1
      
      while revolver[6] == false do
        
        if love.mouse.isDown(1) and love.mouse.isDown(2) then
          aniform = 3
          
          if bx[k] < 0 then
            bx[k] = -bx[k]
          end
          
          if by[k] < 0 then
            by[k] = -by[k]
          end
          
          bullet:traverse(bx[i], dt)
          revolver[i] = false
          k = k + 1
        end
        
      end
      
      for i, j in ipairs(bullet) do
        
        if bx[i] > 1366 then
          bx[i] = -237
          by[i] = -by[i]
        end
        
      end
      
      if revolver[6] == false then
        can_shoot = false
      end
      
    end
    
  end
  
  
  if revolver[1] == true then
    can_shoot = true
    shot()
  end
  psystem:update(dt)
end
