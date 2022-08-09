_W = display.viewableContentWidth
_H = display.viewableContentHeight
print(_W.."   ".._H)

display.setStatusBar( display.HiddenStatusBar )
system.setIdleTimer( false )
local storyboard = require ("composer")
local scene = storyboard.newScene()
local widget = require("widget")

flag=true

dice=nil
local animation
local animation2
local dice
win=0


--intializing
	diceshot={0,0};--score of player to be saved
	playerCount = 0;--counting who can shot now
	playstart={0,0};--checking which player play the game
	firsttap=1
	

	
-- local forward references should go here --

local function btnTap(event)
	group:insert(dice) 
	group:removeSelf()
	system.setIdleTimer( true )
	--group = nil
	--p1=nil
	--background=nil
	--position=nil
	--bg=nil
	--bgsh=nil
	--bgh=nil
	--bgw=nil
	--diceSound=nil
	--ladders=nil
	--snake=nil
	--i=nil
	--rand=nil
	--dicenumber=nil
	--lad=nil
	--snake=nil
	--player=nil
	--backbtn=nil
	if animation1 ~= nil then
		group:insert(animation1)
	end
	if animation~=nil then
		animation=nil
	end
	if dice ~= nil then
		dice=nil
	end
	event.target.xScale = 0.95
	event.target.yScale =0.95
	storyboard.gotoScene (  event.target.destination, {effect = "slideUp"} )
	return true
end

local function btnTap1(event)
	p1.x = bg.x-1*bgw+5*bgsh;
	p1.y = display.contentHeight-60;
	p2.x = bg.x-2*bgw+22*bgsh;
	p2.y = display.contentHeight-60;
	
	diceshot={0,0};
	playstart={0,0};
	playerwin={0,0};
	playerCount=0;
	i=0;
	print("why");
	player.text="player 1 turn! 100 to win";
				
	transition.moveTo( p1, { x= bg.x-1*bgw+5*bgsh, y= display.contentHeight-60});
	transition.moveTo( p2, { x= bg.x-2*bgw+22*bgsh, y= display.contentHeight-60});

if animation1 ~= nil then
	animation1:removeSelf()
	animation1 = display.newSprite( mySheet1, sequenceData1 )
	animation1.x = bg.x-1*bgw+5*bgsh
	animation1.y = display.contentHeight-30
	animation1:play()
end
	
				--starting new everything
	return true
end
local function btnTap2()
	p1.x = bg.x-1*bgw+5*bgsh;
	p1.y = display.contentHeight-60;
	p2.x = bg.x-2*bgw+22*bgsh;
	p2.y = display.contentHeight-60;
	win=0
	diceshot={0,0};
	playstart={0,0};
	playerwin={0,0};
	playerCount=0;
	i=0;
	print("why");
	player.text="player 1 turn! 100 to win";
				
	transition.moveTo( p1, { x= bg.x-1*bgw+5*bgsh, y= display.contentHeight-60});
	transition.moveTo( p2, { x= bg.x-2*bgw+22*bgsh, y= display.contentHeight-60});

if animation1 ~= nil then
	animation1:removeSelf()
	animation1 = display.newSprite( mySheet1, sequenceData1 )
	animation1.x = bg.x-1*bgw+5*bgsh
	animation1.y = display.contentHeight-30
	animation1:play()
end
	
				--starting new everything
	return true
end

