inventory = {}
require "socket"
require "player"
require "images"
require "weapon"
require "space"

function inventory.load()

    idown = false
    inventory.inInv = false
    inventory.x = 375
    printx = 0
    printy = 0
    inventory.y = 100
    inventory.graviNum = 0
    inventory.locked = false
    inventory.alpha = 255

    inventoryImages = {images.graviton, images.gunBase, images.jetpack}
    --Graviton, Weapon, Jetpack,

    basicGUI = images.inventory
    
end

function inventory.update(dt)

    if gameType == "desktop" then idown = love.keyboard.isDown('i') else idown = buttons.inventory end

    --Changing Items in inventory
    if weapon.currentWeapon == 1 then
        slot1 = images.gunBase
    elseif weapon.currentWeapon == 2 then
        slot1 = images.machineGun
    end

    --Opening Inventory
    if inventory.locked == false then
	    if idown then
            inventory.inInv = true
	    else inventory.inInv =  false end
	end

end

function inventory.draw()

    if inventory.inInv == true then
            love.graphics.setColor(255, 255, 255,255)
        love.graphics.draw(basicGUI, inventory.x, inventory.y, 0, 1.953125, 1.953125)
        if inventory.graviNum > 0 then
            love.graphics.draw(inventoryImages[1], 575, 300, 0, 8, 8)
        	love.graphics.print("x"..inventory.graviNum, 607, 330, 0, 2.5, 2.5)
        end
        if player.hasJetpack == true then
            love.graphics.draw(inventoryImages[3], 715, 290, 0, 5, 5)
        end
   	    love.graphics.draw(inventoryImages[2], 400, 280, 0, 10, 10)
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

--[[function love.mousepressed(x, y, button, istouch)
    if button == 1 then -- the primary button
        if weapon.currentWeapon == 1 then
            weapon.currentWeapon = 0
            sleep(0.2)
        end
        if weapon.currentWeapon == 0 then
            weapon.currentWeapon = 1
            sleep(0.2)
        end
    end
end--]]

--[[function love.mousepressed(x, y, button, istouch)
   if button == 1 then -- the primary button
      printx = x
      printy = y
                  love.graphics.print(printx, 607, 330, 0, 2.5, 2.5)
            love.graphics.print(printy ,607, 350, 0, 2.5, 2.5)
   end
end]]