Gamestate = require "hump.gamestate"
game = {winnername = ""}
winner = {}

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(game)
end

function game:enter()
	matrix = {{'-', '-', '-'},
			  {'-', '-', '-'},
			  {'-', '-', '-'}}
	p1turn = true
	p2turn = false
	turntext = "Numbers' turn"
	p1tab = {['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true, ['5'] = true, ['6'] = true, ['7'] = true, ['8'] = true, ['9'] = true}
	maintab = {['q'] = '1', ['w'] = '2', ['e'] = '3', ['r'] = '4', ['t'] = '5', ['y'] = '6', ['u'] = '7', ['i'] = '8', ['o'] = '9'}
end

function game:draw()
	for i = 1, 3 do
		love.graphics.print("\n")
		for j = 1, 3 do
			love.graphics.print(matrix[i][j], j*100, i*100)
		end
	end
	love.graphics.print(turntext)
	if game.won then
		game:drawm()
	end
end

function game:keypressed(key)
	if p1tab[key] == true and p1turn then
		p1tab[key] = false

		if key == '1' then
			matrix[1][1] = 'x'
		elseif key == '2' then
			matrix[1][2] = 'x'
		elseif key == '3' then
			matrix[1][3] = 'x'
		elseif key == '4' then
			matrix[2][1] = 'x'
		elseif key == '5' then
			matrix[2][2] = 'x'
		elseif key == '6' then
			matrix[2][3] = 'x'
		elseif key == '7' then
			matrix[3][1] = 'x'
		elseif key == '8' then
			matrix[3][2] = 'x'
		elseif key == '9' then
			matrix[3][3] = 'x'
		end

		p1turn = false
		p2turn = true
		turntext = "letters' turn"
	elseif p1tab[maintab[key]] == true and p2turn then
		p1tab[maintab[key]] = false

		if key == 'q' then
			matrix[1][1] = 'o'
		elseif key == 'w' then
			matrix[1][2] = 'o'
		elseif key == 'e' then
			matrix[1][3] = 'o'
		elseif key == 'r' then
			matrix[2][1] = 'o'
		elseif key == 't' then
			matrix[2][2] = 'o'
		elseif key == 'y' then
			matrix[2][3] = 'o'
		elseif key == 'u' then
			matrix[3][1] = 'o'
		elseif key == 'i' then
			matrix[3][2] = 'o'
		elseif key == 'o' then
			matrix[3][3] = 'o'
		end

		p1turn = true
		p2turn = false
		turntext = "Numbers' turn"
	end
end

function game:update(dt)
	if matrix[1][1] == 'x' and matrix[1][2] == 'x' and matrix[1][3] == 'x' then
		self.winnername = "Player 1"
		Gamestate.switch(winner, self.winnername)
	end
end

function winner:enter(mygame, ze_winner)
	self.mygame = mygame
	self.ze_winner = ze_winner
end

function winner:draw()
	love.graphics.print("Winner is: "..self.ze_winner, 200, 200)
	love.graphics.print("Wanna play again?\nPress R to restart\nPress Q to quit", 200, 300)
end

function winner:keypressed(key)
	if key == 'r' then
		Gamestate.switch(game)
	elseif key == 'q' then
		love.event.quit()
	end
end