function scene:createScene(event)
	 group = self.view

	 diceshot={0,0};--score of player to be saved
	playerCount = 0;--counting who can shot now
	playstart={0,0};--checking which player play the game
	
	local bg_adjustment = 0.3

	bgimage = display.newImage("images/Back.png")
	bgimage.xScale = (bg_adjustment  * bgimage.contentHeight)/bgimage.contentHeight
	bgimage.yScale = bgimage.xScale
	bgimage.x = display.contentWidth / 2
	bgimage.y = display.contentHeight / 2
	group:insert(bgimage)

	--background
	 screen_adjustment = .325
	local bgn=math.random(2);
	 if bgn==1 then
		bg = display.newImage("images/snake/bg.png")
	 else
	 	bg = display.newImage("images/snake/bg2.png")
	 end	
	bg.xScale = .167
	bg.yScale = .316
	bg.x = display.contentWidth / 2
	bg.y = display.contentHeight / 2-(14*_H/550)
	bgw=bg.contentWidth/10;
	bgh=bg.contentHeight/10;
	bgsh=bg.contentHeight/100;
	group:insert(bg);
	 bgw=bg.contentWidth/10;
	 bgh=bg.contentHeight/10;
	 bgsh=bg.contentHeight/100;

	  bgw=bg.contentWidth/10;
	 bgh=bg.contentHeight/10;
	 bgsh=bg.contentHeight/100;

	position = {
		{x=bg.x-5*bgw+5*bgsh, y = bg.y+4*bgh+5*bgsh},
		{x=bg.x-4*bgw+5*bgsh, y = bg.y+4*bgh+5*bgsh},
		{x=bg.x-3*bgw+5*bgsh ,y = bg.y+4*bgh+5*bgsh},
		{x=bg.x-2*bgw+5*bgsh, y = bg.y+4*bgh+5*bgsh},
		{x=bg.x-1*bgw+5*bgsh, y = bg.y+4*bgh+5*bgsh},
		{x=bg.x-0*bgw+5*bgsh, y = bg.y+4*bgh+5*bgsh},
		{x=bg.x+1*bgw+5*bgsh, y = bg.y+4*bgh+5*bgsh},
		{x=bg.x+2*bgw+5*bgsh, y = bg.y+4*bgh+5*bgsh},
		{x=bg.x+3*bgw+5*bgsh, y = bg.y+4*bgh+5*bgsh},
		{x=bg.x+4*bgw+5*bgsh, y = bg.y+4*bgh+5*bgsh},
		-------------
		{x= bg.x+4*bgw+5*bgsh, y = bg.y+3*bgh+5*bgsh},
		{x= bg.x+3*bgw+5*bgsh, y = bg.y+3*bgh+5*bgsh},
		{x= bg.x+2*bgw+5*bgsh, y = bg.y+3*bgh+5*bgsh},
		{x= bg.x+1*bgw+5*bgsh, y = bg.y+3*bgh+5*bgsh},
		{x= bg.x+0*bgw+5*bgsh, y = bg.y+3*bgh+5*bgsh},
		{x= bg.x-1*bgw+5*bgsh, y =bg.y+3*bgh+5*bgsh},
		{x= bg.x-2*bgw+5*bgsh, y = bg.y+3*bgh+5*bgsh},
		{x=bg.x-3*bgw+5*bgsh, y = bg.y+3*bgh+5*bgsh},
		{x= bg.x-4*bgw+5*bgsh, y = bg.y+3*bgh+5*bgsh},
		{x= bg.x-5*bgw+5*bgsh, y = bg.y+3*bgh+5*bgsh},
		------------------
		{x=bg.x-5*bgw+5*bgsh, y =bg.y+2*bgh+5*bgsh},
		{x=bg.x-4*bgw+5*bgsh, y = bg.y+2*bgh+5*bgsh},
		{x=bg.x-3*bgw+5*bgsh ,y = bg.y+2*bgh+5*bgsh},
		{x=bg.x-2*bgw+5*bgsh, y = bg.y+2*bgh+5*bgsh},
		{x=bg.x-1*bgw+5*bgsh, y = bg.y+2*bgh+5*bgsh},
		{x=bg.x-0*bgw+5*bgsh, y = bg.y+2*bgh+5*bgsh},
		{x=bg.x+1*bgw+5*bgsh, y = bg.y+2*bgh+5*bgsh},
		{x=bg.x+2*bgw+5*bgsh, y = bg.y+2*bgh+5*bgsh},
		{x=bg.x+3*bgw+5*bgsh, y = bg.y+2*bgh+5*bgsh},
		{x=bg.x+4*bgw+5*bgsh, y =bg.y+2*bgh+5*bgsh},
		-------------
		{x= bg.x+4*bgw+5*bgsh, y = bg.y+1*bgh+5*bgsh},
		{x= bg.x+3*bgw+5*bgsh, y = bg.y+1*bgh+5*bgsh},
		{x= bg.x+2*bgw+5*bgsh, y = bg.y+1*bgh+5*bgsh},
		{x= bg.x+1*bgw+5*bgsh, y = bg.y+1*bgh+5*bgsh},
		{x= bg.x+0*bgw+5*bgsh, y = bg.y+1*bgh+5*bgsh},
		{x= bg.x-1*bgw+5*bgsh, y =bg.y+1*bgh+5*bgsh},
		{x= bg.x-2*bgw+5*bgsh, y = bg.y+1*bgh+5*bgsh},
		{x= bg.x-3*bgw+5*bgsh, y = bg.y+1*bgh+5*bgsh},
		{x= bg.x-4*bgw+5*bgsh, y = bg.y+1*bgh+5*bgsh},
		{x= bg.x-5*bgw+5*bgsh, y = bg.y+1*bgh+5*bgsh},
		
		-----------------------------
		{x=bg.x-5*bgw+5*bgsh, y = bg.y+0*bgh+5*bgsh},
		{x=bg.x-4*bgw+5*bgsh, y = bg.y+0*bgh+5*bgsh},
		{x=bg.x-3*bgw+5*bgsh ,y = bg.y+0*bgh+5*bgsh},
		{x=bg.x-2*bgw+5*bgsh, y = bg.y+0*bgh+5*bgsh},
		{x=bg.x-1*bgw+5*bgsh, y = bg.y+0*bgh+5*bgsh},
		{x=bg.x-0*bgw+5*bgsh, y = bg.y+0*bgh+5*bgsh},
		{x=bg.x+1*bgw+5*bgsh, y = bg.y+0*bgh+5*bgsh},
		{x=bg.x+2*bgw+5*bgsh, y = bg.y+0*bgh+5*bgsh},
		{x=bg.x+3*bgw+5*bgsh, y = bg.y+0*bgh+5*bgsh},
		{x=bg.x+4*bgw+5*bgsh, y = bg.y+0*bgh+5*bgsh},
		----------------------
		{x= bg.x+4*bgw+5*bgsh, y = bg.y-1*bgh+5*bgsh},
		{x= bg.x+3*bgw+5*bgsh, y = bg.y-1*bgh+5*bgsh},
		{x= bg.x+2*bgw+5*bgsh, y = bg.y-1*bgh+5*bgsh},
		{x= bg.x+1*bgw+5*bgsh, y = bg.y-1*bgh+5*bgsh},
		{x= bg.x+0*bgw+5*bgsh, y = bg.y-1*bgh+5*bgsh},
		{x= bg.x-1*bgw+5*bgsh, y =bg.y-1*bgh+5*bgsh},
		{x= bg.x-2*bgw+5*bgsh, y = bg.y-1*bgh+5*bgsh},
		{x= bg.x-3*bgw+5*bgsh, y = bg.y-1*bgh+5*bgsh},
		{x= bg.x-4*bgw+5*bgsh, y = bg.y-1*bgh+5*bgsh},
		{x= bg.x-5*bgw+5*bgsh, y = bg.y-1*bgh+5*bgsh},
		
		------------------
		{x=bg.x-5*bgw+5*bgsh, y = bg.y-2*bgh+5*bgsh},
		{x=bg.x-4*bgw+5*bgsh, y = bg.y-2*bgh+5*bgsh},
		{x=bg.x-3*bgw+5*bgsh ,y = bg.y-2*bgh+5*bgsh},
		{x=bg.x-2*bgw+5*bgsh, y = bg.y-2*bgh+5*bgsh},
		{x=bg.x-1*bgw+5*bgsh, y = bg.y-2*bgh+5*bgsh},
		{x=bg.x-0*bgw+5*bgsh, y = bg.y-2*bgh+5*bgsh},
		{x=bg.x+1*bgw+5*bgsh, y = bg.y-2*bgh+5*bgsh},
		{x=bg.x+2*bgw+5*bgsh, y = bg.y-2*bgh+5*bgsh},
		{x=bg.x+3*bgw+5*bgsh, y =bg.y-2*bgh+5*bgsh},
		{x=bg.x+4*bgw+5*bgsh, y = bg.y-2*bgh+5*bgsh},
		----------------------
		{x= bg.x+4*bgw+5*bgsh, y = bg.y-3*bgh+5*bgsh},
		{x= bg.x+3*bgw+5*bgsh, y = bg.y-3*bgh+5*bgsh},
		{x= bg.x+2*bgw+5*bgsh, y = bg.y-3*bgh+5*bgsh},
		{x= bg.x+1*bgw+5*bgsh, y = bg.y-3*bgh+5*bgsh},
		{x= bg.x-0*bgw+5*bgsh, y = bg.y-3*bgh+5*bgsh},
		{x= bg.x-1*bgw+5*bgsh, y =bg.y-3*bgh+5*bgsh},
		{x= bg.x-2*bgw+5*bgsh, y = bg.y-3*bgh+5*bgsh},
		{x= bg.x-3*bgw+5*bgsh, y = bg.y-3*bgh+5*bgsh},
		{x= bg.x-4*bgw+5*bgsh, y = bg.y-3*bgh+5*bgsh},
		{x= bg.x-5*bgw+5*bgsh, y = bg.y-3*bgh+5*bgsh},
		
		----------------
		{x=bg.x-5*bgw+5*bgsh, y = bg.y-4*bgh+5*bgsh},
		{x=bg.x-4*bgw+5*bgsh, y = bg.y-4*bgh+5*bgsh},
		{x=bg.x-3*bgw+5*bgsh ,y = bg.y-4*bgh+5*bgsh},
		{x=bg.x-2*bgw+5*bgsh, y = bg.y-4*bgh+5*bgsh},
		{x=bg.x-1*bgw+5*bgsh, y = bg.y-4*bgh+5*bgsh},
		{x=bg.x-0*bgw+5*bgsh, y = bg.y-4*bgh+5*bgsh},
		{x=bg.x+1*bgw+5*bgsh, y = bg.y-4*bgh+5*bgsh},
		{x=bg.x+2*bgw+5*bgsh, y = bg.y-4*bgh+5*bgsh},
		{x=bg.x+3*bgw+5*bgsh, y = bg.y-4*bgh+5*bgsh},
		{x=bg.x+4*bgw+5*bgsh, y = bg.y-4*bgh+5*bgsh},
		----------------------
		{x= bg.x+4*bgw+5*bgsh, y = bg.y-5*bgh+5*bgsh},
		{x= bg.x+3*bgw+5*bgsh, y = bg.y-5*bgh+5*bgsh},
		{x= bg.x+2*bgw+5*bgsh, y = bg.y-5*bgh+5*bgsh},
		{x= bg.x+1*bgw+5*bgsh, y = bg.y-5*bgh+5*bgsh},
		{x= bg.x+0*bgw+5*bgsh, y = bg.y-5*bgh+5*bgsh},
		{x= bg.x-1*bgw+5*bgsh, y =bg.y-5*bgh+5*bgsh},
		{x= bg.x-2*bgw+5*bgsh, y = bg.y-5*bgh+5*bgsh},
		{x= bg.x-3*bgw+5*bgsh, y = bg.y-5*bgh+5*bgsh},
		{x= bg.x-4*bgw+5*bgsh, y = bg.y-5*bgh+5*bgsh},
		{x= bg.x-5*bgw+5*bgsh, y = bg.y-5*bgh+5*bgsh},
		}

		sheetData1 = { width=50, height=60, numFrames=3, sheetContentWidth=150, sheetContentHeight=60 }
	 
	mySheet1 = graphics.newImageSheet( "images/handsprite.png", sheetData1 )

	sequenceData1 = {
	 
	  { name = "normalRun",  
	    start = 1,  
	    count = 3,  
	    time = 600,  
	    loopCount = 0, 
	    loopDirection = "forward"  
	  } 
	 
	}

	animation1 = display.newSprite( mySheet1, sequenceData1 )
	animation1.x = bg.x-1*bgw+5*bgsh;
	animation1.y = -300;
    animation1:play()
  

	--headline
	textbg = display.newRect(bg.x-1*bgh+8*bgsh, bg.y-5*bgh-8*bgsh, display.contentWidth+25, 40)
	textbg:setFillColor( 0.1 )
	textbg.alpha = 0.5
	group:insert(textbg)
    player=display.newText("Player 1 turn!  100 to win",0,0,"ETHNOCEN",12);
	player:setTextColor(0.5, 1, 0.5);
	--player:setReferencePoint(display.BottomReferencePoint);
	player.x=bg.x-1*bgh+8*bgsh
	player.y=bg.y-5*bgh-8*bgsh
	group:insert(player)

	 backbtn = display.newImageRect ("images/backbutton.png", 112, 117)
	--backbtn.y = heightScrn - 0.6 * backbtn.height 
	--backbtn.x = .6 * backbtn.width 
	backbtn.x = 40
	backbtn.y = display.contentHeight- 40
	backbtn.width = 50
	backbtn.height =50
	backbtn.destination = "snakeMenu" 
	backbtn:addEventListener("touch", btnTap)
	group:insert(backbtn) 

   --reloadbutton
	reloadbtn = display.newImageRect ("images/reloadbutton.png", 112, 117)
	--backbtn.y = heightScrn - 0.6 * backbtn.height 
	--backbtn.x = .6 * backbtn.width 
	reloadbtn.x = display.contentWidth-40
	reloadbtn.y = display.contentHeight- 40
	reloadbtn.width = 50
	reloadbtn.height =50
	reloadbtn.destination = "snakeMenu" 
	reloadbtn:addEventListener("touch", btnTap1)
	group:insert(reloadbtn) 



	--dice
	dice = display.newImage( "images/dice.png" ) 
	dice.x = display.contentWidth/2
	dice.y = display.contentHeight - 100
	dice.width = bg.width/25
	dice.height = bg.height/15
	group:insert(dice) 


	--first player
	p1 = display.newImage("images/snake/p1.png"); 
	--foo:setReferencePoint(display.BottomReferencePoint);
	p1.width = p1.width/20*5*bgsh; 
	p1.height= p1.height/20*5*bgsh;

	p1.x = bg.x-1*bgw+5*bgsh;
	p1.y = display.contentHeight-60;
	group:insert(p1)

	p11 = display.newImage("images/snake/p1.png"); 
	--foo:setReferencePoint(display.BottomReferencePoint);
	p11.width = p1.width/20*5*bgsh; 
	p11.height= p1.height/20*5*bgsh;

	p11.x = bg.x-1*bgw+5*bgsh;
	p11.y = display.contentHeight-60;
	group:insert(p11)


	------- Second Player
    p2 = display.newImage("images/snake/p2.png"); 
	--boo:setReferencePoint(display.BottomReferencePoint);
	p2.width = p2.width/20*5*bgsh; 
	p2.height= p2.height/20*5*bgsh;

	p2.x = bg.x-2*bgw+22*bgsh;
	p2.y = display.contentHeight-60;
	group:insert(p2)


	p22 = display.newImage("images/snake/p2.png"); 
	--boo:setReferencePoint(display.BottomReferencePoint);
	p22.width = p2.width/20*5*bgsh; 
	p22.height= p2.height/20*5*bgsh;

	p22.x = bg.x-2*bgw+22*bgsh;
	p22.y = display.contentHeight-60;
	group:insert(p22)


	ins = display.newImage("images/instruction.png")
	ins.xScale = (bg_adjustment  * bgimage.contentHeight)/bgimage.contentHeight
	ins.yScale = bgimage.xScale
	ins.x = display.contentWidth / 2
	ins.y = display.contentHeight / 2
	group:insert(ins)




	diceSound = audio.loadSound("sounds/snake/shake_dice.mp3");
	ladders = audio.loadSound("sounds/snake/ladder.mp3");
	snakes = audio.loadSound("sounds/snake/snake.mp3");
	silent = audio.loadSound("sounds/snake/silent.mp3");

	



