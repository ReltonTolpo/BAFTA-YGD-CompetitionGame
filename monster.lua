monster = {}
require "player"
require "planet"

function monster.load()

	monster.amount = love.math.random(1, 10)
	monster.currentGravity = planetArray[currentPlanet][4]

	monsterArray = {{}}
	monsterArray[1] = {love.math.random(0, 1200), love.math.random(100, 500), 11, 11, 10, 7, love.math.random(5, 20), love.math.random(1, 5), 10 * monster.currentGravity}

	for i = 1, monster.amount do
		monsterArray[#monsterArray + 1] = {love.math.random(100, 500), love.math.random(0, 1200), 0, 0, love.math.random(5, 20), monsterArray[i][5] - 3, love.math.random(5, 20), love.math.random(1, 5), monsterArray[i][5] * monster.currentGravity}
		--Monster X 1, Monster Y 2, Random Move 3, Random Jump 4, Mass 5, Friction 6, Speed 7, Monster Type 8, Monster Weight 9,
	end
	
end

function monster.update(dt)

	--TODO Logic Code

end

function monster.movement(dt)


	if monster.randomMove == 1 then
		monster.x = monster.x + monster.speed * dt
	end

	if monster.randomMove == 2 then
		monster.x = monster.x - monster.speed * dt
	end

	if monster.randomMove == 1 then
		monster.y = monster.y + 5 * dt
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

end

function UPDATE_MONSTER(dt)

	monster.update(dt)
	monster.movement(dt)
	monster.physics(dt)

end

function DRAW_MONSTER()

	monster.draw()

end