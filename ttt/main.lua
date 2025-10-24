Gamestate = require "hump.gamestate"
game = {winnername = ""}
winner = {}
--the classes
function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(game)
	h,w = love.graphics.getDimensions()
	love.window.setMode(h, w, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
	mouse_x = 0
	mouse_y = 0
end

function game:mousemoved(mx, my)
	mouse_x = mx
	mouse_y = my
  	--mouse scrolling
end

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

	coord_matrix = {{{140, 70},  {260, 70},  {400, 70}},
					{{140, 192}, {260, 192}, {400, 192}},
					{{140, 320}, {260, 320}, {400, 320}}}
end

function game:draw()
	love.graphics.draw(grid, 65, -10, 0, 0.5, 0.5)
	for i = 1, 3 do
		love.graphics.print("\n")
		for j = 1, 3 do
			love.graphics.draw(matrix[i][j], coord_matrix[i][j][1], coord_matrix[i][j][2])
		end
	end
	love.graphics.print(turntext)
  love.graphics.print("\n"..mouse_x.."\n"..mouse_y)
	if game.won then
		game:drawm()
	end
end

function game:touchpressed(id, x, y)
	if p1turn and x >= coord_matrix[1][1][1] and x <= coord_matrix[3][3][1] + 100 and y >= coord_matrix[1][1][2] and y <= coord_matrix[3][3][2] + 100 then

		if x >= coord_matrix[1][1][1] and x <= coord_matrix[1][1][1] + 100 and y >= coord_matrix[1][1][2] and y <= coord_matrix[1][1][2] + 100 and matrix[1][1] == placeholder then
			matrix[1][1] = myx
		elseif x >= coord_matrix[1][2][1] and x <= coord_matrix[1][2][1] + 100 and y >= coord_matrix[1][2][2] and y <= coord_matrix[1][2][2] + 100 and matrix[1][2] == placeholder then
			matrix[1][2] = myx
		elseif x >= coord_matrix[1][3][1] and x <= coord_matrix[1][3][1] + 100 and y >= coord_matrix[1][3][2] and y <= coord_matrix[1][3][2] + 100 and matrix[1][3] == placeholder then
			matrix[1][3] = myx
		elseif x >= coord_matrix[2][1][1] and x <= coord_matrix[2][1][1] + 100 and y >= coord_matrix[2][1][2] and y <= coord_matrix[2][1][2] + 100 and matrix[2][1] == placeholder then
			matrix[2][1] = myx
		elseif x >= coord_matrix[2][2][1] and x <= coord_matrix[2][2][1] + 100 and y >= coord_matrix[2][2][2] and y <= coord_matrix[2][2][2] + 100 and matrix[2][2] == placeholder then
			matrix[2][2] = myx
		elseif x >= coord_matrix[2][3][1] and x <= coord_matrix[2][3][1] + 100 and y >= coord_matrix[2][3][2] and y <= coord_matrix[2][3][2] + 100 and matrix[2][3] == placeholder then
			matrix[2][3] = myx
		elseif x >= coord_matrix[3][1][1] and x <= coord_matrix[3][1][1] + 100 and y >= coord_matrix[3][1][2] and y <= coord_matrix[3][1][2] + 100 and matrix[3][1] == placeholder then
			matrix[3][1] = myx
		elseif x >= coord_matrix[3][2][1] and x <= coord_matrix[3][2][1] + 100 and y >= coord_matrix[3][2][2] and y <= coord_matrix[3][2][2] + 100 and matrix[3][2] == placeholder then
			matrix[3][2] = myx
		elseif x >= coord_matrix[3][3][1] and x <= coord_matrix[3][3][1] + 100 and y >= coord_matrix[3][3][2] and y <= coord_matrix[3][3][2] + 100 and matrix[3][3] == placeholder then
			matrix[3][3] = myx
		end
    
   	    p1turn = false
		p2turn = true
		turntext = "Player 2's turn"
	elseif p2turn and x >= coord_matrix[1][1][1] and x <= coord_matrix[3][3][1] + 100 and y >= coord_matrix[1][1][2] and y <= coord_matrix[3][3][2] + 100 then
		
		if x >= coord_matrix[1][1][1] and x <= coord_matrix[1][1][1] + 100 and y >= coord_matrix[1][1][2] and y <= coord_matrix[1][1][2] + 100 and matrix[1][1] == placeholder then
			matrix[1][1] = myo
		elseif x >= coord_matrix[1][2][1] and x <= coord_matrix[1][2][1] + 100 and y >= coord_matrix[1][2][2] and y <= coord_matrix[1][2][2] + 100 and matrix[1][2] == placeholder then
			matrix[1][2] = myo
		elseif x >= coord_matrix[1][3][1] and x <= coord_matrix[1][3][1] + 100 and y >= coord_matrix[1][3][2] and y <= coord_matrix[1][3][2] + 100 and matrix[1][3] == placeholder then
			matrix[1][3] = myo
		elseif x >= coord_matrix[2][1][1] and x <= coord_matrix[2][1][1] + 100 and y >= coord_matrix[2][1][2] and y <= coord_matrix[2][1][2] + 100 and matrix[2][1] == placeholder then
			matrix[2][1] = myo
		elseif x >= coord_matrix[2][2][1] and x <= coord_matrix[2][2][1] + 100 and y >= coord_matrix[2][2][2] and y <= coord_matrix[2][2][2] + 100 and matrix[2][2] == placeholder then
			matrix[2][2] = myo
		elseif x >= coord_matrix[2][3][1] and x <= coord_matrix[2][3][1] + 100 and y >= coord_matrix[2][3][2] and y <= coord_matrix[2][3][2] + 100 and matrix[2][3] == placeholder then
			matrix[2][3] = myo
		elseif x >= coord_matrix[3][1][1] and x <= coord_matrix[3][1][1] + 100 and y >= coord_matrix[3][1][2] and y <= coord_matrix[3][1][2] + 100 and matrix[3][1] == placeholder then
			matrix[3][1] = myo
		elseif x >= coord_matrix[3][2][1] and x <= coord_matrix[3][2][1] + 100 and y >= coord_matrix[3][2][2] and y <= coord_matrix[3][2][2] + 100 and matrix[3][2] == placeholder then
			matrix[3][2] = myo
		elseif x >= coord_matrix[3][3][1] and x <= coord_matrix[3][3][1] + 100 and y >= coord_matrix[3][3][2] and y <= coord_matrix[3][3][2] + 100 and matrix[3][3] == placeholder then
			matrix[3][3] = myo
		end
		
		p1turn = true
		p2turn = false
		turntext = "Player 1's turn"
	end
end

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
		love.graphics.print(self.ze_winner, 100, 100)
	else
		love.graphics.print("Winner is: "..self.ze_winner, 100, 100)
	end
	love.graphics.print("Wanna play again?\nPress R to restart\nPress Q to quit", 100, 200)
end

function winner:keypressed(key)
	if key == 'r' then
		Gamestate.switch(game)
	elseif key == 'q' then
		love.event.quit()
	end
end
