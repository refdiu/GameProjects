function love.load()
	c = require('assets/utils')
	main_font = love.graphics.newFont('assets/Evil Empire.otf', 12)
	front_img = love.graphics.newImage('assets/menui.png')
	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
	main_font:setFilter("nearest")
	love.window.setTitle('Intergalactic')
	c = coordinates
	mouse_x, mouse_y = 0
end

function love.draw()
	love.graphics.draw(front_img)
	love.graphics.setFont(main_font)
	love.graphics.print("Intergalactic", 165, 75, 0, 5, 5)
	love.graphics.print("Play", 290, 200, 0, 3, 3)
	love.graphics.print("Exit", 290, 300, 0, 3, 3)
	c:show(mouse_x, mouse_y)
end

function love.mousepressed(x, y, button, istouch)
	if button == 1 then
		if x >= 290 and x <= 350 and y >= 200 and y <= 240 then
			require('game')
		elseif x >= 290 and x <= 350 and y >= 300 and y <= 340 then
			love.event.quit()
		end
	end
end

function love.mousemoved(mx, my)
	mouse_x = mx
	mouse_y = my
end
	
