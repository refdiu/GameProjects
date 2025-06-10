tsprite = love.graphics.newImage("assets/strees.png")
trees = {t1 = love.graphics.newQuad(48, 0, 16, 32, tsprite), t2 = love.graphics.newQuad(48, 32, 16, 32, tsprite)}

function trees:new()
  o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function trees:draw(tx)
  love.graphics.draw(tsprite, self.t1, tx, 120, 0, 4, 4)
end