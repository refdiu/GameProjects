camS = 0
camsp = 200
require('assets/world/back_g')
bg = Background
sti = require('sti')
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
	love.graphics.print(-math.floor(camS), 0, 0)
	love.graphics.translate(-math.floor(camS), 0)
	platformlvl[sel]:draw(0, 350)
end

function love.update(dt)
	if love.keyboard.isDown("left") then
		camS = camS - camsp*dt
	elseif love.keyboard.isDown("right") then
		camS = camS + camsp*dt
	end
	bg:u(dt)
end
