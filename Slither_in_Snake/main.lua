snake_x = 100
snake_y = 100
last_x, last_y = 0
function love.load()
  love.window.setMode(960, 360, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
  --love.graphics.newImage("assets/sbody.png")
  snake_orient = 0
  rand_x = math.random(0, 959)
  rand_y = math.random(0, 359)
  counter = 0
  mouse_x, mouse_y = 0
  next_x, next_y = 0
end

snake_yellow = love.graphics.newImage("assets/sfhead.png")
snake_body = love.graphics.newImage("assets/sbody.png")
snake_green = love.graphics.newImage("assets/sbhead.png")
snake_table = {snake_yellow, snake_body}
pellet = love.graphics.newImage("assets/pellet.png")

function love.draw()
	love.graphics.draw(pellet, rand_x, rand_y, 0, 2, 2)
  love.graphics.draw(snake_table[1], snake_x, snake_y, snake_orient, 1, 1, snake_green:getWidth()/2, snake_green:getHeight()/2)
  
  for i, j in ipairs(snake_table) do
    if counter > 0 --[[and i > 1]] then
      love.graphics.draw(snake_table[i], last_x*i, last_y*i, snake_orient, 1, 1, snake_green:getWidth()/2, snake_green:getHeight()/2)
      last_x, last_y = next_x, next_y
    end
  end
    
  
  love.graphics.print(counter)
  --love.graphics.print("\n"..mouse_x)
  --love.graphics.print("\n\n"..mouse_y)
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
    next_x, next_y = snake_x, snake_y + snake_yellow:getHeight()
  elseif snake_orient == 1.57 then
    snake_y = snake_y + 3
    next_x, next_y = snake_x, snake_y - snake_yellow:getHeight()
  elseif snake_orient == 0 then
    snake_x = snake_x + 3
    next_x, next_y = snake_x - snake_yellow:getWidth(), snake_y
  elseif snake_orient == -3.14 then
    snake_x = snake_x - 3
    next_x, next_y = snake_x + snake_yellow:getWidth(), snake_y
  end
  
  if snake_x >= rand_x-30 and snake_x <= rand_x+20 and snake_y >= rand_y-30 and snake_y <= rand_y+20 then
    counter = counter + 1
    rand_x = math.random(0, 958)
    rand_y = math.random(0, 358)
    --table.insert(snake_table, snake_body)
  end
  
  if snake_x <= 0 or snake_x >= 950 or snake_y <= 0 or snake_y >= 350 then
    love.event.quit()
  end
end
