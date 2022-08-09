
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

withScrn = display.contentWidth
heightScrn = display.contentHeight
topScrn = display.screenOriginY
leftScrn = display.screenOriginX

local widget = require("widget")

function catchBackgroundOverlay(event)
	return true 
end

function scene:createScene( event )
	local group = self.view
	
	local backgroundOverlay = display.newRect (group, leftScrn-1000, topScrn-1000, withScrn+1000, heightScrn+1000)
				backgroundOverlay:setFillColor( black )
				backgroundOverlay.alpha = 0.6
				backgroundOverlay.isHitTestable = true
				backgroundOverlay:addEventListener ("tap", catchBackgroundOverlay)
				backgroundOverlay:addEventListener ("touch", catchBackgroundOverlay)
				
	local imageRandom = math.random(3);
	 if imageRandom==1 then
		overlay = display.newImageRect ("images/msg1.png", 300 , 200)
		overlay.x = centerX
		overlay.y = centerY
		group:insert (overlay)
	 elseif imageRandom==2 then
	 	overlay = display.newImageRect ("images/msg2.png", 300 , 200)
		overlay.x = centerX
		overlay.y = centerY
		group:insert (overlay)
	else
		overlay = display.newImageRect ("images/msg3.png", 300 , 200)
		overlay.x = centerX
		overlay.y = centerY
		group:insert (overlay)
	 end	
				
	
				
	local closeBtn = display.newImageRect ("images/close_icon.png", 60, 60)
				closeBtn.x = centerX
				closeBtn.y = centerY + overlay.height/2
				local function hideOverlay(event)
					storyboard.hideOverlay("fade", 800)
				end 
				closeBtn:addEventListener ("tap", hideOverlay)
				group:insert(closeBtn)
end

function scene:enterScene( event )
	local group = self.view

	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	-- INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view


	-- INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks

end


-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

return scene



