camS = 0
camsp = 50
require('assets/world/back_g')
bg = Background
sti = require('stibg')
stip = require('sti')
charac = stip('assets/world/mc.lua')
platformlvl = {sti('assets/world/lvl1.lua'), 
	sti('assets/world/lvl2.lua'), 
	sti('assets/world/lvl3.lua'), 
	sti('assets/world/lvl4.lua'),
	sti('assets/world/lvl5-0.lua'),
	sti('assets/world/lvl5-1.lua')
}
sel = 1
love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Road to Code')
bg:render()


function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
	if key == "c" then
		sel = math.random(1, 6)
	end
	if key == "r" then
		dofile("main.lua")
	end
end


function love.draw()
	bg:drawim()
	local pF = 0.27
	love.graphics.print(-math.floor(camS), 0, 0)
	charac:draw(320, 327)
	love.graphics.translate(-math.floor(camS), 0)
	platformlvl[sel]:draw(0, 400)
end

function love.update(dt)
	bg:u(dt)
	if love.keyboard.isDown("left") then
		camS = camS - camsp*dt
	elseif love.keyboard.isDown("right") then
		camS = camS + camsp*dt
	end
end
