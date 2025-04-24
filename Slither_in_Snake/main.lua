function love.load()
  love.window.setMode(960, 360, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
  snake_x = 100
  snake_y = 100
  --love.graphics.newImage("assets/sbody.png")
  snake_orient = 0
  rand_x = math.random(0, 959)
  rand_y = math.random(0, 359)
  counter = 0
  mouse_x = 0
  mouse_y = 0
end

snake_yellow = love.graphics.newImage("assets/sfhead.png")
snake_green = love.graphics.newImage("assets/sbhead.png")
snake_table = {snake_green, snake_green}
pellet = love.graphics.newImage("assets/pellet.png")

function love.draw()
	love.graphics.draw(pellet, rand_x, rand_y, 0, 2, 2)  
  for i, j in ipairs(snake_table) do
    if snake_orient == -1.57 then
      love.graphics.draw(snake_table[i], snake_x, snake_y -(snake_green:getHeight()*(i-1)), snake_orient, 1, 1, snake_green:getWidth()/2, snake_green:getHeight()/2)
    elseif snake_orient == 1.57 then
      love.graphics.draw(snake_table[i], snake_x, snake_y +(snake_green:getHeight()*(i-1)), snake_orient, 1, 1, snake_green:getWidth()/2, snake_green:getHeight()/2)
    elseif snake_orient == 0 then
      love.graphics.draw(snake_table[i], snake_x-(snake_green:getWidth()*(i-1)), snake_y, snake_orient, 1, 1, snake_green:getWidth()/2, snake_green:getHeight()/2)
    elseif snake_orient == -3.14 then
      love.graphics.draw(snake_table[i], snake_x+(snake_green:getWidth()*(i-1)), snake_y, snake_orient, 1, 1, snake_green:getWidth()/2, snake_green:getHeight()/2)
    end
    
  end
  love.graphics.print(counter)
  love.graphics.print("\n"..mouse_x)
  love.graphics.print("\n\n"..mouse_y)
end

function love.keypressed(key)
  if key == "s" then
    love.event.quit()
  end
end

function love.mousemoved(x, y)
  mouse_x = x
  mouse_y = y
end

function love.update(dt)
  if love.keyboard.isDown("up") and snake_orient ~= 1.57 then
    snake_orient = -1.57
  elseif love.keyboard.isDown("down") and snake_orient ~= -1.57 then
    snake_orient = 1.57
  elseif love.keyboard.isDown("right") and snake_orient ~= -3.14 then
    snake_orient = 0
  elseif love.keyboard.isDown("left") and snake_orient ~= 0 then
    snake_orient = -3.14
  end
  
  
  if snake_orient == -1.57 then
    snake_y = snake_y - 3
  elseif snake_orient == 1.57 then
    snake_y = snake_y + 3
  elseif snake_orient == 0 then
    snake_x = snake_x + 3
  elseif snake_orient == -3.14 then
    snake_x = snake_x - 3
  end
  
  if snake_x >= rand_x-30 and snake_x <= rand_x+20 and snake_y >= rand_y-30 and snake_y <= rand_y+20 then
    counter = counter + 1
    rand_x = math.random(0, 958)
    rand_y = math.random(0, 358)
    table.insert(snake_table, snake_green)
  end
  
  if snake_x <= 0 or snake_x >= 950 or snake_y <= 0 or snake_y >= 350 then
    love.event.quit()
  end
end
