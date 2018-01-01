space = {}
require "images"
require "tutorial"
local stars = nil

function space.load()

    if gameType == "desktop" then 
        movementExplanation = "You can manourve in space \nby using the A and D \nkeys to turn. \n\nTo increase and decrease \nyour speed, use W and S." 
    else movementExplanation = "You can manourve in space \nby using the < and > \nkeys to turn. \n\nTo increase \nyour speed, use ^."
    end

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
    space.counter = 0
    space.counterUp = false
    space.tutorialDone = false

    showhintA = false

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
        space.counterUp = true
    end


end

function space.tutorial()

    showhintA = false

    if space.counterUp == true then
        space.counter = space.counter + 1
        tutorial.counter = 10000
    end

    if space.counter > 1 and space.counter < 500 then
        space.hintString = "WOW! You got to space \nfirst try, never \nseen that before! \n\nAnyway... Where was I? \nahh, yes, controls."
        showhintA = true
    end

    if space.counter > 500 and space.counter < 1000 then
        space.hintString = movementExplanation
        showhintA = true
    end

        if space.counter > 1000 and space.counter < 1500 then
        space.hintString = "Beware though, if you fly \nto far, you will reach \nthe EDGE of the \nUniverse. A barren \nplace with no stars,\nno planets and no\n life. Some become lost forvever \nin this dark void!"
        showhintA = true
    end

        if space.counter > 1500 and space.counter < 2000 then
        space.hintString = "One way to stop you getting \nlost is paying attention \nto the colour \nof the planets. A \nwhite/pink is your \nspawn planet & a greyed out \nplanet means \nthat you have killed that \nplanet's boss!"
        showhintA = true
    end

        if space.counter > 2000 and space.counter < 2500 then
        space.hintString = "You can land on planets by \nflying over them and \npressing 'E'. So \ngo ahead, explore the \nunknown, kill \nsome bosses and get \n5 gravitons!"
        space.tutorialDone = true
        showhintA = true
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
        if star.XPosition > -10 and star.XPosition < love.graphics.getWidth()+10 and star.YPosition > -10 and star.YPosition < love.graphics.getHeight()+10 then
            love.graphics.rectangle("fill", star.XPosition, star.YPosition, star.Size, star.Size)
        end
    end

end

function UPDATE_SPACE(dt)

    space.tutorial()
    
end

function DRAW_SPACE()

    space.draw()

end