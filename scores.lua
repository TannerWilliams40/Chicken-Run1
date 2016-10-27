-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local data = require( "data" )
local scene = composer.newScene()
local widget = require "widget"
local returnBtn
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5
-- 'onRelease' event listener for playBtn
local hscores
local function onReturnBtnRelease()
	
	-- go to level1.lua scene
	composer.gotoScene( "menu", "fade", 500 )
	
	return true	-- indicates successful touch
end
function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	-- create a grey rectangle as the backdrop
	local background = display.newImageRect( "HighScores.png", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	
	local H1 = display.newText (data[1], display.contentWidth/2, display.contentHeight/2 - 140, native.systemFont, 30)
	local H2 = display.newText (data[2], display.contentWidth/2, display.contentHeight/2 - 90, native.systemFont, 30)
	local H3 = display.newText (data[3], display.contentWidth/2, display.contentHeight/2 - 40, native.systemFont, 30)
	local H4 = display.newText (data[4], display.contentWidth/2, display.contentHeight/2 + 10, native.systemFont, 30)
	local H5 = display.newText (data[5], display.contentWidth/2, display.contentHeight/2 + 60, native.systemFont, 30)
	local H6 = display.newText (data[6], display.contentWidth/2, display.contentHeight/2 + 110, native.systemFont, 30)
	local H7 = display.newText (data[7], display.contentWidth/2, display.contentHeight/2 + 160, native.systemFont, 30)
	local H8 = display.newText (data[8], display.contentWidth/2, display.contentHeight/2 + 210, native.systemFont, 30)

	returnBtn = display.newText("Return", display.contentWidth/2 - 450, display.contentHeight/2 - 250, native.systemFont, 50)	
	returnBtn:setFillColor(0, 0, 0)
	function returnBtn:tap(event)
		composer.gotoScene("menu", "fade", 500)
		composer.removeScene("scores")
	end
	returnBtn:addEventListener("tap", returnBtn)
	
	sceneGroup:insert( background )
	sceneGroup:insert( H1 )
	sceneGroup:insert( H2 )
	sceneGroup:insert( H3 )
	sceneGroup:insert( H4 )
	sceneGroup:insert( H5 )
	sceneGroup:insert( H6 )
	sceneGroup:insert( H7 )
	sceneGroup:insert( H8 )
	sceneGroup:insert( returnBtn )
end
function scene:show( event )
local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end


--------------------------------------------

-- forward declarations and other locals


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
return scene