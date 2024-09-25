Coordinates = {}

function Coordinates:new()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Coordinates:show(x, y)
	love.graphics.print("x coordinate: "..x.."\ny coordinate: "..y)
end
