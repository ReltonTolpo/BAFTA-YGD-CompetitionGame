ship = {}
require "player"
require "images"
require "space"
require "planet"
require "weapon"

function ship.load()

	shipActive = false
	ship = images.ship
	rampx = 350
	rampy = 550
	shipalpha = 255
	shipvel = 2
	animation4 = true
	animation1 = false
    animation2 = false
    animation3 = false
    playerOverShip = false
    smokeActive = false
    shipx = 50
    shipy = 350
	liftoff = false
	speed = 0.01
	Xscroll = 0
    Yscroll = 0
    rotation = 0
    number = 1

	local smoke = images.smoke
	local fire = images.fire
 
	psystem1 = love.graphics.newParticleSystem(smoke, 70)
	psystem1:setParticleLifetime(2, 10) -- Particles live at least 2s and at most 5s.
	psystem1:setEmissionRate(200)
	psystem1:setSizeVariation(1)
	psystem1:setLinearAcceleration(-20, -10, -20, 10) -- Random movement in all directions.
	psystem1:setColors(255, 255, 255, 255, 255, 255, 255, 0) -- Fade to transparency.

	psystem2 = love.graphics.newParticleSystem(fire, 100)
	psystem2:setParticleLifetime(2, 3) -- Particles live at least 2s and at most 5s.
	psystem2:setEmissionRate(20)
	psystem2:setSizeVariation(0)
	psystem2:setLinearAcceleration(-20, -5, -20, 5) -- Random movement in all directions.
	psystem2:setColors(255, 255, 255, 255, 255, 255, 255, 0) -- Fade to transparency.
end	

function update(dt)

	if shipActive == true or liftoff == true then
		playerInsideShip = true
	else
		playerInsideShip = false
	end

	if playerInsideShip == true and number == 1 then
		weapon.previousWeapon = weapon.currentWeapon
		weapon.currentWeapon = 0
		number = 0
	end

	if player.onPlanet == true and shipActive == false and liftoff == false then
		number = 1
	end

	if number == 1 then
		weapon.currentWeapon = weapon.previousWeapon
	end

 	shipalpha=player.shipalpha 
	if player.onPlanet == false then
		sound.walking_sfx:pause()
	end
	if playerOverShip == true then
		sound.walking_sfx:pause()
	end

	n = 0
	if player.onPlanet == true then
		if player.x < 400 and player.x > 100 and player.y > 400 and shipActive == false and player.dead == false and tutorial.counter < 5000 then
			player.onShip = true
		else
			player.onShip = false	
		end

		if love.keyboard.isDown('e') and player.x < 400 and player.x > 100 and player.y > 400 and shipActive == false and player.dead == false and tutorial.counter > 5000 and currentPlanet ~= 11 then

			player.canMove = false
			player.x = 350
			player.hero = player.rightPlayer
		    animation1 = true
		    weapon.currentWeapon = weapon.previousWeapon

		elseif love.keyboard.isDown('e') and shipActive == true then
			ship = images.ship
			player.x = 100
			player.playerExists = true
			player.doGravity = true
			player.canMove = true
			smokeActive = false
			shipActive = false
			playerOverShip = false
			love.timer.sleep(0.1)
			rampx = 350
			rampy = 550
		    shipx = 50
	  	    shipy = 350
	    	liftoff = false
		end

		if love.keyboard.isDown('space') and smokeActive == true then
			liftoff = true
			shipActive = false
			smokeActive = false
			player.canMove = false
		end
		

		if shipActive == true and weapon.ammoAmount < 30 then
			weapon.ammoAmount = weapon.ammoAmount + 1
		end

		if shipvel < 1 then
			shipvel = 0
		end

	end

end

function draw()
	
	local width = love.graphics.getWidth()
	local height = love.graphics.getHeight()

	love.graphics.setColor(255,255,255)
	love.graphics.translate(width/2, height/2)
	love.graphics.translate(-width/2, -height/2)
	love.graphics.setColor(255, 255, 255,shipalpha)

	if player.onPlanet == true then
		love.graphics.draw(ship, shipx, shipy, 0, 7, 7)
		shipvel = 2
	elseif player.onPlanet == false then
		love.graphics.draw(ship, love.graphics.getWidth()/2, love.graphics.getHeight()/2, rotation, 1, 1, 30, 30)
		love.graphics.print("Speed = "..string.format("%.2f", shipvel), 520, 50, 0, 2, 2)
	end
	 
	if shipActive == true then
		love.graphics.setColor(0, 0, 0,255)
	    love.graphics.line(350, 550, rampx, rampy)
	end

	if liftoff == true then
		love.graphics.draw(psystem2, shipx+160, shipy+140)
  	    love.graphics.draw(psystem2, shipx+160, shipy+145)
  	    ship = images.playerInShipNoGear
	end

	if smokeActive == true then
		--Draw the particle system at the center of the game window.
		love.graphics.draw(psystem1,shipx+150,shipy+140)
    	love.graphics.setColor(200, 80, 80)
		love.graphics.print("Press SPACE to start the Engine", shipx , shipy - 50, 0, 3, 3)
	end

end

function playerIntoShip() --Animations for player getting into ship

	if animation1 == true then
		player.x = player.x + 3
		if player.x > 450 then			   
		 	animation1 = false
		   	animation2 = true
		    shipActive = true
		end
	end

	if animation2 == true then
		playerOverShip = true
		player.x = player.x - 3
		if player.x < 350 then
		    animation2 = false
    		animation4 = true
		    animation3 = true
  		end
	end

	if animation3 == true then
		player.doGravity = false
		player.x = player.x - 1
		player.y = player.y - 10
		if player.x < 300 and player.y > 400 then
			player.playerExists = false
		   	ship = images.playerInShip
		   	animation3 = false
		   	smokeActive = true
	    end
	end

end

function liftOff()

	if liftoff == true then
		shipy = shipy - 3
		shipx = shipx + 2
	end
	if shipy < 0 and player.onPlanet == true then
		liftoff = false
		player.onPlanet = false
		player.canMove = false
		ship = images.shipInSpace
	end
	
end

function shipPhysics()

	if player.onPlanet == false then
		space.starX = -shipvel*math.sin(rotation)
    	space.starY = shipvel*math.cos(rotation)
	end

end

function shipMovement(dt)

	if player.onPlanet == false then

		if love.keyboard.isDown('a') and player.dead == false then
			rotation = rotation - 0.1 -- restore to 0.01
		end

		if love.keyboard.isDown('d') and player.dead == false then
			rotation = rotation + 0.1  -- restore to 0.01
		end

		if love.keyboard.isDown('w') and player.dead == false then
			shipvel = shipvel + speed
		end

		if love.keyboard.isDown('s') and player.dead == false then
			shipvel = shipvel - speed
		end

		if rotation > 2 * math.pi then
			rotation = 0
		end

		if rotation < -2 * math.pi then
			rotation = 0
		end
	end
	
end

function UPDATE_SHIP(dt)

	psystem1:update(dt)
	psystem2:update(dt)
	update(dt)
	playerIntoShip()
	liftOff()
	shipPhysics(dt)
	shipMovement(dt)

	if shipActive == true then
		rampx = rampx + 0.25
		rampy = rampy + 0.25
	    if rampy > 589 and rampx > 389 then 
		    rampy = 590
		    rampx = 390
	    end
	end

end

function DRAW_SHIP()

	draw()

end
