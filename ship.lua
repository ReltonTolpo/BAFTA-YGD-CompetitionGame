ship = {}
require "player"
require "images"

function ship.load()

	shipActive = false
	ship = images.ship
	animation1 = false
    animation2 = false
    animation3 = false

    playerOverShip = false
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
		shipActive = false
		playerOverShip = false
		love.timer.sleep(0.1)
	end

end

function draw()

	love.graphics.setColor(255, 255, 255)

	love.graphics.draw(ship, 50 , 350, 0, 7, 7)
	if shipActive == true then

		shipStairCoordTable = {
			350, 550,
			350, 560,
			360, 560,
			360, 570,
			370, 570,
			370, 580,
			380, 580,
			380, 590,
			390, 590,
		}

		love.graphics.setColor(0, 0, 0)

	    love.graphics.line(shipStairCoordTable)
	end
end

function playerIntoShip() --Animations for player getting into ship

	if animation1 == true then
		player.x = player.x + 0.5
		if player.x > 450 then			   
		 	animation1 = false
		   	animation2 = true
		end
	end

	if animation2 == true then
		playerOverShip = true
		player.x = player.x - 0.5
		if player.x < 350 then
		    animation2 = false
    		shipActive = true
		    animation3 = true
  		end
	end

	if animation3 == true then
		player.doGravity = false
		player.x = player.x - 0.5
		player.y = player.y - 0.5
		if player.x < 300 then
	   		player.canMove = true
			player.playerExists = false
		   	ship = images.playerInShip
		   	animation3 = false
	    end
	end

end

function UPDATE_SHIP(dt)

	update(dt)
	playerIntoShip()

end

function DRAW_SHIP()

	draw()

end 


