Rock = {r_image = "sproject.png", r_y = {48, 96, 144, 192, 240, 288, 336, 384, 432}, ry = love.math.random(1, 9)}

function Rock:new()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Rock:r_render()
	r_renimg = love.graphics.newImage(self.r_image)
end

function Rock:r_drawim(rx, ex)
	rand_y = self.r_y[self.ry]
	if ex then
		rand_y = self.r_y[self.ry]
		love.graphics.draw(r_renimg, rx, rand_y, 0, 3, 3)
		return rand_y
	else
		love.graphics.draw(r_renimg, rx, rand_y, 0, 3, 3)
	end
	return rand_y
end

