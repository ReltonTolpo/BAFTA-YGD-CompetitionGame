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

	local img = love.graphics.newImage("images/particles/smoke.png")
 
	psystem = love.graphics.newParticleSystem(img, 64)
	psystem:setParticleLifetime(2, 5) -- Particles live at least 2s and at most 5s.
	psystem:setEmissionRate(2000)
	psystem:setSizeVariation(1)
	psystem:setLinearAcceleration(-20, -20, 20, 20) -- Random movement in all directions.
	psystem:setColors(255, 255, 255, 255, 255, 255, 255, 0) -- Fade to transparency.

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
	end
end

function draw()

	love.graphics.setColor(255, 255, 255)

	love.graphics.draw(ship, shipx,shipy, 0, 7, 7)
	if shipActive == true then

		love.graphics.setColor(0, 0, 0,255)
	    love.graphics.line(350,550,rampx,rampy)
	end

	if smokeActive == true then
			-- Draw the particle system at the center of the game window.
	love.graphics.draw(psystem,shipx+170,shipy+140)
    love.graphics.draw(psystem,shipx+150,shipy+140)
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
	psystem:update(dt)
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
	end
	end


