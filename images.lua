images = {}

function images.load()

	--↓ Player images 
	images.playerIdle 			= love.graphics.newImage("images/player/playerIdle.png") 			-- Still player
	images.playerDead 			= love.graphics.newImage("images/player/playerDead.png") 			-- Dead player
	images.playerWalk 			= love.graphics.newImage("images/player/playerWalking.png")		    -- Player moving left

	--↓ Item images
	images.graviton				= love.graphics.newImage("images/items/graviton.png")	 		-- Graviton texture doesn't change when you kill a boss	-- Gravitons
	images.gunBase				= love.graphics.newImage("images/items/basicGun.png") 				-- Basic Gun
	images.machineGun			= love.graphics.newImage("images/items/machineGun.png") 			-- Machine Gun
	images.ammoBase				= love.graphics.newImage("images/items/basicAmmo.png")				-- Basic Ammo
	images.jetpack				= love.graphics.newImage("images/items/jetpack.png")				-- AMAZINGLY AMAZING JETPACK INC. [sponsored by Danny&co.]
	images.cannon				= love.graphics.newImage("images/items/cannon.png")
	images.harpoonGun			= love.graphics.newImage("images/items/harpoonGun.png")

	--↓ GUI images
	images.inventory			= love.graphics.newImage("images/GUI/inventoryGUI.png")				-- Basic Ammo

	--↓ Ship images
	images.ship 		 		= love.graphics.newImage("images/ship/shipLand.png")				-- Ship without player inside
	images.playerInShip     		= love.graphics.newImage("images/ship/shipLandPlayer.png")			-- Ship with player inside
	images.playerInShipNoGear		= love.graphics.newImage("images/ship/shipLandPlayerNoGear.png")	-- Ship with player inside and no landing gears
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
	images.fire					= love.graphics.newImage("images/particles/fire.png") 			-- Fire
	images.firework				= love.graphics.newImage("images/particles/firework.png") 			-- Fireworks

	--↓ Planet images
	images.planet   			= love.graphics.newImage("images/planet/basePlanet.png") 		-- Planet image

	--↓ Planet11 images
	images.gary				= love.graphics.newImage("images/planet11/gary.png")			-- Gary NPC
	images.averagePerson			= love.graphics.newImage("images/planet11/averagePerson.png")	-- Average NPC
	
	--filters:

	images.gary:setFilter("nearest", "nearest")
	images.averagePerson:setFilter("nearest", "nearest")
	images.planet:setFilter("nearest", "nearest")
	images.firework:setFilter("nearest", "nearest")
	images.fire:setFilter("nearest", "nearest")
	images.smoke:setFilter("nearest", "nearest")
	images.wormhole:setFilter("nearest", "nearest")
	images.sun:setFilter("nearest", "nearest")
	images.moon:setFilter("nearest", "nearest")
	images.cyclopsOgreMove:setFilter("nearest", "nearest")
	images.cyclopsOgre:setFilter("nearest", "nearest")
	images.flyingOctoMove:setFilter("nearest", "nearest")
	images.flyingOcto:setFilter("nearest", "nearest")
	images.darkElfMove:setFilter("nearest", "nearest")
	images.darkElf:setFilter("nearest", "nearest")
	images.ship:setFilter("nearest", "nearest")
	images.shipInSpace:setFilter("nearest", "nearest")
	images.playerInShip:setFilter("nearest", "nearest")
	images.playerInShipNoGear:setFilter("nearest", "nearest")
	images.inventory:setFilter("nearest", "nearest")
	images.jetpack:setFilter("nearest", "nearest")
	images.ammoBase:setFilter("nearest", "nearest")
	images.machineGun:setFilter("nearest", "nearest")
	images.gunBase:setFilter("nearest", "nearest")
	images.graviton:setFilter("nearest", "nearest")
	images.playerWalk:setFilter("linear", "linear")
	images.playerDead:setFilter("linear", "linear")
	images.playerIdle:setFilter("linear", "linear")
	images.cannon:setFilter("nearest", "nearest")
	images.harpoonGun:setFilter("nearest", "nearest")
end

function images.update()

	--TODO LOGIC CODE

end

function UPDATE_IMAGES(dt)

	images.update()

end
