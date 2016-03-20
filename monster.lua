monster = {}
require "planet"
require "images"

function monster.load()

	monster.amount = love.math.random(1, 1)
	monster.currentGravity = planetArray[currentPlanet][4]
	monster.randomNumber = 1

	monsterImage = images.darkElf

	monsterArray = {{}}
	monsterArray[1] = {love.math.random(100, 500), love.math.random(0, 1200), 0, 0, love.math.random(5, 20), love.math.random(1, 1), love.math.random(1, 5), 1, images.darkElf}

    monsterArray[1][8] = monsterArray[1][5] * monster.currentGravity

	for i = 1, monster.amount do
		monsterArray[#monsterArray + 1] = {love.math.random(100, 500), love.math.random(0, 1200), 0, 0, love.math.random(5, 20), love.math.random(10, 100), love.math.random(1, 5), monsterArray[i][5] * monster.currentGravity, images.darkElf}
		--Monster X 1, Monster Y 2, Random Move 3, Random Jump 4, Mass 5, Speed 6, Monster Type 7, Monster Weight 8, Monster Image 9
	end
	
end

function monster.update(dt)

	for m = 1, monster.amount do
		if monster.randomNumber == 1 then
			monsterArray[m][3] = love.math.random(1, 2)
		end
		monster.randomNumber = love.math.random(1, 200)
	end
	
end

function monster.boundary(dt)

	for n = 1, monster.amount do

		if monsterArray[n][2] > 450 then
			monsterArray[n][2] = 450    	
		end

		if monsterArray[n][1] < -50 then
			monsterArray[n][1] = 1150
		end

		if monsterArray[n][1] > 1200 then
			monsterArray[n][1] = -30
		end

	end

end

function monster.movement(dt)
	
	for p = 1, monster.amount do
		if monsterArray[p][3] == 1 then
			monsterArray[p][1] = monsterArray[p][1] + monsterArray[p][6]
		end

		if monsterArray[p][3] == 2 then
			monsterArray[p][1] = monsterArray[p][1] - monsterArray[p][6]
		end

		if monster.randomMove == 1 then
			monsterArray[p][2] = monsterArray[p][2] + 5 * dt
		end
	end

end

function monster.playerTracker(dt)

	--TODO Logic Code

end

function monster.physics(dt)

	for j = 1, monster.amount do
		monsterArray[j][2] = monsterArray[j][2] + monsterArray[j][8] --Gravity applied here
	end

end

function monster.draw()

	if player.onPlanet == true then
		for b = 1, monster.amount do
			love.graphics.draw(monsterArray[b][9], monsterArray[b][1], monsterArray[b][2], 0, 2, 2)  
			--love.graphics.draw()
		end
	end
	
end

function UPDATE_MONSTER(dt)

	monster.update(dt)
	monster.movement(dt)
	monster.boundary(dt)
	monster.physics(dt)

end

function DRAW_MONSTER()

	monster.draw()

end