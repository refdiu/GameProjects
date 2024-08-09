--dependencies
require('assets/world/back_g')
require('audio')
require('utils')
sti = require('stibg')
wf = require('windfield')

--some required constants
camS = -0
camsp = 50
gravity = 7
Jump_v = -300
pDY = 0
render_val = 0
i = 1


--background inclusion
bg = Background


--de-bloats some conditional statements
f = Features
j = Jump
world = wf.newWorld(0, 500)


--the real assets
--player = {}
--player.sprite = love.graphics.newImage("assets/world/player.png")
player = world:newBSGRectangleCollider(100, pY, 75, 70, 14)
ground = world:newRectangleCollider(0, 340, 800, 300)
ground:setType('static')
--player.collider:setFixedRotation(true)
p_height = love.graphics.getWidth(player)	


--tilemaps
platform = sti('assets/world/lvl2.lua')
pY = love.graphics.getHeight(platformlvl1)


--sounds
sfx = Sfx

love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Road to Code')
bg:render(2)


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
	if key == 'up' and pDY == 0 then
		pDY = Jump_v
		sfx:play(4)
	end
end


--the real thing happens here
function love.draw()
	ncamS = -math.floor(camS)
	fall_condition = f:cond_p2(ncamS)
	collide_condition = f:checklvl2(ncamS, pY)
	
	bg:drawim()
	world:draw()
	--love.graphics.draw(player.sprite, 100, pY+5)
	love.graphics.print(pY, 0, 0)
	love.graphics.print(ncamS, 0, 10)
	
	if ncamS >= -1100 and ncamS <= 0 then
		love.graphics.translate(ncamS, 0)
	end
	
	
	platform:draw(0, 350)
	if fall_condition then
			if pY > 420 then
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
	if love.keyboard.isDown("left") then
		camS = camS - camsp*dt
	elseif love.keyboard.isDown("right") then
		camS = camS + camsp*dt
	end
	
	pDY = pDY + gravity
	pY = pY + pDY*dt
	world:update(dt)
	i = i + 1
	if i > 8 then
		i = 1
	end
end
