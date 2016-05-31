planet = {}
require "space"
require "images"

function planet.load()

	planet = images.planet

	currentPlanet = 1
	planetNum = 10

	planetArray = {{}}
	planetArray[1] = {255, 225, 225, 1, 0.1, love.graphics.getWidth()/2, love.graphics.getHeight()/2, love.math.random(0, 255),love.math.random(0, 255) ,love.math.random(0, 255), love.math.random(-math.pi, math.pi), 5, 5, false, 1, 1}
	planetArray[11] = {love.math.random(0, 127), love.math.random(50, 255), love.math.random(100, 255), 0, 0.1, 4000, 4000, love.math.random(0, 255),love.math.random(0, 255) ,love.math.random(0, 255), love.math.random(-math.pi, math.pi), 5, 5, false}

	for j = 1, planetNum do
		planetArray[#planetArray + 1] = {love.math.random(0, 127), love.math.random(50, 255), love.math.random(100, 255), love.math.random(2, 10), love.math.random(0.01, 0.1), love.math.random(-2400,2400), love.math.random(-1500, 1500), love.math.random(0, 255), love.math.random(0, 255),love.math.random(0, 255), love.math.random(-math.pi, math.pi), love.math.random(5,7), love.math.random(5,7), true, false, 1, 1} --love.math.random(10,12)/10, love.math.random(10,12)/10}
		--Planet R 1, Planet G 2, Planet B 3, gravity 4, orbitTime 5, Space X 6, Space Y 7, Space R 8, Space G 9, Space B 10, rotation 11, sizex 12, sizey 13, Has Boss 14, Visited 15
	end

end

function UPDATE_PLANET(dt)

	HomePlanetX = planetArray[1][6]
	HomePlanetY = planetArray[1][7]
	HomeSizeX = planetArray[1][12]
	HomeSizeY = planetArray[1][13]

	love.graphics.setColor(255,0,0)



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

	if player.onPlanet == true then
		sound.bg_music:play()
		sound.bg_music_space:pause()
	elseif player.onPlanet == false then
		sound.bg_music_space:play()
		sound.bg_music:pause()		
	end

end

function DRAW_PLANET()

	

	if player.onPlanet == true then

		if space.dayTime == 1 then
			love.graphics.setBackgroundColor(planetArray[currentPlanet][1], planetArray[currentPlanet][2], planetArray[currentPlanet][3])
		else
			love.graphics.setBackgroundColor(planetArray[currentPlanet][1] - 100, planetArray[currentPlanet][2] - 100, planetArray[currentPlanet][3] - 100)
		end
		love.graphics.setColor(planetArray[currentPlanet][8], planetArray[currentPlanet][9], planetArray[currentPlanet][10])
		love.graphics.rectangle("fill", 0, 560, 1200, 600) --> Dirt/Earth
		love.graphics.setColor(planetArray[currentPlanet][8] - planetArray[currentPlanet][1], planetArray[currentPlanet][9] + planetArray[currentPlanet][2], planetArray[currentPlanet][10] - planetArray[currentPlanet][3])
		love.graphics.rectangle("fill", 0, 560, 1200, 30) --> Grass

	elseif player.onPlanet == false then

		love.graphics.setBackgroundColor(0, 0, 0)
		space.dayTime = 0
		for i = 1, planetNum do
			planetArray[i][6] = planetArray[i][6] + space.starX
			planetArray[i][7] = planetArray[i][7] + space.starY
			planetArray[i][11] = planetArray[i][11] + 0.01 --planetArray[i][5] - 0.5

			--for i = 2, planetNum do
			if planetArray[i][15] == true and i ~= 1 then
				love.graphics.setColor(100,100,100)
			else
				love.graphics.setColor(planetArray[i][1], planetArray[i][2], planetArray[i][3])
			end

			love.graphics.draw(planet, planetArray[i][6], planetArray[i][7], planetArray[i][11], planetArray[i][12], planetArray[i][13], 32, 32, 0.2, 0.2)--planetArray[i][16], planetArray[i][17])

		

			--love.graphics.draw(planet, planetArray[i][6], planetArray[i][7], planetArray[i][11], planetArray[i][12], planetArray[i][13], 32, 32, 0.2, 0.2)--planetArray[i][16], planetArray[i][17])


			local width = love.graphics.getWidth()
			local height = love.graphics.getHeight()

			if planetArray[i][6] > 615 - 128 and planetArray[i][6] < 615 + 128 and planetArray[i][7] > 409 - 128 and planetArray[i][7] < 409 + 128 and love.keyboard.isDown("e") then
				player.onPlanet = true
				playerOverShip = false
				player.playerExists = true
				currentPlanet = i
				ship = images.ship
				shipx = 50
				shipy = 350
				player.x = 600
				player.y = 200
				player.canMove = true
				planetArray[i][15] = true
			end
		end




	end
end