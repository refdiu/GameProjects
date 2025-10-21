Gamestate = require "hump.gamestate"
game = {winnername = ""}
winner = {}

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(game)
	if love.system.getOS() == 'Android' then
    	h, w = love.graphics.getDimensions()
    	love.window.setMode(h, w, {fullscreen = true, vsync = -1, resizable = false, centered = true, highdpi = true})
  	else
    	love.window.setMode(1366, 768, {fullscreen = true, vsync = -1, resizable = false, centered = true, highdpi = true})
  	end
end

--function game:

function game:enter()
	p1turn = true
	p2turn = false
	turntext = "Player 1's turn"
	grid = love.graphics.newImage('grid.png')
	myx = love.graphics.newImage('ex.png')
	myo = love.graphics.newImage('oh.png')
	placeholder = love.graphics.newImage('blank.png')
	matrix = {{placeholder, placeholder, placeholder},
			  {placeholder, placeholder, placeholder},
			  {placeholder, placeholder, placeholder}}

	coord_matrix = {{{580, 155}, {859, 155}, {1138, 155}},
					{{580, 410}, {859, 410}, {1138, 410}},
					{{580, 665}, {859, 665}, {1138, 665}}}
end

function game:draw()
	love.graphics.draw(grid, 450)
	for i = 1, 3 do
		love.graphics.print("\n")
		for j = 1, 3 do
			love.graphics.draw(matrix[i][j], coord_matrix[i][j][1], coord_matrix[i][j][2], 0, 0.2)
		end
	end
	love.graphics.print(turntext)
	if game.won then
		game:drawm()
	end
end

function game:mousepressed(x, y, button)
	if button == 1 and p1turn then

		if x >= 580 and x <= 785 and y >= 155 and y <= 360 and matrix[1][1] == placeholder then
			matrix[1][1] = myx
		elseif x >= 859 and x <= 1064 and y >= 155 and y <= 360 and matrix[1][2] == placeholder then
			matrix[1][2] = myx
		elseif x >= 1138 and x <= 1343 and y >= 155 and y <= 360 and matrix[1][3] == placeholder then
			matrix[1][3] = myx
		elseif x >= 580 and x <= 785 and y >= 410 and y <= 615 and matrix[2][1] == placeholder then
			matrix[2][1] = myx
		elseif x >= 859 and x <= 1064  and y >= 410 and y <= 615 and matrix[2][2] == placeholder then
			matrix[2][2] = myx
		elseif x >= 1138 and x <= 1343 and y >= 410 and y <= 615 and matrix[2][3] == placeholder then
			matrix[2][3] = myx
		elseif x >= 580 and x <= 785 and y >= 665 and y <= 870 and matrix[3][1] == placeholder then
			matrix[3][1] = myx
		elseif x >= 859 and x <= 1064 and y >= 665 and y <= 870 and matrix[3][2] == placeholder then
			matrix[3][2] = myx
		elseif x >= 1138 and x <= 1343 and y >= 665 and y <= 870 and matrix[3][3] == placeholder then
			matrix[3][3] = myx
		end
    
    p1turn = false
		p2turn = true
		turntext = "Player 2's turn"
	elseif button == 2 and p2turn then
		
		if x >= 580 and x <= 785 and y >= 155 and y <= 360 and matrix[1][1] == placeholder then
			matrix[1][1] = myo
		elseif x >= 859 and x <= 1064 and y >= 155 and y <= 360 and matrix[1][2] == placeholder then
			matrix[1][2] = myo
		elseif x >= 1138 and x <= 1343 and y >= 155 and y <= 360 and matrix[1][3] == placeholder then
			matrix[1][3] = myo
		elseif x >= 580 and x <= 785 and y >= 410 and y <= 615 and matrix[2][1] == placeholder then
			matrix[2][1] = myo
		elseif x >= 859 and x <= 1064  and y >= 410 and y <= 615 and matrix[2][2] == placeholder then
			matrix[2][2] = myo
		elseif x >= 1138 and x <= 1343 and y >= 410 and y <= 615 and matrix[2][3] == placeholder then
			matrix[2][3] = myo
		elseif x >= 580 and x <= 785 and y >= 665 and y <= 870 and matrix[3][1] == placeholder then
			matrix[3][1] = myo
		elseif x >= 859 and x <= 1064 and y >= 665 and y <= 870 and matrix[3][2] == placeholder then
			matrix[3][2] = myo
		elseif x >= 1138 and x <= 1343 and y >= 665 and y <= 870 and matrix[3][3] == placeholder then
			matrix[3][3] = myo
		end
		
		p1turn = true
		p2turn = false
		turntext = "Player 1's turn"
	end
end

--function game:touchpressed(x, y, button)
--	if button == 1 and p1turn then
--		p1turn = false
--		p2turn = true
--		turntext = "Player 2's turn"

