-- 
-- Abstract: The hanoi game platform for the tutoring class
--
-- Copyright (C) 2011 Reflexive Rabbit
--
-- 
-- Sample code is MIT licensed
--
-- show game records

module(..., package.seeall)

local widget = require "widget"
local hanoiLevel = require("hanoiLevel")
local hanoiGame = require("hanoiGame")


local myGroup
local myBackBtn

function slideOut()
    transition.to( myGroup, { time=500, x= 960, alpha=0, transition=easing.outQuad} )
end

function slideIn()
    transition.to( myGroup, { time=500, x= 0, alpha=1, transition=easing.outQuad} )
end

local function cleanUp()
    if (myGroup ~= nil) then
        myBackBtn:removeSelf()
        myBackBtn = nil
        myGroup:removeSelf()
        myGroup= nil
    end
end

local function onBtnRelease( event )
	
	if event.phase == "release" then
	    slideOut()
		hanoiLevel.slideIn()
		local myTimer = timer.performWithDelay(500, cleanUp)
	end

end

local function grid9Xy(index)
    local x = ((index-3)%3) * 70 + 112
    local y = math.floor((index-3)/3) * 70 + 50
    return x,y
end

local function gridVertXy(index)
    local x = 1 -- homework
    local y = 1 -- homework
    return x,y
end

local function gridCheckerXy(index)
    local x = 1 -- homework
    local y = 1 -- homework
    return x,y
end

function setup() 

    myGroup = display.newGroup()
    
    local myBackRect = display.newRect(myGroup, 0,0,480,320)
    myBackRect:setFillColor(64,128,192)
    local myRecords = hanoiGame.accessGameRecords()
    for i=3,9 do        
        local boxGroup = display.newGroup()
        myGroup:insert(boxGroup)
        local myRdRound = display.newRoundedRect(boxGroup, 10,10,50,50,15)
        myRdRound:setFillColor(192,192,192)
        local myText = display.newText( boxGroup, i, 40, 40, 
                                            native.systemFontBold, 32 )
        local trophyImage                                    
        if (myRecords[i]==nil) then
            tropyImage = nil
        elseif (myRecords[i]=="best") then
            trophyImage = display.newImage( boxGroup, "Target40.png", true )   
        elseif (myRecords[i]=="good") then
            trophyImage = display.newImage( boxGroup, "TryHarder40.png", true )
        end

        boxGroup.x, boxGroup.y = grid9Xy(i)
    end
    
    myBackBtn = widget.newButton{ id=1, label="Back", y=280, onEvent=onBtnRelease }
    myBackBtn.x=display.contentWidth / 2 - myBackBtn.width/2
    myGroup:insert( myBackBtn.view )
    
    myGroup.x=960
    
end
