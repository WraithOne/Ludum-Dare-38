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
		{--dirt_06.png
			x=732,y=710,width=120,height=140
		},
		{--dirt_11.png
			x=732,y=0,width=120,height=140
		},
		{--dirt_12.png
			x=610,y=1846,width=120,height=140
		},
		{--dirt_13.png
			x=610,y=1704,width=120,height=140
		},
		{--dirt_14.png
			x=610,y=1562,width=120,height=140
		},
		{--dirt_15.png
			x=610,y=1420,width=120,height=140
		},
		{--dirt_16.png
			x=122,y=426,width=120,height=140
		},
		{--dirt_17.png
			x=610,y=1136,width=120,height=140
		},
		{--dirt_18.png
			x=610,y=994,width=120,height=140
		},
		{--grass_05.png
			x=610,y=142,width=120,height=140
		},
		{--grass_10.png 
			x=488,y=1420,width=120,height=140
		},
		{--grass_11.png 
			x=488,y=1278,width=120,height=140
		},
		{--grass_12.png 
			x=488,y=1136,width=120,height=140
		},
		{--grass_13.png 
			x=488,y=994,width=120,height=140
		},
		{--grass_14.png 
			x=488,y=852,width=120,height=140
		},
		{--grass_15.png 
			x=488,y=710,width=120,height=140
		},
		{--grass_16.png 
			x=488,y=568,width=120,height=140
		},
		{--sand_07.png
			x=244,y=426,width=120,height=140
		},
		{--sand_12.png
			x=122,y=1704,width=120,height=140
		},
		{--sand_13.png
			x=122,y=1562,width=120,height=140
		},
		{--sand_14.png
			x=122,y=1420,width=120,height=140
		},
		{--sand_15.png
			x=122,y=1278,width=120,height=140
		},
		{--sand_16.png
			x=122,y=1136,width=120,height=140
		},
		{--sand_17.png
			x=122,y=994,width=120,height=140
		},
		{--sand_18.png
			x=122,y=852,width=120,height=140
		},
		{--stone_07.png
			x=0,y=1704,width=120,height=140
		},
		{--stone_12.png
			x=0,y=994,width=120,height=140
		},
		{--stone_13.png
			x=0,y=852,width=120,height=140
		},
	},
}
local terrainTiles = graphics.newImageSheet( "hexagonAll_sheet.png", terrainSheet )

-- Initialize variables
local gameTime = 240
local score = 0

-- Map
local mapTable = {}
local mapWidth = 11
local mapHeight = 7

-- Player
local playerWood = 0
local playerFood = 0
local playerHouses = 0
local playerSoldier = 0

-- Enemie
local enemieWood = 0
local enemieFood = 0
local enemieHouse = 0
local enemieSoldier = 0

-- Scenegroups
local backGroup
local mainGroup
local uiGroup

-- Text
local gameTimeText
local playerText
local playerWoodText
local playerFoodText
local playerHouseText
local playerSoldierText
local enemieText
local enemieWoodText
local enemieFoodText
local enemieHouseText
local enemieSoldierText

-- Audio

-- Functions
local function updateText()
	gameTimeText.text = "Time left:" ..gameTime
	playerWoodText.text = "Wood: " .. playerWood
	playerFoodText.text = "Food: " .. playerFood
	playerHouseText.text = "Houses: " .. playerHouses
	playerSoldierText.text = "Soldiers: " .. playerSoldier
	enemieWoodText.text = "Wood: " .. enemieWood
	enemieFoodText.text = "Food: " .. enemieFood
	enemieHouseText.text = "Houses: " .. enemieHouse
	enemieSoldierText.text = "Soldiers: " .. enemieSoldier
end

local function createMap()
	local offsetX = 0
	local offsetY = 0
	for i = 0, mapHeight do
		for j = 0, mapWidth do
			local rnd = math.random(27)
			local newTile = display.newImageRect(mainGroup, terrainTiles, rnd ,120,140)
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
	score = playerWood + playerFood + (playerHouses * 5)+ (playerSoldier * 10)
end

local function endGame()
	computeScore()
	composer.setVariable("finalScore", score)
	composer.gotoScene("highScore", {time=800, effect="crossFade"})
end

local function abortGame()
	composer.gotoScene("menu", { time=800, effect="crossFade" })
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
	
	enemieText = display.newText( uiGroup, "Enemie ", 90, 60, native.systemFont, 48)
	enemieText:setFillColor(1,0,0)
	enemieWoodText = display.newText(uiGroup, "Wood: " .. enemieWood, 350, 60, native.systemFont, 32)
	enemieFoodText = display.newText(uiGroup, "Food: " .. enemieFood, 500, 60, native.systemFont, 32)
	enemieHouseText = display.newText(uiGroup, "Houses: " .. enemieHouse, 675, 60, native.systemFont, 32)
	enemieSoldierText = display.newText(uiGroup, "Soldiers: " .. enemieSoldier, 850, 60, native.systemFont, 32)

	local abortButton = display.newText( sceneGroup, "Exit", 1200, 60, native.systemFont, 48 )
	abortButton:setFillColor( 0, 0, 0 )
	abortButton:addEventListener( "tap", abortGame )

	playerText = display.newText( uiGroup, "Player ", 90, 700, native.systemFont, 48)
	playerText:setFillColor(0,0,1)
	playerWoodText = display.newText(uiGroup, "Wood: " .. playerWood, 350, 701, native.systemFont, 32)
	playerFoodText = display.newText(uiGroup, "Food: " .. playerFood, 500, 701, native.systemFont, 32)
	playerHouseText = display.newText(uiGroup, "Houses: " .. playerHouses, 675, 701, native.systemFont, 32)
	playerSoldierText = display.newText(uiGroup, "Soldiers: " .. playerSoldier, 850, 701, native.systemFont, 32)
	gameTimeText = display.newText(uiGroup, "Time left: ".. gameTime, 1125, 700, native.systemFont, 48)
	gameTimeText:setFillColor(0,1,0)

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

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
