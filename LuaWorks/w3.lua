-- w3.lua 
-- w3 write a function leapYear, parameter is number type (the year) and result is boolean (true if the year is leap year)
--    put example year xx/yy result on WorkPad1/2
--    hint: you will use math (calculation), comparison, and control.

module(..., package.seeall)

-- your function leapYear here
local function leapYear(theYear)
	-- your calcuation here

	-- e.g.
	if (theYear == 4) then
		return true
	else 
		return false
	end

end

run = function()
   -- call your function on year xxxx
	local year1 = 1984
	local result1 = leapYear(year1)
	if (result == true) then
		WorkPad1:setText("year " .. year1 .. " is leap ")
	else
		WorkPad1:setText("year " .. year1 .. " is not leap ")
	end

   -- call your function on year yyyy
   -- and put on WorkPad2

end