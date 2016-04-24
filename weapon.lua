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
    weapon.currentWeapon = 2
    weapon.drawAmmo = false
    weapon.lock = false
    weapon.bulletDamage = 10
    weapon.bulletSpeed = 5
    weapon.firstFire = true

    weapon.a = true
    weapon.b = true



    weapon.left = true
    weapon.right = true

    weapon.lockLeft = false
    weapon.lockRight = false

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

    weapon.playerX = player.x
    weapon.mouseX = love.mouse.getX()
    weapon.canFire = player.onPlanet
        --if rightDown == true and player.onPlanet == true then
        --if leftDown == true and player.onPlanet == true then

    --Testing for Left or Right gun
    if leftDown == true and player.onPlanet == true then
        weapon.gunDirection = "left"
    elseif rightDown == true and player.onPlanet == true then
        weapon.gunDirection = "right"
    elseif player.onPlanet == true then
        weapon.gunDirection = "na"
    end

    --[[if player.onPlanet == false then
        weapon.gunDirection = "na"
    elseif player.direction == "still" and player.onPlanet == true then
        if weapon.mouseX < weapon.playerX+64 then
            weapon.gunDirection = "left"
        elseif weapon.mouseX > weapon.playerX+64 then
            weapon.gunDirection = "right"
        end
    elseif player.direction == "left" and player.onPlanet == true then
        if weapon.mouseX < weapon.playerX+64 then
            weapon.gunDirection = "left"
        elseif weapon.mouseX > weapon.playerX+64 then
            weapon.gunDirection = "na"
        end
    elseif player.direction == "right" and player.onPlanet == true then
        if weapon.mouseX > weapon.playerX+64 then
            weapon.gunDirection = "right"
        elseif weapon.mouseX < weapon.playerX+64 then
            weapon.gunDirection = "na"
        end
    end]]

    psystem3:update(dt)
    mouseDown = love.mouse.isDown(1)
    leftDown = love.keyboard.isDown("a")
    rightDown = love.keyboard.isDown("d")

    --Setting things depending on weapon
    if weapon.currentWeapon == 1 then
        weapon.bulletDamage = 5
        weapon.bulletSpeed = 4
        sizeX = 4
        weaponImage = images.gunBase
    elseif weapon.currentWeapon == 2 then
        weapon.bulletDamage = 3
        weapon.bulletSpeed = 7
        weaponImage = images.machineGun
        sizeX = 3
    end

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
            weapon.lock = true
            weapon.drawAmmo = true
            if weapon.firstFire == true then
                weapon.lock = false
                weapon.firstFire = false
                weapon.mouseDown = false
                print(weapon.mouseDown)
            end
            if weapon.bulletDirection == "left" or weapon.lockLeft == true then 
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

function weapon.draw()

    --love.graphics.print(weapon.playerX, 250,250,0,2,2)
    --love.graphics.print(weapon.mouseX, 250,275,0,2,2)

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