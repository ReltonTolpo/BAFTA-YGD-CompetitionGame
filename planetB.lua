planetB = {}

function planetB.load()

	planetB.gravity = 0
	planetB.colourR = love.math.random(0, 255) 
	planetB.colourG = love.math.random(0, 255) 
	planetB.colourB = love.math.random(0, 255) 
	planetB.backColourR = love.math.random(0, 255) 
	planetB.backColourG = love.math.random(0, 255) 
	planetB.backColourB = love.math.random(0, 255) 
	planetB.gravity = love.math.random(1, 5)
	planetB.groundlevel = 600

end

function planetB.draw()

	love.graphics.setBackgroundColor(planetB.backColourR, planetB.backColourG, planetB.backColourB)
	love.graphics.setColor(82, 46, 23)
	love.graphics.rectangle("fill", 0, planetB.groundlevel, 1200, 600) --> Dirt/Earth
	love.graphics.setColor(35, 115, 31)
	love.graphics.rectangle("fill", 0, 600, 1200, 30) --> Grass

end

function UPDATE_PLANETB(dt)

end

function DRAW_PLANETB()

	planetB.draw()

end