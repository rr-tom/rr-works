-- hanoiDrag.lua 
--

module(..., package.seeall)

local physics = require("physics")

-- A basic function for dragging physics objects
function startDrag( event )
	local t = event.target

	local phase = event.phase
	if "began" == phase then
		display.getCurrentStage():setFocus( t )
		t.isFocus = true

		-- Store initial position
		t.x0 = event.x - t.x
		t.y0 = event.y - t.y
		
		-- Make body type temporarily "kinematic" (to avoid gravitional forces)
		event.target.bodyType = "kinematic"
		
		-- Stop current motion, if any
		event.target:setLinearVelocity( 0, 0 )
		event.target.angularVelocity = 0

	elseif t.isFocus then
		if "moved" == phase then
			t.x = event.x - t.x0
			t.y = event.y - t.y0

		elseif "ended" == phase or "cancelled" == phase then
			display.getCurrentStage():setFocus( nil )
			t.isFocus = false
			
			-- Switch body type back to "dynamic", unless we've marked this sprite as a platform
			if ( not event.target.isPlatform ) then
				event.target.bodyType = "dynamic"
			end

		end
	end

	-- Stop further propagation of touch event!
	return true
end

function stickCollision( self, event )
	if ( event.phase == "began" ) then
		print( "began: " .. self.myName .. " & " .. event.other.myName )
		transition.to( event.other, { time=200, x= self.x, transition=easing.outQuad} )
	elseif ( event.phase == "ended" ) then
		print( "ended: " .. self.myName .. " & " .. event.other.myName )
	end

	return true
end