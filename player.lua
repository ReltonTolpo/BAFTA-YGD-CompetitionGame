player = {}
require "space"
require "planet"
require "sound"
require "images"
require "monster"
require "weapon"

function player.load()
	player.jetpack = true
	player.health = 100
	player.x = 50
	player.y = 50
	player.deadX = 50
	player.deadY = 50
	player.dead = false
	player.storedX = 0
	player.storedY = 0
	player.xvel = 1
	player.yvel = 1
	player.friction = 7
	player.speed = 1250
	player.altspeed = 2500
	player.mass = 10
	player.currentGround = 550
	player.currentGravity = planetArray[currentPlanet][4]
	player.moving = false
	player.playerExists = true
	player.canMove = true
	player.doGravity = true
	player.onPlanet = true
	player.beenHit = false
	player.direction = "still"

	player.weight = player.currentGravity * player.mass

	hero = images.playerIdle --Starts looking straight
	
end

function player.draw()

	downS = love.keyboard.isDown('s')

	if space.dayTime == 1 then
		player.healthColourR = planetArray[currentPlanet][1] - 100
		player.healthColourG = planetArray[currentPlanet][2] - 100
		player.healthColourB = planetArray[currentPlanet][3] - 100
	else
		player.healthColourR = planetArray[currentPlanet][1] + 100
		player.healthColourG = planetArray[currentPlanet][2] + 100
		player.healthColourB = planetArray[currentPlanet][3] + 100
	end

	if player.healthColourR < 1 then player.healthColourR = player.healthColourR + 100 end
	if player.healthColourG < 1 then player.healthColourG = player.healthColourG + 100 end
	if player.healthColourB < 1 then player.healthColourB = player.healthColourB + 100 end
	
	if player.beenHit == true then
		love.graphics.setColor(255, 0, 0)
		if player.direction == "right" then
			love.graphics.draw(hero, player.x + 130, player.y, 0, -2, 2)
		else
			love.graphics.draw(hero, player.x, player.y, 0, 2, 2)
		end
	elseif player.beenHit == false then
		love.graphics.setColor(255, 255, 255)
		if player.direction == "right" then
			love.graphics.draw(hero, player.x + 130, player.y, 0, -2, 2)
		else
			love.graphics.draw(hero, player.x, player.y, 0, 2, 2)
		end
	end

	love.graphics.setColor(player.healthColourR, player.healthColourG, player.healthColourB)
	love.graphics.print("Player Health = " ..player.health, 30, 30, 0, 3, 3)
	love.graphics.print("Ammo amount = " ..weapon.ammoAmount, 780, 30, 0, 3, 3)

	if player.dead == true then
		love.graphics.setColor(200, 80, 80)
		love.graphics.print("Press SPACE to respawn", player.deadX - 100, player.deadY - 50, 0, 3, 3)
	end

end

function player.physics(dt)

	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	player.yvel = player.yvel + player.weight --Gravity applied here
	player.xvel = player.xvel * (1 - math.min(dt * player.friction, 1))

end
 
function player.update(dt)

	if love.keyboard.isDown('d') and player.xvel < player.speed and player.dead == false then
		player.xvel = player.xvel + player.speed * dt
		hero = images.playerWalk

		player.direction = "right"
		player.moving = true
	end

	if love.keyboard.isDown('a') and player.xvel > -player.speed and player.dead == false then
		player.xvel = player.xvel - player.speed * dt
		hero = images.playerWalk

		player.direction = "left"
		player.moving = true
	end

	if love.keyboard.isDown('d') and love.keyboard.isDown('lalt') and player.xvel < player.speed and player.dead == false then
		player.xvel = player.xvel + player.altspeed * dt
		hero = images.playerWalk

		player.direction = "right"
		player.moving = true
	end

	if love.keyboard.isDown('a') and love.keyboard.isDown('lalt') and player.xvel > -player.speed and player.dead == false then
		player.xvel = player.xvel - player.altspeed * dt
		hero = images.playerWalk

		player.direction = "left"
		player.moving = true
	end

	if player.moving ~= true then
		player.direction = "still"
	end
	
	for i = 1, monster.amount do --Monster deals damage to player here
		if player.x >= monsterArray[i][1] - 20 and player.x <= monsterArray[i][1] + 20 and player. y >= monsterArray[i][2] - 30 and player.y <= monsterArray[i][2] + 30 then
			player.health = player.health - 1
			player.beenHit = true
		else
			player.beenHit = false
		end
	end

	if player.health < 0 then
		player.health = 0
	end

	if player.health == 0 then

		player.deadX = player.x
		player.deadY = player.y
		hero = images.playerDead

		player.dead = true
		player.moving = false

		if love.keyboard.isDown('space') then
			weapon.ammoAmount = 30

			space.load()
			monster.load()
			player.load()

			player.dead = false
		end

	end

	function love.keyreleased(key)
		if key == "a" or "d" then
			hero = images.playerIdle

			player.moving = false
		end
	end

	if love.keyboard.isDown('space') and player.dead == false then
		player.y = player.y - 10
	end

	if downS == true and player.dead == false then
		player.y = player.y + 10
		player.x = player.storedX
	else
		player.storedX = player.x
	end

	if love.keyboard.isDown('c') and player.dead == false then
		currentPlanet = currentPlanet + 1
		monster.load()
		love.timer.sleep(0.5)
	end

	if player.moving == true and player.canMove == true then
		if player.y >= player.currentGround - 120 and downS == false then
			sound.walking_sfx:play()
		else
			sound.walking_sfx:pause()
		end
	elseif player.moving == false or player.active == false then
		sound.walking_sfx:pause()
	end

	player.currentGravity = planetArray[currentPlanet][4]
	player.weight = player.currentGravity * player.mass
	
	if player.onPlanet = true then
		sound.bg_music:play()
		sound.bg_music_space:pause()
	elseif player.onPlanet = false then
		sound.bg_music_space:play()
		sound.bg_music:pause()		
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

	if player.y > player.currentGround - 100 then
		player.y = player.currentGround - 100
		player.yvel = 0
	end

end

function player.jetpack()
	if player.jetpack == true then
	end
end
function UPDATE_PLAYER(dt)

	player.physics(dt)

	if player.canMove == true then
		player.update(dt)
	end

	player.boundary()

end

function DRAW_PLAYER()

	if player.playerExists == true then
		player.draw()
	end

end
