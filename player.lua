player = {}
require "space"
require "planet"
require "sound"
require "images"
require "monster"
require "weapon"

function player.load()

	counter = 0
    showhint = true
    hintString = "ERROR"
	player.hasJetpack = false
	player.health = 100
	player.x = 50
	player.y = 50
	player.alpha = 255
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

function sleep(sec)

    socket.select(nil, nil, sec)

end



function player.draw()



function player.tag(x,y,text,a)
		love.graphics.setColor(207,190,4,a)
    love.graphics.rectangle("fill", x-200, y-200, 200, 120 )
        love.graphics.line(x-200, y-200, x, y)
        love.graphics.setColor(0,0,0,a)
            love.graphics.print(text, x-200, y-200, 0, 1, 1)

	end

	downS = love.keyboard.isDown('s')



	showhint = false
	hintString = "ERROR"
	if counter < 300 then
	hintString = "Welcome to The Gravity Game!"
	showhint = true
	 end
	 if counter > 500 and counter < 1000 then
	hintString = "Use A and D to move me \n around. \n Space to jump and S to crouch \n (means you don't move whilst \n turning)."
	showhint = true
	 end
	if counter > 1200 and counter < 1800 then
	hintString = "You are currently standing on \n your home planet.\n Its gravitons have been stolen \n by \n alien creatures, making its \n gravity extreemly unstable and \n no longer suitable to support \n human life!"
	showhint = true
	 end

	if counter > 2000 and counter < 2500 then
	hintString = "Your mission is to kill all 10 \n evil alien bosses and recover \n their gravitons to restore \n your home planet to its former \n glory!!"
	showhint = true
	 end


	if counter > 2600 and counter < 3000 then
	hintString = "PLZ add to tutorial!!!!!"
	showhint = true
	 end

if showhint == true then
	player.tag(player.x,player.y,hintString,player.alpha)
	end



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
		love.graphics.print("Press SPACE to respawn", player.deadX - 100, player.deadY - 50, 0, 3, 3)
	end

end

function player.drawInfo()

	love.graphics.setColor(player.healthColourR, player.healthColourG, player.healthColourB)
	love.graphics.print("Player Health = " ..player.health, 30, 30, 0, 3, 3)
	--	love.graphics.print("Current Tick = " ..counter, 30, 100, 0, 3, 3)
	love.graphics.print("Ammo amount = " ..weapon.ammoAmount, 780, 30, 0, 3, 3)

end

function player.physics(dt)

	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	player.yvel = player.yvel + player.weight --Gravity applied here
	player.xvel = player.xvel * (1 - math.min(dt * player.friction, 1))

end
 
function player.update(dt)
counter = counter + 1
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
		if monsterArray[i][16] == false then
			if monsterArray[i][7] == 1 then
				if player.x >= monsterArray[i][1] - 20 and player.x <= monsterArray[i][1] + 20 and player. y >= monsterArray[i][2] - 30 and player.y <= monsterArray[i][2] + 30 then
					player.health = player.health - 1
					player.beenHit = true
				else
					player.beenHit = false
				end
			elseif monsterArray[i][7] == 2 then
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
			elseif monsterArray[i][7] == 2 then
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

		if love.keyboard.isDown('space') then
			weapon.ammoAmount = 30

			space.load()
			monster.load()
			player.load()
			inventory.load()

			currentPlanet = 1

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

	--[[if love.keyboard.isDown('c') and player.dead == false then
		currentPlanet = currentPlanet + 1
		monster.load()
		love.timer.sleep(0.5)
	end]]

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

	if player.hasJetpack == true then

	end

end

function UPDATE_PLAYER(dt)

	player.physics(dt)

	if player.canMove == true then
		player.update(dt)
	end

	player.boundary()
	player.jetpack()

end

function DRAW_PLAYER()

	if player.playerExists == true then
		player.draw()
	end
	if player.onPlanet == true then
		player.drawInfo()
	end

end
