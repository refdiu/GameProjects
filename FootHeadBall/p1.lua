P1 = {pic = "pepsi.png", ground = "ground.png"}

function P1:new()
  o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function P1:draw(x, y)
  pic_p1 = love.graphics.newImage(self.pic)
  stadium = love.graphics.newImage(self.ground)
  love.graphics.draw(stadium)
  love.graphics.draw(pic_p1, x, y)
end
