space = {}

function space.load()

	player.radius = 50
	player.segments = 100
	player.mass = 10
	player.weight = player.mass * gravity

end

function space.draw()

	love.graphics.setBackgroundColor(0, 0, 0)

end

function UPDATE_SPACE()

end

function DRAW_SPACE()

	space.draw()

end