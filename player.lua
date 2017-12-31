player = {}
require "space"
require "planet"
require "sound"
require "images"
require "monster"
require "weapon"

function player.load()

	local fire = images.fire
	psystem30 = love.graphics.newParticleSystem(fire, 100)
	psystem30:setParticleLifetime(2, 3) -- Particles live at least 2s and at most 5s.
	psystem30:setEmissionRate(20)
	psystem30:setSizeVariation(0)
	psystem30:setLinearAcceleration(-4, 0, 4, 50) -- Random movement in all directions.

	player.tutorialOn = false

    player.shipalpha = 255
	player.hasJetpack = false
	player.jetpacking = false

	player.health = 100
	player.x = 500
	player.y = 50
	player.alpha = 255
	player.deadX = 50
	player.deadY = 50
	player.dead = false
	player.storedX = 0
	player.storedY = 0
	player.doJump = true
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
	player.doGravity2 = true
	player.onPlanet = true
	player.beenHit = false
	player.direction = "still"

	player.weight = player.currentGravity * player.mass
	player.tickspeed = 3

	hero = images.playerIdle --Starts looking straight
    jetpack = images.jetpack

end

function sleep(sec)

    socket.select(nil, nil, sec)

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

	if player.dead == true then
		love.graphics.setColor(200, 80, 80)
		if gameType == "desktop" then
			love.graphics.print("Press SPACE to respawn", player.deadX - 100, player.deadY - 50, 0, 3, 3)
		else
			love.graphics.print("Press UP to respawn", player.deadX - 100, player.deadY - 50, 0, 3, 3)
		end
	end

end

function player.drawInfo()
	if player.playerExists == true then
		love.graphics.setColor(255,0,0)
	end
	love.graphics.print("Player Health = " ..player.health, 30, 30, 0, 3, 3)
	love.graphics.print("Ammo amount = " ..weapon.ammoAmount, 780, 30, 0, 3, 3)
	love.graphics.setColor(255,255,255)
end

function player.physics(dt)

	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	if player.doGravity2 == true then
		player.yvel = player.yvel + player.weight --Gravity applied here this is just so I can add an extra comment
	end
	player.xvel = player.xvel * (1 - math.min(dt * player.friction, 1))

end

function player.update(dt)
	
	psystem30:update(dt)

	if ddown and player.xvel < player.speed and player.dead == false then
		player.xvel = player.xvel + player.speed * dt
		hero = images.playerWalk

		player.direction = "right"
		player.moving = true
	end

	if adown and player.xvel > -player.speed and player.dead == false then
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
		if monsterArray[i][16] == false then
			if monsterArray[i][7] == 1 then
				if player.x >= monsterArray[i][1] - 20 and player.x <= monsterArray[i][1] + 20 and player. y >= monsterArray[i][2] - 30 and player.y <= monsterArray[i][2] + 30 then
					player.health = player.health - 1
					player.beenHit = true
				else
					player.beenHit = false
				end
			elseif monsterArray[i][7] == 2 or monsterArray[i][7] == 3 then
				if player.x >= monsterArray[i][1] - 20 and player.x <= monsterArray[i][1] + 20 and player. y >= monsterArray[i][2] - 100 and player.y <= monsterArray[i][2] + 100 then
					player.health = player.health - 1
					player.beenHit = true
				else
					player.beenHit = false
				end
			end
		elseif monsterArray[i][16] == true then
			if monsterArray[i][7] == 1 then
				if player.x >= monsterArray[i][1] - 40 and player.x <= monsterArray[i][1] + 40 and player. y >= monsterArray[i][2] - 30 and player.y <= monsterArray[i][2] + 30 then
					player.health = player.health - 2
					player.beenHit = true
				else
					player.beenHit = false
				end
			elseif monsterArray[i][7] == 2 or monsterArray[i][7] == 3 then
				if player.x >= monsterArray[i][1] - 40 and player.x <= monsterArray[i][1] + 40 and player. y >= monsterArray[i][2] - 100 and player.y <= monsterArray[i][2] + 100 then
					player.health = player.health - 2
					player.beenHit = true
				else
					player.beenHit = false
				end
			end
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

		if spacedown then
			weapon.ammoAmount = 30

			if player.hasJetpack == true then
				player.load()
				player.hasJetpack = true
			else
				player.load()
			end

			space.load()
			monster.load()

			currentPlanet = 1
			if inventory.graviNum > 0 then
				inventory.graviNum = inventory.graviNum - 1
			end
			player.dead = false
		end

	end

	function love.keyreleased(key)
		if key == "a" or "d" then
			hero = images.playerIdle

			player.moving = false
		end
	end

	if spacedown and player.dead == false and player.doJump == true then
		player.y = player.y - 10
	end

	if downS == true and player.dead == false and player.jetpacking == false then
		player.y = player.y + 10
		player.x = player.storedX
	elseif downS == true and spacedown and player.jetpacking == true then
		player.y = player.y + 2
	else
		player.storedX = player.x
	end

	if player.moving == true and player.canMove == true then
		if player.onPlanet == true then
			sound.walking_sfx:play()
		else
			sound.walking_sfx:pause()
		end
	elseif player.moving == false or player.active == false or player.onPlanet == false then
		sound.walking_sfx:pause()
	end

	player.currentGravity = planetArray[currentPlanet][4]
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

	if player.y > player.currentGround - 100 then
		player.y = player.currentGround - 100
		player.yvel = 0
	end

end

function player.jetpack()

	if player.onPlanet == true and spacedown and player.hasJetpack == true then
		player.y = player.y - 2
		love.graphics.setColor(255,255,255)
		love.graphics.draw(psystem30, player.x + 40, player.y + 70)
		love.graphics.draw(psystem30, player.x + 70, player.y + 70)
		player.doGravity2 = false
		player.doJump = false
		player.jetpacking = true
		sound.walking_sfx:pause()
	else
		player.doGravity2 = true
		player.jetpacking = false
	end

	if player.hasJetpack == true then
		love.graphics.draw(jetpack, player.x + 25 , player.y + 30, 0, 3, 3)
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
		player.jetpack()
		player.draw()
	end
	if player.onPlanet == true then
		player.drawInfo()
	end

end
