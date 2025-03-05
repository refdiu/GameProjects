P1 = {pic = "pepsi.png", ground = "ground.png"}

function P1:new()
  o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function P1:drawplayer(x, y, r, sx, sy)
  pic_p1 = love.graphics.newImage(self.pic)
  love.graphics.draw(pic_p1, x, y, r, sx, sy)
end

function P1:drawground()
  stadium = love.graphics.newImage(self.ground)
  love.graphics.draw(stadium)
end