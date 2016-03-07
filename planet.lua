planet = {}
require "space"


function planet.load()


	landedShip = love.graphics.newImage("images/ship/shipLand.png")


	currentPlanet = 1
	planetNum = 3 --> we may have to set a default number of planets as the for loop will not accept a variable

	planetArray = {{}}
	planetArray[1] = {math.random(255), math.random(255), math.random(255), math.random(2, 5), math.random(0.01, 0.1)} -- Planet R, Planet G, Planet B, gravity, orbitTime

	for i = 1, 3 do--> planet.planetNum do (doesn't work)
		planetArray[#planetArray + 1] = {math.random(255), math.random(255), math.random(255), math.random(2, 5), math.random(0.01, 0.1)}
	end

end

function planet.draw()
		love.graphics.setBackgroundColor(planetArray[currentPlanet][1], planetArray[currentPlanet][2], planetArray[currentPlanet][3])
		love.graphics.setColor(82, 46, 23)
		love.graphics.rectangle("fill", 0, 560, 1200, 600) --> Dirt/Earth
		love.graphics.setColor(35, 115, 31)
		love.graphics.rectangle("fill", 0, 560, 1200, 30) --> Grass

			love.graphics.setColor(255, 255, 255)
		love.graphics.draw(landedShip, 50 , 400, 0, 14, 14)
	


end

function UPDATE_PLANET(dt)

	planet.draw()


space.weatherX = space.weatherX + planetArray[currentPlanet][5] * 5
if space.weatherX>500 then 
    space.weatherY = space.weatherY + planetArray[currentPlanet][5] * 2
end
if space.weatherX<500 then 
space.weatherY = space.weatherY - planetArray[currentPlanet][5] * 2
end
if space.weatherX>1200 then 
    space.weatherX = 0
    space.weatherY = 150
    if space.dayTime == 0 then
        space.dayTime = 1
        elseif space.dayTime == 1 then
            space.dayTime = 0
        end
    end

end

function DRAW_PLANET()

	planet.draw()

end