inventory = {}
require "socket"
require "player"
require "images"
require "weapon"

function inventory.load()

    inventory.inInv = false
    inventory.x = 375
    inventory.y = 100
    inventory.graviNum = 0

    inventoryArray = {images.graviton, images.gunBase}
    --Graviton, Weapon, Jetpack,

    basicGUI = images.inventory
    
end

function inventory.update(dt)

    --Changing Items in inventory
    if weapon.currentWeapon == 1 then
        slot1 = images.gunBase
    elseif weapon.currentWeapon == 2 then
        slot1 = images.machineGun
    end


    --Opening Inventory
    if love.keyboard.isDown('i') then
        if inventory.inInv == true then
            inventory.inInv = false
        elseif inventory.inInv == false then
            inventory.inInv = true
        end
        sleep(0.2)
    end

end

function inventory.draw()

    if inventory.inInv == true then
        love.graphics.draw(basicGUI, inventory.x, inventory.y, 0, 7.8125, 7.8125)
        if inventory.graviNum > 0 then
            love.graphics.draw(graviton, 575, 300, 0, 8, 8)
            love.graphics.print("x" ..inventory.graviNum, 607, 330, 0, 2.5, 2.5)
        end
        love.graphics.draw(slot1, 400, 280, 0, 10, 10)
    end

end

function UPDATE_INVENTORY(dt)

    inventory.update(dt)

end

function DRAW_INVENTORY()

    inventory.draw()

end

function sleep(sec)

    socket.select(nil, nil, sec)

end