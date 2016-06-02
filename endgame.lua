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

    a1,a2,a3,a4,a5 = 0,200,400,600,1000
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
     
    if inventory.graviNum >= 5 and player.onPlanet == false and endgame.drawWormhole == true then

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
            shipalpha = 255
        	endgame.drawWormhole = false
        	playerOverShip = false
			player.playerExists = true
			ship = images.ship
			shipx = -5000
			shipy = 3500
			player.x = 600
			player.y = 200
			player.canMove = true
            endgame.endgame = true
    	end
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
        love.graphics.draw(images.averagePerson, a3, adveragey + 1, 0, 2, 2)
        love.graphics.draw(images.averagePerson, a4, adveragey, 0, 2, 2)
        love.graphics.draw(images.averagePerson, a5, adveragey - 1, 0, 2, 2)
        love.graphics.draw(images.averagePerson, a2, adveragey, 0, 2, 2)
        love.graphics.draw(images.averagePerson, a1, adveragey +2, 0, 2, 2)

        if endgame.counter < 500 then
            endgame.hintString = "Welcome to Earth!\nOr, a gravitiless Earth..."
        end
        if endgame.counter > 500 and endgame.counter < 1000 then
            endgame.hintString = "Please deposit \n your precious\n GRAVITONS to \n restore the \n planet's gravity!"
        end

        if endgame.counter > 1000 and endgame.counter < 1300 then
            endgame.hintString = "Thank you so much!"
        end

                if endgame.counter > 1300 then
            endgame.hintString = "FIREWORK PARTY!!"
                    love.graphics.setColor(200, 80, 80)
        love.graphics.print("The End!", player.x, player.y - 50, 0, 3, 3)
        end

         if endgame.counter > 1000 then
            inventory.graviNum = 0
            adveragey = garyy
            planetArray[11][4] = 1.5
        end

        endgame.counter = endgame.counter + 1

    end

end

function UPDATE_ENDGAME(dt)

    adveragey = adveragey + love.math.random(-2, 2)
    psystem81:update(dt)
    psystem81:setColors(love.math.random(-255, 255), love.math.random(-255, 255), love.math.random(-255, 255), 255)-- Fade to transparency
    if endgame.counter > 1300 then
        a1,a2,a3,a4,a5 = a1 + love.math.random(-3, 3), a2 + love.math.random(-2, 3),a3 + love.math.random(-3, 2), a4 + love.math.random(-4, 3),a5 + love.math.random(-3, 4)
    end

end

function DRAW_ENDGAME()

	endgame.wormhole()
    endgame.animation()

    if endgame.counter > 1300 then
        love.graphics.draw(psystem81,garyx + 70, garyy) 
        love.graphics.draw(psystem81,a2 + 70, adveragey)
        love.graphics.draw(psystem81,a3 + 70, adveragey)
        love.graphics.draw(psystem81,a4 + 70, adveragey)
        love.graphics.draw(psystem81,a5 + 70, adveragey)
        love.graphics.draw(psystem81,a1 + 70, adveragey)
    end
    
    garytag(garyx, garyy, endgame.hintString, player.alpha)

end