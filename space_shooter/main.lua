function love.load()
	require('back_g')
	require('ship')
	require('rock')
	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
	love.window.setTitle('Road to Code')
	love.mouse.setVisible(false)
	bullets = {}
	projectiles = {}
	--r_coord = {48, 96, 144, 192, 240, 288, 336, 384, 432}
	bg = Background
	s = Ship
	r = Rock
	bg:bg_render()
	s:s_render()	
	r:r_render()	
	shoodata = love.sound.newSoundData("explosion (1).wav")
	shoot = love.audio.newSource(shoodata)
	r_x = 630
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end

function love.draw()
	bg:bg_drawim()
	s:s_drawim(s_x, s_y)
	r:r_drawim(r_x)
	--table.insert(projectiles, {r_x = 630, y_r = r_val})
    for i, bullet in ipairs(bullets) do
        s:bullet_drawim(bullet.x, bullet.y)
    end
end 

function love.mousepressed(x, y, button, istouch)
	if button == 1 then
		shot = love.audio.play(shoot)
    	table.insert(bullets, {x = s_x + 50, y = s_y + 22})
	end
end

function love.update(dt)
	bg:bg_u(dt)
	r_x = r_x - 150 * dt
	for i, bullet in ipairs(bullets) do
        bullet.x = bullet.x + 250 * dt
        if r_x > bullet.x and r_x < bullet.x + 30 or r_x < 0 then
			r_x = 630
		end
	end
	if r_x > s_x and r_x < s_x + 30 then
		love.event.quit()
	end
    --collide_check()
    --[[for j, projectiles in ipairs(projectiles) do
    end]]
end

function love.mousemoved(mx, my)
	s_x = mx
	s_y = my
end


