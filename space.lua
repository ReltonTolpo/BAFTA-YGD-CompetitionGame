space = {}

function space.load()

	space.i = 1
	space.maxStars = 100
	space.minStars = 30
	space.starNum = love.math.random(space.minStars, space.maxStars) 
	space.starSize = 1
	space.starXPosition = 1
	space.starYPosition = 1

end

function space.draw()

	love.graphics.setBackgroundColor(0, 0, 0)
	love.graphics.setColor(255, 255, 255)

	while space.i < space.starNum do
		space.starSize = love.math.random(1, 10)
		space.starXPosition = love.math.random(1, 1200)
		space.starYPosition = love.math.random(1, 750)
		love.graphics.rectangle("fill", space.starXPosition, space.starYPosition, space.starSize, space.starSize)
		space.i = space.i + 1
	end
end

function UPDATE_SPACE(dt)

end

function DRAW_SPACE()

	space.draw()

end