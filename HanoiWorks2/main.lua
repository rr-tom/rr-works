-- 
-- Abstract: The hanoi game platform for the tutoring class
--
-- Copyright (C) 2011 Reflexive Rabbit
--
-- based on DragPlatforms sample project
-- 
-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.

local physics = require("physics")
local hanoiDrag = require("hanoiDrag")

gNumOfPlates = 3

gSticks = {}
gPlates = {}

local plate=nil
local plateId = 0

local function addPlates(numOfPlates)
	for i=1,numOfPlates do
		
		if (i%2 == 0) then
			plate = display.newImage( "gplate.png" )
		else
			plate = display.newImage( "gplate2.png" )
		end
		
		plate.x = 80
		
		-- key part
		plateId = numOfPlates-i+1
		plate.y = 60 + plateId*30 -- or 280-i*30
		plate:scale(1+plateId*0.4, 1)
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


local function setup()
	physics.start()

	display.setStatusBar( display.HiddenStatusBar )

	local background = display.newImage( "bkg_bricks.png", true )
	background.x = display.contentWidth / 2
	background.y = display.contentHeight / 2

	local ground = display.newImage( "floor.png" )
	ground.x = 240; ground.y = 320
	physics.addBody( ground, "static", { friction=0.6 } )

	for i=1,3 do
		gSticks[i] = display.newImage( "stick.png" )
		gSticks[i].x = 80+160*(i-1); gSticks[i].y = 142
		physics.addBody( gSticks[i], "static", { isSensor = true  } )
	
		gSticks[i].collision = hanoiDrag.stickCollision
		gSticks[i]:addEventListener( "collision", gSticks[i] )
		gSticks[i].myName = i
		gSticks[i].plates = {}
	end
	
	addPlates(gNumOfPlates)
end

setup()


