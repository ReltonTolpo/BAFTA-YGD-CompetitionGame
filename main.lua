require "space"
require "planet"
require "player"

function love.load()

	love.graphics.setBackgroundColor(255, 255, 255)

	--Loading Classes
	--space.load()
	planet.load()
	player.load()

end

function love.update(dt)

	--UPDATE_SPACE()
	UPDATE_PLANET()
	UPDATE_PLAYER()

end

function love.draw()

	--DRAW_SPACE()
	DRAW_PLANET()
	DRAW_PLAYER()

end