--		if x >= 580 and x <= 785 and y >= 155 and y <= 360 and matrix[1][1] == placeholder then
--			matrix[1][1] = myx
--		elseif x >= 859 and x <= 1064 and y >= 155 and y <= 360 and matrix[1][2] == placeholder then
--			matrix[1][2] = myx
--		elseif x >= 1138 and x <= 1343 and y >= 155 and y <= 360 and matrix[1][3] == placeholder then
--			matrix[1][3] = myx
--		elseif x >= 580 and x <= 785 and y >= 410 and y <= 615 and matrix[2][1] == placeholder then
--			matrix[2][1] = myx
--		elseif x >= 859 and x <= 1064  and y >= 410 and y <= 615 and matrix[2][2] == placeholder then
--			matrix[2][2] = myx
--		elseif x >= 1138 and x <= 1343 and y >= 410 and y <= 615 and matrix[2][3] == placeholder then
--			matrix[2][3] = myx
--		elseif x >= 580 and x <= 785 and y >= 665 and y <= 870 and matrix[3][1] == placeholder then
--			matrix[3][1] = myx
--		elseif x >= 859 and x <= 1064 and y >= 665 and y <= 870 and matrix[3][2] == placeholder then
--			matrix[3][2] = myx
--		elseif x >= 1138 and x <= 1343 and y >= 665 and y <= 870 and matrix[3][3] == placeholder then
--			matrix[3][3] = myx
--		end
--	elseif button == 2 and p2turn then
		
--		if x >= 580 and x <= 785 and y >= 155 and y <= 360 and matrix[1][1] == placeholder then
--			matrix[1][1] = myo
--		elseif x >= 859 and x <= 1064 and y >= 155 and y <= 360 and matrix[1][2] == placeholder then
--			matrix[1][2] = myo
--		elseif x >= 1138 and x <= 1343 and y >= 155 and y <= 360 and matrix[1][3] == placeholder then
--			matrix[1][3] = myo
--		elseif x >= 580 and x <= 785 and y >= 410 and y <= 615 and matrix[2][1] == placeholder then
--			matrix[2][1] = myo
--		elseif x >= 859 and x <= 1064  and y >= 410 and y <= 615 and matrix[2][2] == placeholder then
--			matrix[2][2] = myo
--		elseif x >= 1138 and x <= 1343 and y >= 410 and y <= 615 and matrix[2][3] == placeholder then
--			matrix[2][3] = myo
--		elseif x >= 580 and x <= 785 and y >= 665 and y <= 870 and matrix[3][1] == placeholder then
--			matrix[3][1] = myo
--		elseif x >= 859 and x <= 1064 and y >= 665 and y <= 870 and matrix[3][2] == placeholder then
--			matrix[3][2] = myo
--		elseif x >= 1138 and x <= 1343 and y >= 665 and y <= 870 and matrix[3][3] == placeholder then
--			matrix[3][3] = myo
--		end
		
--		p1turn = true
--		p2turn = false
--		turntext = "Player 1's turn"
--	end
--end

function game:update(dt)
	if matrix[1][1] == myx and matrix[1][2] == myx and matrix[1][3] == myx then
		self.winnername = "Player 1"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[2][1] == myx and matrix[2][2] == myx and matrix[2][3] == myx then
		self.winnername = "Player 1"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[3][1] == myx and matrix[3][2] == myx and matrix[3][3] == myx then
		self.winnername = "Player 1"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[1][1] == myx and matrix[2][2] == myx and matrix[3][3] == myx then
		self.winnername = "Player 1"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[1][1] == myx and matrix[2][1] == myx and matrix[3][1] == myx then
		self.winnername = "Player 1"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[1][2] == myx and matrix[2][2] == myx and matrix[3][2] == myx then
		self.winnername = "Player 1"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[1][3] == myx and matrix[2][3] == myx and matrix[3][3] == myx then
		self.winnername = "Player 1"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[1][1] == myo and matrix[1][2] == myo and matrix[1][3] == myo then
		self.winnername = "Player 2"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[2][1] == myo and matrix[2][2] == myo and matrix[2][3] == myo then
		self.winnername = "Player 2"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[3][1] == myo and matrix[3][2] == myo and matrix[3][3] == myo then
		self.winnername = "Player 2"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[1][1] == myo and matrix[2][2] == myo and matrix[3][3] == myo then
		self.winnername = "Player 2"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[1][1] == myo and matrix[2][1] == myo and matrix[3][1] == myo then
		self.winnername = "Player 2"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[1][2] == myo and matrix[2][2] == myo and matrix[3][2] == myo then
		self.winnername = "Player 2"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[1][3] == myo and matrix[2][3] == myo and matrix[3][3] == myo then
		self.winnername = "Player 2"
		Gamestate.switch(winner, self.winnername)
	elseif matrix[1][1] ~= placeholder and matrix[1][2] ~= placeholder and matrix[1][3] ~= placeholder and matrix[2][1] ~= placeholder and matrix[2][2] ~= placeholder and matrix[2][3] ~= placeholder and matrix[3][1] ~= placeholder and matrix[3][2] ~= placeholder and matrix[3][3] ~= placeholder then
		self.winnername = "It's a draw!"
		Gamestate.switch(winner, self.winnername)
	end
end

function winner:enter(mygame, ze_winner)
	self.mygame = mygame
	self.ze_winner = ze_winner
end

function winner:draw()
	if self.ze_winner == "It's a draw!" then
		love.graphics.print(self.ze_winner, 200, 200)
	else
		love.graphics.print("Winner is: "..self.ze_winner, 200, 200)
	end
	love.graphics.print("Wanna play again?\nPress R to restart\nPress Q to quit", 200, 300)
end

function winner:keypressed(key)
	if key == 'r' then
		Gamestate.switch(game)
	elseif key == 'q' then
		love.event.quit()
	end
end
