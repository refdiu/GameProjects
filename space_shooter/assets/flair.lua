Kaboom = {explimg = love.graphics.newImage('assets/rexplode.png'), boomarr = {}, iter = 1}

for i = 1, 3 do
	for j = 1, 3 do
		table.insert(Kaboom.boomarr, love.graphics.newQuad(32*j, 32*i, 32, 32, Kaboom.explimg))
	end
end

function Kaboom:new()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Kaboom:anim(ax, ay)
	love.graphics.draw(self.explimg, self.boomarr[self.iter], ax, ay, 0, 2, 2)
end

function Kaboom:k_update(delt)
	for delt = 1, 8 do
		self.iter = self.iter + 1
	end
	if self.iter == 9 then
		self.iter = 1
	end
end
