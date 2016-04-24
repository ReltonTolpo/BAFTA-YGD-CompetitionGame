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

function love.load()
playerOverShip = true
x = 0
	--Loading Classes
	inmenu = true

	menu.load()
	if inmenu == false then

	sound.load()
	images.load()

	space.load()
	planet.load()

	player.load()
	weapon.load()
	inventory.load()

	monster.load()
	ship.load()
end
	
end

function love.update(dt)

		if inmenu == false then
				x = x +1
					if x == 1 then
	sound.load()
	images.load()

	space.load()
	planet.load()

	player.load()
	weapon.load()
	inventory.load()

	monster.load()
	ship.load()
		
			end
	UPDATE_SOUND(dt)
	UPDATE_IMAGES(dt)

	UPDATE_SHIP(dt)
	UPDATE_SPACE(dt)

	UPDATE_PLANET(dt)

	UPDATE_PLAYER(dt)
	UPDATE_WEAPON(dt)
	UPDATE_INVENTORY(dt)

	UPDATE_MONSTER(dt)




	end
end

--end 


function love.draw()
	if inmenu == true then
	DRAW_MENU()
end
if inmenu == false then
	DRAW_SPACE()
	DRAW_PLANET()

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
end
end