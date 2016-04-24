planet = {}
require "space"
require "images"

function planet.load()
	planet = images.planet
	onPlanet = true

	currentPlanet = 1
	planetNum = 20

	planetArray = {{}}
	planetArray[1] = {love.math.random(0, 127), love.math.random(50, 255), love.math.random(100, 255), love.math.random(2, 10), love.math.random(0.01, 0.1), love.math.random(-2400,2400),love.math.random(-1500, 1500), love.math.random(0, 255),love.math.random(0, 255) ,love.math.random(0, 255), love.math.random(-math.pi, math.pi), love.math.random(-4, 10),  love.math.random(-1, 1)} 																	

	for i = 1, planetNum do
		planetArray[#planetArray + 1] = {love.math.random(0, 127), love.math.random(50, 255), love.math.random(100, 255), love.math.random(2, 10), love.math.random(0.01, 0.1),love.math.random(-2400,2400) ,love.math.random(-1500, 1500), love.math.random(0,255 ), love.math.random(0, 255),love.math.random(0, 255), love.math.random(-math.pi, math.pi), love.math.random(-4, 10),  love.math.random(-1, 1)}
		--Planet R 1, Planet G 2, Planet B 3, gravity 4, orbitTime 5, Space X 6, Space Y 7, Space R 8, Space G 9, Space B 10, rotation 11, sizex 12, sizey 13
	end

end

function UPDATE_PLANET(dt)

						 onPlanet = true
						 currentPlanet = 1
	if player.onPlanet == true then
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

end

function DRAW_PLANET()

	if player.onPlanet == true then
		if space.dayTime == 1 then
			love.graphics.setBackgroundColor(planetArray[currentPlanet][1], planetArray[currentPlanet][2], planetArray[currentPlanet][3])
		else
			love.graphics.setBackgroundColor(planetArray[currentPlanet][1] - 100, planetArray[currentPlanet][2] - 100, planetArray[currentPlanet][3] - 100)
		end
		love.graphics.setColor(82, 46, 23)
		love.graphics.rectangle("fill", 0, 560, 1200, 600) --> Dirt/Earth
		love.graphics.setColor(35, 115, 31)
		love.graphics.rectangle("fill", 0, 560, 1200, 30) --> Grass
	elseif player.onPlanet == false then
		love.graphics.setBackgroundColor(0, 0, 0)
		space.dayTime = 0
		for i = 1, planetNum do
			planetArray[i][6] = planetArray[i][6] + space.starX
			planetArray[i][7] = planetArray[i][7] + space.starY
			planetArray[i][11] = planetArray[i][11] + 0.01 --planetArray[i][5] - 0.5
			love.graphics.setColor(planetArray[i][1], planetArray[i][2], planetArray[i][3])
			love.graphics.draw(planet,planetArray[i][6], planetArray[i][7], planetArray[i][11], planetArray[i][12], planetArray[i][12]+planetArray[i][13],30,30)
			-- DEBUG CODE:
			love.graphics.rectangle("fill",  planetArray[i][6],  planetArray[i][7], planetArray[i][12] , planetArray[i][12]+planetArray[i][13]) 
			love.graphics.print(planetArray[i][6], planetArray[i][6]  , planetArray[i][7]  - 50, 0, 3, 3)
						love.graphics.print(planetArray[i][7], planetArray[i][6]  , planetArray[i][7]+25  - 50, 0, 3, 3)


	local width = love.graphics.getWidth()
	local height = love.graphics.getHeight()

						if planetArray[i][6] > 615 - 32 and planetArray[i][6] < 615 + 32 and planetArray[i][7] > 409 -32 and planetArray[i][7] < 409 + 32 then
						 onPlanet = true
						 currentPlanet = 1
						end

		end
	end
	
end