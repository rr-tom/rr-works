-- 
-- Abstract: Hello World sample app
-- 
-- Version: 1.0
-- 
-- Copyright (C) 2009 ANSCA Inc. All Rights Reserved.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of 
-- this software and associated documentation files (the "Software"), to deal in the 
-- Software without restriction, including without limitation the rights to use, copy, 
-- modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
-- and to permit persons to whom the Software is furnished to do so, subject to the 
-- following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all copies 
-- or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
-- PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
-- FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
-- OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
-- DEALINGS IN THE SOFTWARE.

local background = display.newImage( "world.jpg" )

local textObject = display.newText( "Hello World!", 50, 50, native.systemFont, 24 )
textObject:setTextColor( 255,255,255 )

local button = display.newImage( "button.png" )
button.x = display.contentWidth / 2
button.y = display.contentHeight - 50

local beepSound = audio.loadSound( "beep.wav" )

function button:tap( event )
	local r = math.random( 0, 255 )
	local g = math.random( 0, 255 )
	local b = math.random( 0, 255 )

	textObject:setTextColor( r, g, b )
	audio.play( beepSound )
end

button:addEventListener( "tap", button )

transition.to( textObject, { time=1000, 
y=textObject.y+100,
x=textObject.x+50,
size=textObject.size+20,
rotation = 360,
alpha = 0.5 } )
