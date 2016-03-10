player = {}
require "space"
require "planet"
require "sound"


function player.load()

	player.x = 50
	player.y = 50
	player.xvel = 1
	player.yvel = 1
	player.friction = 7
	player.speed = 1250
	player.altspeed = 2500
	player.mass = 10
	player.currentGround = 575
	player.currentGravity = planetArray[currentPlanet][4]
	player.moving = false
	player.playerExists = true

	player.weight = player.currentGravity * player.mass

	--Importing the images
	idlePlayer = love.graphics.newImage("images/player/playerIdle.png") -- Still player
	spacePlayer = love.graphics.newImage("images/player/playerIdleSpace.png") -- Player in space
	leftPlayer = love.graphics.newImage("images/player/playerWalkingLeft.png")	-- Player moving left
	rightPlayer = love.graphics.newImage("images/player/playerWalkingRight.png") --Playeer moving right

	hero = spacePlayer --Starts looking straight
	
end

function player.draw()

	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(hero, player.x, player.y, 0, 2, 2)


end

function player.physics(dt)

	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	player.yvel = player.yvel + player.weight --Gravity applied here
	player.xvel = player.xvel * (1 - math.min(dt * player.friction, 1))

end

function player.update(dt)

	--player.currentGravity = planet[space.switch][4]

	if love.keyboard.isDown('d') and player.xvel < player.speed then
		player.xvel = player.xvel + player.speed * dt
		hero = rightPlayer

		player.moving = true
	end

	if love.keyboard.isDown('a') and player.xvel > -player.speed then
		player.xvel = player.xvel - player.speed * dt
		hero = leftPlayer

		player.moving = true
	end

	if love.keyboard.isDown('d') and love.keyboard.isDown('lalt') and player.xvel < player.speed then
		player.xvel = player.xvel + player.altspeed * dt
		hero = rightPlayer

		player.moving = true
	end

	if love.keyboard.isDown('a') and love.keyboard.isDown('lalt') and player.xvel > -player.speed then
		player.xvel = player.xvel - player.altspeed * dt
		hero = leftPlayer

		player.moving = true
	end

	function love.keyreleased(key)
		if key == "a" or "d" then
			hero = idlePlayer

			player.moving = false
		end
	end

	if love.keyboard.isDown('space') then
		player.y = player.y - 10
	end

	if love.keyboard.isDown('s') and player.y < player.currentGround then
		player.y = player.y + 10
	end

	function love.mousereleased(x, y, button)
		if button == 2 then
			space.switch = space.switch + 1
		end
	end

	if player.moving == true then
		if player.y >= player.currentGround - 120 then
			sound.walking_sfx:play()
		else
			sound.walking_sfx:pause()
		end
	else
		sound.walking_sfx:pause()
	end

	player.weight = player.currentGravity * player.mass
end

function player.boundary()

	if player.x < -50 then
		player.x = 1150
		player.xvel = 0
	end

	if player.x > 1200 then
		player.x = -30
		player.xvel = 0
	end

	if player.y < 0 then
		player.y = 0
		player.yvel = 0
	end

	if player.y < 0 and love.keyboard.isDown('space') then
		player.y = player.y + 50
		player.yvel = 0
	end

	if player.y > player.currentGround - 100 then
		player.y = player.currentGround - 100
		player.yvel = 0
	end

	if space.switch > 3 then
		space.switch = 1
	end

end

function UPDATE_PLAYER(dt)

	player.physics(dt)
	player.update(dt)
	player.boundary()

end

function DRAW_PLAYER()

	if player.playerExists == true then
		player.draw()
	else

	end

end