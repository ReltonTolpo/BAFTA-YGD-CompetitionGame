require "space"
require "planetA"
require "planetB"
require "planetC"
player = {}

function player.load()

	player.x = 50
	player.y = 50
	player.xvel = 1
	player.yvel = 1
	player.friction = 7
	player.speed = 1250
	player.altspeed = 2500
	player.mass = 10
	--player.currentGround = 575
	player.currentGravity = 1

	if(space.switch==1)then

		--player.currentGround = planetA.groundlevel
		player.currentGravity = planetA.gravity

	elseif(space.switch==2)then

		--player.currentGround = planetB.groundlevel
		player.currentGravity = planetB.gravity

	elseif(space.switch==3)then

		--player.currentGround = planetC.groundlevel
		player.currentGravity = planetC.gravity

	end

	player.weight = player.mass * player.currentGravity

end

function player.draw()

	love.graphics.setColor(200, 200, 200)
	idlePlayer = love.graphics.newImage("images/player/playerIdle.png")
	love.graphics.draw(idlePlayer, player.x, player.y, 0, 8, 8)

end

function player.physics(dt)

	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	player.yvel = player.yvel + player.weight --Gravity applied here
	player.xvel = player.xvel * (1 - math.min(dt * player.friction, 1))

end

function player.move(dt)

	if love.keyboard.isDown('d') and player.xvel < player.speed then
		player.xvel = player.xvel + player.speed * dt
	end

	if love.keyboard.isDown('a') and player.xvel > -player.speed then
		player.xvel = player.xvel - player.speed * dt
	end

	if love.keyboard.isDown('d') and love.keyboard.isDown('lalt') and player.xvel < player.speed then
		player.xvel = player.xvel + player.altspeed * dt
	end

	if love.keyboard.isDown('a') and love.keyboard.isDown('lalt') and player.xvel > -player.speed then
		player.xvel = player.xvel - player.altspeed * dt
	end

	if love.keyboard.isDown('space') then
		player.y = player.y - 10
	end

	if love.keyboard.isDown('s') and player.y < player.currentGround then
		player.y = player.y + 10
	end

	if love.keyboard.isDown('c') then
		space.switch = space.switch + 1
	end

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

	if player.y > 580 - 100 then
		player.y = 580 - 100
		player.yvel = 0
	end

	if space.switch > 3 then
		space.switch = 1
	end

end

function UPDATE_PLAYER(dt)

	player.physics(dt)
	player.move(dt)
	player.boundary()

end

function DRAW_PLAYER()

	player.draw()

end