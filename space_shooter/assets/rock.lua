Rock = {r_image = "assets/sproject.png"}

function Rock:new()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Rock:r_render()
	r_renimg = love.graphics.newImage(self.r_image)
end

function Rock:r_drawim(rx, ry)
	love.graphics.draw(r_renimg, rx, ry, 0, 3, 3)
end

