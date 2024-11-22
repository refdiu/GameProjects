require('assets/world/coo')
function love.load()
	love.window.setMode(1366, 768, {fullscreen = false, vsync = -1, resizable = false, centered = true})
	love.window.setTitle('Nascent Cold')
	love.graphics.setDefaultFilter('nearest', 'nearest')
	c = coordinates
	mx = 0
	my = 0
	game_state = nil
end

function love.draw()
	love.graphics.print("Nascent Cold", 460, 100, 0, 6, 6)
	love.graphics.print("Start", 652, 350, 0, 3, 3)
	love.graphics.print("Exit", 662, 500, 0, 3, 3)
	love.graphics.print("CC0 (Public Domain)", 10, 720)
	love.graphics.print("Made by Pitiful Games", 1222, 720)
	c:show(mx, my)
end

function love.mousemoved(x, y)
	mx = x
	my = y
end

function love.mousepressed(px, py, button)
	if button == 1 then	
		if px >= 640 and px <= 735 and py >= 350 and py <= 400 then
			dofile("lvl1plat.lua")
		end
		if px >= 660 and px <= 755 and py >= 490 and py <= 550 then
			love.event.quit()
		end
	end
end
