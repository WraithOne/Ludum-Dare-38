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

local sheetOptions =
{
	frames =
	{
		{--dirt_01.png 
			x=732,y=1420,width=120,height=140
		},
		{--dirt_02.png 
			x=732,y=1278,width=120,height=140
		},
		{--dirt_03.png 
			x=732,y=1136,width=120,height=140
		},
		{--dirt_04.png
			x=732,y=994,width=120,height=140
		},
		{--dirt_05.png
			x=732,y=852,width=120,height=140
		},
		{--dirt_06.png
			x=732,y=710,width=120,height=140
		},
		{--dirt_07.png
			x=244,y=1136,width=120,height=140
		},
		{--dirt_08.png
			x=732,y=426,width=120,height=140
		},
		{--dirt_09.png
			x=732,y=284,width=120,height=140
		},
		{--dirt_10.png
			x=732,y=142,width=120,height=140
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
		{--dirt_19.png
			x=1342,y=245,width=88,height=101
		},
		{--grass_01.png
			x=610,y=710,width=120,height=140
		},
		{--grass_02.png
			x=610,y=568,width=120,height=140
		},
		{--grass_03.png
			x=610,y=426,width=120,height=140
		},
		{--grass_04.png
			x=610,y=284,width=120,height=140
		},
		{--grass_05.png
			x=610,y=142,width=120,height=140
		},
		{--grass_06.png
			x=610,y=0,width=120,height=140
		},
		{--grass_07.png
			x=488,y=1846,width=120,height=140
		},
		{--grass_08.png
			x=488,y=1704,width=120,height=140
		},
		{--grass_09.png
			x=488,y=1562,width=120,height=140
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
		{--grass_17.png 
			x=488,y=426,width=120,height=140
		},
		{--grass_18.png 
			x=488,y=284,width=120,height=140
		},
		{--grass_19.png 
			x=1342,y=451,width=88,height=102
		},
		{--mars_01.png 
			x=488,y=0,width=120,height=140
		},
		{--mars_02.png 
			x=1342,y=555,width=88,height=101
		},
		{--mars_03.png 
			x=366,y=1704,width=120,height=140
		},
		{--mars_04.png 
			x=366,y=1562,width=120,height=140
		},
		{--mars_05.png 
			x=366,y=1420,width=120,height=140
		},
		{--mars_06.png 
			x=366,y=1278,width=120,height=140
		},
		{--mars_07.png 
			x=366,y=1136,width=120,height=140
		},
		{--mars_08.png 
			x=366,y=994,width=120,height=140
		},
		{--mars_09.png 
			x=366,y=852,width=120,height=140
		},
		{--mars_10.png 
			x=366,y=710,width=120,height=140
		},
		{--mars_11.png 
			x=366,y=568,width=120,height=140
		},
		{--mars_12.png 
			x=366,y=426,width=120,height=140
		},
		{--mars_13.png 
			x=366,y=284,width=120,height=140
		},
		{--mars_14.png 
			x=366,y=142,width=120,height=140
		},
		{--mars_15.png 
			x=366,y=0,width=120,height=140
		},
		{--mars_16.png 
			x=244,y=1846,width=120,height=140
		},
		{--mars_17.png 
			x=244,y=1704,width=120,height=140
		},
		{--mars_18.png 
			x=244,y=1562,width=120,height=140
		},
		{--mars_19.png 
			x=244,y=1420,width=120,height=140
		},
		{--medieval_archery.png 
			x=976,y=568,width=120,height=140
		},
		{--medieval_archway.png 
			x=976,y=426,width=120,height=140
		},
		{--medieval_blacksmith.png 
			x=976,y=284,width=120,height=140
		},
		{--medieval_cabin.png 
			x=976,y=142,width=120,height=140
		},
		{--medieval_church.png 
			x=976,y=0,width=120,height=140
		},
		{--medieval_farm.png 
			x=854,y=1846,width=120,height=140
		},
		{--medieval_house.png 
			x=854,y=1704,width=120,height=140
		},
		{--medieval_largeCastle.png 
			x=854,y=1562,width=120,height=140
		},
		{--medieval_lumber.png 
			x=610,y=852,width=120,height=140
		},
		{--medieval_mine.png 
			x=488,y=142,width=120,height=140
		},
		{--medieval_openCastle.png 
			x=854,y=1136,width=120,height=140
		},
		{--medieval_ruins.png 
			x=854,y=994,width=120,height=140
		},
		{--medieval_smallCastle.png 
			x=854,y=852,width=120,height=140
		},
		{--medieval_tower.png 
			x=854,y=710,width=120,height=140
		},
		{--medieval_windmill.png 
			x=854,y=568,width=120,height=140
		},
		{--military_entrance.png 
			x=854,y=426,width=120,height=140
		},
		{--military_hangar.png 
			x=854,y=284,width=120,height=140
		},
		{--military_rockets.png 
			x=854,y=142,width=120,height=140
		},
		{--military_tanks.png 
			x=366,y=1846,width=120,height=140
		},
		{--military_turretLarge.png
			x=732,y=1846,width=120,height=140
		},
		{--military_turretMedium.png
			x=732,y=1704,width=120,height=140
		},
		{--military_turretSmall.png
			x=732,y=1562,width=120,height=140
		},
		{--mill_crane.png
			x=610,y=1278,width=120,height=140
		},
		{--mill_cutter.png
			x=1220,y=1562,width=120,height=140
		},
		{--mill_factory.png
			x=1220,y=1278,width=120,height=140
		},
		{--mill_stoneWarehouse.png
			x=1220,y=1704,width=120,height=140
		},
		{--mill_storage.png
			x=1342,y=0,width=120,height=140
		},
		{--mill_warehouse.png
			x=1220,y=1846,width=120,height=140
		},
		{--modern_campsite.png
			x=1220,y=994,width=120,height=140
		},
		{--modern_cornerShop.png
			x=1220,y=852,width=120,height=140
		},
		{--modern_house.png
			x=1220,y=568,width=120,height=140
		},
		{--modern_houseSmall.png
			x=1220,y=1420,width=120,height=140
		},
		{--modern_largeBuilding.png
			x=1220,y=284,width=120,height=140
		},
		{--modern_oldBuilding.png
			x=1220,y=1136,width=120,height=140
		},
		{--modern_petrol.png
			x=1098,y=1846,width=120,height=140
		},
		{--modern_shop.png
			x=1098,y=1136,width=120,height=140
		},
		{--modern_skyscraper.png
			x=1220,y=710,width=120,height=140
		},
		{--modern_skyscraperGlass.png
			x=1098,y=994,width=120,height=140
		},
		{--modern_trailerpark.png
			x=1220,y=426,width=120,height=140
		},
		{--modern_villa.png
			x=1098,y=426,width=120,height=140
		},
		{--modern_villageLarge.png
			x=1220,y=142,width=120,height=140
		},
		{--sand_01.png
			x=244,y=1278,width=120,height=140
		},
		{--sand_02.png
			x=1342,y=348,width=88,height=101
		},
		{--sand_03.png
			x=244,y=994,width=120,height=140
		},
		{--sand_04.png
			x=244,y=852,width=120,height=140
		},
		{--sand_05.png
			x=244,y=710,width=120,height=140
		},
		{--sand_06.png
			x=244,y=568,width=120,height=140
		},
		{--sand_07.png
			x=244,y=426,width=120,height=140
		},
		{--sand_08.png
			x=244,y=284,width=120,height=140
		},
		{--sand_09.png
			x=244,y=142,width=120,height=140
		},
		{--sand_10.png
			x=244,y=0,width=120,height=140
		},
		{--sand_11.png
			x=122,y=1846,width=120,height=140
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
		{--sand_19.png
			x=122,y=710,width=120,height=140
		},
		{--scifi_base.png
			x=1220,y=0,width=120,height=140
		},
		{--scifi_building.png
			x=976,y=1704,width=120,height=140
		},
		{--scifi_cargo.png
			x=1098,y=1704,width=120,height=140
		},
		{--scifi_corner.png
			x=1098,y=1562,width=120,height=140
		},
		{--scifi_domes.png
			x=1098,y=1420,width=120,height=140
		},
		{--scifi_energy.png
			x=1098,y=1278,width=120,height=140
		},
		{--scifi_factory.png
			x=976,y=852,width=120,height=140
		},
		{--scifi_factoryHangar.png
			x=854,y=1420,width=120,height=140
		},
		{--scifi_factoryHigh.png
			x=1098,y=852,width=120,height=140
		},
		{--scifi_foliage.png
			x=1098,y=710,width=120,height=140
		},
		{--scifi_hangar.png
			x=1098,y=568,width=120,height=140
		},
		{--scifi_headquarters.png
			x=854,y=1278,width=120,height=140
		},
		{--scifi_living.png
			x=1098,y=284,width=120,height=140
		},
		{--scifi_port.png
			x=1098,y=142,width=120,height=140
		},
		{--scifi_silo.png
			x=1098,y=0,width=120,height=140
		},
		{--scifi_skyscraper.png
			x=976,y=1846,width=120,height=140
		},
		{--scifi_tower.png
			x=854,y=0,width=120,height=140
		},
		{--stone_01.png
			x=122,y=568,width=120,height=140
		},
		{--stone_02.png
			x=1342,y=142,width=88,height=101
		},
		{--stone_03.png
			x=122,y=284,width=120,height=140
		},
		{--stone_04.png
			x=122,y=142,width=120,height=140
		},
		{--stone_05.png
			x=122,y=0,width=120,height=140
		},
		{--stone_06.png
			x=0,y=1846,width=120,height=140
		},
		{--stone_07.png
			x=0,y=1704,width=120,height=140
		},
		{--stone_08.png
			x=0,y=1562,width=120,height=140
		},
		{--stone_09.png
			x=0,y=1420,width=120,height=140
		},
		{--stone_10.png
			x=0,y=1278,width=120,height=140
		},
		{--stone_11.png
			x=0,y=1136,width=120,height=140
		},
		{--stone_12.png
			x=0,y=994,width=120,height=140
		},
		{--stone_13.png
			x=0,y=852,width=120,height=140
		},
		{--stone_14.png 
			x=0,y=710,width=120,height=140
		},
		{--stone_15.png
			x=0,y=568,width=120,height=140
		},
		{--stone_16.png
			x=0,y=426,width=120,height=140
		},
		{--stone_17.png
			x=0,y=284,width=120,height=140
		},
		{--stone_18.png
			x=0,y=142,width=120,height=140
		},
		{--stone_19.png
			x=0,y=0,width=120,height=140
		},
		{--western_bank.png
			x=976,y=1562,width=120,height=140
		},
		{--western_general.png
			x=976,y=1420,width=120,height=140
		},
		{--western_indians.png
			x=976,y=1278,width=120,height=140
		},
		{--western_saloon.png
			x=976,y=1136,width=120,height=140
		},
		{--western_sheriff.png
			x=976,y=994,width=120,height=140
		},
		{--western_station.png
			x=732,y=568,width=120,height=140
		},
		{--western_watertower.png
			x=976,y=710,width=120,height=140
		},
	},
}
local objectSheet = graphics.newImageSheet( "hexagonAll_sheet.png", sheetOptions )

-- Initialize variables
local gameTime = 240
local score = 0

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

	-- Display Texts
	enemieText = display.newText( uiGroup, "Enemie ", 48, 260, native.systemFont, 24)
	enemieWoodText = display.newText(uiGroup, "Wood: " .. enemieWood, 160, 262, native.systemFont, 16)
	enemieFoodText = display.newText(uiGroup, "Food: " .. enemieFood, 260, 262, native.systemFont, 16)
	enemieHouseText = display.newText(uiGroup, "Houses: " .. enemieHouse, 360, 262, native.systemFont, 16)
	enemieSoldierText = display.newText(uiGroup, "Soldiers: " .. enemieSoldier, 460, 262, native.systemFont, 16)

	local abortButton = display.newText( sceneGroup, "Abort", 650, 265, native.systemFont, 36 )
	abortButton:setFillColor( 1, 0, 0 )
	abortButton:addEventListener( "tap", abortGame )

	playerText = display.newText( uiGroup, "Player ", 40, 700, native.systemFont, 24)
	playerWoodText = display.newText(uiGroup, "Wood: " .. playerWood, 160, 701, native.systemFont, 16)
	playerFoodText = display.newText(uiGroup, "Food: " .. playerFood, 260, 701, native.systemFont, 16)
	playerHouseText = display.newText(uiGroup, "Houses: " .. playerHouses, 360, 701, native.systemFont, 16)
	playerSoldierText = display.newText(uiGroup, "Soldiers: " .. playerSoldier, 460, 701, native.systemFont, 16)
	gameTimeText = display.newText(uiGroup, "Time left: ".. gameTime, 625, 700, native.systemFont, 24)

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
