--prerequisites
function game_play(ship_option)
	require('assets/ship')
	require('assets/rock')
	require('assets/select')
	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
	love.window.setTitle('Intergalactic')
	local sv = love.mouse.setVisible(false)
	bullets = {}
	projectiles = {}
	s = Ship
	r = Rock
	s:s_render()	
	r:r_render()
	main_font = love.graphics.newFont("assets/Evil Empire.otf")
	shoodata = {love.sound.newSoundData("assets/s1.wav"), love.sound.newSoundData("assets/s2.wav"),     love.sound.newSoundData("assets/s3.wav"), love.sound.newSoundData("assets/s4.wav"), love.sound.newSoundData("assets/s5.wav"), love.sound.newSoundData("assets/s6.wav")}
	expldata = love.sound.newSoundData("assets/collision.wav")
	shoot = love.audio.newSource(shoodata[ship_option])
	collide = love.audio.newSource(expldata)
	score_counter = 0
	rand_y = {48, 96, 144, 192, 240, 288, 336, 384, 432}
	ry = love.math.random(1, 9)
	bg = require("assets/back_g")
	bg = Background
	bg:bg_render()
	r_x = 650
	local a_x = nil
	local a_y = nil
	
	
		
	
	function love.draw()
		bg:bg_drawim()
		love.graphics.setFont(main_font)
		love.graphics.print(score_counter, 0, 0, 0, 3, 3)
		s:s_drawim(s_x, s_y, 3, ship_option)
		r_y = rand_y[ry]
		r:r_drawim(r_x, r_y)
    	for i, bullet in ipairs(bullets) do
    	    s:bullet_drawim(bullet.x, bullet.y)
    	end
    	love.graphics.print("Project by Pitiful Games", 520, 465)
	end


	function love.update(dt)
		bg:bg_u(dt)
		r_x = r_x - 450 * dt
		if r_x and s_x and r_y and s_y then
			if r_x > s_x - 20 and r_x < s_x + 20 and r_y > s_y - 20 and r_y < s_y + 20 then
				love.event.quit()
			end
		end
		for i, bullet in ipairs(bullets) do
    	    bullet.x = bullet.x + 250 * dt    
    	    if bullet.y < r_y + 30 and bullet.y > r_y - 10 then
    	    	if r_x > bullet.x - 10 and r_x < bullet.x + 10 then
					a_x = r_x
					a_y = r_y
					r_x = 650
					collided = love.audio.play(collide)
					score_counter = score_counter + 1
					shuffle(rand_y)
				end
			end
		end
		if r_x < 0 then
			score_counter = score_counter - 1
			r_x = 650
			shuffle(rand_y)
		end
	end


	function shuffle(tbl)
  		for i = #tbl, 2, -1 do
    		local j = math.random(i)
    		tbl[i], tbl[j] = tbl[j], tbl[i]
  		end
  		return tbl
	end



	function love.mousemoved(mx, my)
		s_x = mx
		s_y = my
	end
		
	function love.keypressed(key)
		if key == "escape" then
			love.event.quit()
		elseif key == "s" then
			ship_select()
		end
		if key == 'm' and mtext == "Music On" then
			mtext = "Music Off"
			love.audio.stop(bgm)
		elseif key == 'm' and mtext == "Music Off" then
			mtext = "Music On"
			bgm:setLooping(true)
			bgm:play()
		end
	end 
	
	
	function love.mousepressed(x, y, button, istouch)
		if button == 1 then
			shot = love.audio.play(shoot)
	    	table.insert(bullets, {x = s_x + 50, y = s_y + 22})
		end
	end
end

--[[function gameover()
	function love.load()
		--c = require("assets/utils")
		require("assets/select")
		--[[main_font = love.graphics.newFont("assets/Evil Empire.otf", 12)
		front_img = love.graphics.newImage("assets/menui.png")
		love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
		love.window.setTitle('Intergalactic')
		c = Coordinates
		mouse_x = 0
		mouse_y = 0
		r_x = 650
	end
	main_font:setFilter("nearest")
	love.mouse.setVisible(true)
	
	function love.draw()
		love.graphics.setFont(main_font)
		love.graphics.print("Game Over!", 200, 75, 0, 5, 5)
		love.graphics.print("Play Again", 245, 200, 0, 3, 3)
		love.graphics.print("Exit", 290, 300, 0, 3, 3)
		--c:show(mouse_x, mouse_y)
	end
	
	function love.mousepressed(X, Y, Button, Istouch)
		if Button == 1 then
			if X >= 290 and X <= 350 and Y >= 200 and Y <= 240 then
				ship_select()
			elseif X >= 290 and X <= 350 and Y >= 300 and Y <= 340 then
				love.event.quit()
			end
		end
	end
	
	function love.mousemoved(mX, mY)
		mouse_x = mX
		mouse_y = mY
	end
end]]


--Made by Pitiful Games


