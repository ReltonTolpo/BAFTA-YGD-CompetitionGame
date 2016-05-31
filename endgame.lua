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
    if endgame.endgame == true then love.graphics.draw(psystem81,garyx + 70 ,garyy) end
    love.graphics.draw(psystem8,500,500)
    
end