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
require "mobile"


function love.load()

	adown,ddown,spacedown = false,false,false

	mobile.load()
	playerOverShip = true
	x = 0

	--Loading Classes
	inmenu = true

	menu.load()

	scale = love.graphics.getWidth()/1200

	gameType = "desktop"

	if love.system.getOS() == 'iOS' or love.system.getOS() == 'Android' then
  		gameType = "mobile"
	end
	
end

function love.update(dt)

	if gameType == "desktop" then
		adown = love.keyboard.isDown('a')
		ddown = love.keyboard.isDown('d')
		spacedown = love.keyboard.isDown('space')
	else
		adown = buttons.left
		ddown = buttons.right
		spacedown = buttons.up
	end

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
		if gameType == "mobile" then
			UPDATE_MOBILE()
		end
	end

	touches = love.touch.getTouches()

end

function love.draw()

	love.graphics.push()

	love.graphics.scale(scale)

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
		if gameType == "mobile" then
			DRAW_MOBILE()
		end
		DRAW_INVENTORY()
		DRAW_TUTORIAL()
	end

	love.graphics.pop()


end