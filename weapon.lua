weapon = {}
require "space"
require "planet"
require "player"
require "monster"
require "sound"
require "images"
require "ship"

function weapon.load()

    weapon.ammoAmount = 30
    weapon.ammoX = player.x
    weapon.ammoY = player.y
    weapon.bulletDirection = "na"
    weapon.currentAmmo = 1
    weapon.currentWeapon = 1

    weaponImage = images.gunBase
    ammoImage = images.ammoBase

end

function weapon.weaponAnime()

    if weapon.bulletDirection == "left" then
        if love.mouse.isDown(1) and weapon.ammoAmount > 0 and weapon.currentAmmo == 1 then
            love.graphics.setColor(255, 0, 0)
            love.graphics.draw(ammoImage, weapon.ammoX, weapon.ammoY, 0, 5, 5)
        end
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
    weapon.weaponAnime()

end