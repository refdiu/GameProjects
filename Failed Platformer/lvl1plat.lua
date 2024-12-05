--some presets
love.window.setMode(1366, 768, {fullscreen = false, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Nascent Cold')
title_font = love.graphics.newFont("assets/world/Icecold.ttf", 12)
--title_font:setFilter("nearest")

--dependencies
require('assets/world/back_g')
require('assets/world/coo')
wbg = love.graphics.newImage("assets/world/world_tileset.png")
sfall = love.graphics.newImage("assets/world/sf.png")

--the "camera"
local cam_abs = 0
local cam_ord = 435
local cam_xspeed = 1000
local cam_dyspeed = 0
jump_v = -230
g = 3


--some required constants
i = 1
tiles = {}

--background inclusion
bg = Background
bg:render(1)

--de-bloats some conditional statements
f = Features

--the real assets
player = love.graphics.newImage("assets/world/adventurer-crnr-clmb-01.png")
p_height = love.graphics.getWidth(player)
tramp = love.graphics.newImage("assets/world/trampoline.png")
pd = love.graphics.newImage("assets/world/pd_sprite.png")	

--tilemaps
l1t = {love.graphics.newQuad(0, 144*3, 16*3, 16*3, wbg)--[[white part]], love.graphics.newQuad(0, 160*3, 16*3, 16*3, wbg)--[[white decor]], love.graphics.newQuad(0, 176*3, 16*3, 16*3, wbg)--[[lb part]], love.graphics.newQuad(0, 192*3, 16*3, 16*3, wbg)--[[lb decor]], love.graphics.newQuad(0, 208*3, 16*3, 16*3, wbg)--[[db part]], love.graphics.newQuad(0, 224*3, 16*3, 16*3, wbg)--[[db decor]]}

--particle system
psystem = love.graphics.newParticleSystem(sfall, 10000)
psystem:setParticleLifetime(1, 10) -- Particles live at least 2s and at most 5s.
psystem:setEmissionRate(50)
psystem:setSizeVariation(0.89)
psystem:setLinearAcceleration(-400, -100, 100, 500) -- Random movement in all directions.
psystem:setColors(1, 1, 1, 1, 1, 1, 1, 0) -- Fade to transparency


for x = 1, 4000 do
	table.insert(tiles, {})
	for y = 1, 6 do
		table.insert(tiles[x], l1t[y])
	end
end


--key config
function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	elseif key == 'r' then
		dofile("main.lua")
	elseif key == "up" and cam_dyspeed == 0 then
		cam_dyspeed = jump_v
	end
end


--the real thing happens here
function love.draw()
	love.graphics.setFont(title_font)
	bg:drawim()
	love.graphics.draw(psystem, love.graphics.getWidth() + 40, 0)
	love.graphics.draw(player, 100, cam_ord, 0, 5, 5)
	love.graphics.translate(-math.floor(cam_abs), 0)
	if cam_abs < 0 then
		cam_abs = 0
	end
	for x = 1, 4000 do
		for y = 1, 6 do
			if x == 20 or x == 500 or x == 800 then
				for k = 1, 2 do
					love.graphics.draw(wbg, tiles[x][k], 16*(x-1)*3, 504 + 16*(k-1)*3)
				end
				love.graphics.draw(wbg, tiles[x][y], 16*(x-1)*3, 600 + 16*(y-1)*3)
			else
				love.graphics.draw(wbg, tiles[x][y], 16*(x-1)*3, 600 + 16*(y-1)*3)
			end
		end
	end
	love.graphics.print("Nascent Cold", 460, 100, 0, 6, 6)
	love.graphics.print("It's so cold.........", 10000, 100, 0, 6, 6)
end


function love.mousemoved(x, y)
	mx = x
	my = y
end


--updation
function love.update(dt)
	psystem:update(dt)
	bg:u(dt)
	cam_dyspeed = cam_dyspeed + g
	cam_ord = cam_ord + cam_dyspeed*dt
	if cam_ord > 435 then
		cam_ord = 435
		cam_dyspeed = 0
	end
	if love.keyboard.isDown("left") then
		cam_abs = cam_abs - cam_xspeed*dt
	elseif love.keyboard.isDown("right") then
		cam_abs = cam_abs + cam_xspeed*dt
	end
end

