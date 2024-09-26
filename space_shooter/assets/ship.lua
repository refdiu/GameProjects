Ship = {s_image = love.graphics.newImage("assets/sship.png"), bullet_image = "assets/bullet.png"}
ship_arr = {love.graphics.newQuad(48, 0, 16, 16, Ship.s_image), love.graphics.newQuad(64, 0, 16, 16, Ship.s_image), love.graphics.newQuad(48, 16, 16, 16, Ship.s_image), love.graphics.newQuad(64, 16, 16, 16, Ship.s_image), love.graphics.newQuad(48, 32, 16, 16, Ship.s_image), love.graphics.newQuad(64, 32, 16, 16, Ship.s_image)}

function Ship:new()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Ship:s_render()
	s_renimg = self.s_image
	bullet_renimg = love.graphics.newImage(self.bullet_image)
	s_renimg:setFilter("nearest")
end

function Ship:s_drawim(ship_x, ship_y, s_size, ship_no)
	love.graphics.draw(self.s_image, ship_arr[ship_no], ship_x, ship_y, 0, s_size, s_size)
end

function Ship:bullet_drawim(bullet_x, bullet_y)
	love.graphics.draw(bullet_renimg, bullet_x, bullet_y, 0, 4, 4)
end

