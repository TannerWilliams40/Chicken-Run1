local composer = require( "composer" )
local scene = composer.newScene()
local widget = require "widget"
local returnBtn
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5
-- 'onRelease' event listener for playBtn
local function onMenuBtnRelease()
	
	-- go to level1.lua scene
	composer.gotoScene( "menu", "fade", 500 )
	
	return true	-- indicates successful touch
end

local function onScoreBtnRelease()

	composer.gotoScene( "scores", "fade", 500)

	return true
end

local function onReplayBtnRelease()

	composer.gotoScene( "level1", "fade", 500)

	return true
end

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	-- create a grey rectangle as the backdrop
	local background = display.newRect( 0, 0, screenW, screenH )
	background.anchorX = 0
	background.anchorY = 0
	background:setFillColor( .196, .76, .917 )
	
	menuBtn = widget.newButton{
		label="Main Menu",
		labelColor = { default={0}, over={.5} },
		default="button.png",
		over="button-over.png",
		fontSize = 50,
		width=600, height=600,
		onRelease = onMenuBtnRelease	}

	replayBtn = widget.newButton{
		label="Replay",
		labelColor = { default={0}, over={.5} },
		default="button.png",
		over="button-over.png",
		fontSize = 50,
		width=1200, height=900,
		onRelease = onReplayBtnRelease }

	scoreBtn = widget.newButton{
		label="High Scores",
		labelColor = { default={0}, over={.5} },
		default="button.png",
		over="button-over.png",
		fontSize = 50,
		width=1800, height=600,
		onRelease = onScoreBtnRelease }

		sceneGroup:insert( background )
		sceneGroup:insert( menuBtn )
		sceneGroup:insert( replayBtn )
		sceneGroup:insert( scoreBtn )

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