function love.load()
	require('back_g')
	sproject = love.graphics.newImage("sproject.png")	
	require('ship')
	bg = Background
	s = Ship
	shot = false
	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
	love.window.setTitle('Road to Code')
	bg:bg_render()
	s:s_render()
	love.mouse.setVisible(false)		
	--click_x = 0
	bullets = {}
end

function love.draw()
	bg:bg_drawim()
	s:s_drawim(s_x, s_y)
    for i, bullet in ipairs(bullets) do
        s:bullet_drawim(bullet.x, bullet.y)
    end
end 

function love.mousepressed(x, y, button, istouch)
	if button == 1 then
		x = x + 50
    	y = y + 22
    	table.insert(bullets, {x = s_x, y = s_y})
	end
end

function love.update(dt)
	bg:bg_u(dt)
	for i, bullet in ipairs(bullets) do
        bullet.x = bullet.x + 250 * dt
    end
end

function love.mousemoved(mx, my)
	s_x = mx
	s_y = my
end



