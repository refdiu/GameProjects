coordinates = {x, y}

function coordinates:new()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function coordinates:show(x, y)
	love.graphics.print(" x coordinate: "..x.."\n y coordinate: "..y, 0, 30)
end
