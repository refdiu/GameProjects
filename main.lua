--program to implement infinite scrolling of background
require('back_g')

function love.load()
	love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
	bg = Background
	bg:render()
end

function love.draw()
	bg:draw()
end

function love.update(dt)
	bg:u(dt)
end


function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end
