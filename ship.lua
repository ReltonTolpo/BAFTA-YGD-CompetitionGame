ship = {}

	function ship.load()
	landedShip = love.graphics.newImage("images/ship/shipLand.png")
	end

	function ship.update(dt)
	end

	function ship.draw()
		love.graphics.setColor(255, 255, 255)
		love.graphics.draw(landedShip, 50 , 350, 0, 7, 7)
	end

	function UPDATE_SHIP(dt)
		ship.update(dt)
	end

	function DRAW_SHIP()
		ship.draw()
	end