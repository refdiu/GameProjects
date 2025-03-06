function love.load()
  love.window.setMode(960, 360, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
  snake_x = 100
  snake_y = 100
  snake_v = -1
  snake_h = 1
  angle = 1.57
  tv = {["up"] = true, ["down"] = true, ["left"] = false, ["right"] = true}
  rand_x = math.random(0, 959)
  rand_y = math.random(0, 359)
  counter = 0
end

snake_yellow = love.graphics.newImage("assets/sfhead.png")
snake_green = love.graphics.newImage("assets/sbhead.png")
body = love.graphics.newImage("assets/sbody.png")
pellet = love.graphics.newImage("assets/pellet.png")

function love.draw()
	love.graphics.draw(snake_yellow, snake_x, snake_y, 0, snake_h, snake_h)
  --love.graphics.draw(snake_green, snake_x, snake_y, 0, -snake_h, snake_v)
  love.graphics.print(counter)
  love.graphics.draw(pellet, rand_x, rand_y)
end

function love.keypressed(key)
  if key == "s" then
    love.event.quit()
  end
  if key == "r" then
    if angle == 1.57 then
      angle = -1.57
    elseif angle == -1.57 then
      angle = 1.57
    end
  end
end

function love.update(dt)
  --[[if love.keyboard.isDown("up") and snake_orient ~= 1.57 then
    snake_orient = -1.57
  elseif love.keyboard.isDown("down") and snake_orient ~= -1.57 then
    snake_orient = 1.57
  elseif love.keyboard.isDown("right") and snake_orient ~= -3.14 then
    snake_orient = 0
  elseif love.keyboard.isDown("left") and snake_orient ~= 0 then
    snake_orient = -3.14
  end
  
  if snake_orient == -1.57 then
    snake_y = snake_y - 5
  elseif snake_orient == 1.57 then
    snake_y = snake_y + 5
  elseif snake_orient == 0 then
    snake_x = snake_x + 5
  elseif snake_orient == -3.14 then
    snake_x = snake_x - 5
  end
  
  if snake_x >= rand_x-8 and snake_x <= rand_x+10 and snake_y >= rand_y-8 and snake_y <= rand_y+10 then
    counter = counter + 1
    rand_x = math.random(0, 958)
    rand_y = math.random(0, 358)
  end
  
  if snake_x <= 0 or snake_x >= 960 or snake_y <= 0 or snake_y >= 360 then
    love.event.quit()
  end]]--
end
