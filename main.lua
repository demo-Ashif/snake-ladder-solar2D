-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )

-- load composer scene management library
local composer = require( "composer" )

-- local bg_adjustment = 1

-- local bgimage = display.newImage("images/openingBG.jpg")
-- bgimage.xScale = (bg_adjustment  * bgimage.contentHeight)/bgimage.contentHeight
-- bgimage.yScale = bgimage.xScale
-- centerX = display.contentWidth / 2
-- centerY = display.contentHeight / 2
-- bgimage.x = centerX
-- bgimage.y = centerY

-- withScrn = display.contentWidth
-- heightScrn = display.contentHeight
-- topScrn = display.screenOriginY
-- leftScrn = display.screenOriginX

-- system events
local function onSystemEvent( event )
        
    local eventType = event.type
    
    if ( eventType == "applicationStart" ) then
        -- Occurs when the application is launched and all code in "main.lua" is executed
    elseif ( eventType == "applicationExit" ) then
        -- Occurs when the user or OS task manager quits the application
    elseif ( eventType == "applicationSuspend" ) then
        -- Perform all necessary actions for when the device suspends the application, i.e. during a phone call
    elseif ( eventType == "applicationResume" ) then
        -- Perform all necessary actions for when the app resumes from a suspended state
    end
end
Runtime:addEventListener( "system", onSystemEvent )

-- recycle on scene change
composer.recycleOnSceneChange = true

composer.gotoScene( "mainMenu")