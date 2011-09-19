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
local str = require("w1")
local str = require("w2")
local str = require("w3")



-- work result display text
WorkPad1 = widget.newEmbossedText("Workpad 1",  display.contentWidth * 0.2, 120, 
									native.systemFontBold, 20, {190, 190, 255} )
WorkPad2 = widget.newEmbossedText("Workpad 2",  display.contentWidth * 0.2, 240, 
									native.systemFontBold, 20, {190, 255, 190} )




local onBtnRelease = function( event )
	
	if event.phase == "release" then
		print( "You will run work #" .. event.target.id )
	end
	
	if event.target.id == 1 then
		w1.run()
	elseif event.target.id == 2 then
		w2.run()
	elseif event.target.id == 3 then
		w3.run()
	end
	
	return true
end

function setupWorkSpace()
	-- create work buttons
	local myButton1 = widget.newButton{ id=1, label="w1", x=20, y=20, onEvent=onBtnRelease }
	-- myButton1:setReferencePoint( display.CenterReferencePoint )
	-- myButton1.x = display.contentWidth * 0.5
	local myButton2 = widget.newButton{ id=2, label="w2", x=80, y=20, onEvent=onBtnRelease }
	local myButton3 = widget.newButton{ id=3, label="w3", x=140, y=20, onEvent=onBtnRelease }
end

---------------
-- Main program

function main()

	setupWorkSpace()

end



-- Start program execution
main()