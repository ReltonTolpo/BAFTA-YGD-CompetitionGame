ship = {}
require "player"
require "images"

function ship.load()

	shipActive = false
	ship = images.ship
	rampx = 350
	rampy = 550
	animation4 = true
	animation1 = false
    animation2 = false
    animation3 = false
    playerOverShip = false
    smokeActive = false
    shipx = 50
    shipy = 350
liftoff = false

	local particle = love.graphics.newImage("images/particles/smoke.png")
	local particle2 = love.graphics.newImage("images/particles/fire.png")

 
	psystem1 = love.graphics.newParticleSystem(particle, 64)
	psystem1:setParticleLifetime(2, 5) -- Particles live at least 2s and at most 5s.
	psystem1:setEmissionRate(2000)
	psystem1:setSizeVariation(1)
	psystem1:setLinearAcceleration(-20, -20, 20, 20) -- Random movement in all directions.
	psystem1:setColors(255, 255, 255, 255, 255, 255, 255, 0) -- Fade to transparency.

	psystem2 = love.graphics.newParticleSystem(particle2, 100)
	psystem2:setParticleLifetime(2, 2) -- Particles live at least 2s and at most 5s.
	psystem2:setEmissionRate(20)
	psystem2:setSizeVariation(0)
	psystem2:setLinearAcceleration(-20, -1, -20, 1) -- Random movement in all directions.
	psystem2:setColors(255, 255, 255, 255, 255, 255, 255, 0) -- Fade to transparency.


end	

function update(dt)

	n = 0
	if love.keyboard.isDown('e') and player.x < 400 and player.x > 100 and player.y > 400 and shipActive == false then
		player.canMove = false
		 player.x = 350
		 player.hero = player.rightPlayer
	     animation1 = true
	elseif love.keyboard.isDown('e') and shipActive == true then
		ship = love.graphics.newImage("images/ship/shipLand.png")

		player.x = 100
		player.playerExists = true
		player.doGravity = true
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
	end
end

function draw()

	love.graphics.setColor(255, 255, 255)

	love.graphics.draw(ship, shipx,shipy, 0, 7, 7)
	if shipActive == true then

		love.graphics.setColor(0, 0, 0,255)
	    love.graphics.line(350,550,rampx,rampy)
	end

	if liftoff == true then
		love.graphics.draw(psystem2,shipx+160,shipy+140)
    love.graphics.draw(psystem2,shipx+160,shipy+145)
end

	if smokeActive == true then
			-- Draw the particle system at the center of the game window.
	love.graphics.draw(psystem1,shipx+170,shipy+140)
    love.graphics.draw(psystem1,shipx+150,shipy+140)
    		love.graphics.setColor(200, 80, 80)
		love.graphics.print("Press SPACE to start the Engine", shipx , shipy - 50, 0, 3, 3)
	end
end

function playerIntoShip() --Animations for player getting into ship

	if animation1 == true then
		player.x = player.x + 0.5
		if player.x > 450 then			   
		 	animation1 = false
		   	animation2 = true
		    shipActive = true
		end
	end

	if animation2 == true then
		playerOverShip = true
		player.x = player.x - 0.5
		if player.x < 350 then
		    animation2 = false
    		animation4 = true
		    animation3 = true
  		end
	end

	if animation3 == true then
		player.doGravity = false
		player.x = player.x - 0.5
		player.y = player.y - 5
		if player.x < 300 then
	   		player.canMove = true
			player.playerExists = false
		   	ship = images.playerInShip
		   	animation3 = false
		   	smokeActive = true
	    end
	end

end

function UPDATE_SHIP(dt)
	psystem1:update(dt)
		psystem2:update(dt)
	update(dt)
	playerIntoShip()
	liftOff()
	if shipActive == true then
	--if animation4 == true then
		rampx = rampx + 0.25
		rampy = rampy + 0.25
	 --end
	    if rampy > 589 and rampx > 389 then
   rampy = 590
   rampx = 390
	    end
	end
end

function DRAW_SHIP()

	draw()

end 

function liftOff()
if liftoff == true then
		shipy = shipy - 0.5
		shipx = shipx + 1
	end
	end


