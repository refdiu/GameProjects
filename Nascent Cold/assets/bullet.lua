b = {bullet = love.graphics.newImage("assets/bullet.png")}

function b:new()
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function b:draw()
  love.graphics.draw(self.bullet, 100, 100)
end