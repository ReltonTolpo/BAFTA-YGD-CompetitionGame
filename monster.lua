monster = {}
require "player"
require "planet"
require "images"

function monster.load()

	monster.amount = love.math.random(1, 1)
	monster.currentGravity = planetArray[currentPlanet][4]
	monster.randomNumber = 1

	monsterImage = images.darkElf

	monsterArray = {{}}
	monsterArray[1] = {love.math.random(100, 500), love.math.random(0, 1200), 0, 0, love.math.random(5, 20), love.math.random(10, 50), love.math.random(1, 5), 1, images.darkElf}

    monsterArray[1][8] = monsterArray[1][5] * monster.currentGravity

	for i = 1, monster.amount do
		monsterArray[#monsterArray + 1] = {love.math.random(100, 500), love.math.random(0, 1200), 0, 0, love.math.random(5, 20), love.math.random(10, 50), love.math.random(1, 5), monsterArray[i][5] * monster.currentGravity, images.darkElf}
		--Monster X 1, Monster Y 2, Random Move 3, Random Jump 4, Mass 5, Speed 6, Monster Type 7, Monster Weight 8, Monster Image 9
	end
	
end

function monster.update(dt)

	for p = 1, monster.amount do
		if monster.randomNumber == 1 then -- movement amount
			monsterArray[p][3] = love.math.random(1, 2)
		end
		monster.randomNumber = love.math.random(1, 2)
	end
	
end

function monster.boundary(dt)

<<<<<<< HEAD

	if monster.randomMove == 1 then
		monster.x = monster.x + monster.speed * dt
=======
	for p = 1, monster.amount do
		if monsterArray[p][2] > 450 then
			monsterArray[p][2] = 450    	
		end
>>>>>>> origin/master
	end

end

function monster.movement(dt)
	
	for p = 1, monster.amount do
		if monsterArray[p][3] == 1 then
			monsterArray[p][1] = monsterArray[p][1] + monsterArray[p][6] * dt
		end

		if monster.randomMove == 2 then
			monsterArray[p][1] = monsterArray[p][1] - monsterArray[p][6] * dt
		end

		if monster.randomMove == 1 then
			monsterArray[p][2] = monsterArray[p][2] + 5 * dt
		end
	end

end 

function monster.physics(dt)

	for j = 1, monster.amount do
		monsterArray[j][2] = monsterArray[j][2] + monsterArray[j][8] --Gravity applied here
	end

end

function monster.draw()

	love.graphics.draw(monsterArray[1][9], monsterArray[1][1], monsterArray[1][2], 0, 2, 2)  

	for l = 1, monster.amount do
		--love.graphics.draw(monsterArray[l][10], monsterArray[l][1], monsterArray[l][2], 0, 2, 2)  
	end
	
end

function UPDATE_MONSTER(dt)

	monster.update(dt)
	monster.movement(dt)
	monster.physics(dt)
	monster.boundary(dt)

end

function DRAW_MONSTER()

	monster.draw()

end