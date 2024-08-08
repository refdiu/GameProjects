camS = -0
camsp = 50
gravity = 7
Jump_v = -250
pDY = 0

require('assets/world/back_g')
player = love.graphics.newImage("assets/world/player.jpeg")
p_height = love.graphics.getWidth(player)
bg = Background
sti = require('stibg')
platformlvl1 = sti('assets/world/lvl1.lua')
jump_sound = love.audio.newSource("jump.wav", 'static')

pY = love.graphics.getHeight(platformlvl1)


sel = 1
love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Road to Code')
bg:render(1)


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
	if key == 'up' then
		pDY = Jump_v
		love.audio.play(jump_sound)
	end
	if key == 'q' then
		dofile("lvl2plat.lua")
	end
end


render_val = 0
function love.draw()
	ncamS = -math.floor(camS)
	if ncamS >= -350 and ncamS <= -299 or ncamS >= -730 and ncamS <= -670 then
		check = true
	else
		check = false
	end
	bg:drawim()
	love.graphics.draw(player, 300, pY)
	love.graphics.print(pY, 0, 0)
	love.graphics.print(ncamS, 0, 10)
	if ncamS >= -750 and ncamS <= 0 then
		love.graphics.translate(ncamS, 0)
	elseif ncamS < -750 then
		dofile("lvl2plat.lua")
		love.graphics.translate(-680, 0)
	end
	platformlvl1:draw(0, 400)
	if check then
			if pY > 420 then
				love.graphics.print("You suck.", 270, 220)
				dofile("main.lua")
			end
	elseif pY > 330 then
		pY = 330
		pDY = 0
	end
end


function love.update(dt)
	pDY = pDY + gravity
	pY = pY + pDY*dt
	bg:u(dt)
	if love.keyboard.isDown("left") then
		camS = camS - camsp*dt
	elseif love.keyboard.isDown("right") then
		camS = camS + camsp*dt
	end
end
