b = {bullet = love.graphics.newImage("assets/bullet.png"), bx = -100, by = -100}

function b:new()
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function b:draw(bx, by)
  love.graphics.draw(self.bullet, bx, by)
end

function b:traverse(bx, DT)
  bx = bx + 450*DT
  return bx
end
  