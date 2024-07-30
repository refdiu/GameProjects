--program to implement infinite scrolling of background
love.window.setFullscreen(true, "desktop")

bg = dofile("back_g.lua")

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end
