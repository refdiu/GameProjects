function love.load()
  love.window.setMode(640, 480)
  pressings = 0
  mx = 0
  my = 0
  butt = love.graphics.newImage("buttonui.png")
  bx = (640 - butt:getWidth()/2)/2
  by = (480 - butt:getHeight())/2
  pre = love.graphics.newQuad(0, 0, 256, 256, butt)
  unpre = love.graphics.newQuad(256, 0, 256, 256, butt)
  quad = pre
  butt_sound = love.audio.newSource("buttsound.mp3", "static")
  ftf = love.graphics.newFont("arcadeclassic/ARCADECLASSIC.TTF")
end


function love.draw()
  love.graphics.setFont(ftf)
  love.graphics.print(mx.."\n"..my)
  love.graphics.print(pressings, 290, 50, 0, 5, 5)
  love.graphics.draw(butt, quad, bx, by)
end

function love.mousepressed(x, y, button, istouch, p)
  if x >= bx and x <= bx+butt:getWidth() and y >= by and y <= by+butt:getHeight() and button == 1 then
    pressings=pressings + 1
    quad = unpre
    butt_sound:play()
  end
end

function love.mousemoved(x, y)
  mx = x
  my = y
end

function love.mousereleased(x, y, button, istouch, presses)
  if x >= bx and x <= bx+butt:getWidth() and y >= by and y <= by+butt:getHeight() and button == 1 then
    quad = pre
  end
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end