end

local function onComplete( event )
    if "clicked" == event.action then
        local i = event.index
        if 1 == i then
        		btnTap2()
                -- restart
				--storyboard.reloadScene()
        elseif 2 == i then
                -- exit
                os.exit();
        end
    end
end






		--back hardware key
		




 dicenumber=nil; 
 i=nil;
 rand=nil;
local function gamelogic( )
			local laserChannel = audio.play( laserSound ) ;
    		 i = playerCount%2+1
		 	print( "2 player" ) 
		  --print(rand);
			if rand==1 then--to check if he shot 1
				playstart[i]=1;
			elseif playstart[i]==0 then
				playerCount = playerCount + 1 ;		
			end
		  --print(i..playstart[i]);
			if playstart[i]==1 then--to check is he able to play 

					local shotcheck = diceshot[i]+ rand;--adding temporary score
					print("player  "..i.." score:"..diceshot[i]..":"..rand..":"..shotcheck);
					if rand~=1 then--if he dont score 1 then player change
						playerCount = playerCount + 1 ;	
					end
					if shotcheck <= 100 then--score more than 100 cant possible
						diceshot[i]= shotcheck;
	 			
						dicenumber = diceshot[i];
						shotcheck = nil;
					end
			end		
			local listener = function( event )
				--checking ladder and snake
				if diceshot~=nil then
				        lad=0;
						snake=0;
					if diceshot[i]==5 then
						diceshot[i]=15
						lad=1
					elseif diceshot[i]==13 then
						diceshot[i]=35
						lad=1
					elseif diceshot[i]==20 then
						diceshot[i]=39
						lad=1
					elseif diceshot[i]==23 then
						diceshot[i]=66
						lad=1
					elseif diceshot[i]==63 then
						diceshot[i]=97
						lad=1
					elseif diceshot[i]==53 then
						diceshot[i]=87
						lad=1
					elseif diceshot[i]==32 then
						diceshot[i]=51
						lad=1
					elseif diceshot[i]==43 then
						diceshot[i]=61
						lad=1
					elseif diceshot[i]==14 then
						diceshot[i]=8
						snake=1
					elseif diceshot[i]==33 then
						diceshot[i]=10
						snake=1
					elseif diceshot[i]==40 then
						diceshot[i]=19
						snake=1
					elseif diceshot[i]==79 then
						diceshot[i]=16
						snake=1
					elseif diceshot[i]==60 then
						diceshot[i]=39
						snake=1
					elseif diceshot[i]==69 then
						diceshot[i]=34
						snake=1
					elseif diceshot[i]==93 then
						diceshot[i]=36
						snake=1
					elseif diceshot[i]==75 then
						diceshot[i]=57
						snake=1	
					elseif diceshot[i]==98 then
						diceshot[i]=64
						snake=1	
					end	
					if  snake==1  or lad==1 then 
							if snake==1 then
								local  last = audio.play( snakes) ;
								awarenesMessageWarn()
							end	
							if lad==1 then
								local  last1 = audio.play( ladders) ;
								awarenesMessageGood()
							end
						if i==1 then	
							transition.to( p1, { x= position[diceshot[i]].x, y= position[diceshot[i]].y} );
						elseif i==2 then
							transition.to( p2, { x= position[diceshot[i]].x, y= position[diceshot[i]].y} );
							if diceshot[1]~=0 and diceshot[2]~=0 then
						
									if diceshot[1]==diceshot[2] then
										p1.x=position[diceshot[1]].x
										p1.y=position[diceshot[1]].y
										p2.x=position[diceshot[2]].x+10
										p2.y=position[diceshot[2]].y
									end
							end
						end	
					end
					end
					
								--if foo and boo set in same place 
				if diceshot~=nil then
					if diceshot[1]~=0 and diceshot[2]~=0 then
						print("fut");
						if diceshot[1]==diceshot[2] then
							p1.x=position[diceshot[1]].x
							p1.y=position[diceshot[1]].y
							p2.x=position[diceshot[2]].x+10
							p2.y=position[diceshot[2]].y
						end
					end
				end
						
			end

			if playstart[i]==0 then
				if i==1 then
					p1.x = bg.x-1*bgw+5*bgsh;
					p1.y = display.contentHeight-60;
					player.text="Player 2 turn!  ".. 100-diceshot[2].." to win"

				if animation1 ~= nil then
					animation1:removeSelf()
					animation1 = display.newSprite( mySheet1, sequenceData1 )
					animation1.x = bg.x-2*bgw+22*bgsh
					animation1.y = display.contentHeight-30
					animation1:play()
				end
				elseif i==2 then
					p2.x = bg.x-2*bgw+22*bgsh;
					p2.y = display.contentHeight-60;
					player.text="Player 1 turn!  ".. 100-diceshot[1].." to win"

				if animation1 ~= nil then
					animation1:removeSelf()
					animation1 = display.newSprite( mySheet1, sequenceData1 )
					animation1.x = bg.x-1*bgw+5*bgsh
					animation1.y = display.contentHeight-30
					animation1:play()
				end
	
				end
            elseif i==1 then
					transition.to( p1, { x= position[diceshot[i]].x, y= position[diceshot[i]].y,onComplete=listener} ); 
					print(rand);
					if rand==1 then
					   player.text="Player 1 turn!  ".. 100-diceshot[1].." to win" --after score 1 for rolling again
					    
					 if animation1 ~= nil then
					    animation1:removeSelf()
						animation1 = display.newSprite( mySheet1, sequenceData1 )
						animation1.x = bg.x-1*bgw+5*bgsh
						animation1.y = display.contentHeight-30
						animation1:play()
					 end
	
					else
						player.text="Player 2 turn!  ".. 100-diceshot[2].." to win"--for head line
						
					if animation1 ~= nil then
						animation1:removeSelf()
						animation1 = display.newSprite( mySheet1, sequenceData1 )
						animation1.x = bg.x-2*bgw+22*bgsh
						animation1.y = display.contentHeight-30
						animation1:play()
					end
					end
				    
					
					
		    elseif i==2 then
					transition.to( p2, { x= position[diceshot[i]].x, y= position[diceshot[i]].y,onComplete=listener} );
					player.text="Player 1 turn!  ".. 100-diceshot[1].." to win"--for head line 

				if animation1 ~= nil then
					animation1:removeSelf()
					animation1 = display.newSprite( mySheet1, sequenceData1 )
					animation1.x = bg.x-1*bgw+5*bgsh
					animation1.y = display.contentHeight-30
					animation1:play()
				end
	
					if rand==1 then
							player.text="Player 2 turn!  ".. 100-diceshot[2].." to win"--after score 1 for rolling again
						if animation1 ~= nil then
							animation1:removeSelf()
							animation1 = display.newSprite( mySheet1, sequenceData1 )
							animation1.x = bg.x-2*bgw+22*bgsh
							animation1.y = display.contentHeight-30
							animation1:play()
						end

					end
			
			end

				
		    
			
			if diceshot[i]==100 then
				
				win=1	
				player.text="player 1 turn 100 to win";
				print("player"..i.."win");
				local alert = native.showAlert( "Player  "..i.."   win","congratulation", { "Ok",  }, onComplete )
				
				--starting new everything
		    end
		 
	      
