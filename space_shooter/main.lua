function love.load()
	require('back_g')
	require('ship')
	require('rock')
	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
	love.window.setTitle('Road to Code')
	love.mouse.setVisible(false)
	bullets = {}
	projectiles = {}
	bg = Background
	s = Ship
	r = Rock
	bg:bg_render()
	s:s_render()	
	r:r_render()	
	shoodata = love.sound.newSoundData("explosion (1).wav")
	shoot = love.audio.newSource(shoodata)
	r_x = 650
	score_counter = 0
end




function love.update(dt)
	bg:bg_u(dt)
	r_x = r_x - 150 * dt
	if r_x > s_x and r_x < s_x + 30 and r_y > s_y - 10 and r_y < s_y + 10 then
		score_counter = 0
		love.event.quit()
	end
	for i, bullet in ipairs(bullets) do
        bullet.x = bullet.x + 250 * dt
        if bullet.y < r_y + 30 and bullet.y > r_y - 10 then
        	if r_x > bullet.x -10 and r_x < bullet.x + 10 then
				r_x = 650
				score_counter = score_counter + 1
				execute = true
				return execute
			end
		end
	end
	if r_x < 0 then
		score_counter = score_counter - 1
		r_x = 650
		execute = true
		return execute
	end
end

function love.draw()
	bg:bg_drawim()
	love.graphics.print(score_counter, 0, 0, 0, 3, 3)
	s:s_drawim(s_x, s_y)
	r_y = r:r_drawim(r_x, execute)
    for i, bullet in ipairs(bullets) do
        s:bullet_drawim(bullet.x, bullet.y)
    end
end










function love.mousemoved(mx, my)
	s_x = mx
	s_y = my
end
	
function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end 


function love.mousepressed(x, y, button, istouch)
	if button == 1 then
		shot = love.audio.play(shoot)
    	table.insert(bullets, {x = s_x + 50, y = s_y + 22})
	end
end
