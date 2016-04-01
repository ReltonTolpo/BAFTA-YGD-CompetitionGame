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
    weapon.bulletDirection = "na"
    weapon.bulletDistance = 300
    weapon.currentAmmo = 1
    weapon.currentWeapon = 1

    weaponImage = images.gunBase
    ammoImage = images.ammoBase

end

function weapon.bulletAnime()

    if weapon.bulletDirection == "left" then
        if love.mouse.isDown(1) and weapon.ammoAmount > 0 and weapon.currentAmmo == 1 then
            love.graphics.setColor(255, 0, 0)
            love.graphics.draw(ammoImage, weapon.ammoX - 50, weapon.ammoY + 30, 0, 5, 5)
            for i = 0, weapon.bulletDistance do
                weapon.ammoX = weapon.ammoX - 10
            end
        end
    elseif weapon.bulletDirection == "right" then
        if love.mouse.isDown(1) and weapon.ammoAmount > 0 and weapon.currentAmmo == 1 then
            love.graphics.setColor(255, 0, 0)
            love.graphics.draw(ammoImage, weapon.ammoX + 100, weapon.ammoY + 30, 0, 5, 5)
            for j = 0, weapon.bulletDistance do
                weapon.ammoX = weapon.ammoX + 10
            end
        end
    end

end

function weapon.heldWeapon()

    if weapon.bulletDirection == "left" then
        if weapon.currentWeapon == 1 then
            love.graphics.draw(weaponImage, weapon.ammoX + 50, weapon.ammoY + 50, 0, -5, 5)
        elseif weapon.currentWeapon == 2 then
            --TODO LOGIC CODE
        end
    elseif weapon.bulletDirection == "right" then
        if weapon.currentWeapon == 1 then
            love.graphics.draw(weaponImage, weapon.ammoX + 80, weapon.ammoY + 50, 0, 5, 5)
        elseif weapon.currentWeapon == 2 then
            --TODO LOGIC CODE
        end
    else

    end

end

function weapon.update(dt)

    weapon.ammoX = player.x
    weapon.ammoY = player.y

    if love.keyboard.isDown("a") and player.onPlanet == true then
        weapon.bulletDirection = "left"
    elseif love.keyboard.isDown("d") and player.onPlanet == true then
        weapon.bulletDirection = "right"
    elseif player.onPlanet == true then
        weapon.bulletDirection = "na"
    end

end

function weapon.draw()

    --TODO Logic Code

end

function UPDATE_WEAPON(dt)

    weapon.update(dt)

end

function DRAW_WEAPON()

    weapon.draw()
    weapon.bulletAnime()
    weapon.heldWeapon()

end