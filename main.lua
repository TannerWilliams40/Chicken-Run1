-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--First, declare a local reference variable for the stage.
local stage = display.currentStage
 
--Declare your parallax layers in back-to-front order and specify their distance ratio.
--This "distanceRatio" sets the layer's scrolling speed in relation to the foreground (1.0) layer.
local back00 = display.newGroup() ; back00.distanceRatio = 0.2
local back01 = display.newGroup() ; back01.distanceRatio = 0.4
local back02 = display.newGroup() ; back02.distanceRatio = 0.6
local back03 = display.newGroup() ; back03.distanceRatio = 0.8
local foreground = display.newGroup() ; foreground.distanceRatio = 1.0
 
--IMPORTANT NOTE 1: You MUST have one layer set to 1.0 ratio, even if it won't contain any objects.
--IMPORTANT NOTE 2: Attach a reference variable named "refGroup" to the stage table and set its
--value to the 1.0 layer from above. This group will be used as the core reference group in
--relation to screen touch-and-drag.
stage.refGroup = foreground
-- hide the status bar

display.setStatusBar( display.HiddenStatusBar )
local audiooptions = {
	loops = -1
}

local backgroundmusic = audio.loadStream("Loop.mp3")
audio.play(backgroundmusic, audiooptions)

-- include the Corona "composer" module
local composer = require "composer"

-- load menu screen
composer.gotoScene( "menu" )

