-- -----------------------------------------------------------------------------------
-- Ludum Dare 38 "A Small World"
--
-- An Game by @WraithOne
-- -----------------------------------------------------------------------------------

local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local terrainSheet =
{
	frames =
	{
		{--dirt_06.png 1
			x=732,y=710,width=120,height=140
		},
		{--dirt_11.png 2
			x=732,y=0,width=120,height=140
		},
		{--dirt_12.png 3
			x=610,y=1846,width=120,height=140
		},
		{--dirt_13.png 4
			x=610,y=1704,width=120,height=140
		},
		{--dirt_14.png 5
			x=610,y=1562,width=120,height=140
		},
		{--dirt_15.png 6
			x=610,y=1420,width=120,height=140
		},
		{--dirt_16.png 7
			x=122,y=426,width=120,height=140
		},
		{--dirt_17.png 8
			x=610,y=1136,width=120,height=140
		},
		{--dirt_18.png 9
			x=610,y=994,width=120,height=140
		},
		{--grass_05.png 10
			x=610,y=142,width=120,height=140
		},
		{--grass_10.png 11
			x=488,y=1420,width=120,height=140
		},
		{--grass_11.png 12
			x=488,y=1278,width=120,height=140
		},
		{--grass_12.png 13
			x=488,y=1136,width=120,height=140
		},
		{--grass_13.png 14
			x=488,y=994,width=120,height=140
		},
		{--grass_14.png 15
			x=488,y=852,width=120,height=140
		},
		{--grass_15.png 16
			x=488,y=710,width=120,height=140
		},
		{--grass_16.png 17
			x=488,y=568,width=120,height=140
		},
		{--sand_07.png 18
			x=244,y=426,width=120,height=140
		},
		{--sand_12.png 19
			x=122,y=1704,width=120,height=140
		},
		{--sand_13.png 20
			x=122,y=1562,width=120,height=140
		},
		{--sand_14.png 21
			x=122,y=1420,width=120,height=140
		},
		{--sand_15.png 22
			x=122,y=1278,width=120,height=140
		},
		{--sand_16.png 23
			x=122,y=1136,width=120,height=140
		},
		{--sand_17.png 24
			x=122,y=994,width=120,height=140
		},
		{--sand_18.png 25
			x=122,y=852,width=120,height=140
		},
		{--stone_07.png 26
			x=0,y=1704,width=120,height=140
		},
		{--stone_12.png 27
			x=0,y=994,width=120,height=140
		},
		{--stone_13.png 28
			x=0,y=852,width=120,height=140
		},
		{--medieval_farm.png 29
			x=854,y=1846,width=120,height=140
		},
		{--medieval_house.png 30
			x=854,y=1704,width=120,height=140
		},
		{--medieval_lumber.png 31
			x=610,y=852,width=120,height=140
		},
		{--medieval_openCastle.png 32
			x=854,y=1136,width=120,height=140
		},
	},
}
local terrainTiles = graphics.newImageSheet( "data/gfx/hexagonAll_sheet.png", terrainSheet )

local sheetOptions =
{
	width = 75, height = 75, numFrames = 4
}
local powerUps = graphics.newImageSheet( "data/gfx/PowerUp.png", sheetOptions)

local sequenceOptions =
{
    {
        name = "normal",
        start = 1,
        count = 4,
        time = 800,
        loopCount = 0,
		loopDirection = "forward"
    }
}
local powerUpAxeSprite = display.newSprite(powerUps, sequenceOptions)
local powerUpScytheSprite = display.newSprite(powerUps, sequenceOptions)

-- Initialize variables
local playable = true
local gameLoopTimer
local gameTime = 60
local playerscore = 0
local enemiescore = 0
local enemie

-- Map
local mapTable = {}
local mapWidth = 11
local mapHeight = 7

-- Player
local playerWood = 0
local playerFood = 0
local playerVilligar = 0
local playerSoldier = 0

-- Enemie
local enemieWood = 0
local enemieFood = 0
local enemieVilligar = 0
local enemieSoldier = 0

-- Power Ups
local powerUpduratuion = 10
local powerUpAmount = 2
local powerUpCosts = 10

