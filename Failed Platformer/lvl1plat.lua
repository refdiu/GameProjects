--some presets
love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true})
love.window.setTitle('Oh my Gotto boy')


--dependencies
require('assets/world/back_g')
require('assets/world/coo')
wbg = love.graphics.newImage("assets/world/world_tileset.png")

--some required constants
i = 1
tiles = {}

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
l1t = love.graphics.newQuad(96, 16, 16, 16, wbg)

for y = 1, 20 do
	table.insert(tiles, {}
	for x = 1, 20 do
		table.insert(tiles[y], {id < 5 and 1 or 2})
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
	for y = 1, 20 do
		for x = 1, 20 do
			local till = tiles[y][x]
			love.graphics.draw(wbg, tiles
end


function love.mousemoved(x, y)
	mx = x
	my = y
end


--[[updation
function love.update(dt)
	
end]]