end

--spritesheet code
			local sheetData = { width=100, height=105, numFrames=15, sheetContentWidth=500, sheetContentHeight=316 }
			 
			local mySheet = graphics.newImageSheet( "images/pebwmafi.png", sheetData )

			local sequenceData = {
			 
			  { name = "normalRun",  
			    start = 1,  
			    count = 15,  
			    time = 480,  
			    loopCount = 0, 
			    loopDirection = "forward"  
			  } 
			 
			}




			local function remove_explosion( event )
			     local phase = event.phase
			     if phase == "loop" then
			         local animation = event.target
			         animation:removeEventListener( "sprite", remove_explosion )
			         animation:removeSelf()
			         animation=nil
			     end
			end

			local function make_explosion()
			    local animation = display.newSprite( mySheet, sequenceData )
			    animation:play()
			    animation:addEventListener( "sprite", remove_explosion )
			    return animation
			end




			--for rotating dice
			local function diceFunction( event )
				
				local listener1 = function( event )
						flag = false
						--dice:scale( 0.1, 0.1 )
						 transition.to( dice, {time=500, x =  display.contentWidth/2, y = display.contentHeight - 100 } )
						--local animation = make_explosion()
						if animation~=nil then
								 animation.x = startX
						 	animation.y = startY
							transition.to( animation, {time=500, x =  display.contentWidth/2, y = display.contentHeight - 100 } )
						end

				end
				if firsttap==1 then
					ins:removeSelf( )
					ins=nil
				end
				firsttap=firsttap+1
				if flag then
					if event.phase == "began" then
						flag = false
						audio.play( diceSound )
						rand = math.random(6)
				        startX = event.x 
				        startY = event.y
				        local a = dice.x
				        local b = dice.y
				        dice:removeSelf( )
				        dice = display.newImage( "images/dice"..rand..".png" ) 
				        dice.x = a
				        dice.y = b
						dice.width = bg.width/25
						dice.height = bg.height/15
				        --dice:scale( 0.5, 0.5 )
				        transition.to( dice, {time=450, x = startX, y = startY} )
				         animation = make_explosion()
				        animation.x = a
				        animation.y = b
					    transition.to( animation, {time=500, x = startX, y = startY,onComplete=listener1} )
						local function timerE(ev)
							if diceshot~=nil then
								gamelogic();
							end
							--dice:scale( 2.0, 2.0 )
							flag=true
						end
						
						timer.performWithDelay( 1000, timerE )
						
						
					end 
				end
			    return true
			 
			end

	local function onShake (event)
    if event.isShake and win==0 then
        -- Device was shaken, so change background
        local listener1 = function( event )
						flag = false
						--dice:scale( 0.1, 0.1 )
						 transition.to( dice, {time=500, x =  display.contentWidth/2, y = display.contentHeight - 100 } )
						--local animation = make_explosion()
						 if animation~=nil then
								 animation.x = startX
						 	animation.y = startY
							transition.to( animation, {time=500, x =  display.contentWidth/2, y = display.contentHeight - 100 } )
						end
				end
				if firsttap==1 then
					ins:removeSelf( )
					ins=nil
				end
				firsttap=firsttap+1
				
				if flag then
					
						flag = false
						audio.play( diceSound )
						rand = math.random(6)
				        startX = math.random(50, display.contentWidth-50)
       					startY = math.random(50, display.contentHeight-50)
				        local a = dice.x
				        local b = dice.y
				        dice:removeSelf( )
				        dice = display.newImage( "images/dice"..rand..".png" ) 
				        dice.x = a
				        dice.y = b
						dice.width = bg.width/25
						dice.height = bg.height/15
				        --dice:scale( 0.5, 0.5 )
				        transition.to( dice, {time=450, x = startX, y = startY} )
				         animation = make_explosion()
				        animation.x = a
				        animation.y = b
					    transition.to( animation, {time=500, x = startX, y = startY,onComplete=listener1} )
						local function timerE(ev)
							if diceshot~=nil then
								gamelogic();
							end
							--dice:scale( 2.0, 2.0 )
							flag=true
						end
						
						timer.performWithDelay( 1000, timerE )
						
						
					 
				end
			    return true
    end
