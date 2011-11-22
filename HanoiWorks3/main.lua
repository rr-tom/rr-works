-- 
-- Abstract: The hanoi game platform for the tutoring class
--
-- Copyright (C) 2011 Reflexive Rabbit
--
-- based on DragPlatforms sample project
-- 
-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.


gSticks = {}
gPlates = {}

local hanoiLevel = require("hanoiLevel")
local hanoiDrag = require("hanoiDrag")
local hanoiGame = require("hanoiGame")
local hanoiCredit = require("hanoiCredit")
local hanoiRecord = require("hanoiRecord")

display.setStatusBar( display.HiddenStatusBar )

hanoiLevel.setup()
hanoiCredit.setup()
-- hanoiRecord.setup()

