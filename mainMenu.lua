local storyboard = require( "composer" )
local scene = storyboard.newScene()

-- local widget = require("widget")

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- variables
local menu_background
local bg_adjustment = 1
local game_title
local menuGroup
local menu_btn
local quit_btn
local menu_text
local cloud_img
local snake_sprite
local sheet_options = { 
	width=200, 
	height=200, 
	numFrames=8, 
	sheetContentWidth=800, 
	sheetContentHeight=400 
}
local sequence_options = {
	name = "normalRun",  
	start = 1,  
	count = 8,  
	time = 1600,  
	loopCount = 0, 
	loopDirection = "bounce"  
 } 



local clouds ={
	{getImage = "images/cloud01.png"}, 
	{getImage = "images/cloud02.png"},
	{getImage = "images/cloud03.png"}
   }
	

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	-- menuGroup = display.newGroup()

	-- background
		menu_background = display.newImageRect(sceneGroup, "images/openingBG.jpg", display.contentWidth, display.contentHeight)
		-- menu_background.xScale = (bg_adjustment  * menu_background.contentHeight)/menu_background.contentHeight
		menu_background.yScale = menu_background.xScale
		menu_background.x = display.contentCenterX
		menu_background.y  = display.contentCenterY
		menu_background.alpha=0
		transition.fadeIn( menu_background, { time=2000 } )

	-- title
		game_title = display.newImageRect(sceneGroup, "images/gameTitle.png", 250 , 160 )
		game_title.x = display.contentCenterX
		game_title.y  = 80
		game_title.alpha=0
		transition.fadeIn( game_title, { time=2000 } )

	-- buttons
		-- main menu
			menu_btn = display.newImageRect (sceneGroup,"images/button_notpressed.png", 120, 260)
			menu_btn.width = display.contentWidth*0.8
			menu_btn.height = (display.contentWidth*0.8)/4
			menu_btn.x = display.contentCenterX
			menu_btn.y =  260
			
			local function menu_btn_listener( event )
				transition.fadeIn( menu_btn, { time=2000 } )
			end
			timer.performWithDelay( 500, menu_btn_listener )
			
			local function menu_btn_tap(event)
				storyboard.gotoScene(  "snakeMenu", { time=1000, effect="crossFade" } )
				return true
			end
			menu_btn:addEventListener("tap", menu_btn_tap)

		-- quit btn
			quit_btn = display.newImageRect (sceneGroup,"images/quit.png", 112, 117)
			quit_btn.x = display.contentWidth-40
			quit_btn.y = display.contentHeight- 40
			quit_btn.width = 50
			quit_btn.height =50
			-- quit_btn.destination = "ludoai"

			local function quit_btn_listener( event )
				transition.fadeIn( quit_btn, { time=2000 } )
			end
			timer.performWithDelay( 500, quit_btn_listener )

			local function quit_btn_tap(event)
				os.exit()
				return true
			end
			quit_btn:addEventListener("tap", quit_btn_tap)
			
	-- texts
		-- menu text
			menu_text = display.newText( sceneGroup,"Snake-Ladder", 100, 200, native.systemFont, 35 )
			menu_text.x = display.contentCenterX
			menu_text.y =  260
			menu_text:setFillColor( 0, 0, 0 )

	-- animation
		-- clouds

			local cX = display.contentCenterX
			local cY = display.contentCenterY

			for i=0,2 do

			imagesId = math.random (1,3)
			local cloud = display.newImage(clouds[imagesId].getImage   )
			cloud.x = math.random (display.screenOriginX , cX )
			cloud.y = math.random (display.screenOriginY + cloud.height, cY)
			
			cloud.alpha = 0.7
			transition.to( cloud, {time = math.random (30000 , 120000), x = display.contentWidth + 300 } )

			end 

		-- snake sprite
			snake_sheet = graphics.newImageSheet("images/snakesprite.png", sheet_options )
			
			snake_sprite = display.newSprite( sceneGroup, snake_sheet, sequence_options )
			snake_sprite.x = display.contentWidth / 2
			snake_sprite.y = menu_btn.y + 130
			snake_sprite:play()

end

local function onKeyEvent( event )
		    if (event.keyName == "back") and (system.getInfo("platformName") == "Android") then 
				return true
		    end

		    
end


-- show()
function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
		

	elseif ( phase == "did" ) then
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


-- destroy()
function scene:destroy( event )
	local sceneGroup = self.view

end




scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


---------------------------------------------------------------------------------

return scene---------------------------------------------------------
