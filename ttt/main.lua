Gamestate = require "hump.gamestate"
game = {winnername = ""}
winner = {}
--the classes

-- Global variables for screen dimensions and layout
local w, h
local game_size, game_area_x, game_area_y, cell_size
local grid_scale, scale

function love.load()
Gamestate.registerEvents()
Gamestate.switch(game)

-- Get the actual screen dimensions
w, h = love.graphics.getDimensions()

-- Set the window mode (this is more for desktop, LÖVE on Android handles this)
love.window.setMode(w, h, {fullscreen = true, vsync = 1, resizable = false, highdpi = true})

mouse_x = 0
mouse_y = 0
end

function game:mousemoved(mx, my)
mouse_x = mx
mouse_y = my
end

function game:enter()
p1turn = true
p2turn = false
turntext = "Player 1's turn"

-- Load images
grid = love.graphics.newImage('grid.png')
myx = love.graphics.newImage('ex.png')
myo = love.graphics.newImage('oh.png')
placeholder = love.graphics.newImage('blank.png')

-- Reset matrix
matrix = {{placeholder, placeholder, placeholder},
{placeholder, placeholder, placeholder},
{placeholder, placeholder, placeholder}}

-- ### START DYNAMIC LAYOUT CALCULATION ###

-- Get current dimensions (in case of resize, though it's disabled)
w, h = love.graphics.getDimensions()

-- 1. Define Game Area (a square that is 90% of the smallest screen dimension)
game_size = math.min(w, h) * 0.9
game_area_x = (w - game_size) / 2
game_area_y = (h - game_size) / 2
cell_size = game_size / 3

-- 2. Calculate scaling factors for images
-- Scale grid to fit the whole game area
grid_scale = game_size / grid:getWidth()

-- Scale pieces to fit 80% of a cell (for padding)
local piece_drawable_size = cell_size * 0.6
scale = piece_drawable_size / myx:getWidth() -- Assuming myx and myo are same size

-- 3. Dynamically build coordinate matrix (for DRAWING)
-- These coordinates are the top-left corner to draw the piece,
-- already centered within its cell.
coord_matrix = {}
local piece_w_scaled = myx:getWidth() * scale
local piece_h_scaled = myx:getHeight() * scale

for i = 1, 3 do
	coord_matrix[i] = {}
	for j = 1, 3 do
		-- Top-left corner of the *cell*
		local cell_x = game_area_x + (j - 1) * cell_size
		local cell_y = game_area_y + (i - 1) * cell_size

		-- Calculate top-left for the *piece* to center it
		local draw_x = cell_x + (cell_size - piece_w_scaled) / 2
		local draw_y = cell_y + (cell_size - piece_h_scaled) / 2

		coord_matrix[i][j] = {draw_x, draw_y}
		end
		end
		-- ### END DYNAMIC LAYOUT CALCULATION ###
		end

		function game:draw()
		-- Draw the grid scaled to the game area
		love.graphics.draw(grid, game_area_x, game_area_y, 0, grid_scale, grid_scale)

		-- Draw the X's and O's
		for i = 1, 3 do
			for j = 1, 3 do
				love.graphics.draw(matrix[i][j], coord_matrix[i][j][1], coord_matrix[i][j][2], 0, scale, scale)
				end
				end

				-- Draw text, centered at the top
				love.graphics.printf(turntext, 0, 10, w, 'center')

				-- Debug mouse position
				love.graphics.print("Mouse X: " .. math.floor(mouse_x), 10, h - 40)
				love.graphics.print("Mouse Y: " .. math.floor(mouse_y), 10, h - 25)
				end


				function game:touchpressed(id, x, y)
				-- ### START DYNAMIC TOUCH LOGIC ###

				-- 1. Check if the touch is outside the game board area
				if x < game_area_x or x > game_area_x + game_size or
					y < game_area_y or y > game_area_y + game_size then
					return -- Ignore tap
					end

					-- 2. Calculate which grid cell (i, j) was tapped
					-- We subtract the game area's offset, divide by the cell size,
-- and use math.floor + 1 to get an index from 1 to 3.
local j = math.floor((x - game_area_x) / cell_size) + 1
local i = math.floor((y - game_area_y) / cell_size) + 1

-- 3. Check bounds (just in case)
if i < 1 or i > 3 or j < 1 or j > 3 then
	return
	end

	-- 4. Place the piece if the cell is empty
	if matrix[i][j] == placeholder then
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
				-- ### END DYNAMIC TOUCH LOGIC ###
				end

				function game:update(dt)
				-- Win checking logic (no changes needed, it's not layout-dependent)
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
								elseif matrix[1][3] == myx and matrix[2][2] == myx and matrix[3][1] == myx then -- Added missing diagonal check
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
																elseif matrix[1][3] == myo and matrix[2][2] == myo and matrix[3][1] == myo then -- Added missing diagonal check
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
																				elseif matrix[1][1] ~= placeholder and matrix[1][2] ~= placeholder and matrix[1][3] ~= placeholder and
																					matrix[2][1] ~= placeholder and matrix[2][2] ~= placeholder and matrix[2][3] ~= placeholder and
																					matrix[3][1] ~= placeholder and matrix[3][2] ~= placeholder and matrix[3][3] ~= placeholder then
																					self.winnername = "It's a draw!"
																					Gamestate.switch(winner, self.winnername)
																					end
																					end

																					function winner:enter(mygame, ze_winner)
																					self.mygame = mygame
																					self.ze_winner = ze_winner
																					-- Store dimensions for this state
																					self.w, self.h = love.graphics.getDimensions()
																					end

																					function winner:draw()
																					-- Use local w, h for convenience
																					local w, h = self.w, self.h

																					local main_text
																					if self.ze_winner == "It's a draw!" then
																						main_text = "It's a draw!"
																						else
																							main_text = "Winner is: " .. self.ze_winner
																							end

																							-- Draw text centered on the screen
																							love.graphics.printf(main_text, 0, h * 0.3, w, 'center')
																							love.graphics.printf("Tap left to restart", 0, h * 0.6, w/2, 'center')
																							love.graphics.printf("Tap right to quit", w/2, h * 0.6, w/2, 'center')
																							end

																							function winner:touchpressed(id, x, y)
																							local w, h = self.w, self.h

																							-- Only register taps in the bottom half of the screen
																							if y >= h * 0.5 then
																								if x < w / 2 then
																									-- Left side tapped
																									Gamestate.switch(game)
																									elseif x >= w / 2 then
																										-- Right side tapped
																										love.event.quit()
																										end
																										end
																										end
