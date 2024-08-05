--program to implement infinite scrolling of background
Background = {pic_x1 = 1366, pic_x2 = 0, pic_y = 0, image = "bg.jpeg"}

function Bg:new()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Bg:render()
	renimg = love.graphics.newImage(self.image)
end



function Bg:draw()
	love.graphics.draw(renimg, -self.pic_x1, self.pic_y)
	love.graphics.draw(renimg, self.pic_x2, self.pic_y)
end

function Bg:u(tpassed)
	self.pic_x1 = self.pic_x1 + tpassed*90
	if self.pic_x1 >= 1366 then
		self.pic_x1 = -1366
	end
	self.pic_x2 = self.pic_x2 - tpassed*90
	if self.pic_x2 <= -1366 then
		self.pic_x2 = 1366
	end
end

