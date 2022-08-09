local storyboard = require( "composer" )
local scene = storyboard.newScene()
local widget = require("widget")



-- local forward references should go here --

local function btnTap(event)
	event.target.xScale = 0.95
	event.target.yScale =0.95
	storyboard.gotoScene (  event.target.destination, {effect = "slideDown"} )
	return true
end

-- Called when the scene's view does not exist:
function scene:create( event )
	local group = self.view
	print( "Called snake menu" )

	
	if animation1 ~= nil then
		group:insert(animation1)
	end
	diceshot=nil;--score of player to be saved
	playerCount = nil;--counting who can shot now
	playstart=nil;--checking which player play the game
	playerwin=nil;
	totalwin=nil;
	winserial=nil;
	if dice ~=nil then 
		dice:removeSelf( )
		dice=nil
	end
	if animation1 ~= nil then
		animation1:removeSelf( )
		animation1 = nil
	end
	local title= display.newImageRect ("images/optionstitle.png", 297, 99)
	title.x = centerX
	title.y  = 30
	group:insert(title)
	
	clouds ={
	 {getImage = "images/cloud01.png"}, 
	 {getImage = "images/cloud02.png"},
	 {getImage = "images/cloud03.png"}
	}

	for i=0,2 do

	imagesId = math.random (1,3)
	local cloud = display.newImage(clouds[imagesId].getImage   )
	cloud.x = math.random (display.screenOriginX , centerX )
	cloud.y = math.random (display.screenOriginY + cloud.height, centerY)
	group:insert(cloud)
	cloud.alpha = 0.7
	transition.to( cloud, {time = math.random (30000 , 120000), x = withScrn + 300 } )

	end 
	
	local backbtn = display.newImageRect ("images/backbutton.png", 80, 80)
	backbtn.y = heightScrn - 0.6 * backbtn.height 
	backbtn.x = .6 * backbtn.width 
	backbtn.destination = "mainMenu" 
	backbtn:addEventListener("tap", btnTap)
	group:insert(backbtn) 

	-- create custom buttom
	local playBtn1 = widget.newButton
	{
	width = 200,
    height = 50,
    defaultFile = "images/button_notpressed.png",
    overFile = "images/button_pressed.png",
    label="Single player",
	labelColor = { default = { 250, 255, 250}, 
						over ={0,0,0  }},
	fontSize = "25",
	}
	playBtn1.x = centerX
	playBtn1.y = title.y + 100
	playBtn1.destination = "snake1vsaiEXP"
	playBtn1:addEventListener("tap", btnTap)
	group:insert(playBtn1)

	local playBtn2 = widget.newButton
	{
	width = 200,
    height = 50,
    defaultFile = "images/button_notpressed.png",
    overFile = "images/button_pressed.png",
    label="Two player",
	labelColor = { default = { 250, 255, 250}, 
						over ={0,0,0  }},
	fontSize = "25",
	}
	playBtn2.x = centerX
	playBtn2.y = playBtn1.y + 60
	playBtn2.destination = "snake2playerEXP"
	playBtn2:addEventListener("tap", btnTap)
	group:insert(playBtn2)

	local playBtn3 = widget.newButton
	{
	width = 200,
    height = 50,
    defaultFile = "images/button_notpressed.png",
    overFile = "images/button_pressed.png",
    label="Three player",
	labelColor = { default = { 250, 255, 250}, 
						over ={0,0,0  }},
	fontSize = "25",
	}
	playBtn3.x = centerX
	playBtn3.y = playBtn2.y + 60
	playBtn3.destination = "snake3playerEXP"
	playBtn3:addEventListener("tap", btnTap)
	group:insert(playBtn3)

	local playBtn4 = widget.newButton
	{
	width = 200,
    height = 50,
    defaultFile = "images/button_notpressed.png",
    overFile = "images/button_pressed.png",
    label="Four player",
	labelColor = { default = { 250, 255, 250}, 
						over ={0,0,0  }},
	fontSize = "25",
	}
	playBtn4.x = centerX
	playBtn4.y = playBtn3.y + 60
	playBtn4.destination = "snake4playerEXP"
	playBtn4:addEventListener("tap", btnTap)
	group:insert(playBtn4)

	local playBtn5 = widget.newButton
	{
	width = 200,
    height = 50,
    defaultFile = "images/button_notpressed.png",
    overFile = "images/button_pressed.png",
    label="Rules",
	labelColor = { default = { 250, 255, 250}, 
						over ={0,0,0  }},
	fontSize = "25",
	}
	playBtn5.x = centerX
	playBtn5.y = playBtn4.y + 60
	playBtn5.destination = "snakeRules"
	playBtn5:addEventListener("tap", btnTap)
	group:insert(playBtn5)
	
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local group = self.view
	

	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)

end


-- Called when scene is about to move offscreen:
function scene:hide( event )
	local group = self.view

	-- INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroy( event )
	local group = self.view

	-- INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks

end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


---------------------------------------------------------------------------------

return scene