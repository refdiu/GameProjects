--program to implement infinite scrolling of background
love.window.setFullscreen(true, "desktop")
pic_iter_1 = love.graphics.newImage("bg.jpeg")
pic_iter_2 = love.graphics.newImage("bg.jpeg")

pic_x1 = 1366
pic_x2 = 0
pic_y = 0

function love.draw()
	love.graphics.draw(pic_iter_1, -pic_x1, pic_y)
	love.graphics.draw(pic_iter_2, pic_x2, pic_y)
end

function love.update(dt)
	pic_x1 = pic_x1 + dt*90
	if pic_x1 >= 1366 then
		pic_x1 = -1366
	end
	pic_x2 = pic_x2 - dt*90
	if pic_x2 <= -1366 then
		pic_x2 = 1366
	end
end
