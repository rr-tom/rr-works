-- 
-- Abstract: The hanoi game platform for the tutoring class
--
-- Copyright (C) 2011 Reflexive Rabbit
--
-- 
-- Sample code is MIT licensed

module(..., package.seeall)

local widget = require("widget")
local hanoiGame = require("hanoiGame")
local hanoiCredit = require("hanoiCredit")
local hanoiRecord = require("hanoiRecord")

local mySlider
local myLevelGroup = {}
local myTextview

function slideOut()
    transition.to( myLevelGroup, { time=500, x= -480, alpha=0, transition=easing.outQuad} )
end

function slideIn()
    transition.to( myLevelGroup, { time=500, x= 0, alpha=1, transition=easing.outQuad} )
end

local function slider2level(sliderValue)
    return 3+ math.floor(6*sliderValue/100)
end

local onBtnRelease = function( event )
	
	if event.phase == "release" then
		print( "You will run work " .. event.target.id )

    	if event.target.id == "start" then
    	    slideOut()        
    	    timer.performWithDelay(500, hanoiGame.setup)
    	elseif event.target.id == "record" then
    	    slideOut()
    	    hanoiRecord.setup()
    	    hanoiRecord.slideIn()
    	elseif event.target.id == "credit" then
    	    slideOut()
    	    hanoiCredit.slideIn()
    	end
	end
	return true
end

function setup() 
    
    myLevelGroup = display.newGroup()
    
    local background = display.newImage( myLevelGroup, "bkg_bricks.png", true )
	background.x = display.contentWidth / 2
	background.y = display.contentHeight / 2
	-- myLevelGroup:insert( background )
	
	local myTextview = display.newText(myLevelGroup, "6", 0, 0, native.systemFontBold, 24)
	myTextview.x = display.contentWidth * 0.5
    myTextview.y = 80

    local startBtn = widget.newButton{ id="start", label="Start Game", y=160, onEvent=onBtnRelease }
    startBtn.x=display.contentWidth / 2 - startBtn.width/2
    myLevelGroup:insert( startBtn.view )
	
    local recordsBtn = widget.newButton{ id="record", label="Game Record",  y=200, onEvent=onBtnRelease }
    recordsBtn.x=display.contentWidth / 2 - recordsBtn.width/2
    myLevelGroup:insert( recordsBtn.view )
    
    local creditBtn = widget.newButton{ id="credit", label="Credit", y=240, onEvent=onBtnRelease }
    creditBtn.x=display.contentWidth / 2 - creditBtn.width/2
    myLevelGroup:insert( creditBtn.view )
    
    
    -- Create the slider widget
    mySlider = widget.newSlider{
        width=160,
        callback=function(event)
                local numOfPlates = slider2level(event.target.value)
                myTextview.text = numOfPlates
                hanoiGame.setGameNumOfPlates(numOfPlates)
            end
    }
    
    mySlider.view.textview = textview
    -- Center the slider widget on the screen:
    mySlider.x = display.contentWidth * 0.5
    mySlider.y = 120
    -- adjust the slider width:
    mySlider.width = 240
    -- set the value manually:
    mySlider.value = 50
    hanoiGame.setGameNumOfPlates(slider2level(mySlider.value))
    
    -- insert the slider widget into a group:
    myLevelGroup:insert( mySlider.view )
    
end
