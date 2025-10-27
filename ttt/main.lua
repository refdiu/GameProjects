Gamestate = require "hump.gamestate"
game = {winnername = ""}
winner = {}
--the classes

function love.load()

	Gamestate.registerEvents()
	Gamestate.switch(game)

	w = 900
	h = 400
	love.window.setMode(w, h, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
	grid_scale = 0.375
	scale = 0.75
	
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

	coord_matrix = {{{312, 60},  {415, 60},  {520, 60}},
					{{312, 156}, {415, 156}, {520, 156}},
					{{312, 250}, {415, 250}, {520, 250}}}
end

function game:draw()
	love.graphics.draw(grid, h/2 + 60, 0, 0, grid_scale, grid_scale)
	for i = 1, 3 do
		love.graphics.print("\n")
		for j = 1, 3 do
			love.graphics.draw(matrix[i][j], coord_matrix[i][j][1], coord_matrix[i][j][2], 0, scale, scale)
		end
	end
	love.graphics.print(turntext)
  love.graphics.print("\n"..mouse_x.."\n"..mouse_y)
	if game.won then
		game:drawm()
	end
end


function game:touchpressed(id, x, y)
	for i = 1, 3 do
		for j = 1, 3 do
			--if button == 1 then
			outside = (x <= coord_matrix[1][1][1] and x >= coord_matrix[3][3][1] + 70 and y <= coord_matrix[1][1][2] and y >= coord_matrix[3][3][2] + 70)
			if x >= coord_matrix[i][j][1] and x <= coord_matrix[i][j][1] + 70 and y >= coord_matrix[i][j][2] and y <= coord_matrix[i][j][2] + 70 and matrix[i][j] == placeholder and not outside then
				if p1turn then
					matrix[i][j] = myx
					p1turn = false
					p2turn = true
					turntext = "Player 2's turn"
				elseif p2turn then
					matrix[i][j] = myo
					p1turn = true
					p2turn = false
					turntext = "Player 1's turn"
				end
			end
		end
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
		love.graphics.print(self.ze_winner, 390, 100)
	else
		love.graphics.print("Winner is: "..self.ze_winner, 390, 100)
	end
	love.graphics.print("Click here to restart", 100, 200)
	love.graphics.print("Click here to quit", 500, 200)
end

function winner:touchpressed(id, x, y)
	if y >= 200 then
		if x >= 0 and x <= 450 then
			Gamestate.switch(game)
		elseif x > 450 and  x < 900 then
			love.event.quit()
		end
	end

end
