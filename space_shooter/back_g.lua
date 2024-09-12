--program to implement infinite scrolling of background
Background = {pic_x1 = 640, pic_x2 = 0, pic_y = 0, image = "sbg.png"}

function Background:new()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Background:bg_render()
	renimg = love.graphics.newImage(self.image)
end



function Background:bg_drawim()
	love.graphics.draw(renimg, -self.pic_x1, self.pic_y)
	love.graphics.draw(renimg, self.pic_x2, self.pic_y)
end

function Background:bg_u(tpassed)
	self.pic_x1 = self.pic_x1 + tpassed*90
	if self.pic_x1 >= 640 then
		self.pic_x1 = -640
	end
	self.pic_x2 = self.pic_x2 - tpassed*90
	if self.pic_x2 <= -640 then
		self.pic_x2 = 640
	end
end

