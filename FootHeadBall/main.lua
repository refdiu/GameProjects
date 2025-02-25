function love.load()  
  player_1 = require('p1')
  player_1 = P1
  	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
end

function love.draw()
  love.graphics.print("Hewll")
  player_1:draw(0, 320)
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end