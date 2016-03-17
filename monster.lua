monster = {}
require "player"
require "planet"
require "images"

function monster.load()

	monster.amount = love.math.random(1, 1)
	monster.currentGravity = planetArray[currentPlanet][4]

	monsterArray = {{}}
	monsterArray[1] = {love.math.random(0, 1200),love.math.random(100, 500), 11, 11, 10, 7, love.math.random(5, 20), love.math.random(1, 5), 10 * monster.currentGravity, images.darkElf}

	for i = 1, monster.amount do
		monsterArray[#monsterArray + 1] = {love.math.random(100, 500), love.math.random(0, 1200), 0, 0, love.math.random(5, 20), monsterArray[i][5] - 3, love.math.random(5, 20), love.math.random(1, 5), monsterArray[i][5] * monster.currentGravity, images.darkElf}
		--Monster X 1, Monster Y 2, Random Move 3, Random Jump 4, Mass 5, Friction 6, Speed 7, Monster Type 8, Monster Weight 9, Monster Image 10
	end
	
end

function monster.update(dt)

	--TODO Logic Code
		for p = 1, monster.amount do
		if monsterArray[p][2] > 600 then
	    	monsterArray[p][2] = 600    	
	end
		if love.math.random(1,5) == 1 then -- movement amount
			monsterArray[p][3] = love.math.random(1,2)
		end
		end
end

function monster.movement(dt)
		for p = 1, monster.amount do
	if monsterArray[p][3] == 1 then
		monsterArray[p][1] = monsterArray[p][1]+ monsterArray[p][7] * dt
	end

	if monster.randomMove == 2 then
		monsterArray[p][1] = monsterArray[p][1] - monsterArray[p][7] * dt
	end

	if monster.randomMove == 1 then
		monsterArray[p][2] = monsterArray[p][2] + 5 * dt
	end
end

end 

function monster.physics(dt)

	for j = 1, monster.amount do
		monsterArray[j][2] = monsterArray[j][2] + monsterArray[j][9] --Gravity applied here
		monsterArray[j][1] = monsterArray[j][1] * (1 - math.min(dt * monsterArray[j][6], 1))
	end

end

function monster.draw()

	--love.graphics.draw(monsterImage, monster.x, monster.y, 0, 2, 2)

	for l = 1, monster.amount do
		love.graphics.draw(monsterArray[l][10],monsterArray[l][1] , monsterArray[l][2], 0, 2, 2)  
	end
end

function UPDATE_MONSTER(dt)

	monster.update(dt)
	monster.movement(dt)
	monster.physics(dt)

end

function DRAW_MONSTER()

	monster.draw()

end