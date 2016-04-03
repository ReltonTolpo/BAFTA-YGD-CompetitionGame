weapon = {}
require "space"
require "planet"
require "sound"
require "images"

function weapon.load()

    weapon.ammoAmount = 30
    weapon.ammoX = player.x
    weapon.ammoY = player.y
    weapon.storedX = 0
    weapon.storedY = 0
    weapon.bulletDirection = "na"
    weapon.gunDirection = "na"
    weapon.currentWeapon = 1
    weapon.drawAmmo = false
    weapon.lock = false

    weapon.a = true
    weapon.b = true

    weapon.left = true
    weapon.right = true

    weapon.lockLeft = false
    weapon.lockRight = false

    weaponImage = images.gunBase
    ammoImage = images.ammoBase

end

function weapon.bulletAnime()

    if player.dead == false then
        if love.mouse.isDown(1) or weapon.lock == true then
            if weapon.bulletDirection == "left" or weapon.lockLeft == true then
                love.graphics.setColor(255, 0, 0)
                love.graphics.draw(ammoImage, weapon.ammoX - 50, weapon.ammoY + 30, 0, 5, 5)
            elseif weapon.bulletDirection == "right" or weapon.lockRight == true then
                love.graphics.setColor(255, 0, 0)
                love.graphics.draw(ammoImage, weapon.ammoX + 100, weapon.ammoY + 30, 0, 5, 5)
            end
        end
    end

end

function weapon.update(dt)

    mouseDown = love.mouse.isDown(1)
    leftDown = love.keyboard.isDown("a")
    rightDown = love.keyboard.isDown("d")

    --Testing for Left or Right gun
    if leftDown == true and player.onPlanet == true then
        weapon.gunDirection = "left"
    elseif rightDown == true and player.onPlanet == true then
        weapon.gunDirection = "right"
    elseif player.onPlanet == true then
        weapon.gunDirection = "na"
    end

    --Testing for Left or Right bullet
    if weapon.gunDirection == "left" and weapon.left == true then
        weapon.bulletDirection = "left"
        --weapon.right = true
    elseif weapon.gunDirection == "right" and weapon.right == true then
        weapon.bulletDirection = "right"
        --weapon.left = true
    elseif weapon.gunDirection == "na" then
        weapon.bulletDirection = "na"
    end

    --Doing bullet movement
    if weapon.ammoAmount > 0 and player.dead == false then
        if mouseDown == true or weapon.lock == true then
            weapon.ammoX = weapon.storedX
            weapon.ammoY = weapon.storedY
            weapon.lock = true
            if weapon.bulletDirection == "left" or weapon.lockLeft == true then 
                if weapon.left == true then
                    weapon.storedX = weapon.storedX - 5
                    weapon.right = false
                    weapon.lockLeft = true
                    if weapon.ammoX > 1200 or weapon.ammoX < 0 then
                        weapon.lock = false
                        weapon.right = true
                        weapon.lockLeft = false
                    end
                end
            elseif weapon.bulletDirection == "right" or weapon.lockRight == true then
                if weapon.right == true then
                    weapon.storedX = weapon.storedX + 5
                    weapon.left = false
                    weapon.lockRight = true
                    if weapon.ammoX > 1200 or weapon.ammoX < 0 then
                        weapon.lock = false
                        weapon.left = true
                        weapon.lockRight = false
                    end
                end
            end
        else
            weapon.storedX = player.x
            weapon.storedY = player.y
            weapon.ammoY = -500
        end
    else
        weapon.ammoY = -500
        weapon.storedY = -500
    end

    --Removing ammo after fire
    if weapon.ammoAmount > 0 then
        if mouseDown == true or weapon.lock == true then
            if weapon.b == true then
                weapon.ammoAmount = weapon.ammoAmount - 1
                weapon.b = false
            end
        elseif mouseDown == false and weapon.lock == false and weapon.b == false then
            weapon.b = true
        end
    end

end

function weapon.draw()

    if player.dead == false and player.onPlanet == true and smokeActive == false and liftoff == false then
        if weapon.gunDirection == "left" then
            if weapon.currentWeapon == 1 then
                love.graphics.draw(weaponImage, player.x + 50, player.y + 50, 0, -5, 5)
            elseif weapon.currentWeapon == 2 then
                --TODO LOGIC CODE
            end
        elseif weapon.gunDirection == "right" then
            if weapon.currentWeapon == 1 then
                love.graphics.draw(weaponImage, player.x + 80, player.y + 50, 0, 5, 5)
            elseif weapon.currentWeapon == 2 then
                --TODO LOGIC CODE
            end
        elseif weapon.gunDirection == "na" then
            if weapon.currentWeapon == 1 then
                love.graphics.draw(weaponImage, player.x + 35, player.y + 90, 4.71239, -2, 2)
            elseif weapon.currentWeapon == 2 then
                --TODO LOGIC CODE
            end
        end
    end

end

function UPDATE_WEAPON(dt)

    weapon.update(dt)

end

function DRAW_WEAPON()

    weapon.draw()
    weapon.bulletAnime()

end