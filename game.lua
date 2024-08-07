camS = -0
camsp = 50
gravity = 7
Jump_v = -250
pDY = 0
pY = 330

require('assets/world/back_g')
player = love.graphics.newImage("assets/world/player.jpeg")
p_height = love.graphics.getWidth(player)
bg = Background
sti = require('stibg')
platformlvl1 = sti('assets/world/lvl1.lua')


sel = 1
love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Road to Code')
bg:render()


function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
	if key == 'c' then
		sel = math.random(1, 6)
	end
	if key == 'r' then
		dofile("main.lua")
	end
	if key == 'space' and pDY == 0 then
		pDY = Jump_v
	end
end


render_val = 0
function love.draw()
	ncamS = -math.floor(camS)
	bg:drawim()
	love.graphics.draw(player, 300, pY)
	local pF = 0.27
	love.graphics.print(ncamS, 0, 0)
	if ncamS >= -640 and ncamS <= 0 then
		love.graphics.translate(ncamS, 0)
	elseif ncamS < -640 and ncamS >= -1280 then
		render_val = 640
		love.graphics.translate(ncamS, 0)
	elseif ncamS < -1280 then
		love.graphics.translate(-1280, 0)
	end
	platformlvl1:draw(render_val, 400)
end


function love.update(dt)
	pDY = pDY + gravity
	pY = pY + pDY*dt
	if pY > 330 then
		pY = 330
		pDY = 0
	end
	bg:u(dt)
	if love.keyboard.isDown("left") then
		camS = camS - camsp*dt
	elseif love.keyboard.isDown("right") then
		camS = camS + camsp*dt
	end
end
