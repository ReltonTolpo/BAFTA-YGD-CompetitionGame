mobile = {}

function mobile.load()

	buttons = {left=false,right=false,up=false,fire=false,inventory=false,enter=false}


end

function mobile.update()

	buttons.left = mobile.checkButton(115,650)
	buttons.right = mobile.checkButton(320,650)
	buttons.up = mobile.checkButton(1050,650)
	buttons.fire = mobile.checkButton(850,650)
	buttons.inventory = mobile.checkButton(650,650)
	buttons.enter = mobile.checkButton(230,500)


end

function mobile.draw()

	mobile.drawButton("<",115,650,buttons.left)
	mobile.drawButton(">",320,650,buttons.right)
	mobile.drawButton("E",230,500,buttons.enter)
	mobile.drawButton("I",650,650,buttons.inventory)
	mobile.drawButton("F",850,650,buttons.fire)
	mobile.drawButton("^",1050,650,buttons.up)


end

function UPDATE_MOBILE()

	mobile.update()

end

function DRAW_MOBILE()

	mobile.draw()

end

function mobile.drawButton(text,x,y,selected)

	if selected then love.graphics.setColor(50,50,50,100) else love.graphics.setColor(200,200,200,100) end
	love.graphics.circle("fill",x,y,80)
	love.graphics.setColor(0,0,0)
	love.graphics.print(text,x-10,y-10,0,3)

end

function mobile.checkButton(x,y)

	down,mx,my = love.mouse.isDown(1), love.mouse.getX(), love.mouse.getY()

	if down == true and mx > (x-80)*scale and mx < (x+80)*scale and my > (y-80)*scale and my < (y+80)*scale then
		return true
	else return false end

end