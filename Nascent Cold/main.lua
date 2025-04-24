function love.load()
  u = 2
  d = 100
  mp_can_jump = false
end


function love.keypressed(key)
  if mp_can_jump == false and key == "up" then
    mp_can_jump = true
  end
end

function love.update(dt)
  if mp_can_jump then
    v = v + u
    if u > 1.5 then
      u = 1.5
      u = -(u - (1.5)*dt)
    else
      u = u + (1.5)*dt
    end
  end
end
