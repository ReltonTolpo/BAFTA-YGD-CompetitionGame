space = {}
local stars = nil

function space.load()

    space.starNum = love.math.random(60, 200) 
    space.starSize = 10
    space.starXPosition = 100
    space.starYPosition = 100
    space.dayTime = love.math.random(0, 1)
    space.weatherX = 0
    space.weatherY = 150
    space.switch = 1 --love.math.random(1, 3)
    space.orbitSpeed = love.math.random(0.01, 0.1)

end

function space.draw()

    love.graphics.setBackgroundColor(0, 0, 0)

end

local function createStars()

    if stars==nil then
        stars={}
        for i = 1, space.starNum do
            stars[i] = {
                Size = love.math.random(1, 10),
                XPosition = love.math.random(1, 1200),
                YPosition = love.math.random(1, 750),
            }
        end
    end
    
end

function space.drawStars()

    createStars()
    for i, star in ipairs(stars) do
        love.graphics.setColor(255, 255, 255)
        love.graphics.rectangle("fill", star.XPosition, star.YPosition, star.Size, star.Size)
    end

end

function UPDATE_SPACE(dt)

    --TODO LOGIC CODE

end

function DRAW_SPACE()

    space.draw()
    
    if(space.dayTime==0)then
        space.drawStars()
        moon = love.graphics.newImage("images/weather/moon.png")
        love.graphics.draw(moon, space.weatherX, space.weatherY, 0, 2, 2)
    elseif(space.dayTime==1)then
        love.graphics.setColor(255, 255, 0)
        sun = love.graphics.newImage("images/weather/sun.png")
        love.graphics.draw(sun, space.weatherX, space.weatherY, 0, 10, 10)
    end

end