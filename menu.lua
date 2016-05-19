menu = {}
require "space"
require "planet"
require "player"
require "monster"
require "sound"
require "images"
require "ship"

function menu.load()

    sound.load()
    space.starSize = 10
    space.starXPosition = 100
    space.starYPosition = 100
    starX = 0
    starY = 0
    colourOver = false
    
end

local function createStars()

    if stars==nil then
        stars={}
        for i = 1, love.math.random(600, 800) do
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
        star.XPosition = star.XPosition + 0.5
        star.YPosition = star.YPosition + 0.5
        love.graphics.rectangle("fill", star.XPosition, star.YPosition, star.Size, star.Size)
    end

end

function menu.update(dt)

    --TODO Logic Code

end

function menu.draw()

    if colourOver == true then
        love.graphics.setColor(100, 100, 230)
        love.graphics.rectangle("fill", 480, 300, 200, 60 )
        print("Hi")
    else
        love.graphics.setColor(255, 255, 255)
        love.graphics.rectangle("fill", 480, 300, 200, 60 )
    end
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Press to Start", 495, 307, 0, 2, 3)
 
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("WASD to move. Space to jump. E to enter ship or planet. LClick to shoot. I for inventory.", 65, 600, 0, 2, 3)

end

function love.mousepressed(x, y, button, istouch)

    if button == 1 and x > 480 and x < 680 and y > 300 and y < 360 then
        inmenu = false
    end

    --[[if button ~= 1 and x > 480 and x < 680 and y > 300 and y < 360 then
        colourOver = true
    end]]

end

function UPDATE_MENU(dt)

    menu.update(dt)

end

function DRAW_MENU()

	menu.drawStars()
    menu.draw()
    love.mousepressed()

end