-- w2.lua 
-- write a linear equation of your own, e.g. y=2x+3, as a function. 
--     Put the results of y when x =8, 16, 32 on WorkPad
--     WorkPad1 is the example prepared by Tom
--    WorkPad2 as your practice
--    The function parameter is number type and result is number type

module(..., package.seeall)

-- example function
local function example(x)
	local varY = (2 * x / 4) + 5
	return varY
end

-- write your own function here
--



run = function()

	-- calculate example and put result
   local eg1 = example(8)
   local eg2 = example(16)
   local eg3 = example(32)

   -- these two dots .. is telling iphone to concatenate the text 
   -- so, print("first" .. ", " .. " second") would put "first, second" on screen
   WorkPad1:setText(eg1 .. ", " .. eg2 .. ", " .. eg3)

   -- call your function to do calculation

   -- and put result on WorkPad2


end