player = {}
require "space"
require "planet"
require "sound"
require "images"
require "monster"
require "weapon"

function player.load()

	player.counter = 0
	player.counterUp = true
	player.tutorialOn = true
    showhint = true -- fixing oris thing 
    hintString = "ERROR"

	player.hasJetpack = true -- set to false when done
	player.health = 100
	player.x = 500
	player.y = 50
	player.alpha = 255
	player.deadX = 50
	player.firstTimeInSpace = true
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
	player.tickspeed = 3

	hero = images.playerIdle --Starts looking straight
    jetpack = images.jetpack

end

function sleep(sec)

    socket.select(nil, nil, sec)

end



function player.draw()
	if player.hasJetpack == true then
	love.graphics.draw(jetpack, player.x, player.y, 0, 2, 2)
	end
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
		love.graphics.print("Press SPACE to respawn", player.deadX - 100, player.deadY - 50, 0, 3, 3)
	end

end

function player.tutorial()
	
	function player.tag(x,y,text,a)

		love.graphics.setColor(207, 190, 4, a)
	    love.graphics.rectangle("fill", x-200, y-200, 200, 120 )
	    love.graphics.line(x-200, y-200, x, y)
	    love.graphics.setColor(0, 0, 0, a)
	    love.graphics.print(text, x-200, y-200, 0, 1, 1)

	end

	showhint = false
	hintString = "ERROR"

	if player.tutorialOn == true then
		if player.counter < 300 then
			hintString = "Welcome to Graviton Galaxy!"
			showhint = true
		end

		if player.counter > 500 and player.counter < 1200 then
			hintString = "Use A and D to move you \naround. \n\nSpace to jump and S to crouch \n(crouch means you don't move \nwhilst turning)."
			showhint = true
		end

		if player.counter > 1400 and player.counter < 2200 then
			hintString = "You are currently standing on \na safe planet. My home \nplanet has had its gravitons \nstolen by alien creatures, \nmaking its gravity extremely \nunstable and no longer suitable \nto support human life!"
			showhint = true
		end

		if player.counter > 2200 and player.counter < 3100 then
			hintString = "Your mission is to kill 5 \nevil alien bosses and recover \ntheir gravitons to help me \nrestore my home planet to its \nformer glory!!"
			showhint = true
		end

		if player.counter > 3100 and player.counter < 3900 then
			hintString = "Once you have killed these \nterrible 5, a portal \nwill open to my home \nplanet for you to \njump through, and supply \nthe gravitons."
			showhint = true
		end

		if player.counter > 3900 and player.counter < 4500 then
			hintString = "As you can see, it is \ncurrently day on this \nplanet. When it turns night, \nall the evil creatures \ncome out and attack you. \nYou have to defend yourself \nwith your gun and \nlimited ammo!"
			showhint = true
	 	end
	 
	 	if player.counter > 4500 and player.counter < 5000 then
			hintString = "You fire by clicking \nwhilst using A and D \nto aim. Some monsters reqire \nyou to jump in order for \nyour bullets to hit them. \n\nYou can collect more ammo \nfrom your ship."
			showhint = true
		end

		if player.counter > 5000 and player.counter < 5500 then
			hintString = "Go ahead! \n\nWalk up to the spaceship \nand press E to enter it. \nE does many things \nlike entering the ship \nand landing on planets."
			showhint = true
	 	end

	 	if player.onPlanet == false  and player.firstTimeInSpace == true then
			hintString = "WOW! You got to space \nfirst try, never \nseen that before! \n\nAnyway... Where was I? \nahh, yes, controls."
			showhint = true
			player.firstTimeInSpace = false
	 	end

	 	if player.counter > 5000 and player.counter < 5500 and player.onPlanet == true then
	 		player.counterUp = false
	 	end

	 	if player.onPlanet == false then
	 		player.counterUp = true
	 	end

	 	print(player.counterUp)

	 	if player.counter > 5500 and player.counter < 6000 then
	 		hintString = "You can manourve in space \nby using the A and D \nkeys to turn. \n\nTo increase and decrease \nyour speed, use W and S."
	 		showhint = true
	 	end

		if showhint == true then
			player.tag(player.x, player.y, hintString, player.alpha)
		end
	end

end

function player.drawInfo()

	love.graphics.setColor(player.healthColourR, player.healthColourG, player.healthColourB)
	love.graphics.print("Player Health = " ..player.health, 30, 30, 0, 3, 3)
	--love.graphics.print("Current Tick = " ..player.counter, 30, 100, 0, 3, 3)
	love.graphics.print("Ammo amount = " ..weapon.ammoAmount, 780, 30, 0, 3, 3)

end

function player.physics(dt)

	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	player.yvel = player.yvel + player.weight --Gravity applied here
	player.xvel = player.xvel * (1 - math.min(dt * player.friction, 1))

end

function player.update(dt)

	if player.counterUp == true then
		player.counter = player.counter + player.tickspeed
	end

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

	if player.moving == true and player.canMove == true then
		if player.onPlanet == true then
			sound.walking_sfx:play()
		else
			sound.walking_sfx:pause()
		end
	elseif player.moving == false or player.active == false or player.onPlanet == false then
		sound.walking_sfx:pause()
	end

	if player.onPlanet == false then
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
	love.graphics.draw(jetpack, player.x, player.y, 0, 2, 2)
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
	player.tutorial()

end