end

--awareness message
function awarenesMessageWarn()
    
	--showAwarenesMessage = 1
	--print(showAwarenesMessage)
	storyboard.showOverlay( "customDialogWarn",{effect = "fade"  , params ={showAwarenesMessage = 2}, isModal = true})
	--print(showAwarenesMessage)
	
end

function awarenesMessageGood()
    --showAwarenesMessage = 1
	storyboard.showOverlay( "customDialogGood",{effect = "fade"  , params ={showAwarenesMessage = 2}, isModal = true})
	--print(showAwarenesMessage)

end

function scene:enterScene(event)
  group=self.view
	
  				Runtime:addEventListener("accelerometer", onShake)
				Runtime:addEventListener( "touch", diceFunction )
				
end 
 



function scene:exitScene(event)
	group=self.view
	storyboard.removeScene( "snake2playerEXP" )
	storyboard.purgeScene( "snake2playerEXP" )
	--background:removeEventListener( "touch", diceFunction )  
	--Runtime:removeEventListener( "key", onKeyEvent );
	Runtime:removeEventListener( "touch", diceFunction ) 

end




function scene:destroyScene(event)
	group=self.view
	--storyboard.removeScene( "snake2playerEXP" )
	Runtime:removeEventListener("accelerometer", onShake)
	Runtime:removeEventListener( "touch", diceFunction ) 
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene


