menu = {}
require "space"
require "planet"
require "player"
require "monster"
require "sound"
require "images"
require "ship"
require "tutorial"

function menu.load()

    sound.load()
    space.starSize = 10
    space.starXPosition = 100
    space.starYPosition = 100
    starX = 0
    starY = 0
    colourOver = false
    acceleration = 0.2
    delta = 0.001

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
        star.XPosition = star.XPosition + acceleration
        star.YPosition = star.YPosition + acceleration
        love.graphics.rectangle("fill", star.XPosition, star.YPosition, star.Size, star.Size)
    end
        
    acceleration = acceleration + delta

    if acceleration <= -1.3 then
        delta = -delta
    elseif acceleration >= 1.3 then
        delta = -delta
    end

end

function menu.draw()

    --love.graphics.print(acceleration, 200, 200)

    sound.bg_music_space:play()
    if colourOver == true then
        love.graphics.setColor(100, 100, 230)
        love.graphics.rectangle("fill", 480, 300, 200, 60 )
    else
        love.graphics.setColor(255, 255, 255)
        love.graphics.rectangle("fill", 470, 300, 220, 60 )
        love.graphics.rectangle("fill", 470, 363, 220, 60 )
    end
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Play", 550, 307, 0, 2, 3)
    love.graphics.print("Play with Tutorial", 480, 370, 0, 2, 3)
 
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf("Graviton Galaxy", 0, 60, 75, "center", 0, 3, 3, -155)
    love.graphics.printf("Created by Benjamin Broadbent, Danny Harris and Ori Taylor", 65, 600, 1000, "center")

end

function love.mousepressed(x, y, button, istouch)

    if button == 1 and x > 470 and x < 690 and y > 300 and y < 360 and inmenu == true then
        inmenu = false

        images.load()
        space.load()
        planet.load()
        endgame.load()
        inventory.load()
        weapon.load()
        inventory.load()
        monster.load()
        weapon.load()
        ship.load()
        player.load()
        tutorial.load()

        player.tutorialOn = false
    end

    if button == 1 and x > 470 and x < 690 and y > 363 and y < 423 and inmenu == true then
        inmenu = false
        
        images.load()
        space.load()
        planet.load()
        endgame.load()
        inventory.load()
        weapon.load()
        inventory.load()
        monster.load()
        weapon.load()
        ship.load()
        player.load()
        tutorial.load()

        player.tutorialOn = true
    end

end

function UPDATE_MENU(dt)

    menu.update(dt)
    love.mousepressed()

end

function DRAW_MENU()

	menu.drawStars()
    menu.draw()

end