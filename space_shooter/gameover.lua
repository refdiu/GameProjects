main_font = love.graphics.newFont('assets/Evil Empire.otf', 12)
front_img = love.graphics.newImage('assets/menui.png')
love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
main_font:setFilter("nearest")
love.mouse.setVisible(true)
love.window.setTitle('Intergalactic')
mouse_x, mouse_y = 0


function love.draw()
	love.graphics.setFont(main_font)
	love.graphics.print("Game Over!!!", 185, 75, 0, 5, 5)
	love.graphics.print("Back to Game", 230, 200, 0, 3, 3)
	love.graphics.print("Exit", 290, 300, 0, 3, 3)
end

function love.mousepressed(x, y, button, istouch)
	if button == 1 then
		if x >= 230 and x <= 400 and y >= 200 and y <= 240 then
			dofile("game.lua")
		elseif x >= 290 and x <= 350 and y >= 300 and y <= 340 then
			love.event.quit()
		end
	end
end

function love.mousemoved(mx, my)
	mouse_x = mx
	mouse_y = my
end
