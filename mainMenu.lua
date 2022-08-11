local storyboard = require( "composer" )
local scene = storyboard.newScene()
local widget = require("widget")

local title

local menuGroup;


local function btnTap1(event)
	os.exit()
	return true
end

function scene:create( event )

	local group = self.view
	menuGroup = display.newGroup()

	-- local image = display.newImageRect( "images/gameTitle.png", 250, 160 )
	-- image.x = display.contentCenterX
	-- image.y = display.contentCenterY
	-- group:insert(image)
	
	title = display.newImageRect( "images/gameTitle.png", 250 , 160 )
	title.x = centerX
	title.y  = 80
	menuGroup:insert(title)

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
	menuGroup:insert(cloud)
	cloud.alpha = 0.7
	transition.to( cloud, {time = math.random (30000 , 120000), x = withScrn + 300 } )

	end 

	sheetData = { width=200, height=200, numFrames=8, sheetContentWidth=800, sheetContentHeight=400 }
	 
	mySheet = graphics.newImageSheet( "images/snakesprite.png", sheetData )

	sequenceData = {
	 
	  { 
	  	name = "normalRun",  
	    start = 1,  
	    count = 8,  
	    time = 1600,  
	    loopCount = 0, 
	    loopDirection = "bounce"  
	  } 
	 
	}

	-- local animation = display.newSprite( mySheet, sequenceData )
	-- animation.x = display.contentWidth / 2
	-- animation.y = optionsBtn.y + 130
    -- animation:play()
    -- menuGroup:insert(animation)

    reloadbtn = display.newImageRect ("images/quit.png", 112, 117)
	reloadbtn.x = display.contentWidth-40
	reloadbtn.y = display.contentHeight- 40
	reloadbtn.width = 50
	reloadbtn.height =50
	reloadbtn.destination = "ludoai" 
	reloadbtn:addEventListener("touch", btnTap1)
	menuGroup:insert(reloadbtn)
end

local function onKeyEvent( event )
		    if (event.keyName == "back") and (system.getInfo("platformName") == "Android") then 
				return true
		    end

		    
		end

-- function scene:enterScene( event )
-- 	local group = self.view
-- 	Runtime:addEventListener( "key", onKeyEvent );
	

-- end

function scene:show( event )
	local group = self.view
	-- Runtime:addEventListener( "key", onKeyEvent );
	local phase = event.phase
 
    if ( phase == "will" ) then
        local function btnTap(event)
			-- print( "Tap event on: " .. self.name )
			-- print( "Tap event on: " .. event.target.destination )
			storyboard.gotoScene(  event.target.destination, {effect = "fade"} )
			return true
		end

		local optionsBtn = widget.newButton
		{
		width = display.contentWidth*0.8,
		height = (display.contentWidth*0.8)/4,
		defaultFile = "images/button_notpressed.png",
		overFile = "images/button_pressed.png",
		label="Snake-Ladder",
		labelColor = { default = { 250, 255, 250}, 
							over ={0,0,0  }},
		fontSize = "35",
		}
		optionsBtn.x = centerX
		optionsBtn.y = 80 + 180
		optionsBtn.destination = "snakeMenu"
		-- optionsBtn.tap = btnTap
		optionsBtn:addEventListener("tap", btnTap)
		-- group:insert(optionsBtn)

		local animation = display.newSprite( mySheet, sequenceData )
		animation.x = display.contentWidth / 2
		animation.y = optionsBtn.y + 130
		animation:play()
    elseif ( phase == "did" ) then
		print( "Scene show did" )
        -- Code here runs when the scene is entirely on screen
 
    end
	

end



-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
		-- display.remove( menuGroup )
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
		
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end



function scene:destroy( event )
	local group = self.view


end




scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


---------------------------------------------------------------------------------

return scene---------------------------------------------------------
