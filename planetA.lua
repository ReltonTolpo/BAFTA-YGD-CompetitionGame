require "space"
planetA = {}

function planetA.load()

	planetA.colourR = love.math.random(0, 255) 
	planetA.colourG = love.math.random(0, 255) 
	planetA.colourB = love.math.random(0, 255) 
	planetA.backColourR = love.math.random(0, 255) 
	planetA.backColourG = love.math.random(0, 255) 
	planetA.backColourB = love.math.random(0, 255) 
	planetA.gravity = love.math.random(1, 5)
	planetA.groundlevel = 600

end

function planetA.draw()

	if(space.switch==1)then
		love.graphics.setBackgroundColor(planetA.backColourR, planetA.backColourG, planetA.backColourB)
		love.graphics.setColor(82, 46, 23)
		love.graphics.rectangle("fill", 0, planetA.groundlevel, 1200, 600) --> Dirt/Earth
		love.graphics.setColor(35, 115, 31)
		love.graphics.rectangle("fill", 0, 600, 1200, 30) --> Grass
	end

end

function UPDATE_PLANETA(dt)

end

function DRAW_PLANETA()

	planetA.draw()

end