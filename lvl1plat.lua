--dependencies
require('assets/world/back_g')
require('audio')
require('utils')
sti = require('stibg')


--some required constants
camS = -0
camsp = 25
gravity = 7
Jump_v = -250
pDY = 0
sel = 1
render_val = 0
i = 1

--background inclusion
bg = Background

--de-bloats some conditional statements
f = Features
j = Jump

--the real assets
player = love.graphics.newImage("assets/world/player.png")
p_height = love.graphics.getWidth(player)
tramp = love.graphics.newImage("assets/world/trampoline.png")
pd = love.graphics.newImage("assets/world/pd_sprite.png")	

--tilemaps
platformlvl1 = sti('assets/world/lvl1.lua')
pY = love.graphics.getHeight(platformlvl1)


--sounds
sfx = Sfx


--some presets
love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Road to Code')
bg:render(1)





--key config
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
	if key == 'up' and ncamS <= -350 then
		pDY = Jump_v
		sfx:play(4)
	end
	if key == 'q' then
		dofile("lvl2plat.lua")
	end
end





--the real thing happens here
function love.draw()
	ncamS = -math.floor(camS)
	condition = f:cond(ncamS)
	
	bg:drawim()
	love.graphics.draw(player, 100, pY+5)
	love.graphics.print(pY, 0, 0)
	love.graphics.print(ncamS, 0, 10)
	
	if ncamS >= -1000 and ncamS <= 0 then
		love.graphics.translate(ncamS, 0)
	elseif ncamS < -1000 then
		love.timer.sleep(2)
		dofile("lvl2plat.lua")
		love.graphics.translate(-1000, 0)
	end
	
	platformlvl1:draw(0, 400)
	love.graphics.draw(tramp, 500, 368, 0, 0.05, 0.05)
	love.graphics.draw(pd, 1000, 340, 0, 0.1, 0.1)
	
	
	if condition then
			if pY > 420 then
				love.graphics.print('you suck', 150, 150)
				love.timer.sleep(2)
				dofile("main.lua")
			end
	elseif pY > 335 then
		pY = 335
		pDY = 0
	end

end





--updation
function love.update(dt)
	bg:u(dt)
	if love.keyboard.isDown("left") then
		camS = camS - camsp*dt
	elseif love.keyboard.isDown("right") then
		camS = camS + camsp*dt
	end
	
	pDY = pDY + gravity
	pY = pY + pDY*dt
	i = i + 1
	if i > 8 then
		i = 1
	end
end

