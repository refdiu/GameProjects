require('assets/world/coo')
function love.load()
	love.window.setMode(1024, 768, {fullscreen = false, vsync = -1, resizable = false, centered = true})
	love.window.setTitle('Untitled Platformer Game')
	love.graphics.setDefaultFilter('nearest', 'nearest')
	c = coordinates
	mx = 0
	my = 0
	game_state = nil
end

function love.draw()
	love.graphics.print("Untitled Platformer Game", 210, 100, 0, 4, 4)
	love.graphics.print("Start", 472, 350, 0, 3, 3)
	love.graphics.print("Exit", 482, 500, 0, 3, 3)
	love.graphics.print("CC0 (Public Domain)", 0, 720)
	love.graphics.print("Made by Pitiful Games", 880, 720)
	c:show(mx, my)
end

function love.mousemoved(x, y)
	mx = x
	my = y
end
	
function love.keypressed(key)
	if key == 'p' then
		dofile("lvl2plat.lua")
	end
end

function love.mousepressed(px,py, button)
	if button == 1 then	
		if px >= 465 and px <= 570 and py >= 350 and py <= 400 then
			dofile("lvl1plat.lua")
		end
		if px >= 470 and px <= 560 and py >= 490 and py <= 550 then
			love.event.quit()
		end
	end
end
