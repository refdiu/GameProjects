--program to implement infinite scrolling of background
Background = {pic_x1 = 1366, pic_x2 = 0, pic_y = 0, image = {"assets/world/bg1.jpeg", "assets/world/bg_java.jpeg", "assets/world/bg_assembly.jpeg"}}

function Background:new()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Background:render(i)
	renimg = love.graphics.newImage(self.image[i])
end



function Background:drawim()
	love.graphics.draw(renimg, -self.pic_x1, self.pic_y)
	love.graphics.draw(renimg, self.pic_x2, self.pic_y)
end

function Background:u(tpassed)
	self.pic_x1 = self.pic_x1 + tpassed*90
	if self.pic_x1 >= 1366 then
		self.pic_x1 = -1366
	end
	self.pic_x2 = self.pic_x2 - tpassed*90
	if self.pic_x2 <= -1366 then
		self.pic_x2 = 1366
	end
end

