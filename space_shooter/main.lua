function love.load()
	require('back_g')
	require('ship')
	sproject = love.graphics.newImage("sproject.png")	
	bg = Background
	s = Ship
	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
	love.window.setTitle('Road to Code')
	bg:bg_render()
	s:s_render()
	love.mouse.setVisible(false)
end

function love.draw()
	bg:bg_drawim()
	s:s_drawim(s_x, s_y)
end

function love.update(dt)
	bg:bg_u(dt)
	
end

function love.mousemoved(mx, my)
	s_x = mx
	s_y = my
end 
