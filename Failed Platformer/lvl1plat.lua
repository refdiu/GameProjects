--dependencies
require('assets/world/back_g')
require('audio')
require('utils')
require('assets/world/coo')
sti = require('stibg')


--some required constants
camS = -0
camsp = 40
gravity = 3
Jump_v = -100
pDY = 0
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
platform = sti('assets/world/lvl1.lua')
pY = love.graphics.getHeight(platformlvl1)


--sounds
sfx = Sfx


--some presets
love.window.setMode(1024, 768, {fullscreen = false, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Road to Code')
bg:render(1)




--key config
function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
	if key == 'r' then
		dofile("main.lua")
	end
	if key == 'up' and ncamS < -279 and pDY == 0 then
		Jump_v = -150
		pDY = Jump_v
		sfx:play(4)
	end
end





--the real thing happens here
function love.draw()
	ncamS = -math.floor(camS)
	condition = f:cond_p1(ncamS)
	
	bg:drawim()
	c:show(mx, my)
	love.graphics.draw(player, 100, pY+5)
	love.graphics.print(pY, 0, 0)
	love.graphics.print(ncamS, 0, 10)
	
	if ncamS >= -11000 and ncamS <= 0 then
		love.graphics.translate(ncamS, 0)
	end
	
	platform:draw(0, 320)
	love.graphics.draw(tramp, 400, 368, 0, 0.05, 0.05)
	love.graphics.draw(pd, 700, 340, 0, 0.1, 0.1)
	
	
	if condition then
			if pY > 500 then
				love.timer.sleep(2)
				dofile("main.lua")
			end
	elseif pY > 335 then
		pY = 335
		pDY = 0
	end
	
	if ncamS >= -1656 and ncamS <= 1595 and pY > 290 then
		pY = 290
		pDY = 0
	end
end


function love.mousemoved(x, y)
	mx = x
	my = y
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

