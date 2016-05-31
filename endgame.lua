endgame = {}
require "inventory"
require "images"
require "player"

function endgame.load()

    endgame.wormSize = 1
    endgame.wormRotate = 0
    endgame.wormX = 575
    endgame.wormY = 350

end

function endgame.wormhole()

    if inventory.graviNum >= 0 and player.onPlanet == false then

        endgame.wormRotate = endgame.wormRotate + 0.001
        endgame.wormSize = endgame.wormSize + 0.0000001
        endgame.wormX = 575
        endgame.wormY = 350

        love.graphics.draw(images.wormhole, endgame.wormX, endgame.wormY, endgame.wormRotate, endgame.wormSize, endgame.wormSize)
    end

end

function UPDATE_ENDGAME(dt)

end

function DRAW_ENDGAME()

	endgame.wormhole()

end