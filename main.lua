main = {}
require "space"
require "planet"
require "player"
require "weapon"
require "monster"
require "sound"
require "images"
require "ship"
require "inventory"
require "menu"
require "endgame"

function love.load()

	playerOverShip = true
	x = 0

	--Loading Classes
	inmenu = true

	menu.load()
	
end

function love.update(dt)

	if inmenu == false then
		UPDATE_SOUND(dt)
		UPDATE_IMAGES(dt)

		UPDATE_SHIP(dt)
		UPDATE_SPACE(dt)
		UPDATE_ENDGAME(dt)

		UPDATE_PLANET(dt)

		UPDATE_PLAYER(dt)
		UPDATE_WEAPON(dt)
		UPDATE_INVENTORY(dt)

		UPDATE_MONSTER(dt)
		UPDATE_TUTORIAL(dt)
	end

end

function love.draw()

	if inmenu == true then
		DRAW_MENU()
	elseif inmenu == false then
		DRAW_SPACE()
		DRAW_PLANET()
		DRAW_ENDGAME()

		DRAW_MONSTER()
	   
		if playerOverShip == false then
			DRAW_PLAYER()
			DRAW_WEAPON()
			DRAW_SHIP()
		elseif playerOverShip == true then  
			DRAW_SHIP()
			DRAW_PLAYER()
			DRAW_WEAPON()
		end
		DRAW_INVENTORY()
		DRAW_TUTORIAL()
	end

end