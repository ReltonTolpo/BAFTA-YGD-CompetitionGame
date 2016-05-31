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
    endgame.endgame = false
    counter = 0
    hintString = "Welcome home\n adventurer!"

  local fireworks = images.firework
    psystem81 = love.graphics.newParticleSystem(fireworks, 70)
    psystem81:setParticleLifetime(2, 10) -- Particles live at least 2s and at most 5s.
    psystem81:setEmissionRate(200)
    psystem81:setSizeVariation(1)
    psystem81:setLinearAcceleration(-5, -20, 5, -30) -- Random movement in all directions.
    psystem81:setColors(love.math.random(0, 255), love.math.random(0, 255), love.math.random(0, 255), 255, love.math.random(0, 255), love.math.random(0, 255), love.math.random(0, 255), 255) -- Fade to transparency.

end

function endgame.wormhole()
     
    if inventory.graviNum >=  0 and player.onPlanet == false and endgame.drawWormhole == true then
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
            endgame.endgame = true
    	end
    end

end

function endgame.animation()

    if endgame.endgame == true then

        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(images.gary, garyx, garyy, 0, 2, 2)

    end

end

function UPDATE_ENDGAME(dt)
    psystem81:update(dt)
    psystem81:setColors(love.math.random(-255, 255), love.math.random(-255, 255), love.math.random(-255, 255), 255)-- Fade to transparency.
end

function DRAW_ENDGAME()


	endgame.wormhole()
    endgame.animation()
    if endgame.endgame == true then love.graphics.draw(psystem81,garyx + 70 ,garyy)

        if player.counter < 500 then
            hintString = "Welcome to Graviton Galaxy!"
        end
                if player.counter > 500  and player.counter < 1000 then
            hintString = "Please deposit \n your precious\n GRAVITONS to \n restore the \n planet's gravity!"
        end


        function garytag(x,y,text,a)

        love.graphics.setColor(207, 190, 4, a)
        love.graphics.rectangle("fill", x-200, y-200, 200, 120 )
        love.graphics.line(x-200, y-200, x, y)
        love.graphics.setColor(0, 0, 0, a)
        love.graphics.print(text, x-200, y-200, 0, 1, 1)

    end
    counter = counter + 1
     garytag(garyx, garyy, hintString, player.alpha)
 end


end