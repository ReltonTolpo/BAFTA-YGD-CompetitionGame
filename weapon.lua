weapon = {}
require "space"
require "planet"
require "sound"
require "images"

function weapon.load()

    mdown = false
    weapon.ammoAmount = 30
    weapon.ammoX = player.x
    weapon.ammoY = player.y
    weapon.storedX = 0
    weapon.storedY = 0
    weapon.bulletDirection = "na"
    weapon.gunDirection = "na"
    weapon.currentWeapon = 1
    weapon.previousWeapon = weapon.currentWeapon
    weapon.drawAmmo = false
    weapon.lock = false
    weapon.bulletDamage = 10
    weapon.bulletSpeed = 5
    weapon.firstFire = true
    weapon.ready = false

    weapon.a = true
    weapon.b = true

    weapon.left = true
    weapon.right = true

    weapon.lockLeft = false
    weapon.lockRight = false

    timer3 = 20

    weaponImage = images.gunBase
    ammoImage = images.ammoBase

    local smoke = images.smoke

    psystem3 = love.graphics.newParticleSystem(smoke, 70)
    psystem3:setParticleLifetime(2, 10) -- Particles live at least 2s and at most 5s.
    psystem3:setEmissionRate(200)
    psystem3:setSizeVariation(1)
    psystem3:setLinearAcceleration(-20, -10, -20, 10) -- Random movement in all directions.
    psystem3:setColors(255, 255, 255, 255, 255, 255, 255, 0) -- Fade to transparency.

end

function weapon.bulletAnime()

    if player.dead == false and weapon.drawAmmo == true then
        if love.mouse.isDown(1) or weapon.lock == true then
            if weapon.bulletDirection == "left" or weapon.lockLeft == true then
                love.graphics.setColor(255, 0, 0)
                love.graphics.draw(ammoImage, weapon.ammoX - 50, weapon.ammoY + 40, 0, sizeX, 4)
            elseif weapon.bulletDirection == "right" or weapon.lockRight == true then
                love.graphics.setColor(255, 0, 0)
                love.graphics.draw(ammoImage, weapon.ammoX + 130, weapon.ammoY + 40, 0, sizeX, 4)
            end
        end
    end

end

function weapon.update(dt)

    if gameType == "desktop" then
        mdown = love.mouse.isDown(1)
    else 
        if timer3 < 1 then
        mdown = buttons.fire
        else mdown = true end
    end

    if timer3 > -1 then timer3 = timer3 - 1 end

    weapon.playerX = player.x
    weapon.mouseX = love.mouse.getX()
    weapon.canFire = player.onPlanet

    --Testing for Left or Right gun
    if leftDown == true and player.onPlanet == true then
        weapon.gunDirection = "left"
    elseif rightDown == true and player.onPlanet == true then
        weapon.gunDirection = "right"
    elseif player.onPlanet == true and gameType == "desktop" then
        weapon.gunDirection = "na"
    end

    psystem3:update(dt)
    mouseDown = mdown
    leftDown = adown
    rightDown = ddown

    --Setting things depending on weapon
    if weapon.currentWeapon == 1 then
        weapon.bulletDamage = 6
        weapon.bulletSpeed = 15
        sizeX = 4
        weaponImage = images.gunBase
    elseif weapon.currentWeapon == 2 then
        weapon.bulletDamage = 6
        weapon.bulletSpeed = 30
        weaponImage = images.machineGun
        sizeX = 2
    elseif weapon.currentWeapon == 3 then
        weapon.bulletDamage = 18
        weapon.bulletSpeed = 10
        weaponImage = images.cannon
        sizeX = 5
    elseif weapon.currentWeapon == 4 then
        weapon.bulletDamage = 12
        weapon.bulletSpeed = 15
        weaponImage = images.harpoonGun
        sizeX = 20
    elseif weapon.currentWeapon == 0 then
        weapon.gunDirection = "na"
        weapon.bulletDirection = "na"
        mouseDown = false
    end

    if weapon.lock == true and weapon.ammoAmount ~= 0 then 
        sound.shot_fx:play()
    end
    
    if player.onPlanet == true then
    --Testing for Left or Right bullet
        if weapon.gunDirection == "left" and weapon.left == true then
            weapon.bulletDirection = "left"
        elseif weapon.gunDirection == "right" and weapon.right == true then
            weapon.bulletDirection = "right"
        elseif weapon.gunDirection == "na" then
            weapon.bulletDirection = "na"
        end

        --Doing bullet movement
        if weapon.ammoAmount > 0 and player.dead == false then
            if mouseDown == true or weapon.lock == true then
                weapon.ammoX = weapon.storedX
                weapon.ammoY = weapon.storedY
                weapon.drawAmmo = true
                if weapon.bulletDirection == "left" or weapon.lockLeft == true then
                    weapon.lock = true
                    if weapon.left == true then
                        weapon.storedX = weapon.storedX - weapon.bulletSpeed
                        weapon.right = false
                        weapon.lockLeft = true
                        if weapon.ammoX > 1200 or weapon.ammoX < 0 then
                            weapon.lock = false
                            weapon.right = true
                            weapon.lockLeft = false
                            weapon.drawAmmo = false
                            weapon.ammoX = player.x
                            weapon.ammoY = player.y
                        end
                    end
                elseif weapon.bulletDirection == "right" or weapon.lockRight == true then
                    weapon.lock = true
                    if weapon.right == true then
                        weapon.storedX = weapon.storedX + weapon.bulletSpeed
                        weapon.left = false
                        weapon.lockRight = true
                        if weapon.ammoX > 1200 or weapon.ammoX < 0 then
                            weapon.lock = false
                            weapon.left = true
                            weapon.lockRight = false
                            weapon.drawAmmo = false
                            weapon.ammoX = player.x
                            weapon.ammoY = player.y
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
        if weapon.ammoAmount > 0 and weapon.gunDirection ~= "na" then
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
end

function weapon.draw()

    love.graphics.draw(psystem3, ammoX, ammoY)

    if player.dead == false and player.onPlanet == true and smokeActive == false and liftoff == false then
        if weapon.gunDirection == "left" then
            love.graphics.draw(weaponImage, player.x + 50, player.y + 50, 0, -5, 5)
        elseif weapon.gunDirection == "right" then
            love.graphics.draw(weaponImage, player.x + 80, player.y + 50, 0, 5, 5)
        elseif weapon.gunDirection == "na" then
            love.graphics.draw(weaponImage, player.x + 35, player.y + 90, 4.71239, -2, 2)
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