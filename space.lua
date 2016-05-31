space = {}
require "images"
local stars = nil

function space.load()

    space.starNum = love.math.random(600, 800) 
    space.starSize = 10
    space.starXPosition = 100
    space.starYPosition = 100
    space.dayTime = 1
    space.weatherX = 0
    space.weatherY = 150
    space.orbitSpeed = love.math.random(0.01, 0.1)
    space.starX = 0
    space.starY = 0
    space.wormSize = 1
    space.wormRotate = 0

end

function space.draw()

    love.graphics.setBackgroundColor(0, 0, 0)
    if(space.dayTime==0 and player.onPlanet == true)then
        space.drawStars()
        love.graphics.draw(images.moon, space.weatherX, space.weatherY, 0, 2, 2)
    elseif(space.dayTime==1)then
        love.graphics.setColor(255, 255, 0)
        love.graphics.draw(images.sun, space.weatherX, space.weatherY, 0, 10, 10)
    elseif(player.onPlanet == false)then
        space.drawStars()

    end

end

local function createStars()

    if stars==nil then
        stars={}
        for i = 1, space.starNum do
            stars[i] = {
                Size = love.math.random(1, 10),
                XPosition = love.math.random(-2400, 2400),
                YPosition = love.math.random(-1500, 1500),
            }
        end
    end
    
end

function space.drawStars()

    createStars()
    for i, star in ipairs(stars) do
        love.graphics.setColor(255, 255, 255)
        if player.onPlanet == false then
        star.XPosition = star.XPosition + space.starX
        star.YPosition = star.YPosition + space.starY
    end
        love.graphics.rectangle("fill", star.XPosition, star.YPosition, star.Size, star.Size)
    end

end

function space.wormhole()

    if inventory.graviNum <= 1 and player.onPlanet == false then

        space.wormRotate = space.wormRotate + 5
        space.wormSize = space.wormSize + 1

        love.graphics.draw(images.wormhole, love.graphics.getWidth()/2, love.graphics.getHeight()/2, space.wormRotate, space.wormSize, space.wormSize) 

    end

end

function UPDATE_SPACE(dt)

    --TODO LOGIC CODE

    space.wormhole()

end

function DRAW_SPACE()

    space.draw()

end