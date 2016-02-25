require "space"
require "planetA"
require "planetB"
require "planetC"
require "player"

function love.load()

	love.graphics.setBackgroundColor(255, 255, 255)

	--Loading Classes
	space.load()
	player.load()

	planetA.load()
	planetB.load()
	planetC.load()
	
end

function love.update(dt)

	UPDATE_SPACE(dt)
	UPDATE_PLAYER(dt)

	UPDATE_PLANETA(dt)
	UPDATE_PLANETB(dt)
	UPDATE_PLANETC(dt)

end

function love.draw()

	DRAW_SPACE()
	DRAW_PLAYER()

	DRAW_PLANETA()
	DRAW_PLANETB()
	DRAW_PLANETC()

end