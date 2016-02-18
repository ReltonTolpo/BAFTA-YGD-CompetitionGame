require "planet"
player = {}

function player.load()

	planet.load()
	player.x = 50
	player.y = 50
	player.xvel = 1
	player.yvel = 1
	player.friction = 7
	player.speed = 5
	player.altspeed = 100
	player.mass = 10
	player.weight = player.mass * planet.gravity

end

function player.draw()

	idlePlayer = love.graphics.newImage("images/playerIdle.jpg")
	love.graphics.draw(idlePlayer, player.x, player.y, 0, 3, 3)

end

function player.physics(dt)

	player.x = player.x + player.xvel
	player.y = player.y + player.yvel
	player.yvel = player.yvel + player.weight
	player.xvel = player.xvel * (1 - math.min(player.friction, 1))

end

function player.move(dt)

	if love.keyboard.isDown('d') and player.xvel < player.speed then
		player.xvel = player.xvel + player.speed
	end

	if love.keyboard.isDown('a') and player.xvel > -player.speed then
		player.xvel = player.xvel - player.speed
	end

	if love.keyboard.isDown('d') and love.keyboard.isDown('lalt') and player.xvel < player.speed then
		player.xvel = player.xvel + player.altspeed
	end

	if love.keyboard.isDown('a') and love.keyboard.isDown('lalt') and player.xvel > -player.speed then
		player.xvel = player.xvel - player.altspeed
	end

	if love.keyboard.isDown('space') and player.y < planet.planet.groundlevel then
		player.y = player.y - 10
	end

	if love.keyboard.isDown('s') and player.y < planet.planet.groundlevel then
		player.y = player.y + 10
	end

end

function player.boundary()

	if player.x <= 0 then
		player.x = 0
		player.xvel = 0
	end

	if player.x >= 1100 then
		player.x = 1100
		player.xvel = 0
	end

	if player.y < 0 then
		player.y = 0
		player.yvel = 0
	end

	if player.y + 16 > planet.groundlevel then
		player.y = planet.groundlevel - 16
		player.yvel = 0
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