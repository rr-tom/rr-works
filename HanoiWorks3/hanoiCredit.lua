-- 
-- Abstract: The hanoi game platform for the tutoring class
--
-- Copyright (C) 2011 Reflexive Rabbit
--
-- 
-- Sample code is MIT licensed
--
-- show about me and credit while practicing display objects functions

module(..., package.seeall)

local widget = require "widget"
local hanoiLevel = require("hanoiLevel")

local myGroup=nil

function slideOut()
    transition.to( myGroup, { time=500, x= 960, alpha=0, transition=easing.outQuad} )
end

function slideIn()
    transition.to( myGroup, { time=500, x= 0, alpha=1, transition=easing.outQuad} )
end

local function onBtnRelease( event )
	
	if event.phase == "release" then
	    slideOut()
		hanoiLevel.slideIn()
	end
	
	return true
end


function setup() 

    myGroup = display.newGroup()
	
	local myCircle = display.newCircle( 320, 100, 60 )
    myGroup:insert( myCircle )
    myCircle:setFillColor(192,192,0)
    
    local myLine = display.newLine( myGroup, 400, 60, 60, 300)
    myLine:setColor(128,128,128)
    myLine.width=4
    local myRect = display.newRect( myGroup, 30, 30, 160, 160 )
    myRect:setFillColor(192,0,192)
    
    local myRdRect = display.newRoundedRect( myGroup, 0, 120, 160, 160, 20 )
    myRdRect:setFillColor(0,192,192)
    
    local gameImage = display.newImage( myGroup, "hanoi-300p.png", true )
	gameImage.x = display.contentWidth / 2
	gameImage.y = display.contentHeight / 2
	-- myGroup:insert( gameImage )
	
    local myText = display.newText( myGroup, "Created By Reflexive Rabbit", 240, 240, 
                                        native.systemFontBold, 32 )
    
    myText.alpha = 0.7
    
    local backBtn = widget.newButton{ id=1, label="Back", y=280, onEvent=onBtnRelease }
    backBtn.x=display.contentWidth / 2 - backBtn.width/2
    myGroup:insert( backBtn.view )
    
    
    
    myGroup.x=960
    
end
