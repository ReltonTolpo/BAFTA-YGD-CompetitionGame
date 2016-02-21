planet = {}

function planet.load()

	planet.gravity = 0
	planet.colourR = love.math.random(0, 255) 
	planet.colourG = love.math.random(0, 255) 
	planet.colourB = love.math.random(0, 255) 
	planet.backColourR = love.math.random(0, 255) 
	planet.backColourG = love.math.random(0, 255) 
	planet.backColourB = love.math.random(0, 255) 
	planet.gravity = love.math.random(0.1, 5)
	planet.groundlevel = 600

end

function planet.draw()

	love.graphics.setBackgroundColor(planet.backColourR, planet.backColourG, planet.backColourB)
	love.graphics.setColor(82, 46, 23)
	love.graphics.rectangle("fill", 0, planet.groundlevel, 1200, 600) --> Dirt
	love.graphics.setColor(35, 115, 31)
	love.graphics.rectangle("fill", 0, 600, 1200, 30) --> Grass

end

function UPDATE_PLANET(dt)

end

function DRAW_PLANET()

	planet.draw()

end