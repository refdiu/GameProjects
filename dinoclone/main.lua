	--some presets
love.window.setMode(700, 300, {fullscreen = false, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Oh my Gotto boy')
require("t")
t = trees
character = love.graphics.newImage("idle.png")
charquad = love.graphics.newQuad(10, 0, 126, 39, character)
local cam_ord = 183
jump_v = -300
g = 7
local cam_dyspeed = 0

function love.load()
  tx = 701
  playercanjump = false
end

function love.draw()
  t:draw(tx)
  love.graphics.draw(character, charquad, 0, cam_ord, 0, 2, 2)
end

function love.keypressed(key)
	if key == "space" and cam_dyspeed == 0 then
		cam_dyspeed = jump_v
	end
end


function love.update(dt)
  tx = tx - 320*dt
  if tx < 0 then
    tx = 701
  end
  cam_dyspeed = cam_dyspeed + g
	cam_ord = cam_ord + cam_dyspeed*dt
	if cam_ord > 183 then
		cam_ord = 183
		cam_dyspeed = 0
	end
end