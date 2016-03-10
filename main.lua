main = {}
require "space"

require "planet"
require "player"
require "sound"
require "ship"

function love.load()

	--love.graphics.setBackgroundColor(255, 255, 255)

	--Loading Classes
	space.load()
	planet.load()
	sound.load()
	player.load()
	ship.load()
	main.onPlanet = true

	
end

function love.update(dt)

	UPDATE_SPACE(dt)
	UPDATE_PLANET(dt)
	UPDATE_SOUND(dt)
	UPDATE_PLAYER(dt)
	UPDATE_SHIP(dt)
end 



function love.draw()

	DRAW_SPACE()
	DRAW_PLANET()
   
if playerOverShip == false then
		DRAW_PLAYER()
		DRAW_SHIP()

end
if playerOverShip == true then  
		DRAW_SHIP()
	DRAW_PLAYER()
end
end