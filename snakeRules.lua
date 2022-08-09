display.setStatusBar( display.HiddenStatusBar )

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local widget = require("widget")



-- create a tabBar widget with two buttons at the bottom of the screen
local function btnTap(event)
	event.target.xScale = 0.95
	event.target.yScale =0.95
	scrollView:removeSelf()
	scrollView = nil
	storyboard.gotoScene (  event.target.destination, {effect = "slideUp"} )
	return true
end


function scene:createScene(event)
	group = self.view	

	
	local function scrollListener( event )

    local phase = event.phase
    local direction = event.direction

    	if event.limitReached then
    		if "up" == direction then
    			print("Reached Top Limit")
    		elseif "down" == direction then
    			print("Reached Bottom Limit")
    		end
    	end

        return true
    end

	
-- Create the widget
scrollView = widget.newScrollView
{
    top = 0,
    left = 0,
    width = display.contentWidth,
    height = display.contentHeight,
    topPadding = 50,
    bottomPadding = 30,
    horizontalScrollDisabled = true,
    verticalScrollDisabled = false,
    listener = scrollListener,
    hideBackground = true,
    
}	

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
    scrollView:insert(cloud)
    cloud.alpha = 0.7
    transition.to( cloud, {time = math.random (30000 , 120000), x = withScrn + 300 } )

    end 

local heading = "Snake-Ladder Rules"
local lotsofTextObject = display.newText(heading,0,40,280,0,"BeautifulEveryTime",25)
lotsofTextObject:setFillColor(0,0,0)
lotsofTextObject.x = display.contentCenterX + 25
scrollView:insert(lotsofTextObject) 

    
    background = display.newImageRect("images/dialog1.png",display.contentWidth*3.3,300)
    background.xScale=.30
    background.x = display.contentWidth/2 
    background.y =  display.contentWidth/2 + 40 
    scrollView:insert(background)




local lotsofText = "In case of single player vs device, deice will draw the dice for it's turn" 

local lotsofTextObject = display.newText(lotsofText,0,195+40,200,0,"BeautifulEveryTime",16)
lotsofTextObject:setFillColor(0,0,0)
lotsofTextObject.x = background.x + 10
lotsofTextObject.y = background.y - 20
scrollView:insert(lotsofTextObject)

    background2 = display.newImageRect("images/dialog2.png",display.contentWidth*3.3,300)
    background2.xScale=.30
    background2.x = background.x 
    background2.y =  background.y + 210 + 40
    scrollView:insert(background2)

local lotsofText2 = "For two or more player, each player has to tap on device screen or shake the device to draw dice"

local lotsofTextObject2 = display.newText(lotsofText2,0,195+40,200,0,"BeautifulEveryTime",16)
lotsofTextObject2:setFillColor(0,0,0)
lotsofTextObject2.x = background2.x + 10
lotsofTextObject2.y = background2.y - 20
scrollView:insert(lotsofTextObject2)
  
    background3 = display.newImageRect("images/dialog3.png",display.contentWidth*3.3,300)
    background3.xScale=.30
    background3.x = background.x 
    background3.y =  background2.y + 210 +40
    scrollView:insert(background3)

local lotsofText3 = "If you are at a cell where there is a bottom part of a ladder, you will crawl up the ladder automatically"

local lotsofTextObject3 = display.newText(lotsofText3,0,195+40,200,0,"BeautifulEveryTime",16)
lotsofTextObject3:setFillColor(0,0,0)
lotsofTextObject3.x = background3.x + 10
lotsofTextObject3.y = background3.y - 15
scrollView:insert(lotsofTextObject3) 

    background4 = display.newImageRect("images/dialog4.png",display.contentWidth*3.3,300)
    background4.xScale=.30
    background4.x = background.x 
    background4.y =  background3.y + 210 +40
    scrollView:insert(background4)

local lotsofText4 = "If you are at a cell where there is a snake mouth, you will be dragged to the tail of it"

local lotsofTextObject4 = display.newText(lotsofText4,0,195+40,200,0,"BeautifulEveryTime",16)
lotsofTextObject4:setFillColor(0,0,0)
lotsofTextObject4.x = background4.x + 10
lotsofTextObject4.y = background4.y - 15
scrollView:insert(lotsofTextObject4) 

local backbtn = display.newImageRect ("images/backbutton.png", 50, 50)
	backbtn.y = 1130 
	backbtn.x = 30 
	backbtn.destination = "snakeMenu" 
	backbtn:addEventListener("tap", btnTap)
	scrollView:insert(backbtn) 


end 

function scene:enterScene(event)
	group = self.view



end 
 
function scene:exitScene(event)
	group = self.view

end




function scene:destroyScene(event)
	group = self.view 
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene