-- Include the Composer library
local composer = require( "composer" )

-- Removes status bar on iOS
-- https://docs.coronalabs.com/api/library/display/setStatusBar.html
display.setStatusBar( display.HiddenStatusBar ) 

-- -- Removes bottom bar on Android 
-- if system.getInfo( "androidApiLevel" ) and system.getInfo( "androidApiLevel" ) < 19 then
-- 	native.setProperty( "androidSystemUiVisibility", "lowProfile" )
-- else
-- 	native.setProperty( "androidSystemUiVisibility", "immersiveSticky" ) 
-- end

local bg_adjustment = 1

local bgimage = display.newImage("images/openingBG.jpg")
bgimage.xScale = (bg_adjustment  * bgimage.contentHeight)/bgimage.contentHeight
bgimage.yScale = bgimage.xScale
centerX = display.contentWidth / 2
centerY = display.contentHeight / 2
bgimage.x = centerX
bgimage.y = centerY

withScrn = display.contentWidth
heightScrn = display.contentHeight
topScrn = display.screenOriginY
leftScrn = display.screenOriginX


composer.gotoScene( "mainMenu", { effect = "fade"} )