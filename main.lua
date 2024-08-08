require('assets/world/coo')
function love.load()
	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
	love.window.setTitle('Road to Code')
	love.graphics.setDefaultFilter('nearest', 'nearest')
	c = coordinates
	mx = 0
	my = 0
	game_state = nil
end

function love.draw()
	love.graphics.print("Untitled Platformer Game", 120, 85, 0, 2.5, 2.5)
	love.graphics.print("Start", 299, 200, 0, 1.7, 1.7)
	love.graphics.print("Exit", 304, 300, 0, 1.7, 1.7)
	love.graphics.print("CC0 (Public Domain)", 0, 460)
	love.graphics.print("Made by Pitiful Games", 500, 460)
	c:show(mx, my)
end

function love.mousemoved(x, y)
	mx = x
	my = y
end
	
function love.mousepressed(px,py, button)
	if button == 1 then	
		if px >= 290 and px <= 360 and py >= 200 and py <= 250 then
			dofile("lvl1plat.lua")
		end
		if px >= 290 and px <= 360 and py >= 300 and py <= 350 then
			love.event.quit()
		end
	end
end
