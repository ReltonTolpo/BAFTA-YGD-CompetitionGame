images = {}

function images.load()

	--↓ Player images 
	images.playerIdle 			= love.graphics.newImage("images/player/playerIdle.png") 		-- Still player
	images.playerDead 			= love.graphics.newImage("images/player/playerDead.png") 		-- Dead player
	images.playerSpace 			= love.graphics.newImage("images/player/playerIdleSpace.png") 	-- Player in space
	images.playerLeft 			= love.graphics.newImage("images/player/playerWalkingLeft.png")	-- Player moving left
	images.playerRight 			= love.graphics.newImage("images/player/playerWalkingRight.png") --Player moving right

	--↓ Ship images
	images.ship 		        = love.graphics.newImage("images/ship/shipLand.png")			--Ship without player inside
	images.playerInShip     	= love.graphics.newImage("images/ship/shipLandPlayer.png")		--Ship with player inside
	images.playerInShipNoGear	= love.graphics.newImage("images/ship/shipLandPlayerNoGear.png")--Ship with player inside and no landing gears
	images.shipInSpace			= love.graphics.newImage("images/ship/shipSpace.png")			--Ship in space

	--↓ Monster images
	images.darkElf 				= love.graphics.newImage("images/monster/darkElf/darkElf.png")			--Dark elf monster
	images.darkElfRight			= love.graphics.newImage("images/monster/darkElf/darkElfRight.png")		--Dark elf monster
	images.darkElfRightDown		= love.graphics.newImage("images/monster/darkElf/darkElfRightDown.png")	--Dark elf monster
	images.darkElfLeft			= love.graphics.newImage("images/monster/darkElf/darkElfLeft.png")		--Dark elf monster
	images.darkElfLeftDown		= love.graphics.newImage("images/monster/darkElf/darkElfLeftDown.png")	--Dark elf monster

	--↓ Weather images
	images.moon 				= love.graphics.newImage("images/weather/moon.png")				--Moon
	images.sun 					= love.graphics.newImage("images/weather/sun.png")				--Sun

	--↓ Particle images
	images.smoke				= love.graphics.newImage("images/particles/smoke.png") 			--Smoke
	images.haze				= love.graphics.newImage("images/particles/haze.png") 			--Haze
	images.fire					= love.graphics.newImage("images/particles/fire.png") 			--Fire

	--↓ Planet images
	images.planet   			= love.graphics.newImage("images/planet/basePlanet.png") 			--planet
end

function images.update()

	--TODO LOGIC CODE

end

function UPDATE_IMAGES(dt)

	images.update()

end
