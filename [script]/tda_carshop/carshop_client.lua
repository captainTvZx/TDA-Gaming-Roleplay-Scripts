local screenWidth, screenHeight = guiGetScreenSize(  )
local oldAnim = 0
local nextAnim = 0
carShop = {
	marker = createMarker( -1957.35, 305.9, 40, "cylinder", 1, 255, 176, 0, 255, getLocalPlayer(  ) ),
	marker2 = createMarker( -1952, 305.9, 40, "cylinder", 1, 255, 176, 0, 255, getLocalPlayer(  ) ),
	font = dxCreateFont( "font/font.ttf", 52, false ),
	blurElement = nil,
	blur = 0,
	state = false,
	vehicle = 1,
	animTick = 0,
	plus = 0,
	bindState = false,
	alpha = 0,
	exitAlpha = 0,
	oldAlpha = 0,
	alphaTick = 0,
	logo = {
		[1] = {name = "Audi", img = "img/audi.png", posX = screenWidth/2 - 128, posY = screenHeight/2 - 256, sizeX = 256, sizeY = 256, postGui = true, scale = 0, },
		[2] = {name = "Mini", img = "img/mini.png", posX = screenWidth/2 - 128, posY = screenHeight/2 - 128, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[3] = {name = "Chevrolet", img = "img/chevrolet.png", posX = screenWidth/2 - 128, posY = screenHeight/2, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[4] = {name = "Subaru", img = "img/subaru.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[5] = {name = "Ford", img = "img/ford.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 2, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[6] = {name = "Bugatti", img = "img/bugatti.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 3, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[7] = {name = "Pagani", img = "img/pagani.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 4 + 24, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[8] = {name = "McLaren", img = "img/mclaren.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 5 + 44, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[9] = {name = "Seat", img = "img/seat.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 6 + 96, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[10] = {name = "Lexus", img = "img/lexus.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 7 + 172, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[11] = {name = "Mazda", img = "img/mazda.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 10, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[12] = {name = "Nissan", img = "img/nissan.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 12 - 32, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[13] = {name = "Cadillac", img = "img/cadillac.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 13 + 96, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[14] = {name = "Volkswagen", img = "img/volkswagen.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 16 - 24, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[15] = {name = "BMW", img = "img/bmw.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 18, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[16] = {name = "Mercedes", img = "img/mercedes.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 20 + 24, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[17] = {name = "Mitsubishi", img = "img/mitsubishi.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 22 + 32, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[18] = {name = "Corvette", img = "img/corvette.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 24 + 32, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[19] = {name = "Dodge", img = "img/dodge.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 26 + 24, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[20] = {name = "Lamborgihini", img = "img/lamborgihini.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 28 + 44, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[21] = {name = "Koenigsegg", img = "img/koenigsegg.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 30 + 64, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[22] = {name = "Porsche", img = "img/porsche.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 32 + 78, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[23] = {name = "Maserati", img = "img/maserati.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 34 + 88, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[24] = {name = "Ferrari", img = "img/ferrari.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 36 + 96, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[25] = {name = "W Motors", img = "img/wmotors.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 39 - 24, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[26] = {name = "Plymounth", img = "img/plymounth.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 41, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
		[27] = {name = "GMC", img = "img/gmc.png", posX = screenWidth/2 - 128, posY = screenHeight/2 + 128 * 42, sizeX = 256, sizeY = 256, postGui = false, scale = 0, },
	},
}
local selectAnimTick = 0
local oldSelectAnim = 0
local selectState = nil
local toggleState = false
local selectAlpha = 0

function drawVehiclePanel(  )
	dxDrawImage( screenWidth - 32, 4, 32, 32, "img/exit.png", 0, 0, 0, tocolor( 255, 255, 255, carShop.exitAlpha ), true )
	if selectState ~= true then
		dxDrawImage( carShop.logo[1].posX + carShop.logo[1].scale/2, carShop.logo[1].posY - carShop.plus + carShop.logo[1].scale/2, carShop.logo[1].sizeX - carShop.logo[1].scale, carShop.logo[1].sizeY - carShop.logo[1].scale, carShop.logo[1].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[1].postGui )
		dxDrawImage( carShop.logo[2].posX + carShop.logo[2].scale/2, carShop.logo[2].posY - carShop.plus + carShop.logo[2].scale/2, carShop.logo[2].sizeX - carShop.logo[2].scale, carShop.logo[2].sizeY - carShop.logo[2].scale, carShop.logo[2].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[2].postGui )
		dxDrawImage( carShop.logo[3].posX + carShop.logo[3].scale/2, carShop.logo[3].posY - carShop.plus + carShop.logo[3].scale/2, carShop.logo[3].sizeX - carShop.logo[3].scale, carShop.logo[3].sizeY - carShop.logo[3].scale, carShop.logo[3].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[3].postGui )
		dxDrawImage( carShop.logo[4].posX + carShop.logo[4].scale/2, carShop.logo[4].posY - carShop.plus + carShop.logo[4].scale/2, carShop.logo[4].sizeX - carShop.logo[4].scale, carShop.logo[4].sizeY - carShop.logo[4].scale, carShop.logo[4].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[4].postGui )
		dxDrawImage( carShop.logo[5].posX + carShop.logo[5].scale/2, carShop.logo[5].posY - carShop.plus + carShop.logo[5].scale/2, carShop.logo[5].sizeX - carShop.logo[5].scale, carShop.logo[5].sizeY - carShop.logo[5].scale, carShop.logo[5].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[5].postGui )
		dxDrawImage( carShop.logo[6].posX + carShop.logo[6].scale/2, carShop.logo[6].posY - carShop.plus + carShop.logo[6].scale/2, carShop.logo[6].sizeX - carShop.logo[6].scale, carShop.logo[6].sizeY - carShop.logo[6].scale, carShop.logo[6].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[6].postGui )
		dxDrawImage( carShop.logo[7].posX + carShop.logo[7].scale/2, carShop.logo[7].posY - carShop.plus + carShop.logo[7].scale/2, carShop.logo[7].sizeX - carShop.logo[7].scale, carShop.logo[7].sizeY - carShop.logo[7].scale, carShop.logo[7].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[7].postGui )
		dxDrawImage( carShop.logo[8].posX + carShop.logo[8].scale/2, carShop.logo[8].posY - carShop.plus + carShop.logo[8].scale/2, carShop.logo[8].sizeX - carShop.logo[8].scale, carShop.logo[8].sizeY - carShop.logo[8].scale, carShop.logo[8].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[8].postGui )
		dxDrawImage( carShop.logo[9].posX + carShop.logo[9].scale/2, carShop.logo[9].posY - carShop.plus + carShop.logo[9].scale/2, carShop.logo[9].sizeX - carShop.logo[9].scale, carShop.logo[9].sizeY - carShop.logo[9].scale, carShop.logo[9].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[9].postGui )
		dxDrawImage( carShop.logo[10].posX + carShop.logo[10].scale/2, carShop.logo[10].posY - carShop.plus + carShop.logo[10].scale/2, carShop.logo[10].sizeX - carShop.logo[10].scale, carShop.logo[10].sizeY - carShop.logo[10].scale, carShop.logo[10].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[10].postGui )
		dxDrawImage( carShop.logo[11].posX + carShop.logo[11].scale/2, carShop.logo[11].posY - carShop.plus + carShop.logo[11].scale/2, carShop.logo[11].sizeX - carShop.logo[11].scale, carShop.logo[11].sizeY - carShop.logo[11].scale, carShop.logo[11].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[11].postGui )
		dxDrawImage( carShop.logo[12].posX + carShop.logo[12].scale/2, carShop.logo[12].posY - carShop.plus + carShop.logo[12].scale/2, carShop.logo[12].sizeX - carShop.logo[12].scale, carShop.logo[12].sizeY - carShop.logo[12].scale, carShop.logo[12].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[12].postGui )
		dxDrawImage( carShop.logo[13].posX + carShop.logo[13].scale/2, carShop.logo[13].posY - carShop.plus + carShop.logo[13].scale/2, carShop.logo[13].sizeX - carShop.logo[13].scale, carShop.logo[13].sizeY - carShop.logo[13].scale, carShop.logo[13].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[13].postGui )
		dxDrawImage( carShop.logo[14].posX + carShop.logo[14].scale/2, carShop.logo[14].posY - carShop.plus + carShop.logo[14].scale/2, carShop.logo[14].sizeX - carShop.logo[14].scale, carShop.logo[14].sizeY - carShop.logo[14].scale, carShop.logo[14].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[14].postGui )
		dxDrawImage( carShop.logo[15].posX + carShop.logo[15].scale/2, carShop.logo[15].posY - carShop.plus + carShop.logo[15].scale/2, carShop.logo[15].sizeX - carShop.logo[15].scale, carShop.logo[15].sizeY - carShop.logo[15].scale, carShop.logo[15].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[15].postGui )
		dxDrawImage( carShop.logo[16].posX + carShop.logo[16].scale/2, carShop.logo[16].posY - carShop.plus + carShop.logo[16].scale/2, carShop.logo[16].sizeX - carShop.logo[16].scale, carShop.logo[16].sizeY - carShop.logo[16].scale, carShop.logo[16].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[16].postGui )
		dxDrawImage( carShop.logo[17].posX + carShop.logo[17].scale/2, carShop.logo[17].posY - carShop.plus + carShop.logo[17].scale/2, carShop.logo[17].sizeX - carShop.logo[17].scale, carShop.logo[17].sizeY - carShop.logo[17].scale, carShop.logo[17].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[17].postGui )
		dxDrawImage( carShop.logo[18].posX + carShop.logo[18].scale/2, carShop.logo[18].posY - carShop.plus + carShop.logo[18].scale/2, carShop.logo[18].sizeX - carShop.logo[18].scale, carShop.logo[18].sizeY - carShop.logo[18].scale, carShop.logo[18].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[18].postGui )
		dxDrawImage( carShop.logo[19].posX + carShop.logo[19].scale/2, carShop.logo[19].posY - carShop.plus + carShop.logo[19].scale/2, carShop.logo[19].sizeX - carShop.logo[19].scale, carShop.logo[19].sizeY - carShop.logo[19].scale, carShop.logo[19].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[19].postGui )
		dxDrawImage( carShop.logo[20].posX + carShop.logo[20].scale/2, carShop.logo[20].posY - carShop.plus + carShop.logo[20].scale/2, carShop.logo[20].sizeX - carShop.logo[20].scale, carShop.logo[20].sizeY - carShop.logo[20].scale, carShop.logo[20].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[20].postGui )
		dxDrawImage( carShop.logo[21].posX + carShop.logo[21].scale/2, carShop.logo[21].posY - carShop.plus + carShop.logo[21].scale/2, carShop.logo[21].sizeX - carShop.logo[21].scale, carShop.logo[21].sizeY - carShop.logo[21].scale, carShop.logo[21].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[21].postGui )
		dxDrawImage( carShop.logo[22].posX + carShop.logo[22].scale/2, carShop.logo[22].posY - carShop.plus + carShop.logo[22].scale/2, carShop.logo[22].sizeX - carShop.logo[22].scale, carShop.logo[22].sizeY - carShop.logo[22].scale, carShop.logo[22].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[22].postGui )
		dxDrawImage( carShop.logo[23].posX + carShop.logo[23].scale/2, carShop.logo[23].posY - carShop.plus + carShop.logo[23].scale/2, carShop.logo[23].sizeX - carShop.logo[23].scale, carShop.logo[23].sizeY - carShop.logo[23].scale, carShop.logo[23].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[23].postGui )
		dxDrawImage( carShop.logo[24].posX + carShop.logo[24].scale/2, carShop.logo[24].posY - carShop.plus + carShop.logo[24].scale/2, carShop.logo[24].sizeX - carShop.logo[24].scale, carShop.logo[24].sizeY - carShop.logo[24].scale, carShop.logo[24].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[24].postGui )
		dxDrawImage( carShop.logo[25].posX + carShop.logo[25].scale/2, carShop.logo[25].posY - carShop.plus + carShop.logo[25].scale/2, carShop.logo[25].sizeX - carShop.logo[25].scale, carShop.logo[25].sizeY - carShop.logo[25].scale, carShop.logo[25].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[25].postGui )
		dxDrawImage( carShop.logo[26].posX + carShop.logo[26].scale/2, carShop.logo[26].posY - carShop.plus + carShop.logo[26].scale/2, carShop.logo[26].sizeX - carShop.logo[26].scale, carShop.logo[26].sizeY - carShop.logo[26].scale, carShop.logo[26].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[26].postGui )
		dxDrawImage( carShop.logo[27].posX + carShop.logo[27].scale/2, carShop.logo[27].posY - carShop.plus + carShop.logo[27].scale/2, carShop.logo[27].sizeX - carShop.logo[27].scale, carShop.logo[27].sizeY - carShop.logo[27].scale, carShop.logo[27].img, 0, 0, 0, tocolor( 255, 255, 255, carShop.alpha ), carShop.logo[27].postGui )
		dxDrawText ( carShop.logo[carShop.vehicle].name, 0, screenHeight - dxGetFontHeight( 1, carShop.font ) + 12, screenWidth - 24, screenHeight, tocolor ( 255, 255, 255, carShop.alpha ), 1, carShop.font, "right", "top", false, false, true, true )
	end
	if carShop.state then
		carShop.alpha = interpolateBetween( carShop.oldAlpha, 0, 0, 255, 0, 0, getProgress( 800, carShop.alphaTick ), "OutQuad" )
		carShop.exitAlpha = interpolateBetween( carShop.oldAlpha, 0, 0, 255, 0, 0, getProgress( 800, carShop.alphaTick ), "OutQuad" )
		carShop.blur = interpolateBetween( 0, 0, 0, 3, 0, 0, getProgress( 800, carShop.alphaTick ), "OutQuad" )
		exports.tda_source:setBlurIntensity( carShop.blur )
	elseif carShop.state == false then
		carShop.alpha = interpolateBetween( 255, 0, 0, 0, 0, 0, getProgress( 800, carShop.alphaTick ), "OutQuad" )
		carShop.exitAlpha = interpolateBetween( 255, 0, 0, 0, 0, 0, getProgress( 800, carShop.alphaTick ), "OutQuad" )
		carShop.blur = interpolateBetween( 3, 0, 0, 0, 0, 0, getProgress( 800, carShop.alphaTick ), "OutQuad" )
		exports.tda_source:setBlurIntensity( carShop.blur )
		if getProgress( 800, carShop.alphaTick ) >= 1 then
			carShop.state = false
			carShop.blurElement = not exports.tda_source:destroyBlurBox( carShop.blurElement )
			carShop.blurElement = nil
			removeEventHandler( "onClientPreRender", root, animVehicle )
			removeEventHandler( "onClientRender", root, drawVehiclePanel )
			removeEventHandler( "onClientRender", root, selectedAnim )
			showChat( true )
			showCursor( false)
			nextAnim = 0
			oldAnim = 0
			carShop.plus = 0
			carShop.bindState = false
			carShop.logo[1].postGui = true
			for i=2,27 do
				carShop.logo[i].postGui = false
			end
		end
	end
end

function toggleVehicleShop( hitElement )
	if hitElement == getLocalPlayer(  ) then
		if getElementType( hitElement ) == "player" then
			if carShop.state == false then
				showChat( false )
				showCursor( true )
				nextAnim = 0
				oldAnim = 0
				carShop.vehicle = 1
				carShop.plus = 0
				carShop.bindState = true
				carShop.state = true
				carShop.logo[1].postGui = true
				selectState = nil
				for i=2,27 do
					carShop.logo[i].postGui = false
				end
				carShop.blurElement = exports.tda_source:createGuassianBlur( 0, 0, screenWidth, screenHeight, 255, 255, 255, 255, 3, 3, 3, true )
				carShop.alphaTick = getTickCount(  )
				addEventHandler( "onClientPreRender", root, animVehicle )
				addEventHandler( "onClientRender", root, drawVehiclePanel )
				bindKey( "mouse_wheel_down", "down", nextVehicle )
				bindKey( "arrow_d", "down", nextVehicle )
				bindKey( "mouse_wheel_up", "down", prevVehicle )
				bindKey( "arrow_u", "down", prevVehicle )
				bindKey( "enter", "down", selectVehicleDown )
				bindKey( "enter", "up", selectVehicleUp )
				exports.tda_levels:showPlayerLevel(false)
				exports.tda_scoreboard:showPlayerScoreboard(false)
				exports.tda_phone:showPlayerPhone(false)
				exports.tda_hud:showPlayerHud("all",false)
			end
		end
	end
end
addEventHandler( "onClientMarkerHit", carShop.marker, toggleVehicleShop )

function clickEvent( button, state, cX, cY )
	if carShop.state == true then
		if checkHover( screenWidth - 32, 4, 32, 32 ) and button == "left" and state == "up" then
			carShop.state = false
			carShop.alphaTick = getTickCount(  )
			exports.tda_levels:showPlayerLevel(true)
			exports.tda_scoreboard:showPlayerScoreboard(true)
			exports.tda_phone:showPlayerPhone(true)
			exports.tda_hud:showPlayerHud("all",true)
		end
	end
end
addEventHandler( "onClientClick", root, clickEvent )

local selectState = nil

function selectVehicleDown(  )
	if carShop.state == true then
		selectState = false
		oldSelectAnim = carShop.logo[carShop.vehicle].scale
		selectAnimTick = getTickCount(  )
		addEventHandler( "onClientRender", root, selectedAnim )
		unbindKey( "mouse_wheel_down", "down", nextVehicle )
		unbindKey( "arrow_d", "down", nextVehicle )
		unbindKey( "mouse_wheel_up", "down", prevVehicle )
		unbindKey( "arrow_u", "down", prevVehicle )
	end
end

function selectVehicleUp(  )
	if carShop.state == true then
		selectState = true
		oldSelectAnim = carShop.logo[carShop.vehicle].scale
		selectAnimTick = getTickCount(  )
		unbindKey( "enter", "down", selectVehicleDown )
		unbindKey( "enter", "up", selectVehicleUp )
	end
end

vehicle = { [1] = nil, [2] = nil, [3] = nil, [4] = nil, [5] = nil }
detail = { [1] = nil, [2] = nil, [3] = nil, [4] = nil, [5] = nil }

function selectedAnim(  )
	if selectState == false then
		carShop.logo[carShop.vehicle].scale = interpolateBetween( oldSelectAnim, 0, 0, -64, 0, 0, getProgress( 800, selectAnimTick ), "OutElastic" )
	elseif selectState == true then
		carShop.logo[carShop.vehicle].scale = interpolateBetween( oldSelectAnim, 0, 0, 0, 0, 0, getProgress( 800, selectAnimTick ), "OutElastic" )
		carShop.state = false
		carShop.alphaTick = getTickCount(  )
		if getProgress( 800, selectAnimTick ) >= 1 then
			detail[1] = nil
			detail[2] = nil
			detail[3] = nil
			detail[4] = nil
			detail[5] = nil
			vehicle[1] = nil
			vehicle[2] = nil
			vehicle[3] = nil
			vehicle[4] = nil
			vehicle[5] = nil
			toggleVehicleCamera( )
			removeEventHandler( "onClientRender", root, selectedAnim )
		end
	end
end

cars = {
	[1] = { money = 400000, tdapoint = 400, id = 419, mark = "Audi", series = "R8", model = "4.2 FSI Quattro R-tronic", class = "Automobile", year = "2015", power = "426 - 450 HP", capacity = "4001 - 4500", fuel = "Petrol", body = "Coupe" },
	[2] = { money = 150000, tdapoint = 150, id = 410, mark = "Mini", series = "Cooper S", model = "1.6", class = "Automobile", year = "2015", power = "176 - 200 HP", capacity = "1401 - 1600", fuel = "Petrol", body = "Hatchback" },
	[3] = { money = 850000, tdapoint = 850, id = 434, mark = "Chevrolet", series = "Camaro", model = "SS", class = "Automobile", year = "1970", power = "226 - 250 HP", capacity = "1801 - 2000", fuel = "Petrol", body = "Fastback" },
	[4] = { money = 1500000, tdapoint = 1500, id = 603, mark = "Chevrolet", series = "Camaro", model = "RS", class = "Automobile", year = "2015", power = "426 - 450 HP", capacity = "6001 and over", fuel = "Petrol", body = "Coupe" },
	[5] = { money = 600000, tdapoint = 600, id = 526, mark = "Subaru", series = "BRZ", model = "2.0R Premium", class = "Automobile", year = "2015", power = "176 - 200 HP", capacity = "1801 - 2000", fuel = "Petrol", body = "Coupe" },
	[6] = { money = 350000, tdapoint = 350, id = 474, mark = "Subaru", series = "Impreza", model = "2.0 WRX", class = "Automobile", year = "2015", power = "226 - 250 HP", capacity = "1801 - 2000", fuel = "Petrol", body = "Hatchback" },
	[7] = { money = 800000, tdapoint = 800, id = 541, mark = "Ford", series = "GT40", model = "4.0", class = "Automobile", year = "1966", power = "426 - 450 HP", capacity = "4181 and over", fuel = "Petrol", body = "Cabrio" },
	[8] = { money = 1250000, tdapoint = 1250, id = 494, mark = "Ford", series = "Shelby GT500", model = "3.0", class = "Automobile", year = "1969", power = "301 - 381 HP", capacity = "2001 - 3000", fuel = "Petrol", body = "Fastback" },
	[9] = { money = 2000000, tdapoint = 2000, id = 502, mark = "Ford", series = "Shelby GT500", model = "4.0", class = "Automobile", year = "2015", power = "426 - 450 HP", capacity = "6001 and over", fuel = "Petrol", body = "Coupe" },
	[10] = { money = 8500000, tdapoint = 8500, id = 602, mark = "Bugatti", series = "Veyron", model = "16.4 Veyron", class = "Automobile", year = "2015", power = "601 HP and over", capacity = "6001 and over", fuel = "Petrol", body = "Cabrio" },
	[11] = { money = 7500000, tdapoint = 7500, id = 480, mark = "Pagani", series = "Huayra", model = "Hyper", class = "Automobile", year = "2015", power = "601 HP and over", capacity = "6001 and over", fuel = "Petrol", body = "Berlinetta" },
	[12] = { money = 7750000, tdapoint = 7750, id = 496, mark = "Pagani", series = "Zonda", model = "7.3 L AMG V12", class = "Automobile", year = "2015", power = "701 HP and over", capacity = "7001 and over", fuel = "Petrol", body = "Berlinetta" },
	[13] = { money = 6500000, tdapoint = 6500, id = 527, mark = "McLaren", series = "P1", model = "3.8 L", class = "Automobile", year = "2015", power = "601 HP and over", capacity = "6001 and over", fuel = "Petrol", body = "Berlinetta" },
	[14] = { money = 100000, tdapoint = 100, id = 445, mark = "Seat", series = "Leon", model = "FR", class = "Automobile", year = "2015", power = "101 - 125 HP", capacity = "1401 - 1600", fuel = "Petrol", body = "Hatchback" },
	[15] = { money = 2750000, tdapoint = 2750, id = 401, mark = "Lexus", series = "LFA", model = "4.8 L", class = "Automobile", year = "2015", power = "426 - 450 HP", capacity = "4001 - 4801", fuel = "Petrol", body = "Coupe" },
	[16] = { money = 125000, tdapoint = 125, id = 587, mark = "Mazda", series = "RX", model = "RX-8", class = "Automobile", year = "2015", power = "226 - 250 HP", capacity = "1201 - 1400", fuel = "Petrol", body = "Coupe" },
	[17] = { money = 400000, tdapoint = 400, id = 549, mark = "Nissan", series = "Skyline GT-R", model = "R34", class = "Automobile", year = "2015", power = "276 - 355 HP", capacity = "2001 - 3555", fuel = "Petrol", body = "Coupe" },
	[18] = { money = 600000, tdapoint = 600, id = 558, mark = "Nissan", series = "Skyline GT-R", model = "R35", class = "Automobile", year = "2015", power = "476 - 500 HP", capacity = "3501 - 4000", fuel = "Petrol", body = "Coupe" },
	[19] = { money = 280000, tdapoint = 280, id = 534, mark = "Cadillac", series = "Caddy", model = "1.6 8Valf", class = "Automobile", year = "1971", power = "75 - 150 HP", capacity = "1201 - 1401", fuel = "Petrol", body = "Cabrio" },
	[20] = { money = 180000, tdapoint = 180, id = 600, mark = "Volkswagen", series = "Polo", model = "1.6 TDi BlueMotion Comfortline", class = "Automobile", year = "2015", power = "101 - 125 HP", capacity = "1401 - 1600", fuel = "Diesel", body = "Station Wagon" },
	[21] = { money = 130000, tdapoint = 130, id = 492, mark = "Volkswagen", series = "Passat Variant", model = "1.6 TDi Comfortline", class = "Automobile", year = "2015", power = "76 - 100 HP", capacity = "1401 - 1600", fuel = "Diesel", body = "Hatchback" },
	[22] = { money = 1500000, tdapoint = 1500, id = 503, mark = "BMW", series = "Z", model = "Z4 3.5i sDrive", class = "Automobile", year = "2015", power = "301 - 325 HP", capacity = "2501 - 3000", fuel = "Petrol", body = "Coupe" },
	[23] = { money = 180000, tdapoint = 180, id = 560, mark = "BMW", series = "M", model = "M4 Coupe", class = "Automobile", year = "2015", power = "401 - 425 HP", capacity = "3501 - 4000", fuel = "Petrol", body = "Coupe" },
	[24] = { money = 340000, tdapoint = 340, id = 436, mark = "BMW", series = "2", model = "218I", class = "Automobile", year = "2015", power = "126 - 150 HP", capacity = "1401 - 1600", fuel = "Petrol", body = "Coupe" },
	[25] = { money = 2500000, tdapoint = 2500, id = 429, mark = "Mercedes - Benz", series = "SLS AMG", model = "Coupe", class = "Automobile", year = "2015", power = "576 - 600 HP", capacity = "6001 and over", fuel = "Petrol", body = "Coupe" },
	[26] = { money = 220000, tdapoint = 220, id = 507, mark = "Mercedes - Benz", series = "A", model = "A45 AMG", class = "Automobile", year = "2015", power = "351 - 375 HP", capacity = "1801 - 2000", fuel = "Petrol", body = "Hatchback" },
	[27] = { money = 720000, tdapoint = 720, id = 585, mark = "Mercedes - Benz", series = "S", model = "S65 AMG", class = "Automobile", year = "2015", power = "601 HP and over", capacity = "5501 - 6000", fuel = "Petrol", body = "Coupe" },
	[28] = { money = 950000, tdapoint = 950, id = 604, mark = "Mercedes - Benz", series = "C", model = "S63 AMG", class = "Automobile", year = "2008", power = "501 - 525 HP", capacity = "6001 and over", fuel = "Petrol", body = "Sedan" },
	[29] = { money = 800000, tdapoint = 800, id = 562, mark = "Mitsubishi", series = "Lancer Evolution", model = "X", class = "Automobile", year = "2015", power = "276 - 300 HP", capacity = "1801 - 2000", fuel = "Petrol", body = "Coupe" },
	[30] = { money = 250000, tdapoint = 250, id = 529, mark = "Mitsubishi", series = "Lancer Evolution", model = "III", class = "Automobile", year = "2005", power = "76 - 100 HP", capacity = "1401 - 1600", fuel = "Petrol", body = "Sedan" },
	[31] = { money = 600000, tdapoint = 600, id = 550, mark = "Mitsubishi", series = "Lancer Evolution", model = "X", class = "Automobile", year = "2015", power = "276 - 300 HP", capacity = "1801 - 2000", fuel = "Petrol", body = "Sedan" },
	[32] = { money = 1400000, tdapoint = 1400, id = 533, mark = "Chevrolet", series = "Corvette", model = "ZR1", class = "Automobile", year = "2015", power = "501 - 525 HP", capacity = "6001 and over", fuel = "Petrol", body = "Cabrio" },
	[33] = { money = 750000, tdapoint = 750, id = 579, mark = "Dodge", series = "Ram 3500", model = "2.6", class = "Automobile", year = "2015", power = "201 - 300 HP", capacity = "2001 - 2600", fuel = "Diesel", body = "Pickup Truck" },
	[34] = { money = 1000000, tdapoint = 1000, id = 402, mark = "Dodge", series = "Challenger", model = "SRT", class = "Automobile", year = "2015", power = "451 - 475 HP", capacity = "6001 and over", fuel = "Petrol", body = "Coupe" },
	[35] = { money = 1500000, tdapoint = 1500, id = 536, mark = "Dodge", series = "Challenger", model = "R/T", class = "Automobile", year = "2015", power = "201 - 350 HP", capacity = "2001 - 3500", fuel = "Petrol", body = "Fastback" },
	[36] = { money = 1750000, tdapoint = 1750, id = 589, mark = "Dodge", series = "Challenger", model = "R/T", class = "Automobile", year = "2015", power = "201 - 350 HP", capacity = "2001 - 3500", fuel = "Petrol", body = "Fastback" },
	[37] = { money = 1250000, tdapoint = 1250, id = 506, mark = "Dodge", series = "Viper", model = "SRT", class = "Automobile", year = "2015", power = "501 - 525 HP", capacity = "6001 and over", fuel = "Petrol", body = "Coupe" },
	[38] = { money = 5500000, tdapoint = 5500, id = 415, mark = "Lamborgihini", series = "Aventador", model = "LP 700-4", class = "Automobile", year = "2015", power = "601 HP and over", capacity = "6001 and over", fuel = "Petrol", body = "Coupe" },
	[39] = { money = 6000000, tdapoint = 6000, id = 477, mark = "Koenigsegg", series = "CCX", model = "CCX", class = "Automobile", year = "2015", power = "601 HP and over", capacity = "6001 and over", fuel = "Petrol", body = "Coupe" },
	[40] = { money = 6000000, tdapoint = 6000, id = 517, mark = "Koenigsegg", series = "One", model = "1", class = "Automobile", year = "2015", power = "601 HP and over", capacity = "6001 and over", fuel = "Petrol", body = "Coupe" },
	[41] = { money = 900000, tdapoint = 900, id = 561, mark = "Porsche", series = "Cayman", model = "Turbo", class = "Automobile", year = "2015", power = "201 - 350 HP", capacity = "2001 - 3500", fuel = "Petrol", body = "Station Wagon" },
	[42] = { money = 1700000, tdapoint = 1700, id = 555, mark = "Porsche", series = "GT", model = "4", class = "Automobile", year = "2015", power = "201 - 350 HP", capacity = "2001 - 3500", fuel = "Petrol", body = "Coupe" },
	[43] = { money = 1000000, tdapoint = 1000, id = 559, mark = "Maserati", series = "Grantursimo", model = "4.2", class = "Automobile", year = "2015", power = "401 - 425 HP", capacity = "4001 - 4500", fuel = "Petrol", body = "Coupe" },
	[44] = { money = 1100000, tdapoint = 1100, id = 551, mark = "Maserati", series = "Gihibli", model = "3.0", class = "Automobile", year = "2015", power = "251 - 275 HP", capacity = "2501 - 3000", fuel = "Diesel", body = "Sedan" },
	[45] = { money = 8000000, tdapoint = 8000, id = 565, mark = "Ferrari", series = "Enzo", model = "6.0", class = "Automobile", year = "2015", power = "601 HP and over", capacity = "6001 and over", fuel = "Petrol", body = "Coupe" },
	[46] = { money = 8200000, tdapoint = 8200, id = 451, mark = "Ferrari", series = "458", model = "Italia", class = "Automobile", year = "2015", power = "601 HP and over", capacity = "6001 and over", fuel = "Petrol", body = "Coupe" },
	[47] = { money = 8500000, tdapoint = 8500, id = 411, mark = "W Motors", series = "Lykan Hypersport", model = "3.7", class = "Automobile", year = "2015", power = "701 HP and over", capacity = "7001 and over", fuel = "Petrol", body = "Coupe" },
	[48] = { money = 160000, tdapoint = 160, id = 518, mark = "Plymounth", series = "Roadrunner", model = "Superbird", class = "Automobile", year = "1970", power = "251 - 275 HP", capacity = "2501 - 3000", fuel = "Petrol", body = "Fastback" },
	[49] = { money = 100000, tdapoint = 100, id = 479, mark = "GMC", series = "Yukon", model = "Denali 6.2 V8", class = "Automobile", year = "2015", power = "426 - 450 HP", capacity = "6001 and over", fuel = "Petrol", body = "Station Wagon" },
}


function toggleVehicleCamera( )
	fadeCamera( false, 1 )
	setTimer( function() 
		fadeCamera( true, 2 ) 
		setCameraClip ( false, false )
		toggleControl( "vehicle_left", false )
		toggleControl( "vehicle_right", false )
		toggleControl( "enter_exit", false )
		toggleControl( "forwards", false )
		toggleControl( "backwards", false )
		toggleControl( "left", false )
		toggleControl( "right", false )
		toggleControl( "fire", false )
		toggleControl( "next_weapon", false )
		toggleControl( "previous_weapon", false )
		toggleControl( "zoom_in", false )
		toggleControl( "zoom_out", false )
		toggleControl( "aim_weapon", false )
		toggleControl( "jump", false )
		toggleControl( "crouch", false ) 
		setCameraViewMode( 3 )
		toggleControl( "change_camera", false )
		addEventHandler( "onClientRender", root, dontSeeDetails )
		exports.tda_levels:showPlayerLevel(false)
		exports.tda_scoreboard:showPlayerScoreboard(false)
		exports.tda_phone:showPlayerPhone(false)
		exports.tda_hud:showPlayerHud("radar",false)
		exports.tda_hud:showPlayerHud("hud",true)
		if carShop.vehicle == 1 then
			vehicle[1] = createVehicle( cars[1].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 1
			toggleSeeDown( 5 )
		elseif carShop.vehicle == 2 then
			vehicle[1] = createVehicle( cars[2].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 2
			toggleSeeDown( 5 )
		elseif carShop.vehicle == 3 then
			vehicle[1] = createVehicle( cars[3].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[4].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 3
			detail[2] = 4
			toggleSee( 2 )
		elseif carShop.vehicle == 4 then
			vehicle[1] = createVehicle( cars[5].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[6].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 5
			detail[2] = 6
			toggleSee( 2 )
		elseif carShop.vehicle == 5 then
			vehicle[1] = createVehicle( cars[7].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[8].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			vehicle[3] = createVehicle( cars[9].id, 3132.3, -2001.4, 50, 0, 0, 180 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( vehicle[3], 1 )
			setVehicleEngineState( vehicle[3], false )
			setVehicleLocked( vehicle[3], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 7
			detail[2] = 8
			detail[3] = 9
			toggleSee( 3 )
		elseif carShop.vehicle == 6 then
			vehicle[1] = createVehicle( cars[10].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 10
			toggleSeeDown( 5 )
		elseif carShop.vehicle == 7 then
			vehicle[1] = createVehicle( cars[11].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[12].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 11
			detail[2] = 12
			toggleSee( 2 )
		elseif carShop.vehicle == 8 then
			vehicle[1] = createVehicle( cars[13].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 13
			toggleSeeDown( 5 )
		elseif carShop.vehicle == 9 then
			vehicle[1] = createVehicle( cars[14].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 14
			toggleSeeDown( 5 )
		elseif carShop.vehicle == 10 then
			vehicle[1] = createVehicle( cars[15].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 15
			toggleSeeDown( 5 )
		elseif carShop.vehicle == 11 then
			vehicle[1] = createVehicle( cars[16].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 16
			toggleSeeDown( 5 )
		elseif carShop.vehicle == 12 then
			vehicle[1] = createVehicle( cars[17].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[18].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 17
			detail[2] = 18
			toggleSee( 2 )
		elseif carShop.vehicle == 13 then
			vehicle[1] = createVehicle( cars[19].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 19
			toggleSeeDown( 5 )
		elseif carShop.vehicle == 14 then
			vehicle[1] = createVehicle( cars[20].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[21].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 20
			detail[2] = 21
			toggleSee( 2 )
		elseif carShop.vehicle == 15 then
			vehicle[1] = createVehicle( cars[22].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[23].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			vehicle[3] = createVehicle( cars[24].id, 3132.3, -2001.4, 50, 0, 0, 180 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( vehicle[3], 1 )
			setVehicleEngineState( vehicle[3], false )
			setVehicleLocked( vehicle[3], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 22
			detail[2] = 23
			detail[3] = 24
			toggleSee( 3 )
		elseif carShop.vehicle == 16 then
			vehicle[1] = createVehicle( cars[25].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[26].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			vehicle[3] = createVehicle( cars[27].id, 3132.3, -2001.4, 50, 0, 0, 180 )
			vehicle[4] = createVehicle( cars[28].id, 3141, -1992.1, 50, 0, 0, 225 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( vehicle[3], 1 )
			setVehicleEngineState( vehicle[3], false )
			setVehicleLocked( vehicle[3], false )
			setElementDimension( vehicle[4], 1 )
			setVehicleEngineState( vehicle[4], false )
			setVehicleLocked( vehicle[4], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 25
			detail[2] = 26
			detail[3] = 27
			detail[4] = 28
			toggleSee( 4 )
		elseif carShop.vehicle == 17 then
			vehicle[1] = createVehicle( cars[29].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[30].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			vehicle[3] = createVehicle( cars[31].id, 3132.3, -2001.4, 50, 0, 0, 180 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( vehicle[3], 1 )
			setVehicleEngineState( vehicle[3], false )
			setVehicleLocked( vehicle[3], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 29
			detail[2] = 30
			detail[3] = 31
			toggleSee( 3 )
		elseif carShop.vehicle == 18 then
			vehicle[1] = createVehicle( cars[32].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 32
			toggleSeeDown( 5 )
		elseif carShop.vehicle == 19 then
			vehicle[1] = createVehicle( cars[33].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[34].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			vehicle[3] = createVehicle( cars[35].id, 3132.3, -2001.4, 50, 0, 0, 180 )
			vehicle[4] = createVehicle( cars[36].id, 3141, -1992.1, 50, 0, 0, 225 )
			vehicle[5] = createVehicle( cars[37].id, 3155.6, -2005.1, 54, 0, 0, 135 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( vehicle[3], 1 )
			setVehicleEngineState( vehicle[3], false )
			setVehicleLocked( vehicle[3], false )
			setElementDimension( vehicle[4], 1 )
			setVehicleEngineState( vehicle[4], false )
			setVehicleLocked( vehicle[4], false )
			setElementDimension( vehicle[5], 1 )
			setVehicleEngineState( vehicle[5], false )
			setVehicleLocked( vehicle[5], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 33
			detail[2] = 34
			detail[3] = 35
			detail[4] = 36
			detail[5] = 37
			toggleSee( 5 )
		elseif carShop.vehicle == 20 then
			vehicle[1] = createVehicle( cars[38].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 38
			toggleSeeDown( 5 )
		elseif carShop.vehicle == 21 then
			vehicle[1] = createVehicle( cars[39].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[40].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 39
			detail[2] = 40
			toggleSee( 2 )
		elseif carShop.vehicle == 22 then
			vehicle[1] = createVehicle( cars[41].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[42].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 41
			detail[2] = 42
			toggleSee( 2 )
		elseif carShop.vehicle == 23 then
			vehicle[1] = createVehicle( cars[43].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[44].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 43
			detail[2] = 44
			toggleSee( 2 )
		elseif carShop.vehicle == 24 then
			vehicle[1] = createVehicle( cars[45].id, 3142.2, -2001.4, 51 )
			vehicle[2] = createVehicle( cars[46].id, 3153.8, -1992.8, 51, 0, 0, 90 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( vehicle[2], 1 )
			setVehicleEngineState( vehicle[2], false )
			setVehicleLocked( vehicle[2], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 45
			detail[2] = 46
			toggleSee( 2 )
		elseif carShop.vehicle == 25 then
			vehicle[1] = createVehicle( cars[47].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 47
			toggleSeeDown( 5 )
		elseif carShop.vehicle == 26 then
			vehicle[1] = createVehicle( cars[48].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 48
			toggleSeeDown( 5 )
		elseif carShop.vehicle == 27 then
			vehicle[1] = createVehicle( cars[49].id, 3142.2, -2001.4, 51 )
			setElementDimension( vehicle[1], 1 )
			setVehicleEngineState( vehicle[1], false )
			setVehicleLocked( vehicle[1], false )
			setElementDimension( getLocalPlayer(  ), 1 )
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
			setElementFrozen( getLocalPlayer(  ), true )
			setElementAlpha( getLocalPlayer(  ), 0 )
			detail[1] = 49
			toggleSeeDown( 5 )
		end
		addEventHandler( "onClientRender", root, drawVehicle )
		showChat( false )
	end, 2500, 1 )
end

local nowSee = 1
local color = { [1] = createElement( "picker" ), [2] = createElement( "picker" ), [3] = false, [4] = createElement( "button" ), [5] = nil }

function drawVehicle(  )
	dxDrawText ( "Press '#FF0000Q#FFFFFF' #FF0000Quit #FFFFFFto world", 0, 0, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	dxDrawText ( "Press '#FF0000Backspace#FFFFFF' #00FF00return #FFFFFFto the #FF0000previous #FFFFFFwindow", 0, dxGetFontHeight( 1, "default-bold" ), screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	dxDrawImage( 0, 4, 32, 32, "img/exit.png", 0, 0, 0, tocolor( 255, 255, 255, carShop.exitAlpha ), true )
	dxDrawText ( "#FFB000Mark: #ffffaa"..cars[detail[nowSee]].mark, 0, screenHeight - dxGetFontHeight( 1, "default-bold" )*11, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	dxDrawText ( "#FFB000Series: #ffffaa"..cars[detail[nowSee]].series, 0, screenHeight - dxGetFontHeight( 1, "default-bold" )*10, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	dxDrawText ( "#FFB000Model: #ffffaa"..cars[detail[nowSee]].model, 0, screenHeight - dxGetFontHeight( 1, "default-bold" )*9, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	dxDrawText ( "#FFB000Class: #ffffaa"..cars[detail[nowSee]].class, 0, screenHeight - dxGetFontHeight( 1, "default-bold" )*8, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	dxDrawText ( "#FFB000Year: #ffffaa"..cars[detail[nowSee]].year, 0, screenHeight - dxGetFontHeight( 1, "default-bold" )*7, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	dxDrawText ( "#FFB000Power: #ffffaa"..cars[detail[nowSee]].power, 0, screenHeight - dxGetFontHeight( 1, "default-bold" )*6, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	dxDrawText ( "#FFB000Capacity: #ffffaa"..cars[detail[nowSee]].capacity, 0, screenHeight - dxGetFontHeight( 1, "default-bold" )*5, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	dxDrawText ( "#FFB000Fuel: #ffffaa"..cars[detail[nowSee]].fuel, 0, screenHeight - dxGetFontHeight( 1, "default-bold" )*4, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	dxDrawText ( "#FFB000Body: #ffffaa"..cars[detail[nowSee]].body, 0, screenHeight - dxGetFontHeight( 1, "default-bold" )*3, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	dxDrawText ( "#FFB000Amount #00FF00Money: #ffffaa"..cars[detail[nowSee]].money, 0, screenHeight - dxGetFontHeight( 1, "default-bold" )*2, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	dxDrawText ( "#FFB000Amount #FFB000TDA#313131//#FFFFFFPoint: #ffffaa"..cars[detail[nowSee]].tdapoint, 0, screenHeight - dxGetFontHeight( 1, "default-bold" ), screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	if color[3] then
		dxDrawText ( "Color 1:", screenWidth - 312*2, 0, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
		dxDrawText ( "Color 2:", screenWidth - 312, 0, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
		exports.tda_source:dxDrawColorPicker( screenWidth - 312*2, 8, color[1], true )
		exports.tda_source:dxDrawColorPicker( screenWidth - 312, 8, color[2], true )
		exports.tda_source:dxDrawButton("Buy", screenWidth - 328, 256 + 8, 290, 44, color[4], tocolor( 255, 176, 0, 255 ), true)
		setVehicleColor( vehicle[nowSee], getElementData( color[1], "r" ), getElementData( color[1], "g" ), getElementData( color[1], "b" ), getElementData( color[2], "r" ), getElementData( color[2], "g" ), getElementData( color[2], "b" ) )
	else
		dxDrawText ( "Press '#FF0000Enter#FFFFFF' Bought Using #00FF00Money", screenWidth/2 - dxGetTextWidth( "Press 'Enter' Bought Using Money", 1.5, "default-bold" )/2, screenHeight - dxGetFontHeight( 1.5, "default-bold" ) - 128, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1.5, "default-bold", "left", "top", false, false, true, true )
		dxDrawLine( screenWidth/2 - dxGetTextWidth( "Press 'Enter' Bought Using Money", 1.5, "default-bold" )/2, screenHeight - dxGetFontHeight( 1.5, "default-bold" ) - 106, screenWidth/2 - dxGetTextWidth( "Press 'Enter' Bought Using Money", 1.5, "default-bold" )/2 + dxGetTextWidth( "Press 'Enter' Bought Using Money", 1.5, "default-bold" ), screenHeight - dxGetFontHeight( 1.5, "default-bold" ) - 106, tocolor ( 255, 176, 0, 255 ), 1, true )
		dxDrawText ( "Press '#FF0000Space#FFFFFF' Bought Using #FFB000TDA#313131//#FFFFFFPoint", screenWidth/2 - dxGetTextWidth( "Press 'Space' Bought Using TDA//Point", 1.5, "default-bold" )/2, screenHeight - dxGetFontHeight( 1.5, "default-bold" ) - 128 + dxGetFontHeight( 1.5, "default-bold" ), screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1.5, "default-bold", "left", "top", false, false, true, true )
		dxDrawText ( "Press '#FFB000Left#FFFFFF' #00FF00watch #00FFBBnext #FFFFFFvehicle", 0, dxGetFontHeight( 1, "default-bold" )*2, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
		dxDrawText ( "Press '#FFB000Right#FFFFFF' #00FF00watch #00FFBBprevious #FFFFFFvehicle", 0, dxGetFontHeight( 1, "default-bold" )*3, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
	end
end

function dontSeeDetails(  )
	for index,vehicle in ipairs(getElementsByType("vehicle")) do
		setElementCollidableWith(vehicle, getLocalPlayer(  ), false)
	end
end

function toggleSee( state )
	bindKey( "arrow_l", "down", downSee, state )
	bindKey( "arrow_r", "down", upSee, state )
	bindKey( "enter", "down", buyVehicleEnter )
	bindKey( "space", "down", buyVehicleSpace )
	bindKey("backspace", "down", backWindow)
	bindKey("q", "down", quitPanel)
end

function toggleSeeDown( state )
	unbindKey( "arrow_l", "down", downSee, state )
	unbindKey( "arrow_r", "down", upSee, state )
	bindKey( "enter", "down", buyVehicleEnter )
	bindKey( "space", "down", buyVehicleSpace )
	bindKey("backspace", "down", backWindow)
	bindKey("q", "down", quitPanel)
end

function upSee( key, keyState, state )
	if nowSee < state then
		nowSee = nowSee + 1
		getStateSee( nowSee )
		if nowSee == 2 then
			setElementPosition( getLocalPlayer(  ), 3153.8, -1992.8, 51 )
		elseif nowSee == 3 then
			setElementPosition( getLocalPlayer(  ), 3132.3, -2001.4, 50 )
		elseif nowSee == 4 then
			setElementPosition( getLocalPlayer(  ), 3141, -1992.1, 50 )
		elseif nowSee == 5 then
			setElementPosition( getLocalPlayer(  ), 3155.6, -2005.1, 54 )
		end
	end
end

function buyVehicleEnter(  )
	color[3] = true
	color[5] = "Money"
	showCursor( true )
	exports.tda_levels:showPlayerLevel(false)
	exports.tda_scoreboard:showPlayerScoreboard(false)
	exports.tda_phone:showPlayerPhone(false)
	exports.tda_hud:showPlayerHud("all",false)
end

function buyVehicleSpace(  )
	color[3] = true
	color[5] = "TDAPoint"
	showCursor( true )
	exports.tda_levels:showPlayerLevel(false)
	exports.tda_scoreboard:showPlayerScoreboard(false)
	exports.tda_phone:showPlayerPhone(false)
	exports.tda_hud:showPlayerHud("all",false)
end

function complateVehicle(  )
	if color[5] == "Money" then
		triggerServerEvent( "onBuyVehicle", getLocalPlayer(  ), getLocalPlayer(  ), "Money", cars[detail[nowSee]].money, cars[detail[nowSee]].id, cars[detail[nowSee]].mark, cars[detail[nowSee]].series, cars[detail[nowSee]].model, getElementData( color[1], "r" ), getElementData( color[1], "g" ), getElementData( color[1], "b" ), getElementData( color[2], "r" ), getElementData( color[2], "g" ), getElementData( color[2], "b" ) )
	elseif color[5] == "TDAPoint" then
		triggerServerEvent( "onBuyVehicle", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", cars[detail[nowSee]].tdapoint, cars[detail[nowSee]].id, cars[detail[nowSee]].mark, cars[detail[nowSee]].series, cars[detail[nowSee]].model, getElementData( color[1], "r" ), getElementData( color[1], "g" ), getElementData( color[1], "b" ), getElementData( color[2], "r" ), getElementData( color[2], "g" ), getElementData( color[2], "b" ) )
	end
end
addEvent("onClientDXClick", true)
addEventHandler("onClientDXClick", root, complateVehicle)

function quitPanel(  )
	fadeCamera( false, 1 )
	removeEventHandler( "onClientRender", root, drawVehicle )
	exports.tda_levels:showPlayerLevel(false)
	exports.tda_scoreboard:showPlayerScoreboard(false)
	exports.tda_phone:showPlayerPhone(false)
	exports.tda_hud:showPlayerHud("all",false)
	setTimer( function() 
		fadeCamera( true, 2 )
		color[3] = false
		color[5] = nil
		for i=1,5 do
			if vehicle[i] ~= nil then
				destroyElement( vehicle[i] )
			end
		end
		detail[1] = nil
		detail[2] = nil
		detail[3] = nil
		detail[4] = nil
		detail[5] = nil
		vehicle[1] = nil
		vehicle[2] = nil
		vehicle[3] = nil
		vehicle[4] = nil
		vehicle[5] = nil
		nowSee = 1
		showCursor( false )
		unbindKey( "arrow_l", "down", downSee, state )
		unbindKey( "arrow_r", "down", upSee, state )
		unbindKey( "enter", "down", buyVehicleEnter )
		unbindKey( "space", "down", buyVehicleSpace )
		unbindKey("backspace", "down", backWindow)
		unbindKey("q", "down", quitPanel)
		setCameraClip ( true, true )
		toggleControl( "vehicle_left", true )
		toggleControl( "vehicle_right", true )
		toggleControl( "enter_exit", true )
		toggleControl( "forwards", true )
		toggleControl( "backwards", true )
		toggleControl( "left", true )
		toggleControl( "right", true )
		toggleControl( "fire", true )
		toggleControl( "next_weapon", true )
		toggleControl( "previous_weapon", true )
		toggleControl( "zoom_in", true )
		toggleControl( "zoom_out", true )
		toggleControl( "aim_weapon", true )
		toggleControl( "jump", true )
		toggleControl( "crouch", true ) 
		setCameraViewMode( 3 )
		toggleControl( "change_camera", true )
		setElementAlpha( getLocalPlayer(  ), 255 )
		setElementDimension( getLocalPlayer(  ), 0 )
		setElementFrozen( getLocalPlayer(  ), false )
		setElementPosition( getLocalPlayer(  ), -1957.35, 305.9, 40 )
		for index,vehicle in ipairs(getElementsByType("vehicle")) do
			setElementCollidableWith(vehicle, getLocalPlayer(  ), true)
			if getPedOccupiedVehicle( getLocalPlayer(  ) ) then
				setElementCollidableWith(vehicle, getPedOccupiedVehicle( getLocalPlayer(  ) ), true)
			end
		end
		for index,player in ipairs(getElementsByType("player")) do
			setElementCollidableWith(player, getLocalPlayer(  ), true)
		end
		for index,vehicle in ipairs(getElementsByType("vehicle")) do
			if getPedOccupiedVehicle( getLocalPlayer(  ) ) ~= vehicle then
				setElementAlpha( vehicle, 255 )
			end
		end
		carShop.state = false
		carShop.blurElement = not exports.tda_source:destroyBlurBox( carShop.blurElement )
		carShop.blurElement = nil
		removeEventHandler( "onClientPreRender", root, animVehicle )
		removeEventHandler( "onClientRender", root, drawVehiclePanel )
		removeEventHandler( "onClientRender", root, selectedAnim )
		showChat( true )
		showCursor( false)
		nextAnim = 0
		oldAnim = 0
		carShop.plus = 0
		carShop.bindState = false
		carShop.logo[1].postGui = true
		for i=2,27 do
			carShop.logo[i].postGui = false
		end
		removeEventHandler( "onClientRender", root, selectedAnim )
		removeEventHandler( "onClientRender", root, dontSeeDetails )
		exports.tda_levels:showPlayerLevel(true)
		exports.tda_scoreboard:showPlayerScoreboard(true)
		exports.tda_phone:showPlayerPhone(true)
		exports.tda_hud:showPlayerHud("all",true)
	end, 2500, 1 )
end


function backWindow(  )
	if color[3] then
		color[3] = false
		color[5] = nil
		showCursor( false )
		exports.tda_hud:showPlayerHud("hud",true)
	elseif selectState == true then
		fadeCamera( false, 1 )
		exports.tda_levels:showPlayerLevel(false)
		exports.tda_scoreboard:showPlayerScoreboard(false)
		exports.tda_phone:showPlayerPhone(false)
		exports.tda_hud:showPlayerHud("all",false)
		removeEventHandler( "onClientRender", root, drawVehicle )
		setTimer( function() 
			fadeCamera( true, 2 )
			color[3] = false
			color[5] = nil
			for i=1,5 do
				if vehicle[i] ~= nil then
					destroyElement( vehicle[i] )
				end
			end
			detail[1] = nil
			detail[2] = nil
			detail[3] = nil
			detail[4] = nil
			detail[5] = nil
			vehicle[1] = nil
			vehicle[2] = nil
			vehicle[3] = nil
			vehicle[4] = nil
			vehicle[5] = nil
			nowSee = 1
			showCursor( false )
			unbindKey( "arrow_l", "down", downSee, state )
			unbindKey( "arrow_r", "down", upSee, state )
			unbindKey( "enter", "down", buyVehicleEnter )
			unbindKey( "space", "down", buyVehicleSpace )
			unbindKey("backspace", "down", backWindow)
			unbindKey("q", "down", quitPanel)
			setCameraClip ( true, true )
			toggleControl( "vehicle_left", true )
			toggleControl( "vehicle_right", true )
			toggleControl( "enter_exit", true )
			toggleControl( "forwards", true )
			toggleControl( "backwards", true )
			toggleControl( "left", true )
			toggleControl( "right", true )
			toggleControl( "fire", true )
			toggleControl( "next_weapon", true )
			toggleControl( "previous_weapon", true )
			toggleControl( "zoom_in", true )
			toggleControl( "zoom_out", true )
			toggleControl( "aim_weapon", true )
			toggleControl( "jump", true )
			toggleControl( "crouch", true ) 
			setCameraViewMode( 3 )
			toggleControl( "change_camera", true )
			setElementAlpha( getLocalPlayer(  ), 255 )
			setElementDimension( getLocalPlayer(  ), 0 )
			setElementFrozen( getLocalPlayer(  ), false )
			setElementPosition( getLocalPlayer(  ), -1957.35, 305.9, 40 )
			for index,vehicle in ipairs(getElementsByType("vehicle")) do
				setElementCollidableWith(vehicle, getLocalPlayer(  ), true)
				if getPedOccupiedVehicle( getLocalPlayer(  ) ) then
					setElementCollidableWith(vehicle, getPedOccupiedVehicle( getLocalPlayer(  ) ), true)
				end
			end
			for index,player in ipairs(getElementsByType("player")) do
				setElementCollidableWith(player, getLocalPlayer(  ), true)
			end
			for index,vehicle in ipairs(getElementsByType("vehicle")) do
				if getPedOccupiedVehicle( getLocalPlayer(  ) ) ~= vehicle then
					setElementAlpha( vehicle, 255 )
				end
			end
			selectState = false
			removeEventHandler( "onClientRender", root, selectedAnim )
			removeEventHandler( "onClientRender", root, dontSeeDetails )
			toggleVehicleShop( getLocalPlayer(  ) )
		end, 2500, 1 )
	end
end

function buyNatification( state, data )
	if state == 0 then
		if data == "Money" then
			exports.tda_source:outputNotification("Successful purchase with Money", 1)
			color[3] = false
			color[5] = nil
			showCursor( false )
		elseif data == "TDAPoint" then
			exports.tda_source:outputNotification("Successful purchase with TDA//Point", 1)
			color[3] = false
			color[5] = nil
			showCursor( false )
		end
	elseif state == 1 then
		if data == "Money" then
			exports.tda_source:outputNotification("You don't have enough Money", 2)
			color[3] = false
			color[5] = nil
			showCursor( false )
		elseif data == "TDAPoint" then
			exports.tda_source:outputNotification("You don't have enough TDA//Point", 2)
			color[3] = false
			color[5] = nil
			showCursor( false )
		end
	end
end
addEvent( "onClientNatificationVehicle", true )
addEventHandler( "onClientNatificationVehicle", root, buyNatification )

function downSee( key, keyState, state )
	if nowSee > 1 then
		nowSee = nowSee - 1
		getStateSee( nowSee )
		if nowSee == 1 then
			setElementPosition( getLocalPlayer(  ), 3142.2, -2001.4, 51 )
		elseif nowSee == 2 then
			setElementPosition( getLocalPlayer(  ), 3153.8, -1992.8, 51 )
		elseif nowSee == 3 then
			setElementPosition( getLocalPlayer(  ), 3132.3, -2001.4, 50 )
		elseif nowSee == 4 then
			setElementPosition( getLocalPlayer(  ), 3141, -1992.1, 50 )
		end
	end	
end

function getStateSee( state )
	return state
end

function nextVehicle(  )
	if carShop.state then
		if carShop.vehicle < 27 then
			carShop.vehicle = carShop.vehicle + 1
			if carShop.vehicle == 2 then
				nextAnim = 128
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[1].postGui = false
				carShop.logo[2].postGui = true
			elseif carShop.vehicle == 3 then
				nextAnim = 128*2
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[2].postGui = false
				carShop.logo[3].postGui = true
			elseif carShop.vehicle == 4 then
				nextAnim = 128*3
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[3].postGui = false
				carShop.logo[4].postGui = true
			elseif carShop.vehicle == 5 then
				nextAnim = 128*4
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[4].postGui = false
				carShop.logo[5].postGui = true
			elseif carShop.vehicle == 6 then
				nextAnim = 128*5
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[5].postGui = false
				carShop.logo[6].postGui = true
			elseif carShop.vehicle == 7 then
				nextAnim = 128*6 + 24
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[6].postGui = false
				carShop.logo[7].postGui = true
			elseif carShop.vehicle == 8 then
				nextAnim = 128*7 + 24
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[7].postGui = false
				carShop.logo[8].postGui = true
			elseif carShop.vehicle == 9 then
				nextAnim = 128*8 + 96
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[8].postGui = false
				carShop.logo[9].postGui = true
			elseif carShop.vehicle == 10 then
				nextAnim = 128*10 + 44
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[9].postGui = false
				carShop.logo[10].postGui = true
			elseif carShop.vehicle == 11 then
				nextAnim = 128*12
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[10].postGui = false
				carShop.logo[11].postGui = true
			elseif carShop.vehicle == 12 then
				nextAnim = 128*13 + 96
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[11].postGui = false
				carShop.logo[12].postGui = true
			elseif carShop.vehicle == 13 then
				nextAnim = 128*16 - 32
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[12].postGui = false
				carShop.logo[13].postGui = true
			elseif carShop.vehicle == 14 then
				nextAnim = 128*18 - 24
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[13].postGui = false
				carShop.logo[14].postGui = true
			elseif carShop.vehicle == 15 then
				nextAnim = 128*20
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[14].postGui = false
				carShop.logo[15].postGui = true
			elseif carShop.vehicle == 16 then
				nextAnim = 128*22 + 24
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[15].postGui = false
				carShop.logo[16].postGui = true
			elseif carShop.vehicle == 17 then
				nextAnim = 128*24 + 32
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[16].postGui = false
				carShop.logo[17].postGui = true
			elseif carShop.vehicle == 18 then
				nextAnim = 128*26 + 32
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[17].postGui = false
				carShop.logo[18].postGui = true
			elseif carShop.vehicle == 19 then
				nextAnim = 128*28 + 24
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[18].postGui = false
				carShop.logo[19].postGui = true
			elseif carShop.vehicle == 20 then
				nextAnim = 128*30 + 44
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[19].postGui = false
				carShop.logo[20].postGui = true
			elseif carShop.vehicle == 21 then
				nextAnim = 128*32 + 64
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[20].postGui = false
				carShop.logo[21].postGui = true
			elseif carShop.vehicle == 22 then
				nextAnim = 128*34 + 78
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[21].postGui = false
				carShop.logo[22].postGui = true
			elseif carShop.vehicle == 23 then
				nextAnim = 128*36 + 88
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[22].postGui = false
				carShop.logo[23].postGui = true
			elseif carShop.vehicle == 24 then
				nextAnim = 128*38 + 96
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[23].postGui = false
				carShop.logo[24].postGui = true
			elseif carShop.vehicle == 25 then
				nextAnim = 128*40 + 104
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[24].postGui = false
				carShop.logo[25].postGui = true
			elseif carShop.vehicle == 26 then
				nextAnim = 128*43
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[25].postGui = false
				carShop.logo[26].postGui = true
			elseif carShop.vehicle == 27 then
				nextAnim = 128*44
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[26].postGui = false
				carShop.logo[27].postGui = true
			end
		end
	end
end

function prevVehicle(  )
	if carShop.state then
		if carShop.vehicle > 1 then
			carShop.vehicle = carShop.vehicle - 1 
			if carShop.vehicle == 1 then
				nextAnim = 0
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[1].postGui = true
				carShop.logo[2].postGui = false
			elseif carShop.vehicle == 2 then
				nextAnim = 128
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[2].postGui = true
				carShop.logo[3].postGui = false
			elseif carShop.vehicle == 3 then
				nextAnim = 128*2
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[3].postGui = true
				carShop.logo[4].postGui = false
			elseif carShop.vehicle == 4 then
				nextAnim = 128*3
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[4].postGui = true
				carShop.logo[5].postGui = false
			elseif carShop.vehicle == 5 then
				nextAnim = 128*4
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[5].postGui = true
				carShop.logo[6].postGui = false
			elseif carShop.vehicle == 6 then
				nextAnim = 128*5
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[6].postGui = true
				carShop.logo[7].postGui = false
			elseif carShop.vehicle == 7 then
				nextAnim = 128*6 + 24
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[7].postGui = true
				carShop.logo[8].postGui = false
			elseif carShop.vehicle == 8 then
				nextAnim = 128*7 + 24
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[8].postGui = true
				carShop.logo[9].postGui = false
			elseif carShop.vehicle == 9 then
				nextAnim = 128*8 + 96
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[9].postGui = true
				carShop.logo[10].postGui = false
			elseif carShop.vehicle == 10 then
				nextAnim = 128*10 + 44
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[10].postGui = true
				carShop.logo[11].postGui = false
			elseif carShop.vehicle == 11 then
				nextAnim = 128*12
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[11].postGui = true
				carShop.logo[12].postGui = false
			elseif carShop.vehicle == 12 then
				nextAnim = 128*13 + 96
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[12].postGui = true
				carShop.logo[13].postGui = false
			elseif carShop.vehicle == 13 then
				nextAnim = 128*16 - 32
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[13].postGui = true
				carShop.logo[14].postGui = false
			elseif carShop.vehicle == 14 then
				nextAnim = 128*18 - 24
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[14].postGui = true
				carShop.logo[15].postGui = false
			elseif carShop.vehicle == 15 then
				nextAnim = 128*20
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[15].postGui = true
				carShop.logo[16].postGui = false
			elseif carShop.vehicle == 16 then
				nextAnim = 128*22 + 24
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[16].postGui = true
				carShop.logo[17].postGui = false
			elseif carShop.vehicle == 17 then
				nextAnim = 128*24 + 32
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[17].postGui = true
				carShop.logo[18].postGui = false
			elseif carShop.vehicle == 18 then
				nextAnim = 128*26 + 32
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[18].postGui = true
				carShop.logo[19].postGui = false
			elseif carShop.vehicle == 19 then
				nextAnim = 128*28 + 24
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[19].postGui = true
				carShop.logo[20].postGui = false
			elseif carShop.vehicle == 20 then
				nextAnim = 128*30 + 44
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[20].postGui = true
				carShop.logo[21].postGui = false
			elseif carShop.vehicle == 21 then
				nextAnim = 128*32 + 64
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[21].postGui = true
				carShop.logo[22].postGui = false
			elseif carShop.vehicle == 22 then
				nextAnim = 128*34 + 78
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[22].postGui = true
				carShop.logo[23].postGui = false
			elseif carShop.vehicle == 23 then
				nextAnim = 128*36 + 88
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[23].postGui = true
				carShop.logo[24].postGui = false
			elseif carShop.vehicle == 24 then
				nextAnim = 128*38 + 96
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[24].postGui = true
				carShop.logo[25].postGui = false
			elseif carShop.vehicle == 25 then
				nextAnim = 128*40 + 104
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[25].postGui = true
				carShop.logo[26].postGui = false
			elseif carShop.vehicle == 26 then
				nextAnim = 128*43
				oldAnim = carShop.plus
				carShop.bindState = true
				carShop.animTick = getTickCount(  )
				carShop.logo[26].postGui = true
				carShop.logo[27].postGui = false
			end
		end
	end
end

function animVehicle(  )
	if carShop.state == true then
		if carShop.bindState then
			carShop.plus = interpolateBetween( oldAnim, 0, 0, nextAnim, 0, 0, getProgress( 800, carShop.animTick ), "OutElastic" )
		end
	end
end

function getProgress(ms, tick)
	return (getTickCount() - tick) / ms
end

function checkHover( x, y, width, height )
	local screenWidth, screenHeight = guiGetScreenSize(  )
	cX, cY = getCursorPosition()
	cX, cY = cX*screenWidth,cY*screenHeight
	if (cX >= x and cX <= (x + width) and cY >= y and cY <= (y + height)) then
		return true
	end
	return false
end