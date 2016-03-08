ship = {}
require "player"

function ship.load()

	ship = love.graphics.newImage("images/ship/shipLand.png")

end	

function update(dt)
if love.keyboard.isDown('e') and player.x < 20 then
		ship = love.graphics.newImage("images/ship/shipLandPlayer.png")
end
end

function draw()

	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(ship, 50 , 350, 0, 7, 7)

end

function UPDATE_SHIP(dt)

	update(dt)

end

function DRAW_SHIP()
		draw()
end