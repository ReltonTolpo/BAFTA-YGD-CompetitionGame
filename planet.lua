planet = {}
require "space"


function planet.load()

	planetNum = 3

	planetArray = {{}}
	planetArray[1] = {math.random(255), math.random(255), math.random(255), math.random(2, 5), math.random(0.01, 0.1)} -- Planet R, Planet G, Planet B, gravity, orbitTime

	for i = 1, 3 do--planet.planetNum do
		planetArray[#planetArray + 1] = {math.random(255), math.random(255), math.random(255), math.random(2, 5), math.random(0.01, 0.1)}
	end

end

function planet.draw()



end

function UPDATE_PLANET(dt)

	planet.draw()

end

function DRAW_PLANET()

	planet.draw()

end