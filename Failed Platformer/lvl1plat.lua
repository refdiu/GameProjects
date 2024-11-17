	--some presets
love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Oh my Gotto boy')


--dependencies
require('assets/world/back_g')
require('assets/world/coo')
wbg = love.graphics.newImage("assets/world/world_tileset.png")
sfall = love.graphics.newImage("assets/world/sf.png")

--the "camera"
local cam_abs = 0
local cam_ord = 312
local cam_xspeed = 120
local cam_dyspeed = 0
jump_v = -200
g = 4


--some required constants
i = 1
tiles = {}
gentiles = {}
for i = 1, 6 do
	table.insert(gentiles, math.random(1, 40))
end

--background inclusion
bg = Background
bg:render(1)

--de-bloats some conditional statements
f = Features

--the real assets
player = love.graphics.newImage("assets/world/player.png")
p_height = love.graphics.getWidth(player)
tramp = love.graphics.newImage("assets/world/trampoline.png")
pd = love.graphics.newImage("assets/world/pd_sprite.png")	

--tilemaps
l1t = love.graphics.newQuad(0, 160, 16, 16, wbg)
--sfall = love.graphics.newQuad(0, 144, 16, 16, wbg)

--particle system
psystem = love.graphics.newParticleSystem(sfall, 1000)
psystem:setParticleLifetime(1, 10) -- Particles live at least 2s and at most 5s.
psystem:setEmissionRate(50)
psystem:setSizeVariation(0.13)
psystem:setLinearAcceleration(-400, -100, 100, 500) -- Random movement in all directions.
psystem:setColors(1, 1, 1, 1, 1, 1, 1, 0) -- Fade to transparency


for x = 1, 6 do
	table.insert(tiles, {})
	for y = 1, 40 do
		table.insert(tiles[y], l1t)
	end
end


--key config
function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
	if key == 'r' then
		dofile("main.lua")
	end
end


--the real thing happens here
function love.draw()
	bg:drawim()
	love.graphics.draw(psystem, love.graphics.getWidth() + 40, 0)
	love.graphics.draw(player, 100, cam_ord, 0, 1.2, 1.2)
	love.graphics.translate(-math.floor(cam_abs), 0)
	for y = 1, 6 do
		for x = 1, 40 do
			if y < 3 and x == gentiles[y] then
				love.graphics.draw(wbg, tiles[y][x], 16*(x-1), 464 + 16*(y-1))
			elseif y >= 3 and x == gentiles[y] then
				goto continue
			else
				love.graphics.draw(wbg, tiles[y][x], 16*(x-1), 384 + 16*(y-1))
			end
			::continue::
		end
	end
end


function love.keypressed(key)
	if key == "up" and cam_dyspeed == 0 then
		cam_dyspeed = jump_v
	end
end

function love.mousemoved(x, y)
	mx = x
	my = y
end


--updation
function love.update(dt)
	psystem:update(dt)
	cam_dyspeed = cam_dyspeed + g
	cam_ord = cam_ord + cam_dyspeed*dt
	if cam_ord > 312 then
		cam_ord = 312
		cam_dyspeed = 0
	end
	if love.keyboard.isDown("left") then
		cam_abs = cam_abs - cam_xspeed*dt
	elseif love.keyboard.isDown("right") then
		cam_abs = cam_abs + cam_xspeed*dt
	end
end