local playerpowerUpAxe = false
local playerpowerUpAxeTimer = 0
local playerpowerUpScythe = false
local playerpowerUpScytheTimer = 0
local enemiepowerUpAxe = false
local enemiepowerUpAxeTimer = 0
local enemiepowerUpScythe = false
local enemiepowerUpScytheTimer = 0

-- Scenegroups
local backGroup
local mainGroup
local uiGroup

-- Text
local gameEndText
local gameTimeText
local playerText
local playerWoodText
local playerFoodText
local playerHouseText
local playerSoldierText
local playerpowerUpAxeText
local playerpowerUpScytheText

local enemieText
local enemieWoodText
local enemieFoodText
local enemieHouseText
local enemieSoldierText
local playerpowerUpAxeText
local playerpowerUpScytheText

-- Audio

-- Functions
local function updateText()
	if(playable) then
		gameTimeText.text = "Time left:" .. gameTime
		playerWoodText.text = "Wood: " .. playerWood
		playerFoodText.text = "Food: " .. playerFood
		playerHouseText.text = "Villigars: " .. playerVilligar
		playerSoldierText.text = "Soldiers: " .. playerSoldier
		if(playerpowerUpAxe) then
			playerpowerUpAxeText.y = 580
		else
			playerpowerUpAxeText.y = -100
		end
		playerpowerUpAxeText.text = "" .. playerpowerUpAxeTimer
		if(playerpowerUpScythe) then
			playerpowerUpScytheText.y = 580
		else
			playerpowerUpScytheText.y = -100
		end
		playerpowerUpScytheText.text = "" .. playerpowerUpScytheTimer

		enemieWoodText.text = "Wood: " .. enemieWood
		enemieFoodText.text = "Food: " .. enemieFood
		enemieHouseText.text = "Houses: " .. enemieVilligar
		enemieSoldierText.text = "Soldiers: " .. enemieSoldier
		if(enemiepowerUpAxe) then
			enemiepowerUpAxeText.y = 260
		else
			enemiepowerUpAxeText.y = -100
		end
		enemiepowerUpAxeText.text = "" .. enemiepowerUpAxeTimer
		if(enemiepowerUpScythe) then
			enemiepowerUpScytheText.y = 260
		else
			enemiepowerUpScytheText.y = -100
		end
		enemiepowerUpScytheText.text = "" .. enemiepowerUpScytheTimer
	end
end

local function powerUpAxeClicked()
	if(playable) then
		if( playerFood >= powerUpCosts) then
			playerpowerUpAxe = true
			playerpowerUpAxeTimer = powerUpduratuion
			powerUpAxeSprite:setFrame(2)
			playerFood = playerFood - powerUpCosts
		end
	end
end

local function powerUpScytheClicker()
	if(playable) then
		if ( playerWood >= powerUpCosts) then
			playerpowerUpScythe = true
			playerpowerUpScytheTimer = powerUpduratuion
			powerUpScytheSprite:setFrame(4)
			playerWood = playerWood - powerUpCosts
		end
	end
end

local function updatePowerUp()
	if(playable) then
		-- Player
		if (playerpowerUpAxeTimer <= 0) then
			playerpowerUpAxe = false
			powerUpAxeSprite:setFrame(1)
		end
		if (playerpowerUpScytheTimer <= 0) then
			playerpowerUpScythe = false
			powerUpScytheSprite:setFrame(3)
		end
		if(playerpowerUpAxe) then
			playerpowerUpAxeTimer = playerpowerUpAxeTimer - 1
		end
		if(playerpowerUpScythe) then
			playerpowerUpScytheTimer = playerpowerUpScytheTimer - 1
		end
		-- Enemie
		if (enemiepowerUpAxeTimer <= 0) then
			enemiepowerUpAxe = false
		end
		if (enemiepowerUpScytheTimer <= 0) then
			enemiepowerUpScythe = false
		end
		if(enemiepowerUpAxe) then
			enemiepowerUpAxeTimer = enemiepowerUpAxeTimer - 1
		end
		if(enemiepowerUpScythe) then
			enemiepowerUpScytheTimer = enemiepowerUpScytheTimer - 1
		end
	end
end

local function farmClicked()
	if(playable) then
		if(playerpowerUpScythe) then
			playerFood = playerFood + powerUpAmount
		else
			playerFood = playerFood + 1
		end
		updateText()
	end
end

