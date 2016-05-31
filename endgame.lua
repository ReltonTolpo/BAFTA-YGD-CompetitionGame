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

    garyx = 800
    garyy = 450
    adveragey = 250
    endgame.endgame = false
    endgame.counter = 0
    endgame.hintString = "Welcome home\n adventurer!"

  local fireworks = images.firework
    psystem81 = love.graphics.newParticleSystem(fireworks, 70)
    psystem81:setParticleLifetime(2, 10) -- Particles live at least 2s and at most 5s.
    psystem81:setEmissionRate(200)
    psystem81:setSizeVariation(1)
    psystem81:setLinearAcceleration(-5, -20, 5, -30) -- Random movement in all directions.
    psystem81:setColors(love.math.random(0, 255), love.math.random(0, 255), love.math.random(0, 255), 255, love.math.random(0, 255), love.math.random(0, 255), love.math.random(0, 255), 255) -- Fade to transparency.


end

function endgame.wormhole()
     
    if inventory.graviNum >= 0 and player.onPlanet == false and endgame.drawWormhole == true then

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

    end

end

function endgame.animation()

    function garytag(x,y,text,a)

        if endgame.endgame == true then
            love.graphics.setColor(207, 190, 4, a)
            love.graphics.rectangle("fill", x-200, y-200, 200, 120 )
            love.graphics.line(x-200, y-200, x, y)
            love.graphics.setColor(0, 0, 0, a)
            love.graphics.print(text, x-200, y-200, 0, 1, 1)
        end

    end

    if endgame.endgame == true then

        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(images.gary, garyx, garyy, 0, 2, 2)
        love.graphics.draw(images.averagePerson, 400, adveragey + 1, 0, 2, 2)
        love.graphics.draw(images.averagePerson, 600, adveragey, 0, 2, 2)
        love.graphics.draw(images.averagePerson, 1000, adveragey - 1, 0, 2, 2)
        love.graphics.draw(images.averagePerson, 200, adveragey, 0, 2, 2)
        love.graphics.draw(images.averagePerson, 0, adveragey +2, 0, 2, 2)

        if endgame.counter < 500 then
            endgame.hintString = "Welcome to Earth! Or, a gravitiless Earth..."
        end
        if endgame.counter > 500 and endgame.counter < 1000 then
            endgame.hintString = "Please deposit \n your precious\n GRAVITONS to \n restore the \n planet's gravity!"
        end

        endgame.counter = endgame.counter + 1


    end

end

function UPDATE_ENDGAME(dt)
adveragey = adveragey + love.math.random(-2, 2)
    psystem81:update(dt)
    psystem81:setColors(love.math.random(-255, 255), love.math.random(-255, 255), love.math.random(-255, 255), 255)-- Fade to transparency


end

function DRAW_ENDGAME()

	endgame.wormhole()
    endgame.animation()

    if endgame.endgame == true then 
love.graphics.draw(psystem81,garyx + 70, garyy) 
love.graphics.draw(psystem81,200 + 70, adveragey)
love.graphics.draw(psystem81,400 + 70, adveragey)
love.graphics.draw(psystem81,600 + 70, adveragey)
love.graphics.draw(psystem81,1000 + 70, adveragey)
love.graphics.draw(psystem81,0 + 70, adveragey)
end
    
    garytag(garyx, garyy, endgame.hintString, player.alpha)


end