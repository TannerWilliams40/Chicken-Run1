-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require "widget"
local data = require "data"

-- include Corona's "physics" library
local physics = require "physics"
physics.start()
physics.setGravity(0,9.81)

--------------------------------------------

-- forward declarations and other locals
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

	composer.removeScene("level1")
	composer.gotoScene( "level1", "fade", 500)

	return true
end

function scene:create( event )

	local n = 0
	local data = require "data"
	local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5
	local TOP_REF = 0
	local BOTTOM_REF = 1
	local LEFT_REF = 0
	local RIGHT_REF = 1
	local CENTER_REF = 0.5
	local baseline = 650
	local distance = 0
	local sceneGroup = self.view


	local distanceText = display.newText("Distance: "..distance, 200, 30, native.systemFont, 30)
	distanceText:setFillColor(0, 0, 0)
	local mountains = display.newImage( "Mountains.png", screenW, 82 )
	mountains.anchorX = LEFT_REF
	mountains.x = -100
	mountains.y = baseline - 225
	local mnts2 = display.newImage( "Mountains.png", screenW, 82 )
	mnts2.anchorX = LEFT_REF
	mnts2.x = 1500
	mnts2.y = baseline - 225
	local obj = {20}
	local centerX = display.contentCenterX
	local centerY = display.contentCenterY


	-- create a grey rectangle as the backdrop
	local background = display.newRect( 0, 0, screenW, screenH )
	background.anchorX = 0
	background.anchorY = 0
	background:setFillColor( .196, .76, .917 )
	
	-- create a grass object and add physics (with custom shape)

	local ground = display.newRect(centerX, baseline - 67.5, screenW + 10000, 10)
	ground.alpha = 0
	physics.addBody(ground, "static", {friction=0, bounce=0})

	obj[1] = display.newImageRect( "Tree3.png", 204, 200 ) 
	obj[1].xScale = 1.3
	obj[1].yScale = 1.3
	obj[1].anchorY = BOTTOM_REF
	obj[1].x = 300 
	obj[1].y = baseline-60 
	obj[1].dx = 4

	obj[2] = display.newImage( "Cloud1.png", 300, 100 ) 
	obj[2].xScale = 1.2
	obj[2].yScale = 1.2
	obj[2].anchorY = BOTTOM_REF
	obj[2].x = 400 
	obj[2].y = 200 
	obj[2].dx = 1.2

	obj[3] = display.newImage( "Cloud2.png", 300, 100 ) 
	obj[3].xScale = 1.8
	obj[3].yScale = 1.8
	obj[3].anchorY = BOTTOM_REF
	obj[3].x = 600 
	obj[3].y = 180
	obj[3].dx = 1.2

	obj[4] = display.newImage( "Cloud3.png", 300, 100 ) 
	obj[4].xScale = 1.4
	obj[4].yScale = 1.4
	obj[4].anchorY = BOTTOM_REF
	obj[4].x = 1050 
	obj[4].y = 240
	obj[4].dx = 1.2

	obj[5] = display.newImage( "Tree2.png", 300, 100 ) 
	obj[5].xScale = 1.2
	obj[5].yScale = 1.2
	obj[5].anchorY = BOTTOM_REF
	obj[5].x = 900 
	obj[5].y = baseline-60 
	obj[5].dx = 4

	obj[6] = display.newImage( "Cloud4.png", 300, 100 ) 
	obj[6].yScale = 1.1
	obj[6].anchorY = BOTTOM_REF
	obj[6].x = 1500 
	obj[6].y = 240 
	obj[6].dx = 1.2

	obj[7] = display.newImage( "Boulder3.png", 300, 100 ) 
	obj[7].yScale = 1.1
	obj[7].anchorY = BOTTOM_REF
	obj[7].x = 600
	obj[7].y = baseline-70
	obj[7].dx = 4

	obj[8] = display.newImage( "Bush1.png", 300, 100 ) 
	obj[8].yScale = 1.1
	obj[8].anchorY = BOTTOM_REF
	obj[8].x = 1200 
	obj[8].y = baseline-75
	obj[8].dx = 4

	obj[9] = display.newImage( "Boulder1.png", 300, 100 ) 
	obj[9].yScale = 1.1
	obj[9].anchorY = BOTTOM_REF
	obj[9].x = 1500 
	obj[9].y = baseline-60
	obj[9].dx = 4

	obj[10] = display.newImage( "Crate.png", 300, 100 ) 
	obj[10].yScale = 1.1
	obj[10].anchorY = BOTTOM_REF
	obj[10].x = 1700 
	obj[10].y = baseline-60
	obj[10].dx = 12
	physics.addBody(obj[10], "kinematic" )

	obj[11] = display.newImage( "Crate.png", 300, 100 ) 
	obj[11].yScale = 1.1
	obj[11].anchorY = BOTTOM_REF
	obj[11].x = 3000 
	obj[11].y = baseline-60
	obj[11].dx = 12
	physics.addBody(obj[11], "kinematic" )

	obj[12] = display.newImage( "Crate.png", 300, 100 ) 
	obj[12].yScale = 1.1
	obj[12].anchorY = BOTTOM_REF
	obj[12].x = 3000 
	obj[12].y = baseline-170
	obj[12].dx = 12
	physics.addBody(obj[12], "kinematic" )

	obj[13] = display.newImage( "Crate.png", 300, 100 ) 
	obj[13].yScale = 1.1
	obj[13].anchorY = BOTTOM_REF
	obj[13].x = 4000 
	obj[13].y = baseline-60
	obj[13].dx = 12
	physics.addBody(obj[13], "kinematic" )

	obj[14] = display.newImage( "Crate.png", 300, 100 ) 
	obj[14].yScale = 1.1
	obj[14].anchorY = BOTTOM_REF
	obj[14].x = 5000 
	obj[14].y = baseline-60
	obj[14].dx = 12
	physics.addBody(obj[14], "kinematic" )

	obj[15] = display.newImage( "Crate.png", 300, 100 ) 
	obj[15].yScale = 1.1
	obj[15].anchorY = BOTTOM_REF
	obj[15].x = 5100 
	obj[15].y = baseline-60
	obj[15].dx = 12
	physics.addBody(obj[15], "kinematic" )

	obj[16] = display.newImage( "Crate.png", 300, 100 ) 
	obj[16].yScale = 1.1
	obj[16].anchorY = BOTTOM_REF
	obj[16].x = 5100 
	obj[16].y = baseline-170
	obj[16].dx = 12 
	physics.addBody(obj[16], "kinematic" )
	local options = {
	width = 200,
	height = 150,
	numFrames = 6
}
	local sequencedata = {
	{
	name = "running",
	start = 1,
	count = 5,
	time = 500
}
}
	local imagesheet = graphics.newImageSheet ("chickenthing.png", options)
	local c1 = display.newSprite( imagesheet, sequencedata )
	c1.anchorX = LEFT_REF
	c1.x = 200
	c1.y = baseline - 110
	c1:play()
	physics.addBody(c1, "dynamic", {friction=0, bounce=0})
	local jumpBtn = display.newText("          ", display.contentWidth/2, display.contentHeight/2, native.systemFont, 1000)	
	jumpBtn:setFillColor(0, 0, 0)
	function jumpBtn:touch(event)
		c1:pause()
		c1:pause()
		c1:pause()
		if(c1.y > baseline - 170 and event.phase == "began") then
			c1:setLinearVelocity( 0, -390 )
		end
		c1:play()
	end
	jumpBtn:addEventListener("touch", touch)

	local grass = display.newImage( "grass2.png", screenW, 82 )
	grass.anchorX = LEFT_REF
	grass.x = -10
	grass.y = baseline - 40
	local grass2 = display.newImage( "grass2.png", screenW, 82 )
	grass2.anchorX = LEFT_REF
	grass2.x = 640
	grass2.y = baseline - 40
	local grass3 = display.newImage( "grass2.png", screenW, 82)
	grass3.anchorX = LEFT_REF
	grass3.x = 1290
	grass3.y = baseline - 40

	local tPrevious = system.getTimer() 
	local function move(event)
		local tDelta = event.time - tPrevious
		tPrevious = event.time
		distance = distance + (tDelta*.01)
		distanceText.text = "Distance: "..math.round(distance).." meters" 

		obj[10].dx = obj[10].dx + (tDelta*.00008)
		obj[11].dx = obj[10].dx + (tDelta*.00008)
		obj[12].dx = obj[10].dx + (tDelta*.00008)
		obj[13].dx = obj[10].dx + (tDelta*.00008)
		obj[14].dx = obj[10].dx + (tDelta*.00008)
		obj[15].dx = obj[10].dx + (tDelta*.00008)
		obj[16].dx = obj[10].dx + (tDelta*.00008)


		local xOffset = ( 0.2 * tDelta )

		local soundEffect = audio.loadSound ("rec8.wav")
		local soundEffect2 = audio.loadSound ("rec7.wav") 
		local soundEffect3 = audio.loadSound ("rec9.wav")
		
		mountains.x =mountains.x - xOffset/10 
		mnts2.x = mnts2.x - xOffset/10
		if (mountains.x + mountains.width) < -30 then 
			mountains:translate( 2800, 0)
		end
		if (mnts2.x + mnts2.width) < -30 then
			mnts2:translate( 2800, 0) 
		end
		obj[2].x = obj[2].x - obj[2].dx 
		obj[3].x = obj[3].x - obj[3].dx
		obj[4].x = obj[4].x - obj[4].dx
		obj[6].x = obj[6].x - obj[6].dx
		if (obj[2].x + obj[2].width) < -30 then 
			obj[2]:translate( 1550, 0)
		end
		if (obj[3].x + obj[3].width) < -30 then
			obj[3]:translate( 1550, 0) 
		end
		if (obj[4].x + obj[4].width) < -30 then 
			obj[4]:translate( 1550, 0)
		end	
		if (obj[6].x + obj[6].width - 255) < -30 then
			obj[6]:translate( 1550, 0)
		end
		obj[1].x = obj[1].x - obj[1].dx 
		obj[5].x = obj[5].x - obj[5].dx
		obj[7].x = obj[7].x - obj[7].dx
		obj[8].x = obj[8].x - obj[8].dx
		obj[9].x = obj[9].x - obj[9].dx
		obj[10].x = obj[10].x - obj[10].dx
		obj[11].x = obj[11].x - obj[11].dx
		obj[12].x = obj[12].x - obj[12].dx
		obj[13].x = obj[13].x - obj[13].dx
		obj[14].x = obj[14].x - obj[14].dx
		obj[15].x = obj[15].x - obj[15].dx
		obj[16].x = obj[16].x - obj[16].dx
		if (obj[1].x + obj[1].width) < -30 then 
			obj[1]:translate( 1550, 0)
			audio.play( soundEffect2 )
		end
		if (obj[5].x + obj[5].width) < -30 then
			obj[5]:translate( 1550, 0) 
		end
		if (obj[7].x + obj[7].width) < -30 then
			obj[7]:translate( 1550, 0) 
		end
		if (obj[8].x + obj[8].width) < -30 then
			obj[8]:translate( 1550, 0) 
			audio.play( soundEffect )
		end
		if (obj[9].x + obj[9].width) < -30 then
			obj[9]:translate( 1550, 0) 
		end
		if (obj[10].x + obj[10].width) < -30 then
			obj[10]:translate( 4500, 0) 
		end
		if (obj[11].x + obj[11].width) < -30 then
			obj[11]:translate( 4500, 0) 
		end
		if (obj[12].x + obj[12].width) < -30 then
			obj[12]:translate( 4500, 0) 
		end
		if (obj[13].x + obj[13].width) < -30 then
			obj[13]:translate( 4500, 0) 
		end
		if (obj[14].x + obj[14].width) < -30 then
			obj[14]:translate( 4500, 0) 
		end
		if (obj[15].x + obj[15].width) < -30 then
			obj[15]:translate( 4500, 0) 
		end
		if (obj[16].x + obj[16].width) < -30 then
			obj[16]:translate( 4500, 0) 
		end
		grass.x = grass.x - (xOffset*(1.8 + (tDelta *.008)))
		grass2.x = grass2.x - (xOffset*(1.8 + (tDelta *.008)))
		grass3.x = grass3.x - (xOffset*(1.8 + (tDelta *.008)))
		if (grass.x + grass.width) < -30 then 
			grass:translate( 1950, 0)
		end
		if (grass2.x + grass2.width) < -30 then
			grass2:translate( 1950, 0) 
		end
		if (grass3.x + grass3.width) < -30 then 
			grass3:translate( 1950, 0)
		end	

		function onDeath( event)

		print "onDeath"

		jumpBtn:removeEventListener("touch", touch )
		
		local menurect = display.newRoundedRect(display.contentWidth/2 - 350, display.contentHeight/2 - 46, 300, 70, 12)
		sceneGroup:insert( menurect )

		menuBtn = display.newText("Main Menu", display.contentWidth/2 - 350, display.contentHeight/2 - 50, native.systemFont, 50)	
		menuBtn:setFillColor(0, 0, 0)
		function menuBtn:tap(event)
			composer.gotoScene("menu", "fade", 500)
			composer.removeScene("level1")
		end
		menuBtn:addEventListener("tap", menuBtn)


		local scorerect = display.newRoundedRect(display.contentWidth/2 + 350, display.contentHeight/2 - 46, 300, 70, 12)
		sceneGroup:insert( scorerect )

		scoreBtn = display.newText("High Scores", display.contentWidth/2 + 350, display.contentHeight/2 - 50, native.systemFont, 50)
		scoreBtn:setFillColor(0, 0, 0)
		function scoreBtn:tap(event)
			composer.gotoScene("scores", "fade", 500)
			composer.removeScene("level1")
		end
		scoreBtn:addEventListener("tap", scoreBtn)

		sceneGroup:insert(menuBtn)
		sceneGroup:insert(scoreBtn)

	end

		local function onLocalCollision( self, event )
			if ( event.phase == "began" ) then
				if n == 0 then
					local k = 8
					local temp = -1
					for i = 1, 8 do
						if (data[k] > distance) then
							break
						end
					temp = k
					k = k - 1
					end
					for i = 8, temp, -1 do
					data[i] = data[i - 1]
					end
					data[temp] = math.floor(distance + .5)
					print (data[1])
					print (data[2])
					print (data[3])
					print (data[4])
					print (data[5])
					print (data[6])
					print (data[7])
					print (data[8])
					c1:pause()
					physics.pause()
					audio.play( soundEffect3 )
					onDeath()
					Runtime:removeEventListener( "enterFrame", move )
				end
				n = n +1
			end
		end
		obj[10].collision = onLocalCollision
		obj[10]:addEventListener( "collision", obj[10] )
		obj[11].collision = onLocalCollision
		obj[11]:addEventListener( "collision", obj[11] )
		obj[12].collision = onLocalCollision
		obj[12]:addEventListener( "collision", obj[12] )
		obj[13].collision = onLocalCollision
		obj[13]:addEventListener( "collision", obj[13] )
		obj[14].collision = onLocalCollision
		obj[14]:addEventListener( "collision", obj[14] )
		obj[15].collision = onLocalCollision
		obj[15]:addEventListener( "collision", obj[15] )
		obj[16].collision = onLocalCollision
		obj[16]:addEventListener( "collision", obj[16] )
	end
	-- all display objects must be inserted into group

	sceneGroup:insert( background )


	sceneGroup:insert(mountains)
	sceneGroup:insert(mnts2)
	sceneGroup:insert(obj[2])
	sceneGroup:insert(obj[3])
	sceneGroup:insert(obj[4])
	sceneGroup:insert(obj[6])
	sceneGroup:insert(obj[5])
	sceneGroup:insert(obj[1])
	sceneGroup:insert(obj[7])
	sceneGroup:insert(obj[8])
	sceneGroup:insert(obj[9])
	sceneGroup:insert(obj[10])
	sceneGroup:insert(obj[11])
	sceneGroup:insert(obj[12])
	sceneGroup:insert(obj[13])
	sceneGroup:insert(obj[14])
	sceneGroup:insert(obj[15])
	sceneGroup:insert(obj[16])
	--onDeath()
	sceneGroup:insert(distanceText)
	sceneGroup:insert(grass)
	sceneGroup:insert(grass2)
	sceneGroup:insert(grass3)
	sceneGroup:insert(c1)



	Runtime:addEventListener("enterFrame", move);
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		physics.start()
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		
		physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end
---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

-----------------------------------------------------------------------------------------

return scene