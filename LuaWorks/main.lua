---------------------------------------------------------------------------------------
-- Project: RR LuaWorks
--
-- Date: September 16, 2011
-- Version: 0.1
-- File name: main.lua
-- Author: rr-tom
-- Abstract: launch pad for works
--
-- Sample code is MIT licensed
-- Copyright (C) 2011 Reflexive Rabbit Studio. All Rights Reserved.
---------------------------------------------------------------------------------------


-- corona ui widget
local widget = require "widget"

-- Load each works

local w = {}
w[1] = require("w1")
w[2] = require("w2")
w[3] = require("w3")
w[4] = require("w4")
w[5] = require("w5")
w[6] = require("w6")


-- work result display text
-- work result display text
WorkPad1 = widget.newEmbossedText("Workpad 1",  display.contentWidth * 0.25, 120, 
									native.systemFontBold, 20, {190, 190, 255} )
WorkPad2 = widget.newEmbossedText("Workpad 2",  display.contentWidth * 0.25, 150, 
									native.systemFontBold, 20, {190, 255, 190} )
WorkTable = {}


local onBtnRelease = function( event )
	
	if event.phase == "release" then
		print( "You will run work #" .. event.target.id )
	end
	
	if event.target.id ~= nil then
		w[tonumber(event.target.id)].run()
	end
	
	return true
end

function setupWorkSpace()
	-- create work buttons
	local myButton={}
	
	for i=1,6 do
		myButton[i] = widget.newButton{ id=i, label="w"..i, x=10+50*(i-1), y=20, onEvent=onBtnRelease }
	end
	
	for i=1,9 do
		WorkTable[i] = widget.newEmbossedText(" WorkTable "..i,  display.contentWidth * 0.25, 180+i*30, 
						native.systemFontBold, 20, {190, 190, 255} )
	end
end

---------------
-- Main program

function main()

	setupWorkSpace()

end



-- Start program execution
main()