local function houseClicked()
	if(playable) then
		if(playerFood >= 3 and playerWood >= 3) then
			playerVilligar = playerVilligar + 1
			playerFood = playerFood - 3
			playerWood = playerWood - 3
			else
			-- Warning Text
		end
		updateText()
	end
end

local function lumbermillClicked()
	if(playable) then
		if (playerpowerUpAxe) then
			playerWood = playerWood + powerUpAmount
		else
			playerWood = playerWood + 1
		end
		updateText()
	end
end

local function castleClicked()
	if(playable) then
		if(playerFood >= 10 and playerWood >= 10 and playerVilligar >= 1) then
			playerSoldier = playerSoldier + 1
			playerFood = playerFood - 10
			playerWood = playerWood - 10
			playerVilligar = playerVilligar -1
			else
			-- Warning Text
		end
		
		updateText()
	end	
end

local function createMap()
	local offsetX = 0
	local offsetY = 0
	local tilenumber = 0
	local newTile

	for i = 0, mapHeight do
		for j = 0, mapWidth do
			local rnd = 0
			tilenumber = tilenumber + 1

			if(tilenumber == 28) then
			-- Enemie Farm
				rnd = 31
				newTile = display.newImageRect(mainGroup, terrainTiles, rnd ,120,140)
			elseif(tilenumber == 30) then
			-- Enemie House
				rnd = 30
				newTile = display.newImageRect(mainGroup, terrainTiles, rnd ,120,140)
			elseif(tilenumber == 32) then
			-- Enemie Lumber mill
				rnd = 29
				newTile = display.newImageRect(mainGroup, terrainTiles, rnd ,120,140)
			elseif(tilenumber == 42) then
			-- Enemie Castle
				rnd = 32
				newTile = display.newImageRect(mainGroup, terrainTiles, rnd ,120,140)
			elseif(tilenumber == 66) then
			-- Player Castle
				rnd = 32
				newTile = display.newImageRect(mainGroup, terrainTiles, rnd ,120,140)
				newTile:addEventListener("tap", castleClicked)
			elseif(tilenumber == 76) then
			-- Player Farm
				rnd = 31
				newTile = display.newImageRect(mainGroup, terrainTiles, rnd ,120,140)
				newTile:addEventListener("tap", farmClicked)
			elseif(tilenumber == 78) then
			-- Player House
				rnd = 30
				newTile = display.newImageRect(mainGroup, terrainTiles, rnd ,120,140)
				newTile:addEventListener("tap", houseClicked)
			elseif(tilenumber == 80) then
			-- Player Lumber mill
				rnd = 29
				newTile = display.newImageRect(mainGroup, terrainTiles, rnd ,120,140)
				newTile:addEventListener("tap", lumbermillClicked)
			else
			-- Terrain
				rnd = math.random(28)
				newTile = display.newImageRect(backGroup, terrainTiles, rnd ,120,140)
			end

			table.insert(mapTable, newTile)
			if(i%2 == 0) then
				offsetX = 0
				offsetY = i * 35
			else
				offsetX = 60
				offsetY = i * 35
			end

			newTile.x = j * 120 + offsetX
			newTile.y = i * 140 - offsetY
		end
	end
end

local function computeScore()
	playerscore = playerWood + playerFood + (playerVilligar * 50) + (playerSoldier * 100)
	enemiescore = enemieWood + enemieFood + (enemieVilligar * 50) + (enemieSoldier * 100)
end

local function endGame()
	playable = false
	powerUpAxeSprite.y = -100
	powerUpScytheSprite.y = -100
	computeScore()
	if(playerscore > enemiescore) then
		gameEndText.text = "!VICTORY!"
		gameEndText:setFillColor(0,0,1)
		gameEndText.x = display.contentCenterX
		gameEndText.y = display.contentCenterY
		composer.setVariable("finalScore", playerscore)
		composer.gotoScene("highscore", {time=5000, effect="crossFade"})
	else
		gameEndText.text = "DEFEATED"
		gameEndText:setFillColor(1, 0, 0)
		gameEndText.x = display.contentCenterX
		gameEndText.y = display.contentCenterY
		composer.gotoScene("menu", {time=5000, effect="crossFade"})
	end
end

local function abortGame()
	playable = false
	composer.gotoScene("menu", { time=800, effect="crossFade" })
end

local function computeAI()
	if(playable) then

	end
end

