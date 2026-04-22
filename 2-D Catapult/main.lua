function love.load()
  love.window.setMode(800, 480, {vsync = false, resizable = false, fullscreen = false})
  love.window.setTitle("Majha Physics Sim")
  mouse_x = 0
  mouse_y = 0
  p_x = 100
  p_y = 280
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 9.81*64, true)
  
  objects = {}
  
  --rightwall
  objects.rwall = {}
  objects.rwall.body = love.physics.newBody(world, 799, 0)
  objects.rwall.shape = love.physics.newRectangleShape(2, 800)
  objects.rwall.fixture = love.physics.newFixture(objects.rwall.body, objects.rwall.shape)
  
  --leftwall
  objects.lwall = {}
  objects.lwall.body = love.physics.newBody(world, 0, 0)
  objects.lwall.shape = love.physics.newRectangleShape(2, 800)
  objects.lwall.fixture = love.physics.newFixture(objects.lwall.body, objects.lwall.shape)
  
  --ceiling
  objects.cwall = {}
  objects.cwall.body = love.physics.newBody(world, 0, 0)
  objects.cwall.shape = love.physics.newRectangleShape(1600, 2)
  objects.cwall.fixture = love.physics.newFixture(objects.cwall.body, objects.cwall.shape)
  
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world, 0, 430)
  objects.ground.shape = love.physics.newRectangleShape(1600, 80) --make a rectangle with a width of 650 and a height of 50
  objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape) --attach shape to body
  
  objects.e1 = {}
  objects.e1.body = love.physics.newBody(world, 45, 140)
  objects.e1.shape = love.physics.newEdgeShape(40, 136, 57, 150)
  objects.e1.fixture = love.physics.newFixture(objects.e1.body, objects.e1.shape, 1)
  objects.e2 = {}
  objects.e2.body = love.physics.newBody(world, 53, 140)
  objects.e2.shape = love.physics.newEdgeShape(50, 143, 57, 136)
  objects.e2.fixture = love.physics.newFixture(objects.e2.body, objects.e2.shape, 1)
  

  objects.ball = {}
  objects.ball.body = love.physics.newBody(world, p_x, p_y, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
  objects.ball.shape = love.physics.newCircleShape(3) --the ball's shape has a radius of 20
  objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1) -- Attach fixture to body and give it a density of 1.
  objects.ball.fixture:setRestitution(0.3) --let the ball bounce
  
  bout = false
end


pellet = love.graphics.newImage("pellet.png")
cpult = love.graphics.newImage("catapulto.png")
cbg = love.graphics.newImage("catbg.png")

function love.draw()
  love.graphics.draw(cbg)
  love.graphics.print(""..mouse_x)
  love.graphics.print("\n"..mouse_y)
  love.graphics.print("Press R to catapult again, Space to launch", 200, 100, 0, 2, 2)
  love.graphics.draw(cpult, 90, 275)
  love.graphics.draw(pellet, objects.ball.body:getX(), objects.ball.body:getY())
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  elseif key == 'r' then
    objects.ball.body:setPosition(p_x, p_y)
    objects.ball.body:setLinearVelocity(0, 0)
    bout = false
  end
end

function love.mousemoved(mx, my, dx, dy, istouch)
  mouse_x = mx
  mouse_y = my
end

function love.update(dt)
  world:update(dt)
  if love.keyboard.isDown("space") and objects.ball.body:getX() < p_x+10 and objects.ball.body:getY() < p_y+10 then
    objects.ball.body:applyForce(0, -20)
    objects.ball.body:setLinearVelocity(500, -500)
  end
end