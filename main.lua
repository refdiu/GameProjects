--program to implement infinite scrolling of background
require('assets/world/back_g')
sti = require('sti')
platformlvl = {sti('assets/world/lvl1.lua'), 
	sti('assets/world/lvl2.lua'), 
	sti('assets/world/lvl3.lua'), 
	sti('assets/world/lvl4.lua'),
	sti('assets/world/lvl5-0.lua'),
	sti('assets/world/lvl5-1.lua')
}
sel = 1
function love.load()
	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
	bg = Background
	bg:render()
end

function love.draw()
	bg:drawim()	
	platformlvl[sel]:draw(0, 400)
end

function love.update(dt)
	bg:u(dt)
end


function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
	if key == "c" then
		sel = math.random(1, 6)
	end
end
