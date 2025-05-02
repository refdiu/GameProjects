m_pic = love.graphics.newImage("assets/MCMP.png")
m_p = {}

function m_p:new()
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function m_p:draw(x, y, sx, sy, val)
  mval = {love.graphics.newQuad(0, 0, 63, 100, m_pic), love.graphics.newQuad(64, 0, 64, 90, m_pic), love.graphics.newQuad(120, 0, 70, 100, m_pic)}
  love.graphics.draw(m_pic, mval[val], x, y, 0, sx, sy)
end

--[[function m_p:jump()
end]]