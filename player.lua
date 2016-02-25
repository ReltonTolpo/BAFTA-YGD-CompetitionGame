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
	player.weight = player.mass * planet.gravity

end

function player.draw()

	love.graphics.setColor(200, 200, 200)
	idlePlayer = love.graphics.newImage("images/playerIdle.png")
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

	if love.keyboard.isDown('s') and player.y < planet.groundlevel then
		player.y = player.y + 10
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

	if player.y > planet.groundlevel - 100 then
		player.y = planet.groundlevel - 100
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