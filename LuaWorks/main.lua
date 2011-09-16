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


-- work result display text
WorkPad1 = widget.newEmbossedText("Workpad 1",  display.contentWidth * 0.5, 120, 
									native.systemFontBold, 20, {190, 190, 255} )
WorkPad2 = widget.newEmbossedText("Workpad 2",  display.contentWidth * 0.5, 240, 
									native.systemFontBold, 20, {190, 255, 190} )




local onBtnRelease = function( event )
	
	if event.phase == "release" then
		print( "You will run work #" .. event.target.id )
	end
	
	if event.target.id == 1 then
		w1.run()
	end
	
	return true
end

function setupWorkSpace()
	-- create work buttons
	local myButton1 = widget.newButton{ id=1, label="work1", x=20, y=20, onEvent=onBtnRelease }
	-- myButton1:setReferencePoint( display.CenterReferencePoint )
	-- myButton1.x = display.contentWidth * 0.5

end

---------------
-- Main program

function main()

	setupWorkSpace()

end



-- Start program execution
main()