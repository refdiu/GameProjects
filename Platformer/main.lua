Gamestate = require "hump.gamestate"

menu = {}
game = {}
pause = {}

function menu:draw()
	love.graphics.print("Ma Menu", 300, 200, 0, 3, 3)
end

function menu:update(dt)
	---
end

function menu:keypressed(key)
	if key == "space" then
		Gamestate.switch(game)
	end
end

function game:enter(pmenu)
	self.pmenu = pmenu
end

function game:draw()
	love.graphics.print("Unpaused", 300, 200, 0, 3, 3)
end

function pause:enter(mygame)
	self.mygame = mygame
end

function pause:draw()
	love.graphics.print("Paused", 100, 100, 0, 5, 5)
end

function game:keypressed(key)
	if key == "m" then
		Gamestate.switch(self.pmenu)
	end
end

function game:update(dt)
	---
end


function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(menu)
end


function love.keypressed(key)
	if key == 'p' and Gamestate.current() == game then
		return Gamestate.push(pause)
	end
end

function pause:keypressed(key)
	if key == 'p' then
		return Gamestate.pop(pause)
	end
end
