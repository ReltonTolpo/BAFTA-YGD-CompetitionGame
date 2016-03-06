require "space"

require "planet"
require "player"

function love.load()

	love.graphics.setBackgroundColor(255, 255, 255)

	--Loading Classes
	space.load()
	planet.load()

	player.load()

	main.onPlanet = true

	
end

function love.update(dt)

	UPDATE_SPACE(dt)
	UPDATE_PLANET(dt)
	
	UPDATE_PLAYER(dt)

end

function love.draw()

	DRAW_SPACE()
	DRAW_PLANET()

	DRAW_PLAYER()

end