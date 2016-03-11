main = {}
require "space"
require "planet"
require "player"
require "monster"
require "sound"
require "images"
require "ship"

function love.load()

	--love.graphics.setBackgroundColor(255, 255, 255)

	--Loading Classes
	
	sound.load()
	images.load()

	space.load()
	planet.load()

	player.load()

	monster.load()
	ship.load()
	
end

function love.update(dt)
	
	UPDATE_SOUND(dt)
	UPDATE_IMAGES(dt)

	UPDATE_SPACE(dt)
	UPDATE_PLANET(dt)
	UPDATE_PLAYER(dt)

	UPDATE_MONSTER(dt)

	UPDATE_SHIP(dt)

end 


function love.draw()

	DRAW_SPACE()
	DRAW_PLANET()

	DRAW_MONSTER()
   
	if playerOverShip == false then
		DRAW_PLAYER()
		DRAW_SHIP()
	elseif playerOverShip == true then  
		DRAW_SHIP()
		DRAW_PLAYER()
	end
end