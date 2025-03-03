function love.load()
  love.window.setMode(960, 360, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
  snake_x = 100
  snake_y = 100
  snake_orient = 0
  tv = {["up"] = true, ["down"] = true, ["left"] = false, ["right"] = true}
end

snake_yellow = love.graphics.newImage("assets/fhead.png")
snake_green = love.graphics.newImage("assets/sbhead.png")
body = love.graphics.newImage("assets/sbody.png")

function love.draw()
	love.graphics.draw(snake_yellow, snake_x, snake_y, snake_orient)
  love.graphics.print(snake_x)
  love.graphics.print("\n"..snake_y)
end

function love.keypressed(key)
  if key == "s" then
    love.event.quit()
  end
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
    snake_y = snake_y - 5
  elseif snake_orient == 1.57 then
    snake_y = snake_y + 5
  elseif snake_orient == 0 then
    snake_x = snake_x + 5
  elseif snake_orient == -3.14 then
    snake_x = snake_x - 5
  end
  
  if snake_x > 950 then
    snake_x = 950
  elseif snake_x <10 then
    snake_x = 10
  end
  if snake_y > 350 then
    snake_y = 350
  elseif snake_y < 10 then
    snake_y = 10
  end
end
