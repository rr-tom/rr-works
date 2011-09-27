-- w4.lua 
-- use tables to present towers and disks

module(..., package.seeall)

local towers = {}

towers["t1"] = {}
towers["t2"] = {}
towers["t3"] = {}

local function towerStart()
	towers["t1"] = {3, 2, 1}
	towers["t2"] = {}
	towers["t3"] = {}
end

local function towerStep1()
	-- homework
end

local function towerStep6()
	-- homework
end

run = function()
	WorkPad1:setText("start is on worktable 1-3")
	WorkPad2:setText("step1 is on worktable 4-6")
	
	towerStart()
	for i=1,3 do
		WorkTable[i]:setText("start tower ".. i .. " contain " .. 
			(towers["t"..i][1] or " ") ..",".. 
			(towers["t"..i][2] or " ") ..",".. 
			(towers["t"..i][3] or " ") )
	end
	
	towerStep1()
	for i=1,3 do
		WorkTable[i+3]:setText("step1 tower ".. i .. " contain " .. 
			(towers["t"..i][1] or " ") ..",".. 
			(towers["t"..i][2] or " ")..",".. 
			(towers["t"..i][3] or " ") )
	end
	
	towerStep6()
	for i=1,3 do
		WorkTable[i+6]:setText("step6 tower ".. i .. " contain " .. 
			(towers["t"..i][1] or " ") ..",".. 
			(towers["t"..i][2] or " ")..",".. 
			(towers["t"..i][3] or " ") )
	end
end