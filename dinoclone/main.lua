	--some presets
love.window.setMode(700, 300, {fullscreen = false, vsync = 1, stencil = true, resizable = false, centered = true})
love.window.setTitle('cokro')
require("t")
t = trees

character = love.graphics.newImage("idle.png")
local cam_ord = 183
jump_v = -300
g = 7
local cam_dyspeed = 0

score = 0
bg = love.graphics.newImage("bg.png")

function love.load()
  tx = 701
  playercanjump = false
end

function love.draw()
  love.graphics.setBackgroundColor(backgroundcolor)
  t:draw(tx)
  love.graphics.print(math.floor(score))
  love.graphics.draw(character, 70, cam_ord, 0, 2, 2)
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
  
  if cam_ord >= 183 then  
    if character:getWidth() < tx + 30 and character:getWidth() > tx - 5 then
      love.event.quit()
    end
  end
end