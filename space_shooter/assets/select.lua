function ship_select()
	require("assets/ship")
	c = require("assets/utils")
	require("game")
	main_font = love.graphics.newFont("assets/Evil Empire.otf", 12)
	front_img = love.graphics.newImage("assets/s_select_ui.png")
	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
	main_font:setFilter("nearest")
	love.window.setTitle("Intergalactic")
	c = Coordinates
	mouse_x = 0
	mouse_y = 0
	s_option = 0
	s = Ship
	s:s_render()
	local ship_size = {4, 4, 4, 4, 4, 4}
	love.mouse.setVisible(true)
	
	
	function love.draw()
		love.graphics.draw(front_img)
		love.graphics.setFont(main_font)
		love.graphics.print("Select your ship:", 205, 75, 0, 3, 3)
		s:s_drawim(120, 190, ship_size[1], 1)
		s:s_drawim(280, 190, ship_size[2], 2)
		s:s_drawim(440, 190, ship_size[3], 3)
		s:s_drawim(120, 340, ship_size[4], 4)
		s:s_drawim(280, 340, ship_size[5], 5)
		s:s_drawim(440, 340, ship_size[6], 6)
		c:show(mouse_x, mouse_y)
	end
	
	function love.mousemoved(mx, my)
		mouse_x = mx
		mouse_y = my
		if mx >= 120 and mx <= 184 and my >= 190 and my <= 256 then
			ship_size[1] = 5
		elseif mx >= 280 and mx <= 344 and my >= 190 and my <= 256 then
			ship_size[2] = 5
		elseif mx >= 440 and mx <= 504 and my >= 190 and my <= 256 then
			ship_size[3] = 5
		elseif mx >= 120 and mx <= 184 and my >= 340 and my <= 406 then
			ship_size[4] = 5
		elseif mx >= 280 and mx <= 344 and my >= 340 and my <= 406 then
			ship_size[5] = 5
		elseif mx >= 440 and mx <= 504 and my >= 340 and my <= 406 then
			ship_size[6] = 5
		else
			for ss = 1, 6 do
				ship_size[ss] = 4
			end
		end
	end
	
	function love.mousepressed(x, y, button, istouch)
		if button == 1 then	
			if x >= 120 and x <= 184 and y >= 190 and y <= 256 then
				s_option = 1
				game_play(s_option)
			elseif x >= 280 and x <= 344 and y >= 190 and y <= 256 then
				s_option = 2
				game_play(s_option)
			elseif x >= 440 and x <= 504 and y >= 190 and y <= 256 then
				s_option = 3
				game_play(s_option)
			elseif x >= 120 and x <= 184 and y >= 340 and y <= 406 then
				s_option = 4
				game_play(s_option)
			elseif x >= 280 and x <= 344 and y >= 340 and y <= 406 then
				s_option = 5
				game_play(s_option)
			elseif x >= 440 and x <= 504 and y >= 340 and y <= 406 then
				s_option = 6
				game_play(s_option)
			end
		end
	end
end
