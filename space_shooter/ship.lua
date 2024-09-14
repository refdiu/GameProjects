Ship = {s_image = "sship.png", bullet_image = "bullet.png"}

function Ship:new()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Ship:s_render()
	s_renimg = love.graphics.newImage(self.s_image)
	bullet_renimg = love.graphics.newImage(self.bullet_image)
end

function Ship:s_drawim(ship_x, ship_y)
	love.graphics.draw(s_renimg, ship_x, ship_y, 0, 3, 3)
end

function Ship:bullet_drawim(bullet_x, bullet_y)
	love.graphics.draw(bullet_renimg, bullet_x, bullet_y, 0, 4, 4)
end

