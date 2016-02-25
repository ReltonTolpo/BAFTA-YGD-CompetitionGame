require "space"
planetC = {}

function planetC.load()

	planetC.colourR = love.math.random(0, 255) 
	planetC.colourG = love.math.random(0, 255) 
	planetC.colourB = love.math.random(0, 255) 
	planetC.backColourR = love.math.random(0, 255) 
	planetC.backColourG = love.math.random(0, 255) 
	planetC.backColourB = love.math.random(0, 255) 
	planetC.gravity = love.math.random(1, 5)
	planetC.groundlevel = 600

end

function planetC.draw()

	if(space.switch==3)then
		love.graphics.setBackgroundColor(planetA.backColourR, planetA.backColourG, planetA.backColourB)
		love.graphics.setColor(82, 46, 23)
		love.graphics.rectangle("fill", 0, planetA.groundlevel, 1200, 600) --> Dirt/Earth
		love.graphics.setColor(35, 115, 31)
		love.graphics.rectangle("fill", 0, 600, 1200, 30) --> Grass
	end

end

function UPDATE_PLANETC(dt)

end

function DRAW_PLANETC()

	planetC.draw()

end