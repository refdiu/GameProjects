function love.load()
	love.graphics.setBackgroundColor(255, 255, 255)
	clicked = nil
end

function love.draw()
	if clicked then
		love.graphics.draw(
