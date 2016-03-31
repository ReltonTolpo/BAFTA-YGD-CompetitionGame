menu = {}
require "space"
require "planet"
require "player"
require "monster"
require "sound"
require "images"
require "ship"

function menu.load()

    space.starNum = love.math.random(600, 800) 
    space.starSize = 10
    space.starXPosition = 100
    space.starYPosition = 100
    space.starX = 0
    space.starY = 0
    
end

local function createStars()

    if stars==nil then
        stars={}
        for i = 1, menu.starNum do
            stars[i] = {
                Size = love.math.random(1, 10),
                XPosition = love.math.random(-2400, 2400),
                YPosition = love.math.random(-1500, 1500),
            }
        end
    end
    
end

function menu.drawStars()

    createStars()
    for i, star in ipairs(stars) do
        love.graphics.setColor(255, 255, 255)
        star.XPosition = star.XPosition + space.starX
        star.YPosition = star.YPosition + space.starY
        love.graphics.rectangle("fill", star.XPosition, star.YPosition, star.Size, star.Size)
    end

end

function menu.update(dt)

    --TODO Logic Code

end

function menu.draw()

    --TODO Logic Code

end

function UPDATE_MENU(dt)

    menu.update(dt)

end

function DRAW_MENU()

	menu.drawStars()
    menu.draw()

end