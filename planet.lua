planet = {}
require "space"
require "images"

function planet.load()
	planet = images.planet
	onPlanet = true

	currentPlanet = 1
	planetNum = 20

	planetArray = {{}}
	planetArray[1] = {love.math.random(0, 127), love.math.random(0, 255), love.math.random(0, 255), love.math.random(1, 50)/15, love.math.random(0.01, 0.1), love.math.random(-2400,2400),love.math.random(-1500, 1500), love.math.random(0, 255),love.math.random(0, 255) ,love.math.random(0, 255), love.math.random(-math.pi, math.pi), love.math.random(-4, 10),  love.math.random(-1, 1)}-- Planet R 1, Planet G 2, Planet B 3, gravity 4, orbitTime 5, x 6,y 7, colorr 8, colorg 9, colorb 10, rotation 11, sizex 12, sizey 13, 																	

	for i = 1, planetNum do
		planetArray[#planetArray + 1] = {love.math.random(0, 255), love.math.random(0, 255), love.math.random(0, 255), love.math.random(1, 50)/15, love.math.random(0.01, 0.1),love.math.random(-2400,2400) ,love.math.random(-1500, 1500), love.math.random(0,255 ), love.math.random(0, 255),love.math.random(0, 255), love.math.random(-math.pi, math.pi), love.math.random(-4, 10),  love.math.random(-1, 1) }
	end

end

function planet.draw()


end


function UPDATE_PLANET(dt)

--	planet.draw()

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

	--planet.draw()
	if player.onPlanet == true then
		love.graphics.setBackgroundColor(planetArray[currentPlanet][1], planetArray[currentPlanet][2], planetArray[currentPlanet][3])
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
						love.graphics.setColor( planetArray[i][8] ,planetArray[i][9] , planetArray[i][10] )
		love.graphics.draw(planet,planetArray[i][6] , planetArray[i][7],  planetArray[i][11], planetArray[i][12], planetArray[i][12]+planetArray[i][13])
	end
	end
end