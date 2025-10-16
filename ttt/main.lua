function love.load()
	love.window.setMode(640, 480, {fullscreen = true, vsync = -1, resizable = false, centered = true, highdpi = true})
	sgrid = love.graphics.newImage("grid.png")
  xe = love.graphics.newImage("ex.png")
  o = love.graphics.newImage("oh.png")
  x_1 = -580
  y_1 = -155
end

p1turn = true
p2turn = false
mouse_x, mouse_y = 0, 0


matrix = {{0, 0, 0}, 
          {0, 0, 0}, 
          {0, 0, 0}}

function love.draw()
	love.graphics.draw(sgrid, 450)
  love.graphics.print(mouse_x.."\n"..mouse_y)
  love.graphics.draw(xe, x_1, y_1, 0, 0.2)
end


--{{580, 155}, {859, 155}, {1138, 155}}
--{{580, 410}, {859, 410}, {1138, 410}}
--{{580, 665}, {859, 665}, {1138, 665}}
function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end

function love.mousepressed(x, y, button)
  if button == 1 and p1turn == true and (x >= 580 and x <= 800 and y >= 150 and y <= 370) then
    x_1 = -x_1
    y_1 = -y_1
    
  end
end

function love.mousemoved(x, y)
  mouse_x = x
  mouse_y = y
end