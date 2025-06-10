	--some presets
love.window.setMode(700, 380, {fullscreen = false, vsync = 1, stencil = true, resizable = false, centered = true})
love.window.setTitle('cokro')
require("assets/t")
t = trees

character = love.graphics.newImage("assets/idle.png")
local cam_ord = 183
jump_v = -300
g = 7
local cam_dyspeed = 0

score = 0
hiscore = 0
button = love.graphics.newImage("assets/button UI.png")
jump_quad = love.graphics.newQuad(64, 80, 16, 16, button)
exit_quad = love.graphics.newQuad(64, 16, 16, 16, button)

function love.load()
  tx = 701
  playercanjump = false
  gameover = false
end

function love.draw()
  local touches = love.touch.getTouches()

  for i, id in ipairs(touches) do
    local x, y = love.touch.getPosition(id)
    if x > 50 and x < 98 and y > 300 and y < 348 then
      cam_dyspeed = jump_v
    end
  
    if x > 146 and x < 194 and y > 300 and y < 348 then
      love.event.quit()
    end
  end
  
  
  
  love.graphics.setBackgroundColor(backgroundcolor)
  t:draw(tx)
  love.graphics.print({{0,0,0}, "Score:"..math.floor(score)})
  love.graphics.print({{0,0,0}, "\nHigh Score:"..math.floor(hiscore)})
  love.graphics.draw(character, 70, cam_ord, 0, 2, 2)
  love.graphics.draw(button, jump_quad, 50, 300, 0, 3, 3)
  love.graphics.draw(button, exit_quad, 146, 300, 0, 3, 3)
  
  if gameover then
    love.graphics.clear(0,0,0)
    button = love.graphics.newImage("assets/button UI.png")
    restart_quad = love.graphics.newQuad(48, 96, 16, 16, button)
    love.graphics.print("Game Over", 210, 0, 0, 4, 4)
    love.graphics.draw(button, restart_quad, 326, 240, 0, 3, 3)
    local touches = love.touch.getTouches()

    for i, id in ipairs(touches) do
      local x, y = love.touch.getPosition(id)
      if x > 326 and x < 374 and y > 240 and y < 288 then
        tx = 701
        if hiscore <= score then
          hiscore = score
        end
        score = 0
        gameover = false
      end
    end
  end
end

function love.keypressed(key)
	if key == "space" and cam_dyspeed == 0 then
		cam_dyspeed = jump_v
	end
  if key == 'escape' then
    love.event.quit()
  end
end

function love.update(dt)
  backgroundcolor = {math.random(0,1), math.random(0,1), math.random(0,1)}
  tx = tx - 320*dt
  if tx < -40 then
    tx = 701
  end
  cam_dyspeed = cam_dyspeed + g
	cam_ord = cam_ord + cam_dyspeed*dt
	if cam_ord > 183 then
		cam_ord = 183
		cam_dyspeed = 0
	end
  
  score = score + 0.5
  if hiscore <= score then
    hiscore = score
  end
  
  if cam_ord >= 183 then  
    if character:getWidth() < tx + 30 and character:getWidth() > tx - 5 then
      --love.event.quit()
      --dofile("gameover.lua")
      gameover = true
    end
  end
end