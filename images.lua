images = {}

function images.load()

	--↓ Player images 
	images.playerIdle 			= love.graphics.newImage("images/player/playerIdle.png") 			-- Still player
	images.playerDead 			= love.graphics.newImage("images/player/playerDead.png") 			-- Dead player
	images.playerWalk 			= love.graphics.newImage("images/player/playerWalking.png")		    -- Player moving left

	--↓ Item images
	images.graviton				= love.graphics.newImage("images/items/graviton.png")	 			-- Gravitons
	images.gunBase				= love.graphics.newImage("images/items/basicGun.png") 				-- Basic Gun
	images.machineGun			= love.graphics.newImage("images/items/machineGun.png") 			-- Machine Gun
	images.ammoBase				= love.graphics.newImage("images/items/basicAmmo.png")				-- Basic Ammo
	images.jetpack				= love.graphics.newImage("images/items/jetpack.png")				    -- AMAZINGLY AMAZING JETPACK INC. [sponsored by Danny&co.]
	images.jetpackLeft			= love.graphics.newImage("images/items/jetpackLeft.png")
	images.jetpackRight			= love.graphics.newImage("images/items/jetpackRight.png")

	--↓ GUI images
	images.inventory			= love.graphics.newImage("images/GUI/inventoryGUI.png")				-- Basic Ammo

	--↓ Ship images
	images.ship 		        = love.graphics.newImage("images/ship/shipLand.png")				-- Ship without player inside
	images.playerInShip     	= love.graphics.newImage("images/ship/shipLandPlayer.png")			-- Ship with player inside
	images.playerInShipNoGear	= love.graphics.newImage("images/ship/shipLandPlayerNoGear.png")	-- Ship with player inside and no landing gears
	images.shipInSpace			= love.graphics.newImage("images/ship/shipSpace.png")				-- Ship in space

	--↓ Monster images
	images.darkElf 				= love.graphics.newImage("images/monster/darkElf/darkElf.png")		--Dark elf monster
	images.darkElfMove			= love.graphics.newImage("images/monster/darkElf/darkElfMove.png")	--Dark elf monster
	images.flyingOcto 			= love.graphics.newImage("images/monster/flyingOcto/flyingOcto.png")--Flying octo monster
	images.flyingOctoMove		= love.graphics.newImage("images/monster/flyingOcto/flyingOctoMove.png")	--Flying octo monster
	images.cyclopsOgre 			= love.graphics.newImage("images/monster/cyclopsOgre/cyclopsOgre.png")		--Cyclops ogre monster
	images.cyclopsOgreMove		= love.graphics.newImage("images/monster/cyclopsOgre/cyclopsOgreMove.png")	--Cyclops ogre monster

	--↓ Weather images
	images.moon 				= love.graphics.newImage("images/weather/moon.png")				-- Moon
	images.sun 					= love.graphics.newImage("images/weather/sun.png")				-- Sun
	images.wormhole				= love.graphics.newImage("images/weather/wormhole.png")			-- Wormhole

	--↓ Particle images
	images.smoke				= love.graphics.newImage("images/particles/smoke.png") 			-- Smoke
	images.haze					= love.graphics.newImage("images/particles/haze.png") 			-- Haze
	images.fire					= love.graphics.newImage("images/particles/fire.png") 			-- Fire

	--↓ Planet images
	images.planet   			= love.graphics.newImage("images/planet/basePlanet.png") 		-- Planet

	--↓ Flag
	images.flag					= love.graphics.newImage("images/planet/flag.png")				-- Flag

end

function images.update()

	--TODO LOGIC CODE

end

function UPDATE_IMAGES(dt)

	images.update()

end
