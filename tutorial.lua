tutorial = {}


function tutorial.load()

	tutorial.counter = 0
	tutorial.counterUp = true

end

function tutorial.draw()
	
	function tutorial.tag(x,y,text,a)

		love.graphics.setColor(207, 190, 4, a)
	    love.graphics.rectangle("fill", x-200, y-200, 200, 120 )
	    love.graphics.line(x-200, y-200, x, y)
	    love.graphics.setColor(0, 0, 0, a)
	    love.graphics.print(text, x-200, y-200, 0, 1, 1)

	end

	showhint = false
	hintString = "ERROR"

	if tutorial.counter < 300 then
		hintString = "Welcome to Graviton Galaxy!"
		showhint = true
	end

	if tutorial.counter > 500 and tutorial.counter < 1200 then
		hintString = "Use A and D to move you \naround. \n\nSpace to jump and S to crouch \n(crouch means you don't move \nwhilst turning)."
		showhint = true
	end

	if tutorial.counter > 1400 and tutorial.counter < 2200 then
		hintString = "You are currently standing on \na safe planet. My home \nplanet has had its gravitons \nstolen by alien creatures, \nmaking its gravity extremely \nunstable and no longer suitable \nto support human life!"
		showhint = true
	end

	if tutorial.counter > 2200 and tutorial.counter < 3100 then
		hintString = "Your mission is to kill 5 \nevil alien bosses and recover \ntheir gravitons to help me \nrestore my home planet to its \nformer glory!!"
		showhint = true
	end

	if tutorial.counter > 3100 and tutorial.counter < 3900 then
		hintString = "Once you have killed these \nterrible 5, a portal \nwill open to my home \nplanet for you to \njump through, and supply \nthe gravitons."
		showhint = true
	end

	if tutorial.counter > 3900 and tutorial.counter < 4500 then
		hintString = "As you can see, it is \ncurrently day on this \nplanet. When it turns night, \nall the evil creatures \ncome out and attack you. \nYou have to defend yourself \nwith your gun and \nlimited ammo!"
		showhint = true
	end
	 
	if tutorial.counter > 4500 and tutorial.counter < 5000 then
		hintString = "You fire by clicking \nwhilst using A and D \nto aim. Some monsters reqire \nyou to jump in order for \nyour bullets to hit them. \n\nYou can collect more ammo \nfrom your ship."
		showhint = true
	end

	if tutorial.counter > 5000 and tutorial.counter < 5500 and smokeActive == false and player.onPlanet == true and liftoff == false and space.tutorialDone == false then
		hintString = "Go ahead! \n\nWalk up to the spaceship \nand press E to enter it. \nE does many things \nlike entering the ship \nand landing on planets."
		showhint = true
	end

	if showhint == true then
		tutorial.tag(player.x, player.y, hintString, player.alpha)
	end

end

function tutorial.update()



	if tutorial.counterUp == true and player.tutorialOn == true then
		tutorial.counter = tutorial.counter + player.tickspeed
	end

	if player.tutorialOn == false then
		tutorial.counter = 1000000
	end

	if tutorial.counter > 5000 and tutorial.counter < 5500 and player.onPlanet == true then
		tutorial.counterUp = false
	end

end

function UPDATE_TUTORIAL()

	tutorial.update()

end

function DRAW_TUTORIAL()

	if player.tutorialOn == true then
		if player.onPlanet == true then
			tutorial.draw()
		end
	end

end