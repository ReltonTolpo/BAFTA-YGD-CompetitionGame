require "space"
require "planet"

function love.load()

	love.graphics.setBackgroundColor(255, 255, 255)

	--Loading Classes
	--space.load()
	planet.load()

end

function love.update(dt)

	--UPDATE_SPACE()
	UPDATE_PLANET()

end

function love.draw()

	--DRAW_SPACE()
	DRAW_PLANET()

end