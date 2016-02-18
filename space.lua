space = {}

function space.load()

	space.starNum = love.math.random(20, 100) 
	space.starSize = 10
	space.starXPosition = 100
	space.starYPosition = 100

end

function space.draw()

	love.graphics.setBackgroundColor(0, 0, 0)

end

function space.drawStars()

	for i = 1, space.starNum do
		love.graphics.setColor(255, 255, 255)
		space.starSize = love.math.random(1, 10)
		space.starXPosition = love.math.random(1, 1200)
		space.starYPosition = love.math.random(1, 750)
		love.graphics.rectangle("fill", space.starXPosition, space.starYPosition, space.starSize, space.starSize)
	end

end

function UPDATE_SPACE(dt)

end

function DRAW_SPACE()

	space.draw()
	space.drawStars()

end