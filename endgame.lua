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
    endgame.endgame = false

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
            endgame.endgame = true
    	end
    end

end

function endgame.animation()

    if endgame.endgame == true then

        love.graphics.draw(images.gary, 800, 470, 0, 2, 2)

    end

end

function UPDATE_ENDGAME(dt)

end

function DRAW_ENDGAME()

	endgame.wormhole()
    endgame.animation()

end