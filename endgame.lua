endgame = {}
require "inventory"
require "images"
require "player"
require "planet"
require "ship"

function endgame.load()

    endgame.wormSize = 1
    endgame.wormRotate = 0
    endgame.wormX = 575
    endgame.wormY = 350
    endgame.drawWormhole = true

end

function endgame.wormhole()
<<<<<<< HEAD
     
    if inventory.graviNum >=  0 and player.onPlanet == false and endgame.drawWormhole == true then
    
=======

    if inventory.graviNum >= 5 and player.onPlanet == false and endgame.drawWormhole == true then

>>>>>>> origin/master
        endgame.wormRotate = endgame.wormRotate + 0.001
        endgame.wormSize = endgame.wormSize + 0.01
        player.shipalpha = player.shipalpha - 1
        endgame.wormX = endgame.wormX - 0.3
        endgame.wormY = endgame.wormY - 0.4

        love.graphics.draw(images.wormhole, endgame.wormX, endgame.wormY, endgame.wormRotate, endgame.wormSize, endgame.wormSize)

        if endgame.wormSize >= 4 then
        	currentPlanet = 11
        	player.onPlanet = true
        	monster.amount = 0
        	endgame.drawWormhole = false
        	playerOverShip = false
			player.playerExists = true
			ship = images.ship
			shipx = -500
			shipy = 350
			player.x = 600
			player.y = 200
			player.canMove = true
    	end
<<<<<<< HEAD
    end

end

function endgame.animation()

    function garytag(x,y,text,a)

        if endgame.endgame == true then
            love.graphics.setColor(220, 20, 20, a)
            love.graphics.rectangle("fill", x-200, y-200, 200, 120 )
            love.graphics.line(x-200, y-200, x, y)
            love.graphics.setColor(0, 0, 0, a)
            love.graphics.print(text, x-200, y-200, 0, 1, 1)
        end

    end

    if endgame.endgame == true then

        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(images.gary, garyx, garyy, 0, 2, 2)
        love.graphics.draw(images.averagePerson, 400, 450, 0, 2, 2)
        love.graphics.draw(images.averagePerson, 600, 450, 0, 2, 2)
        love.graphics.draw(images.averagePerson, 1000, 450, 0, 2, 2)
        love.graphics.draw(images.averagePerson, 200, 450, 0, 2, 2)
        love.graphics.draw(images.averagePerson, 0, 450, 0, 2, 2)

        if endgame.counter < 500 then
            endgame.hintString = "Welcome to Earth!\nOr, a gravitiless Earth..."
        end
        if endgame.counter > 500 and endgame.counter < 1000 then
            endgame.hintString = "Please deposit \nyour precious\nGRAVITONS to \nrestore the \nplanet's gravity!"
        end

        endgame.counter = endgame.counter + 1
=======
>>>>>>> origin/master

    end

end

function UPDATE_ENDGAME(dt)

end

function DRAW_ENDGAME()

	endgame.wormhole()

end