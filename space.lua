space = {}

function space.load()

	space.starNum = love.math.random(30, 100) 
	space.starSize = 1
	space.starXPosition = 1
	space.starYPosition = 1

end

function space.draw()

	love.graphics.setBackgroundColor(0, 0, 0)
	love.graphics.setColor(255, 255, 255)

	for i = 1, space.starNum do
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

end