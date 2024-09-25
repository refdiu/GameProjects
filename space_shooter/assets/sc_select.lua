require("assets/ship")
c = require("assets/utils")
main_font = love.graphics.newFont("assets/Evil Empire.otf", 12)
front_img = love.graphics.newImage("assets/menui.png")
love.window.setMode(640, 480, {fullscreen = false, vsync = -1, resizable = false, centered = true, highdpi = true})
main_font:setFilter("nearest")
love.window.setTitle("Intergalactic")
c = Coordinates
mouse_x = 0
mouse_y = 0
s = Ship
s:s_render()


function love.draw()
	love.graphics.draw(front_img)
	love.graphics.setFont(main_font)
	love.graphics.print("Select your ship:", 205, 75, 0, 3, 3)
	c:show(mouse_x, mouse_y)
	s:s_drawim(200, 200, 3, 3, 4)
end
