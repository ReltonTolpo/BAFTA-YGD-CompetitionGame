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

    inventoryArray = {"Gun"} --weapon, item slot 1, item slot 2

    basicGUI = images.inventory
    graviton = images.graviton
    weapons = images.gunBase
    
end

function inventory.update(dt)

 if love.keyboard.isDown('i') then
    if inventory.inInv == true then
    inventory.inInv = false

elseif inventory.inInv == false then
    inventory.inInv = true
end
sleep(0.4)
 end


end

function inventory.draw()

    if inventory.inInv == true then
        love.graphics.draw(basicGUI, inventory.x, inventory.y, 0, 1, 1)

        if inventory.graviNum > 0 then
            love.graphics.draw(graviton, 575, 300, 0, 8, 8)
            love.graphics.print("x" ..inventory.graviNum, 607, 330, 0, 2.5, 2.5)
        end

        if weapon.currentWeapon == 1 then
            love.graphics.draw(weapons, 400, 280, 0, 10, 10)
        end
    elseif inventory.inInv == false then
        --TODO LOGIC CODE
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