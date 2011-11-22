-- 
-- Abstract: The hanoi game platform for the tutoring class
--
-- Copyright (C) 2011 Reflexive Rabbit
--
-- based on DragPlatforms sample project
-- 
-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.

module(..., package.seeall)

local physics = require("physics")
local hanoiDrag = require("hanoiDrag")
local hanoiLevel = require("hanoiLevel")

local plate
local plateId = 0
local myGameGroup
local backBtn

local gameNumOfPlates
local gameRecords = {}

function getGameNumOfPlates()
    return gameNumOfPlates
end

function setGameNumOfPlates(newValue)
    gameNumOfPlates=newValue
end

function accessGameRecords()
    return gameRecords
end

local function addPlates(numOfPlates)
    local gSticks = _G.gSticks
    local gPlates = _G.gPlates
    
	for i=1,numOfPlates do
		
		if (i%3 == 0) then
			plate = display.newImage( "gplate.png" )
		elseif (i%3 == 1) then
			plate = display.newImage( "gplate2.png" )
		else
			plate = display.newImage( "gplate3.png" )
		end
		myGameGroup:insert(plate)
		plate.x = 80
		
		-- key part

		plateId = numOfPlates-i+1
		plate.y = 20 + plateId*35 -- or 280-i*30
		plate:scale(1+ (plateId*0.4) , 1)
		plate.myName = plateId
		gSticks[1].plates[i] = plateId
		
		-- print ("put plateId "..plateId.."on poistion "..i)
		-- end of key part
		
		physics.addBody( plate, { density=1.0, bounce=0.2 } )
		plate.isFixedRotation = true 
		
		-- Add touch event listeners to objects
		plate:addEventListener( "touch", hanoiDrag.startDrag )
		
		gPlates[i]=plate
	end
	
end

local function delAllPlates()

-- topic for next course
-- clean and delete object
-- remove array backward
-- remove from physical world
-- remove from display
-- remove itself (from memorry/system)

end

function endGame()
    -- clean up all
    _G.gSticks = {}
    _G.gPlates = {}
    hanoiDrag.cleanUp()
    physics.stop()
    backBtn:removeSelf()
    myGameGroup:removeSelf()
   	
   	hanoiLevel.slideIn()
   	backBtn = nil
    myGameGroup = nil
end



local function onBtnRelease( event )
	
	if event.phase == "release" then
        endGame()
	end
	
	return true
end

function setup()
	physics.start()

    myGameGroup = display.newGroup()
	local background = display.newImage( "bkg_bricks.png", true )
	background.x = display.contentWidth / 2
	background.y = display.contentHeight / 2
    myGameGroup:insert(background)
    
	local ground = display.newImage( "floor.png" )
	ground.x = 240; ground.y = 320
	myGameGroup:insert(ground)
	physics.addBody( ground, "static", { friction=0.6 } )

	for i=1,3 do
		gSticks[i] = display.newImage( "stick.png" )
		gSticks[i].x = 80+160*(i-1); gSticks[i].y = 142
		myGameGroup:insert(gSticks[i])
		physics.addBody( gSticks[i], "static", { isSensor = true  } )
	
		gSticks[i].collision = hanoiDrag.stickCollision
		gSticks[i]:addEventListener( "collision", gSticks[i] )
		gSticks[i].myName = i
		gSticks[i].plates = {}
	end
	
	addPlates(gameNumOfPlates)
	
	backBtn = widget.newButton{ id="Back", label="Back", y=290, onEvent=onBtnRelease }
    backBtn.x=display.contentWidth / 2 - backBtn.width/2
    myGameGroup:insert( backBtn.view )
    
end



