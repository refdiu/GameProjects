m_pic = love.graphics.newImage("assets/MCMP.png")
m_p = {mbase = love.graphics.newQuad(0, 0, 64, 100, m_pic), mjump = love.graphics.newQuad(64, 0, 64, 100, m_pic), mpoint = love.graphics.newQuad(128, 0, 64, 100, m_pic)}

function m_p:new()
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function m_p:draw(x, y, sx, sy, val)
  love.graphics.draw(m_pic, self.mpoint, x, y, 0, sx, sy)
end

--[[function m_p:jump()
end]]