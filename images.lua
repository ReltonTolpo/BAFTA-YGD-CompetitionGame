images = {}

function images.load()

	--↓ Player images 
	images.playerIdle = love.graphics.newImage("images/player/playerIdle.png") -- Still player
	images.playerDead = love.graphics.newImage("images/player/playerDead.png") -- Dead player
	images.playerSpace = love.graphics.newImage("images/player/playerIdleSpace.png") -- Player in space
	images.playerLeft = love.graphics.newImage("images/player/playerWalkingLeft.png")	-- Player moving left
	images.playerRight = love.graphics.newImage("images/player/playerWalkingRight.png") --Playeer moving right

	--↓ Ship images
	images.ship = love.graphics.newImage("images/ship/shipLand.png")
	images.playerInShip = love.graphics.newImage("images/ship/shipLandPlayer.png")

	--↓ Monster images
	images.darkElf = love.graphics.newImage("images/monster/darkElf.png")

	--↓ Weather images
	images.moon = love.graphics.newImage("images/weather/moon.png")
	images.sun = love.graphics.newImage("images/weather/sun.png")

end

function images.update()

	--TODO LOGIC CODE

end

function UPDATE_IMAGES(dt)

	images.update()

end