local function gameLoop()
	gameTime = gameTime - 1
	if(gameTime < 1) then
		endGame()
	end
	if(playable) then
		computeAI()

		updatePowerUp()
		updateText()
	end
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	-- Set up display groups
	backGroup = display.newGroup()  -- Display group for the background image
	sceneGroup:insert( backGroup )  -- Insert into the scene's view group

	mainGroup = display.newGroup()  -- Display group for the ship, asteroids, lasers, etc.
	sceneGroup:insert( mainGroup )  -- Insert into the scene's view group

	uiGroup = display.newGroup()    -- Display group for UI objects like the score
	sceneGroup:insert( uiGroup )    -- Insert into the scene's view group

	-- Map
	createMap()

	-- Display Texts
	local enemieRectangle = display.newRect( uiGroup, display.contentCenterX, 5, 700, 125 )
	enemieRectangle:setFillColor( 0.5 )
	enemieText = display.newText( uiGroup, "Enemie ", 90, 45, native.systemFont, 48)
	enemieText:setFillColor(1,0,0)
	enemieWoodText = display.newText(uiGroup, "Wood: " .. enemieWood, 360, 45, native.systemFont, 32)
	enemieFoodText = display.newText(uiGroup, "Food: " .. enemieFood, 540, 45, native.systemFont, 32)
	enemieHouseText = display.newText(uiGroup, "Villigars: " .. enemieVilligar, 715, 45, native.systemFont, 32)
	enemieSoldierText = display.newText(uiGroup, "Soldiers: " .. enemieSoldier, 900, 45, native.systemFont, 32)

	local abortButton = display.newText( sceneGroup, "Exit", 1225, 45, native.systemFont, 48 )
	abortButton:setFillColor( 0, 0, 0 )
	abortButton:addEventListener( "tap", abortGame )

	local playerRectangle = display.newRect( uiGroup, display.contentCenterX, 770, 700, 125 )
	playerRectangle:setFillColor( 0.5 )
	playerText = display.newText( uiGroup, "Player ", 90, 720, native.systemFont, 48)
	playerText:setFillColor(0,0,1)
	playerWoodText = display.newText(uiGroup, "Wood: " .. playerWood, 360, 727, native.systemFont, 32)
	playerFoodText = display.newText(uiGroup, "Food: " .. playerFood, 540, 727, native.systemFont, 32)
	playerHouseText = display.newText(uiGroup, "Villigars: " .. playerVilligar, 715, 727, native.systemFont, 32)
	playerSoldierText = display.newText(uiGroup, "Soldiers: " .. playerSoldier, 900, 727, native.systemFont, 32)
	gameTimeText = display.newText(uiGroup, "Time left: ".. gameTime, 1135, 720, native.systemFont, 48)
	gameTimeText:setFillColor(0,1,0)

	powerUpAxeSprite:setFrame(1)
	powerUpAxeSprite.x = 1170
	powerUpAxeSprite.y = 600
	powerUpAxeSprite:addEventListener("tap", powerUpAxeClicked)
	
	powerUpScytheSprite:setFrame(3)
	powerUpScytheSprite.x = 100
	powerUpScytheSprite.y = 600
	powerUpScytheSprite:addEventListener("tap", powerUpScytheClicker)

	playerpowerUpAxeText = display.newText(uiGroup, "".. playerpowerUpAxeTimer , 840, -100, native.systemFont, 32)
	playerpowerUpAxeText:setFillColor(0,0,1)
	playerpowerUpScytheText = display.newText(uiGroup, "".. playerpowerUpScytheTimer , 360, -100, native.systemFont, 32)
	playerpowerUpScytheText:setFillColor(0,0,1)

	enemiepowerUpAxeText = display.newText(uiGroup, "".. enemiepowerUpAxeTimer , 840, -100, native.systemFont, 32)
	enemiepowerUpAxeText:setFillColor(1, 0, 0)
	enemiepowerUpScytheText = display.newText(uiGroup, "".. enemiepowerUpScytheTimer , 360, -100, native.systemFont, 32)
	enemiepowerUpScytheText:setFillColor(1, 0, 0)

	gameEndText = display.newText(uiGroup, "", -100, -100, native.systemFont, 76)
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		gameLoopTimer = timer.performWithDelay( 1000, gameLoop, 0 )
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		composer.removeScene( "game" )
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
