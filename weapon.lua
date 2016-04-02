weapon = {}
require "space"
require "planet"
require "monster"
require "sound"
require "images"

function weapon.load()

    weapon.ammoAmount = 30
    weapon.ammoX = player.x
    weapon.ammoY = player.y
    weapon.storedX = 0
    weapon.storedY = 0
    weapon.bulletDirection = "na"
    weapon.bulletDistance = 0
    weapon.fullBulletDistance = 300
    weapon.currentAmmo = 1
    weapon.currentWeapon = 1

    weaponImage = images.gunBase
    ammoImage = images.ammoBase

end

function weapon.bulletAnime()

    if weapon.ammoAmount > 0 then
        if weapon.bulletDirection == "left" then
            if love.mouse.isDown(1) and weapon.currentAmmo == 1 then
                love.graphics.setColor(255, 0, 0)
                love.graphics.draw(ammoImage, weapon.ammoX - 50, weapon.ammoY + 30, 0, 5, 5)
            end
        elseif weapon.bulletDirection == "right" then
            if love.mouse.isDown(1) and weapon.currentAmmo == 1 then
                love.graphics.setColor(255, 0, 0)
                love.graphics.draw(ammoImage, weapon.ammoX + 100, weapon.ammoY + 30, 0, 5, 5)
            end
        end
    end

end

function weapon.update(dt)

    if love.mouse.isDown(1) and weapon.ammoAmount > 0 and weapon.bulletDistance < weapon.fullBulletDistance then
        weapon.ammoX = weapon.storedX
        weapon.ammoY = weapon.storedY
        if weapon.bulletDirection == "left" then
            weapon.storedX = weapon.storedX - 5
            weapon.bulletDistance = weapon.bulletDistance + 1
        elseif weapon.bulletDirection == "right" then
            weapon.storedX = weapon.storedX + 5
            weapon.bulletDistance = weapon.bulletDistance + 1
        end
    else
        weapon.storedX = player.x
        weapon.storedY = player.y
    end

    if love.keyboard.isDown("a") and player.onPlanet == true then
        weapon.bulletDirection = "left"
    elseif love.keyboard.isDown("d") and player.onPlanet == true then
        weapon.bulletDirection = "right"
    elseif player.onPlanet == true then
        weapon.bulletDirection = "na"
    end

    if weapon.bulletDistance = weapon.fullBulletDistance - 10 then
        weapon.ammoAmount = weapon.ammoAmount - 1
    end

end

function weapon.draw()

    if weapon.bulletDirection == "left" then
        if weapon.currentWeapon == 1 then
            love.graphics.draw(weaponImage, player.x + 50, player.y + 50, 0, -5, 5)
        elseif weapon.currentWeapon == 2 then
            --TODO LOGIC CODE
        end
    elseif weapon.bulletDirection == "right" then
        if weapon.currentWeapon == 1 then
            love.graphics.draw(weaponImage, player.x + 80, player.y + 50, 0, 5, 5)
        elseif weapon.currentWeapon == 2 then
            --TODO LOGIC CODE
        end
    else

    end

end

function UPDATE_WEAPON(dt)

    weapon.update(dt)

end

function DRAW_WEAPON()

    weapon.draw()
    weapon.bulletAnime()

end