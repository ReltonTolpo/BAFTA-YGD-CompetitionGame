monster = {}
require "planet"
require "images"
require "space"
require "weapon"

function monster.load()

	monster.amount = love.math.random(1, 10)
	monster.currentGravity = planetArray[currentPlanet][4]
	monster.randomNumber = 1

	monster.dayNight = true

	monster.bossExtras = true

	monsterArray = {{}}
	monsterArray[1] = {love.math.random(0, 1200), 200, 4, 0, love.math.random(5, 20), love.math.random(0.1, 1), love.math.random(1, 3), 1, images.darkElf, love.math.random(20, 100), images.darkElf, images.darkElfMove, "still", false, love.math.random(0, 10), false, 2}

    monsterArray[1][8] = monsterArray[1][5] * monster.currentGravity

	for i = 1, monster.amount do
		monsterArray[#monsterArray + 1] = {love.math.random(0, 1200), 200, 4, 0, love.math.random(5, 20), love.math.random(0.1, 1), love.math.random(1, 3), monsterArray[i][5] * monster.currentGravity, images.darkElf, love.math.random(20, 100), images.darkElf, images.darkElfMove, "still", false, love.math.random(0, 10), false, 2}
		--Monster X 1, Monster Y 2, Random Move 3, Random Track 4, Mass 5, Speed 6, Monster Type 7, Monster Weight 8, Monster Current Image 9, Monster Health 10, Monster Straight Image 11, Monster Image Move 12, Monster Direction 13, Monster Been Hit 14, Monster Drops 15, Monster is boss 16, Monster Size 17
	end
	
end

function monster.update(dt)

	for m = 1, monster.amount do
		if player.onPlanet == true then

			--Drawing Monster Stats
			if monsterArray[m][7] == 1 then
				monsterArray[m][11] = images.darkElf
				monsterArray[m][12] = images.darkElfMove
			elseif monsterArray[m][7] == 2 then
				monsterArray[m][11] = images.flyingOcto
				monsterArray[m][12] = images.flyingOctoMove
				if monsterArray[m][2] > 330 then
					monsterArray[m][2] = 330
				end
			elseif monsterArray[m][7] == 3 then
				monsterArray[m][11] = images.cyclopsOgre
				monsterArray[m][12] = images.cyclopsOgreMove
			end

			--Choosing Direction
			if monster.randomNumber == 1 then
				monsterArray[m][3] = love.math.random(1, 4)
			end

			--Killing Monster
			if monsterArray[m][10] <= 0 then
				monsterArray[m][2] = -500
			end

			--Removing Monsters at day
			if space.dayTime == 1 and monsterArray[m][16] == false then
				monsterArray[m][2] = -500
				monster.dayNight = true
			end

			--Bringing Monsters back at night
			if space.dayTime == 0 and monster.a == true and monsterArray[m][16] == false then
				monsterArray[m][2] = 450
				monster.dayNight = false
			end
			monster.randomNumber = love.math.random(1, 200)

			--Dealing damage to monster
			if monsterArray[m][7] == 1 or monsterArray[m][7] == 3 then
		        if monsterArray[m][1] >= weapon.ammoX - 20 and monsterArray[m][1] <= weapon.ammoX + 20 and monsterArray[m][2] >= weapon.ammoY - 60 and monsterArray[m][2] <= weapon.ammoY + 70 then
		            monsterArray[m][10] = monsterArray[m][10] - weapon.bulletDamage
		            monsterArray[m][14] = true
		            monsterArray[m][4] = 1
		        else
		        	monsterArray[m][14] = false
		        end
		    elseif monsterArray[m][7] == 2 then
		    	if monsterArray[m][1] >= weapon.ammoX - 20 and monsterArray[m][1] <= weapon.ammoX + 20 and monsterArray[m][2] >= weapon.ammoY - 100 and monsterArray[m][2] <= weapon.ammoY + 200 then
		            monsterArray[m][10] = monsterArray[m][10] - weapon.bulletDamage
		            monsterArray[m][14] = true
		            monsterArray[m][4] = 1
		        else
		        	monsterArray[m][14] = false
		        end
		    end
		end
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
		if monsterArray[p][4] ~= 1 and monsterArray[1][16] == false then
			if monsterArray[p][3] == 1 then
				monsterArray[p][1] = monsterArray[p][1] + monsterArray[p][6]
				monsterArray[p][9] = monsterArray[p][12]
				monsterArray[p][13] = "right"
			end

			if monsterArray[p][3] == 2 then
				monsterArray[p][1] = monsterArray[p][1] - monsterArray[p][6]
				monsterArray[p][9] = monsterArray[p][12]
				monsterArray[p][13] = "left"
			end
			
			if monsterArray[p][3] ~= 2 and monsterArray[p][3] ~= 1 and monsterArray[p][4] ~= 1 then
				monsterArray[p][9] = monsterArray[p][11]
			end
		end
		if monsterArray[p][3] == 4 and monsterArray[p][2] > 300 then
			monsterArray[p][2] = monsterArray[p][2] - 10
			monsterArray[p][3] = 3
		end
		if monsterArray[p][13] ~= "left" and monsterArray[p][13] ~= "right" then
			monsterArray[p][13] = "still"
		end
	end

end

function monster.playerTracker(dt)

	for h = 1, monster.amount do
		if monsterArray[h][4] == 1 then
			if monsterArray[h][1] > player.x then
				monsterArray[h][1] = monsterArray[h][1] - monsterArray[h][6]
				monsterArray[h][9] = monsterArray[h][12]
				monsterArray[h][13] = "left"
			end

			if monsterArray[h][1] < player.x then
				monsterArray[h][1] = monsterArray[h][1] + monsterArray[h][6]
				monsterArray[h][9] = monsterArray[h][12]
				monsterArray[h][13] = "right"
			end
		end

		if monster.randomNumber == 4 or monster.randomNumber == 5 or monster.randomNumber == 6 or monster.randomNumber == 7 or monster.randomNumber == 8 then
			monsterArray[h][4] = love.math.random(1, 5)
		end
	end

end

function monster.bossBase(dt)

	for k = 1, monster.amount do
		if planetArray[currentPlanet][14] == true then --Creates boss
			monsterArray[1][16] = true
			monsterArray[1][17] = 6
		end
		if monsterArray[k][10] <= 0 and monsterArray[k][16] == true then --Kills boss
			love.graphics.setColor(255, 255, 255)
			planetArray[currentPlanet][14] = false
			monsterArray[k][16] = false
			inventory.graviNum = inventory.graviNum + 1

			if monsterArray[k][15] == 1 then
				weapon.currentWeapon = 2
			elseif monsterArray[k][15] == 2 then
				player.hasJetpack = true
			end

			monster.bossExtras = true
		end
		if monsterArray[k][16] == true and monster.bossExtras == true then --Adds boss extras
			monsterArray[k][10] = love.math.random(100, 200)

			monster.bossExtras = false
		end
	end

end

function monster.bossTracker(dt)

	for d = 1, monster.amount do
		if monsterArray[1][16] == true and planetArray[currentPlanet][14] == true then
			if monsterArray[d][1] > player.x then
				monsterArray[d][1] = monsterArray[d][1] - 1
				monsterArray[d][9] = monsterArray[d][12]
				monsterArray[d][13] = "left"
			end
			if monsterArray[d][1] < player.x then
				monsterArray[d][1] = monsterArray[d][1] + 1
				monsterArray[d][9] = monsterArray[d][12]
				monsterArray[d][13] = "right"
			end
		end
	end

end

function monster.physics(dt)

	for j = 1, monster.amount do
		monsterArray[j][2] = monsterArray[j][2] + monsterArray[j][8] --Gravity applied here
	end

end

function monster.draw()

	for b = 1, monster.amount do
		if player.onPlanet == true and monsterArray[b][10] > 0 then
			if monsterArray[b][13] == "left" or monsterArray[b][13] == "still" then
				if monsterArray[b][16] == true then
					if monsterArray[b][14] == true then
						love.graphics.setColor(255, 0, 0)
						love.graphics.draw(monsterArray[b][9], monsterArray[b][1], monsterArray[b][2] - 250, 0, monsterArray[b][17], monsterArray[b][17])
						love.timer.sleep(0.03)
					else
						love.graphics.setColor(75, 200, 75)
						love.graphics.draw(monsterArray[b][9], monsterArray[b][1], monsterArray[b][2] - 250, 0, monsterArray[b][17], monsterArray[b][17])
					end
				elseif monsterArray[b][16] == false and space.dayTime == 0 then
					if monsterArray[b][14] == true then
						love.graphics.setColor(255, 0, 0)
						love.graphics.draw(monsterArray[b][9], monsterArray[b][1], monsterArray[b][2], 0, monsterArray[b][17], monsterArray[b][17])
						love.timer.sleep(0.03)
					else
						love.graphics.setColor(75, 200, 75)
						love.graphics.draw(monsterArray[b][9], monsterArray[b][1], monsterArray[b][2], 0, monsterArray[b][17], monsterArray[b][17])
					end
				end
			elseif monsterArray[b][13] == "right" then
				if monsterArray[b][16] == true then
					if monsterArray[b][14] == true then
						love.graphics.setColor(255, 0, 0)
						love.graphics.draw(monsterArray[b][9], monsterArray[b][1] + 330, monsterArray[b][2] - 250, 0, -monsterArray[b][17], monsterArray[b][17])
						love.timer.sleep(0.03)
					else
						love.graphics.setColor(75, 200, 75)
						love.graphics.draw(monsterArray[b][9], monsterArray[b][1] + 330, monsterArray[b][2] - 250, 0, -monsterArray[b][17], monsterArray[b][17])
					end
				elseif monsterArray[b][16] == false and space.dayTime == 0 then
					if monsterArray[b][14] == true then
						love.graphics.setColor(255, 0, 0)
						love.graphics.draw(monsterArray[b][9], monsterArray[b][1] + 145, monsterArray[b][2], 0, -monsterArray[b][17], monsterArray[b][17])
						love.timer.sleep(0.03)
					else
						love.graphics.setColor(75, 200, 75)
						love.graphics.draw(monsterArray[b][9], monsterArray[b][1] + 145, monsterArray[b][2], 0, -monsterArray[b][17], monsterArray[b][17])
					end
				end
			end
		end
	end
	
end

function UPDATE_MONSTER(dt)

	monster.update(dt)
	monster.physics(dt)
	monster.playerTracker(dt)
	monster.movement(dt)
	monster.boundary(dt)
	monster.bossBase(dt)
	monster.bossTracker(dt)

end

function DRAW_MONSTER()

	monster.draw()

end