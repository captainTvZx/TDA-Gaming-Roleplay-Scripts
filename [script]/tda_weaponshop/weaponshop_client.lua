local screenWidth, screenHeight = guiGetScreenSize(  )
createBlip( 777, 1871.4, 5.41, 6, 2, 255, 0, 0, 255, 0, 600, getLocalPlayer(  ) )
createBlip( -1508.9, 2610.5, 56.4, 6, 2, 255, 0, 0, 255, 0, 600, getLocalPlayer(  ) )
createBlip( 2557.6, 2101.5, 11.4, 6, 2, 255, 0, 0, 255, 0, 600, getLocalPlayer(  ) )
createBlip( 2556.9, 2065, 11.6, 6, 2, 255, 0, 0, 255, 0, 600, getLocalPlayer(  ) )
createBlip( 2177.65, 961.5, 11.4, 6, 2, 255, 0, 0, 255, 0, 600, getLocalPlayer(  ) )
createBlip( 2176.95, 925, 11.6, 6, 2, 255, 0, 0, 255, 0, 600, getLocalPlayer(  ) )
createBlip( 2333.4, 61.55, 27.4, 6, 2, 255, 0, 0, 255, 0, 600, getLocalPlayer(  ) )
createBlip( 1368.5, -1279.8, 14.4, 6, 2, 255, 0, 0, 255, 0, 600, getLocalPlayer(  ) )
createBlip( 2400.5, -1981.7, 14.1, 6, 2, 255, 0, 0, 255, 0, 600, getLocalPlayer(  ) )
createBlip( 243, -178.3, 2.1, 6, 2, 255, 0, 0, 255, 0, 600, getLocalPlayer(  ) )
createBlip( -2626.5, 208.5, 5.4, 6, 2, 255, 0, 0, 255, 0, 600, getLocalPlayer(  ) )
shopSec = createPed( 179, 294, -83, 1002 )
givePedWeapon( shopSec, 38, 500000, true)
setElementInterior( shopSec, 4 )
weaponsShop = {
	enterMarkerState = false,
	markerAnimTick = 0,
	markerAnimPlus = 0,
	markerState = false,
	warnMarkerState = false,
	enterShopMarker = createMarker( 777, 1871.4, 5.41, "arrow", 1.2, 255, 176, 0, 255, root ),
	enterShopMarker1 = createMarker( -316, 829.85, 14.75, "arrow", 1.2, 255, 176, 0, 255, root ),
	enterShopMarker2 = createMarker( -1508.9, 2610.5, 56.4, "arrow", 1.2, 255, 176, 0, 255, root ),
	enterShopMarker3 = createMarker( 2557.6, 2101.5, 11.4, "arrow", 1.2, 255, 176, 0, 255, root ),
	enterShopMarker4 = createMarker( 2556.9, 2065, 11.6, "arrow", 1.2, 255, 176, 0, 255, root ),
	enterShopMarker5 = createMarker( 2177.65, 961.5, 11.4, "arrow", 1.2, 255, 176, 0, 255, root ),
	enterShopMarker6 = createMarker( 2176.95, 925, 11.6, "arrow", 1.2, 255, 176, 0, 255, root ),
	enterShopMarker7 = createMarker( 2333.4, 61.55, 27.4, "arrow", 1.2, 255, 176, 0, 255, root ),
	enterShopMarker8 = createMarker( 1368.5, -1279.8, 14.4, "arrow", 1.2, 255, 176, 0, 255, root ),
	enterShopMarker9 = createMarker( 2400.5, -1981.7, 14.1, "arrow", 1.2, 255, 176, 0, 255, root ),
	enterShopMarker10 = createMarker( 243, -178.3, 2.1, "arrow", 1.2, 255, 176, 0, 255, root ),
	enterShopMarker11 = createMarker( -2626.5, 208.5, 5.4, "arrow", 1.2, 255, 176, 0, 255, root ),
	exitShopMarker = createMarker( 285.8, -86, 1002.1, "arrow", 1.2, 255, 176, 0, 255, root ),
	shopPanel = createMarker( 294, -80.5, 1000.5, "cylinder", 1, 255, 176, 0, 255, root ),
}
crossHair = {
	red = 255,
	green = 255,
	blue = 255,
	alpha = 255,
	text = "•",
}
setElementInterior( weaponsShop.exitShopMarker, 4 )
setElementInterior( weaponsShop.shopPanel, 4 )
local weaponState = false
local playerNowWeapon = ""
local shopPanelState = false

function disableWeaponSound(  )
	local enabled = isWorldSoundEnabled ( 5 )
	enabled = not enabled
	setWorldSoundEnabled ( 5, enabled )
end
addEventHandler( "onClientResourceStart", root, disableWeaponSound )

function enterShop( hitPlayer, matchingDimension )
	weaponsShop.enterMarkerState = true
	playerX, playerY, playerZ = getElementPosition( hitPlayer )
	triggerServerEvent ( "onPlayerEnterShop", resourceRoot, hitPlayer, playerX, playerY, playerZ )
	exports.tda_phone:showPlayerPhone(false)
	exports.tda_hud:showPlayerHud("radar", false)
end
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker, enterShop )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker1, enterShop )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker2, enterShop )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker3, enterShop )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker4, enterShop )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker5, enterShop )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker6, enterShop )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker7, enterShop )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker8, enterShop )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker9, enterShop )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker10, enterShop )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker11, enterShop )

function notErrorMarker(  )
	weaponsShop.warnMarkerState = false
end
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker, notErrorMarker )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker1, notErrorMarker )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker2, notErrorMarker )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker3, notErrorMarker )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker4, notErrorMarker )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker5, notErrorMarker )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker6, notErrorMarker )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker7, notErrorMarker )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker9, notErrorMarker )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker11, notErrorMarker )

function warnMarker(  )
	weaponsShop.warnMarkerState = true
end
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker8, warnMarker )
addEventHandler( "onClientMarkerHit", weaponsShop.enterShopMarker10, warnMarker )

function exitShop( hitPlayer, matchingDimension )
	setPedControlState ( shopSec, "fire", false )
	weaponsShop.enterMarkerState = false
	triggerServerEvent ( "onPlayerExitShop", resourceRoot, hitPlayer, weaponsShop.warnMarkerState )
	exports.tda_phone:showPlayerPhone(true)
	exports.tda_hud:showPlayerHud("radar", true)
end
addEventHandler( "onClientMarkerHit", weaponsShop.exitShopMarker, exitShop )

function markerAnim(  )
	if weaponsShop.markerState == false then
		weaponsShop.markerAnimPlus = interpolateBetween( 0, 0, 0, 0.5, 0, 0, getProgress(1500, weaponsShop.markerAnimTick), "OutQuad" )
		setElementPosition( weaponsShop.enterShopMarker, 777, 1871.4, 5.41 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker1, -316, 829.85, 14.75 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker2, -1508.9, 2610.5, 56.4 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker3, 2557.6, 2101.5, 11.4 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker4, 2556.9, 2065, 11.6 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker5, 2177.65, 961.5, 11.4 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker6, 2176.95, 925, 11.6 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker7, 2333.4, 61.55, 27.4 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker8, 1368.5, -1279.8, 14.4 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker9, 2400.5, -1981.7, 14.1 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker10, 243, -178.3, 2.1 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker11, -2626.5, 208.5, 5.4 + weaponsShop.markerAnimPlus )
	elseif weaponsShop.markerState == true then
		weaponsShop.markerAnimPlus = interpolateBetween( 0.5, 0, 0, 0, 0, 0, getProgress(1500, weaponsShop.markerAnimTick), "OutBounce" )
		setElementPosition( weaponsShop.enterShopMarker, 777, 1871.4, 5.41 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker1, -316, 829.85, 14.75 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker2, -1508.9, 2610.5, 56.4 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker3, 2557.6, 2101.5, 11.4 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker4, 2556.9, 2065, 11.6 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker5, 2177.65, 961.5, 11.4 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker6, 2176.95, 925, 11.6 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker7, 2333.4, 61.55, 27.4 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker8, 1368.5, -1279.8, 14.4 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker9, 2400.5, -1981.7, 14.1 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker10, 243, -178.3, 2.1 + weaponsShop.markerAnimPlus )
		setElementPosition( weaponsShop.enterShopMarker11, -2626.5, 208.5, 5.4 + weaponsShop.markerAnimPlus )
	end
	if weaponsShop.markerAnimPlus == 0.5 then
		weaponsShop.markerState = true
		weaponsShop.markerAnimTick = getTickCount(  )
		setTimer ( function() weaponsShop.markerState = false weaponsShop.markerAnimTick = getTickCount(  ) end, 1600, 1 )
	end
	playerXz, playerYz, playerZz = getElementPosition( getLocalPlayer(  ) )
	pedStateShop(  )
end
weaponsShop.markerAnimTick = getTickCount(  )
addEventHandler( "onClientRender", root, markerAnim )

function pedStateShop(  )
	playerHealth = getElementHealth ( getLocalPlayer(  ) ) 
	setElementHealth( shopSec, 200 )
	setPedAimTarget(shopSec, playerXz, playerYz, playerZz)
	setPedCameraRotation(shopSec, playerXz, playerYz, playerZz )
	if getPedControlState( getLocalPlayer( ), "fire" ) and weaponsShop.enterMarkerState == true then
		setPedLookAt( shopSec, playerXz, playerYz, playerZz, 999999999, 200, getLocalPlayer(  ) )
		setPedControlState ( shopSec, "fire", true )
	end
	if playerHealth == 0 then
		setPedControlState ( shopSec, "fire", false )
	end
end

function weaponSounds(  )
	local muzzleX, muzzleY, muzzleZ = getPedWeaponMuzzlePosition( source )
	local pX, pY, pZ = getElementPosition ( source )
	weaponID = getPedWeapon( source )
	if weaponID == 24 then
		local sound = playSound3D( "sound/deagle.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 22 then
		local sound = playSound3D( "sound/pistol.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 23 then
		local sound = playSound3D( "sound/silent.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 25 then
		local sound = playSound3D( "sound/shotgun.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 26 then
		local sound = playSound3D( "sound/sawn.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 27 then
		local sound = playSound3D( "sound/spas.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 29 then
		local sound = playSound3D( "sound/mp5.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 32 then
		local sound = playSound3D( "sound/tec9.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 28 then
		local sound = playSound3D( "sound/uzi.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 30 then
		local sound = playSound3D( "sound/ak47.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 31 then
		local sound = playSound3D( "sound/m4a1.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 33 then
		local sound = playSound3D( "sound/rifle.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 34 then
		local sound = playSound3D( "sound/sniper.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 35 then
		local sound = playSound3D( "sound/rpg.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 36 then
		local sound = playSound3D( "sound/rpg.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	elseif weaponID == 38 then
		local sound = playSound3D( "sound/minigun.wav", muzzleX, muzzleY, muzzleZ )
		setSoundMaxDistance(sound, 50)
	end
end
addEventHandler( "onClientPlayerWeaponFire", root, weaponSounds )

function weaponCrossDraw( )
	local screenValue = screenWidth * 0.5
	local uW, vW = ( screenWidth - screenValue ) * 0.5, ( screenHeight - screenValue )* 0.5
	if playerNowWeapon == "sniper" then
		dxDrawRectangle ( 0, 0, screenWidth, vW, tocolor (0, 0, 0, 255), true )
		dxDrawRectangle ( 0, 0, uW, screenHeight, tocolor (0, 0, 0, 255), true )
		dxDrawRectangle ( 0, screenHeight, screenWidth, -vW, tocolor (0, 0, 0, 255), true )
		dxDrawRectangle ( screenWidth, screenHeight, -uW, -screenHeight, tocolor (0, 0, 0, 255), true )
		dxDrawImage ( uW, vW, screenWidth-2 * uW, screenHeight-2 * vW, "img/snipercross_bg.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
		dxDrawImage ( uW, vW, screenWidth-2 * uW, screenHeight-2 * vW, "img/snipercross.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	elseif playerNowWeapon == "guns" then
		local hX,hY,hZ = getPedTargetEnd ( getLocalPlayer() )
    	local screenWidthw, screenHeightw = getScreenFromWorldPosition ( hX,hY,hZ )
		dxDrawText ( crossHair.text, screenWidthw - ( 32/2 ), screenHeightw - ( 32/2 ), screenWidthw + ( 32/2 ), screenHeightw + ( 32/2 ), tocolor ( crossHair.red, crossHair.green, crossHair.blue, crossHair.alpha ), 1.2, "default", "center", "center", false, false, true )
	elseif playerNowWeapon == "shotguns" then
		local hX,hY,hZ = getPedTargetEnd ( getLocalPlayer() )
    	local screenWidthw, screenHeightw = getScreenFromWorldPosition ( hX,hY,hZ )
		drawCircle( screenWidthw, screenHeightw, 30, 1, tocolor ( crossHair.red, crossHair.green, crossHair.blue, crossHair.alpha ) )
	elseif playerNowWeapon == "rpg" then
		local hX,hY,hZ = getPedTargetEnd ( getLocalPlayer() )
    	local screenWidthw, screenHeightw = getScreenFromWorldPosition ( hX,hY,hZ )
    	drawCircle( screenWidthw, screenHeightw, 80, 2, tocolor ( crossHair.red, crossHair.green, crossHair.blue, crossHair.alpha ) )
    	dxDrawLine( screenWidthw - 10, screenHeightw, screenWidthw + 10, screenHeightw, tocolor ( crossHair.red, crossHair.green, crossHair.blue, crossHair.alpha ), 2, true )
    	dxDrawLine( screenWidthw, screenHeightw - 10, screenWidthw, screenHeightw + 10, tocolor ( crossHair.red, crossHair.green, crossHair.blue, crossHair.alpha ), 2, true )
    elseif playerNowWeapon == "minigun" then
		local hX,hY,hZ = getPedTargetEnd ( getLocalPlayer() )
    	local screenWidthw, screenHeightw = getScreenFromWorldPosition ( hX,hY,hZ )
    	drawCircle( screenWidthw, screenHeightw, 5, 1, tocolor ( crossHair.red, crossHair.green, crossHair.blue, crossHair.alpha ) )
    	drawCircle( screenWidthw - 10, screenHeightw + 10, 5, 1, tocolor ( crossHair.red, crossHair.green, crossHair.blue, crossHair.alpha ) )
    	drawCircle( screenWidthw + 10, screenHeightw - 10, 5, 1, tocolor ( crossHair.red, crossHair.green, crossHair.blue, crossHair.alpha ) )
    	drawCircle( screenWidthw - 10, screenHeightw - 10, 5, 1, tocolor ( crossHair.red, crossHair.green, crossHair.blue, crossHair.alpha ) )
    	drawCircle( screenWidthw + 10, screenHeightw + 10, 5, 1, tocolor ( crossHair.red, crossHair.green, crossHair.blue, crossHair.alpha ) )
    elseif playerNowWeapon == "flame" then
		local hX,hY,hZ = getPedTargetEnd ( getLocalPlayer() )
    	local screenWidthw, screenHeightw = getScreenFromWorldPosition ( hX,hY,hZ )
    	drawCircle( screenWidthw, screenHeightw, 40, 2, tocolor ( crossHair.red, crossHair.green, crossHair.blue, crossHair.alpha ) )
    	drawCircle( screenWidthw, screenHeightw, 20, 2, tocolor ( crossHair.red, crossHair.green, crossHair.blue, crossHair.alpha ) )
	end
end

function playerTargetCheck ( )
	local playerTarget
	playerTarget = getPedTarget ( getLocalPlayer(  ) )
	if weaponState == true then
		if isElement( playerTarget ) then
			local elementType = getElementType ( playerTarget )
			if elementType == "player" then
				crossHair.red = 255
				crossHair.green = 0
				crossHair.blue = 0
				crossHair.alpha = 255
			elseif elementType == "vehicle" then
				crossHair.red = 255
				crossHair.green = 176
				crossHair.blue = 0
				crossHair.alpha = 255
			elseif elementType == "ped" then
				crossHair.red = 255
				crossHair.green = 0
				crossHair.blue = 0
				crossHair.alpha = 255
			else
				crossHair.red = 255
				crossHair.green = 255
				crossHair.blue = 255
				crossHair.alpha = 255
			end
		else
			crossHair.red = 255
			crossHair.green = 255
			crossHair.blue = 255
			crossHair.alpha = 255
		end
	end
end

function aimWeapon( key, state )
	local weapon = getPedWeapon( getLocalPlayer(  ) )
	if weapon == 34 then
		if state == "down" then 
			playerNowWeapon = "sniper"
			addEventHandler ("onClientRender", root, weaponCrossDraw)
		else 
			playerNowWeapon = ""
			removeEventHandler ("onClientRender", root, weaponCrossDraw)
		end
	end
	if weapon == 22 or weapon == 23 or weapon == 24 or weapon == 28 or weapon == 29 or weapon == 32 or weapon == 30 or weapon == 31 or weapon == 33 then
		if state == "down" then 
			playerNowWeapon = "guns"
			weaponState = true
			addEventHandler ("onClientRender", root, weaponCrossDraw)
			addEventHandler( "onClientRender", root, playerTargetCheck )
		else 
			playerNowWeapon = ""
			weaponState = false
			removeEventHandler ("onClientRender", root, weaponCrossDraw)
			removeEventHandler( "onClientRender", root, playerTargetCheck )
		end
	end
	if weapon == 25 or weapon == 26 or weapon == 27 then
		if state == "down" then 
			playerNowWeapon = "shotguns"
			weaponState = true
			addEventHandler ("onClientRender", root, weaponCrossDraw)
			addEventHandler( "onClientRender", root, playerTargetCheck )
		else 
			playerNowWeapon = ""
			weaponState = false
			removeEventHandler ("onClientRender", root, weaponCrossDraw)
			removeEventHandler( "onClientRender", root, playerTargetCheck )
		end
	end
	if weapon == 35 or weapon == 36 then
		if state == "down" then 
			playerNowWeapon = "rpg"
			weaponState = true
			addEventHandler ("onClientRender", root, weaponCrossDraw)
			addEventHandler( "onClientRender", root, playerTargetCheck )
		else 
			playerNowWeapon = ""
			weaponState = false
			removeEventHandler ("onClientRender", root, weaponCrossDraw)
			removeEventHandler( "onClientRender", root, playerTargetCheck )
		end
	end
	if weapon == 38 then
		if state == "down" then 
			playerNowWeapon = "minigun"
			weaponState = true
			addEventHandler ("onClientRender", root, weaponCrossDraw)
			addEventHandler( "onClientRender", root, playerTargetCheck )
		else 
			playerNowWeapon = ""
			weaponState = false
			removeEventHandler ("onClientRender", root, weaponCrossDraw)
			removeEventHandler( "onClientRender", root, playerTargetCheck )
		end
	end
	if weapon == 37 then
		if state == "down" then 
			playerNowWeapon = "flame"
			weaponState = true
			addEventHandler ("onClientRender", root, weaponCrossDraw)
			addEventHandler( "onClientRender", root, playerTargetCheck )
		else 
			playerNowWeapon = ""
			weaponState = false
			removeEventHandler ("onClientRender", root, weaponCrossDraw)
			removeEventHandler( "onClientRender", root, playerTargetCheck )
		end
	end
end
bindKey ( "aim_weapon", "both", aimWeapon )

function playerWasted(  )
	playerNowWeapon = ""
	removeEventHandler( "onClientRender", root, playerTargetCheck )
end
addEventHandler( "onClientPlayerWasted", root, playerWasted )

function shopPanelDraw( hitPlayer )
	if getPlayerName( hitPlayer ) == getPlayerName( getLocalPlayer(  ) ) and shopPanelState == false then
		showCursor( true )
		addEventHandler( "onClientRender", root, drawWeapon )
		shopPanelState = true
	end
end
addEventHandler( "onClientMarkerHit", weaponsShop.shopPanel, shopPanelDraw )

function removePanelDraw( hitPlayer )
	if getPlayerName( hitPlayer ) == getPlayerName( getLocalPlayer(  ) ) and shopPanelState == true then
		showCursor( false )
		removeEventHandler( "onClientRender", root, drawWeapon )
		shopPanelState = false
	end
end
addEventHandler( "onClientMarkerLeave", weaponsShop.shopPanel, removePanelDraw )

local sizeX, sizeY = screenWidth - 100, screenHeight - 100
local posY = 0
local recSizeY = 0
local lineSize1Y = 0
local lineSize2Y = 0
local lineSize3Y = 0
local lineSize6Y = 0
local lineSize7Y = 0
local sectionLine1Y = 0
local sectionLine2Y = 0
local sectionLine3Y = 0
local sectionLine4Y = 0
local sectionImgY1 = 0
local sectionImgY2 = 0
local sectionImgY3 = 0
local sectionImgY4 = 0
local recY = 0
weaponName = ""

function weaponBuyDraw( amount, amountTDA, x, y, xRec, yRec, xSize, ySize )
	local cursorX, cursorY =  getCursorPosition(  )
	cursorX = cursorX*screenWidth
	cursorY = cursorY*screenHeight
	dxDrawRectangle( xRec, yRec, xSize, ySize, tocolor( 0, 0, 0, 150 ), true )
	dxDrawText ( "Buy ( #00FF00"..amount.." $ #FFFFFF) or \n#FFB000TDA#FFFFFF//Point ( #FFB000"..amountTDA.. "#FFFFFF ) ", x, y, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1.2, "default-bold", "left", "top", false, false, true, true )
	dxDrawText ( "#FF0000Left#FFFFFF click: Buy #00FF00Money $ #FFFFFF!\n#FF0000Right#FFFFFF click: Buy #FFB000TDA#FFFFFF//Point !", cursorX + 10, cursorY + 10, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 0.8, "default-bold", "left", "top", false, false, true, true )
end


function drawWeapon(  )
	dxDrawRectangle( screenWidth/2 - 768/2, screenHeight/2 - 768/2, 768, 768, tocolor( 31, 31, 31, 255 ), true )

	--1.Satir--
	dxDrawRectangle( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y, tocolor( 255, 255, 255, 150 ), true )
	--2.Satir--
	dxDrawRectangle( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y, tocolor( 255, 255, 255, 150 ), true )
	--3.Satir--
	dxDrawRectangle( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y, tocolor( 255, 255, 255, 150 ), true )
	--4.Satir--
	dxDrawRectangle( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149, tocolor( 255, 255, 255, 150 ), true )
	--5.Satir--
	dxDrawRectangle( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY, tocolor( 255, 255, 255, 150 ), true )
	--6.Satir--
	dxDrawRectangle( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y, tocolor( 255, 255, 255, 150 ), true )
	--7.Satir--
	dxDrawRectangle( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y, tocolor( 255, 255, 255, 150 ), true )
	dxDrawRectangle( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y, tocolor( 255, 255, 255, 150 ), true )
	
	--Pistol--
	dxDrawImageSection( screenWidth/2 - 768/2 + 16 + 15, screenHeight/2 - 768/2 + 168 + posY, 94, -94 + sectionImgY1, 0, 0, 256, -256 + sectionImgY2, 'img/weapons/colt.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Silenced--
	dxDrawImageSection( screenWidth/2 - 768/2 + 149 + 20 + 15, screenHeight/2 - 768/2 + 168 + posY, 94, -94 + sectionImgY1, 0, 0, 256, -256 + sectionImgY2, 'img/weapons/silenced.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Deagle--
	dxDrawImageSection( screenWidth/2 - 768/2 + 149*2 + 24 + 15, screenHeight/2 - 768/2 + 168 + posY, 94, -94 + sectionImgY1, 0, 0, 256, -256 + sectionImgY2, 'img/weapons/deagle.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Shoutgun--
	dxDrawImageSection( screenWidth/2 - 768/2 + 149*3 + 28 + 15, screenHeight/2 - 768/2 + 168 + posY, 94, -94 + sectionImgY1, 0, 0, 256, -256 + sectionImgY2, 'img/weapons/shotgun.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Sawnoff--
	dxDrawImageSection( screenWidth/2 - 768/2 + 149*4 + 32 + 15, screenHeight/2 - 768/2 + 168 + posY, 94, -94 + sectionImgY1, 0, 0, 256, -256 + sectionImgY2, 'img/weapons/sawnoff.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Spaz--	
	dxDrawImageSection( screenWidth/2 - 768/2 + 16 + 15, screenHeight/2 - 768/2 + 149 + 168 + posY, 94, -94 + sectionImgY3, 0, 0, 256, -256 + sectionImgY4, 'img/weapons/spaz.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Uzi--	
	dxDrawImageSection( screenWidth/2 - 768/2 + 149 + 20 + 15, screenHeight/2 - 768/2 + 149 + 168 + posY, 94, -94 + sectionImgY3, 0, 0, 256, -256 + sectionImgY4, 'img/weapons/uzi.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Mp5--	
	dxDrawImageSection( screenWidth/2 - 768/2 + 149*2 + 24 + 15, screenHeight/2 - 768/2 + 149 + 168 + posY, 94, -94 + sectionImgY3, 0, 0, 128, -128 + sectionImgY4, 'img/weapons/mp5.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Tec9--	
	dxDrawImageSection( screenWidth/2 - 768/2 + 149*3 + 28 + 15, screenHeight/2 - 768/2 + 149 + 168 + posY, 94, -94 + sectionImgY3, 0, 0, 256, -256 + sectionImgY4, 'img/weapons/tec9.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--AK47--
	dxDrawImageSection( screenWidth/2 - 768/2 + 149*4 + 32 + 15, screenHeight/2 - 768/2 + 149 + 168 + posY, 94, -94 + sectionImgY3, 0, 0, 256, -256 + sectionImgY4, 'img/weapons/ak47.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--M4--	
	dxDrawImage ( screenWidth/2 - 768/2 + 16 + 15, screenHeight/2 - 768/2 + 149*2 + 76 + posY, 94, 94, 'img/weapons/m4.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--Rifle--	
	dxDrawImage ( screenWidth/2 - 768/2 + 149 + 20 + 15, screenHeight/2 - 768/2 + 149*2 + 76 + posY, 94, 94, 'img/weapons/rifle.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--Sniper--
	dxDrawImage ( screenWidth/2 - 768/2 + 149*2 + 24 + 15, screenHeight/2 - 768/2 + 149*2 + 76 + posY, 94, 94, 'img/weapons/sniper.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--Rocket--
	dxDrawImage ( screenWidth/2 - 768/2 + 149*3 + 28 + 15, screenHeight/2 - 768/2 + 149*2 + 76 + posY, 94, 94, 'img/weapons/rocket.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--RocketHs--
	dxDrawImage ( screenWidth/2 - 768/2 + 149*4 + 46, screenHeight/2 - 768/2 + 149*2 + 76 + posY, 94, 94, 'img/weapons/rockeths.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--Flame--
	dxDrawImage ( screenWidth/2 - 768/2 + 32, screenHeight/2 - 768/2 + 149*3 + 80 + posY, 94, 94, 'img/weapons/flame.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--Minigun--
	dxDrawImage ( screenWidth/2 - 768/2 + 149 + 36, screenHeight/2 - 768/2 + 149*3 + 80 + posY, 94, 94, 'img/weapons/minigun.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--Box--
	dxDrawImage ( screenWidth/2 - 768/2 + 149*2 + 40, screenHeight/2 - 768/2 + 149*3 + 80 + posY, 94, 94, 'img/box.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )

	if checkHover( screenWidth/2 - 768/2, screenHeight/2 - 768/2, 768, 40 ) or checkHover( screenWidth/2 - 768/2, screenHeight/2 + 768/2 - 14, 768, 20 ) then
	else
		if checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) then--Pistol 1
			weaponBuyDraw( 7500, 75, screenWidth/2 - 768/2 + 16, screenHeight/2 - 768/2 + 100 + posY, screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y )

		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) then-- Pistol 2
			weaponBuyDraw( 8500, 85, screenWidth/2 - 768/2 + 149 + 20, screenHeight/2 - 768/2 + 100 + posY, screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) then-- Silenced 1
			weaponBuyDraw( 12000, 120, screenWidth/2 - 768/2 + 149*2 + 24, screenHeight/2 - 768/2 + 100 + posY, screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) then-- Silenced 2
			weaponBuyDraw( 17500, 175, screenWidth/2 - 768/2 + 149*3 + 28, screenHeight/2 - 768/2 + 100 + posY, screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) then-- Deagle 1
			weaponBuyDraw( 20000, 200, screenWidth/2 - 768/2 + 149*4 + 32, screenHeight/2 - 768/2 + 100 + posY, screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) then-- Deagle 2
			weaponBuyDraw( 21000, 210, screenWidth/2 - 768/2 + 16, screenHeight/2 - 768/2 + 149 + 4 + 100 + posY, screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) then-- Shotgun 1
			weaponBuyDraw( 25000, 250, screenWidth/2 - 768/2 + 149 + 20, screenHeight/2 - 768/2 + 149 + 4 + 100 + posY, screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) then-- Shotgun 2
			weaponBuyDraw( 30000, 300, screenWidth/2 - 768/2 + 149*2 + 24, screenHeight/2 - 768/2 + 149 + 4 + 100 + posY, screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) then-- Sawnoff 1
			weaponBuyDraw( 35000, 350, screenWidth/2 - 768/2 + 149*3 + 28, screenHeight/2 - 768/2 + 149 + 4 + 100 + posY, screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) then-- Sawnoff 2
			weaponBuyDraw( 45000, 450, screenWidth/2 - 768/2 + 149*4 + 32, screenHeight/2 - 768/2 + 149 + 4 + 100 + posY, screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) then-- Spaz 1
			weaponBuyDraw( 55000, 550, screenWidth/2 - 768/2 + 16, screenHeight/2 - 768/2 + 149*2 + 8 + 100 + posY, screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) then-- Spaz 2
			weaponBuyDraw( 58000, 580, screenWidth/2 - 768/2 + 149 + 20, screenHeight/2 - 768/2 + 149*2 + 8 + 100 + posY, screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) then-- Uzi 1
			weaponBuyDraw( 65000, 650, screenWidth/2 - 768/2 + 149*2 + 24, screenHeight/2 - 768/2 + 149*2 + 8 + 100 + posY, screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) then-- Uzi 2
			weaponBuyDraw( 95000, 950, screenWidth/2 - 768/2 + 149*3 + 28, screenHeight/2 - 768/2 + 149*2 + 8 + 100 + posY, screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) then-- Mp5 1
			weaponBuyDraw( 100000, 1000, screenWidth/2 - 768/2 + 149*4 + 32, screenHeight/2 - 768/2 + 149*2 + 8 + 100 + posY, screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y )
	
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) then-- Mp5 2
			weaponBuyDraw( 80000, 800, screenWidth/2 - 768/2 + 16, screenHeight/2 - 768/2 + 149*3 + 12 + 100 + posY, screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) then-- Tec9 1
			weaponBuyDraw( 500000, 5000, screenWidth/2 - 768/2 + 149 + 20, screenHeight/2 - 768/2 + 149*3 + 12 + 100 + posY, screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 )
	
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) then-- Tec9 2
			weaponBuyDraw( 50000, 25050000, screenWidth/2 - 768/2 + 149*2 + 24, screenHeight/2 - 768/2 + 149*3 + 12 + 100 + posY, screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 )
		
		end	
	end
	dxDrawRectangle( screenWidth/2 - 768/2, screenHeight/2 - 768/2, 768, 40, tocolor( 255, 176, 0, 255 ), true )
	dxDrawText ( "Turkish Drift Acells", screenWidth/2 - 80, screenHeight/2 - 768/2 + 10, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1.5, "default-bold", "left", "top", false, false, true )
	dxDrawRectangle( screenWidth/2 - 768/2, screenHeight/2 + 768/2 - 14, 768, 20, tocolor( 255, 176, 0, 255 ), true )
	dxDrawImage ( screenWidth/2 - 768/2 + 8, screenHeight/2 - 768/2 + 10, 16, 16, 'img/exit.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	
end

function clickedWeaponPanel( button, state, cX, cY )
	if isCursorShowing() and shopPanelState == true then
		if checkHover( screenWidth/2 - 768/2 + 8, screenHeight/2 - 768/2 + 10, 16, 16 ) and button == "left" and state == "down" and shopPanelState == true then
			showCursor( false )
			removeEventHandler( "onClientRender", root, drawWeapon )
			shopPanelState = false		
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Pistol" )
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Pistol" )
		
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Silenced" )

		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Silenced" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Deagle" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Deagle" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Shotgun" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Shotgun" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Sawnoff" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Sawnoff" )

		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Spaz" )
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Spaz" )

		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Uzi" )
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Uzi" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Mp5" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Mp5" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Tec9" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Tec9" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Ak47" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Ak47" )

		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "M4" )
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "M4" )

		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Rifle" )
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Rifle" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Sniper" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Sniper" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Rocket" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Rocket" )
		
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "RocketHS" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "RocketHS" )

		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Flame" )
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Flame" )

		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Minigun" )
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Minigun" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Box" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "right" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", "Box" )
		end
	end
end
addEventHandler( "onClientClick", root, clickedWeaponPanel )

function weaponBuy( thePlayer, priceType, weapon, value )
	if getLocalPlayer(  ) == thePlayer then
	if priceType == "Money" then
		if weapon == "Pistol" then
			if value < 7500 then
				exports.tda_source:outputNotification( "You don't have enough Money", 2 )
			elseif value >= 7500 then
				weaponName = "pistol"
				triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 7500 )
				triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
				exports.tda_source:outputNotification( "Successful purchase", 1 )
			end
			elseif weapon == "Box" then
				if value < 50000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 50000 then
					shopPanelState = false
					removeEventHandler( "onClientRender", root, drawWeapon )
					startBox( )
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 50000 )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Silenced" then
				if value < 8500 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 8500 then
					weaponName = "silenced"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 8500 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Deagle" then
				if value < 12000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 12000 then
					weaponName = "deagle"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 12000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Shotgun" then
				if value < 17500 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 17500 then
					weaponName = "shotgun"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 17500 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Sawnoff" then
				if value < 20000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 20000 then
					weaponName = "sawnoff"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 20000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Spaz" then
				if value < 21000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 21000 then
					weaponName = "spaz"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 21000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Uzi" then
				if value < 25000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 25000 then
					weaponName = "uzi"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 25000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Mp5" then
				if value < 30000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 30000 then
					weaponName = "mp5"					
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 30000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Tec9" then
				if value < 35000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 35000 then
					weaponName = "tec9"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 35000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Ak47" then
				if value < 45000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 45000 then
					weaponName = "ak47"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 45000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "M4" then
				if value < 55000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 55000 then
					weaponName = "m4"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 55000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Rifle" then
				if value < 58000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 58000 then
					weaponName = "rifle"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 58000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Sniper" then
				if value < 65000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 65000 then
					weaponName = "sniper"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 65000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Rocket" then
				if value < 95000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 95000 then
					weaponName = "rocket"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 95000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "RocketHS" then
				if value < 100000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 100000 then
					weaponName = "rockeths"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 100000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Flame" then
				if value < 80000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 80000 then
					weaponName = "flame"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 80000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Minigun" then
				if value < 500000 then
					exports.tda_source:outputNotification( "You don't have enough Money", 2 )
				elseif value >= 500000 then
					weaponName = "minigun"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "Money", 500000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			end
		elseif priceType == "TDAPoint" then
			if weapon == "Pistol" then
				if value < 75 then
					exports.tda_source:outputNotification( "You don't have enough \nTDA//Point", 2 )
				elseif value >= 75 then
					weaponName = "pistol"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 75 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Box" then
				if value < 250 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 250 then
					shopPanelState = false
					removeEventHandler( "onClientRender", root, drawWeapon )
					startBox( )
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 250 )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Silenced" then
				if value < 85 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 85 then
					weaponName = "silenced"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 85 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Deagle" then
				if value < 120 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 120 then
					weaponName = "deagle"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 120 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Shotgun" then
				if value < 175 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 175 then
					weaponName = "shotgun"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 175 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Sawnoff" then
				if value < 200 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 200 then
					weaponName = "sawnoff"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 200 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Spaz" then
				if value < 210 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 210 then
					weaponName = "spaz"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 210 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Uzi" then
				if value < 250 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 250 then
					weaponName = "uzi"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 250 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Mp5" then
				if value < 300 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 300 then
					weaponName = "mp5"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 300 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Tec9" then
				if value < 350 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 350 then
					weaponName = "tec9"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 350 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Ak47" then
				if value < 450 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 450 then
					weaponName = "ak47"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 450 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "M4" then
				if value < 550 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 550 then
					weaponName = "m4"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 550 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Rifle" then
				if value < 580 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 580 then
					weaponName = "rifle"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 580 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Sniper" then
				if value < 650 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 650 then
					weaponName = "sniper"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 650 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Rocket" then
				if value < 950 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 950 then
					weaponName = "rocket"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 950 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "RocketHS" then
				if value < 1000 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 1000 then
					weaponName = "rockeths"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 1000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Flame" then
				if value < 800 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 800 then
					weaponName = "flame"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 800 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			elseif weapon == "Minigun" then
				if value < 5000 then
					exports.tda_source:outputNotification( "You don't have enough \nTDAPoint", 2 )
				elseif value >= 5000 then
					weaponName = "minigun"
					triggerServerEvent ( "onClientTakePlayerCash", getLocalPlayer(  ), getLocalPlayer(  ), "TDAPoint", 5000 )
					triggerServerEvent ( "onWeaponBuy", root, getLocalPlayer(  ), weaponName )
					exports.tda_source:outputNotification( "Successful purchase", 1 )
				end
			end
		end
	end
end
addEvent( "onClientLoadMoneyWS", true )
addEventHandler( "onClientLoadMoneyWS", root, weaponBuy )

function rectangleDown(  )
	if posY > -360 then
		posY = posY - 40
	end
	if posY >= -40 then
		recSizeY = 40
	end
	if recSizeY >= 40 and posY == -80 then
		lineSize6Y = 36
	elseif recSizeY >= 40 and posY == -120 then
		lineSize6Y = 76
	elseif recSizeY >= 40 and posY == -160 then
		lineSize6Y = 116
	elseif recSizeY >= 40 and posY == -200 then
		lineSize6Y = 149
	end
	if lineSize6Y == 149 and posY == -200 then
		lineSize7Y = 4
	elseif lineSize7Y == 4 and posY == -240 then
		lineSize7Y = 44
	elseif lineSize7Y == 44 and posY == -280 then
		lineSize7Y = 84
	elseif lineSize7Y == 84 and posY == -320 then
		lineSize7Y = 124
	elseif lineSize7Y == 124 and posY == -360 then
		lineSize7Y = 149
		recY = 14
	end
	if posY == -120 then
		sectionLine1Y = 94/2 + 4
		sectionLine2Y = 256/2 + 4
	elseif posY == - 160 then
		sectionLine1Y = 94
		sectionLine2Y = 256
	elseif posY == -240 then
		sectionLine3Y = 94/4 - 4
		sectionLine4Y = 256/4 - 4
	elseif posY == - 280 then
		sectionLine3Y = 94/2 + 12
		sectionLine4Y = 256/2 + 12
	elseif posY == - 320 then
		sectionLine3Y = 94
		sectionLine4Y = 256
	end
	if posY == -80 then
		lineSize1Y = 49
		sectionImgY1 = 8
		sectionImgY2 = 32
	elseif posY == -120 then
		lineSize1Y = 89
		sectionImgY1 = 64
		sectionImgY2 = 128
	elseif posY == -160 then
		lineSize1Y = 129
		sectionImgY1 = 94
		sectionImgY2 = 256
	elseif posY == -200 then
		lineSize1Y = 149
		lineSize2Y = 9
	elseif posY == -240 then
		lineSize2Y = 69
		sectionImgY3 = 32
		sectionImgY4 = 64
	elseif posY == -280 then
		lineSize2Y = 109
		sectionImgY3 = 94
		sectionImgY4 = 256
	elseif posY == - 320 then
		lineSize2Y = 149
	elseif posY == -360 then
		lineSize3Y = 19
	end
end
bindKey("mouse_wheel_down","down",rectangleDown)

function rectangleUp(  )
	if posY ~= 0 then
		posY = posY + 40
	end
	if posY == 0 then
		recSizeY = 0
	end
	if lineSize6Y == 149 and posY == -160 then
		lineSize6Y = 116
	elseif lineSize6Y == 116 and posY == -120 then
		lineSize6Y = 76
	elseif lineSize6Y == 76 and posY == -80 then
		lineSize6Y = 36
	elseif lineSize6Y == 36 and posY == -40 then
		lineSize6Y = 0
	end
	if lineSize7Y == 149 and posY == -320 then
		lineSize7Y = 124
		recY = 0
	elseif lineSize7Y == 124 and posY == -280 then
		lineSize7Y = 84
	elseif lineSize7Y == 84 and posY == -240 then
		lineSize7Y = 44
	elseif lineSize7Y == 44 and posY == -200 then
		lineSize7Y = 4
	elseif lineSize7Y == 4 and posY == -160 then
		lineSize7Y = 0
	end
	if posY == -120 then
		sectionLine1Y = 94/2 + 4
		sectionLine2Y = 256/2 + 4
	elseif posY == - 80 then
		sectionLine1Y = 0
		sectionLine2Y = 0
	elseif posY == -200 then
		sectionLine3Y = 0
		sectionLine4Y = 0
	elseif posY == -240 then
		sectionLine3Y = 94/4 - 4
		sectionLine4Y = 256/4 - 4
	elseif posY == -280 then
		sectionLine3Y = 94/2 + 12
		sectionLine4Y = 256/2 + 12
	end
	if posY == -120 then
		lineSize1Y = 89
		sectionImgY1 = 64
		sectionImgY2 = 128
	elseif posY == -80 then
		lineSize1Y = 49
		sectionImgY1 = 8
		sectionImgY2 = 32
	elseif posY == -40 then
		lineSize1Y = 9
		sectionImgY1 = 0
		sectionImgY2 = 0
	elseif posY == 0 then
		lineSize1Y = 0
	end
	if posY == -240 then
		sectionImgY3 = 32
		sectionImgY4 = 64
	elseif posY == -200 then
		sectionImgY3 = 0
		sectionImgY4 = 0
	end
	if posY == -280 then
		lineSize2Y = 109
	elseif posY == -240 then
		lineSize2Y = 69
	elseif posY == -200 then
		lineSize2Y = 9
	elseif posY == -160 then
		lineSize2Y = 0
	elseif posY == -320 then
		lineSize3Y = 0
	end
end
bindKey("mouse_wheel_up","down",rectangleUp)

local boxAnimValue = 0
local boxAnimTick = 0
local textState
local animState = false
local alpha = 0
local boxImg = "img/box.png"

function drawBox(  )
	dxDrawRectangle( screenWidth/2 - boxAnimValue/2, screenHeight/2 - boxAnimValue/2, boxAnimValue, boxAnimValue, tocolor( 31, 31, 31, 255 ), true )
	dxDrawRectangle( screenWidth/2 - boxAnimValue/2, screenHeight/2 - boxAnimValue/2, boxAnimValue, boxAnimValue/13, tocolor( 255, 176, 0, 255 ), true )
	dxDrawImage ( screenWidth/2 - boxAnimValue/4, screenHeight/2 - boxAnimValue/4, boxAnimValue/2, boxAnimValue/2, 'img/box.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	dxDrawRectangle( screenWidth/2 - boxAnimValue/4, screenHeight/2 - boxAnimValue/4, boxAnimValue/2, boxAnimValue/2, tocolor( 31, 31, 31, alpha ), true )
	dxDrawImage ( screenWidth/2 - boxAnimValue/4, screenHeight/2 - boxAnimValue/4, boxAnimValue/2, boxAnimValue/2, boxImg, 0, 0, 0, tocolor( 255, 255, 255, alpha ), true )
	if textState == false then
		dxDrawText ( "Chance Box", screenWidth/2 - 44, screenHeight/2 - boxAnimValue/2 + 10, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1.2, "default-bold", "left", "top", false, false, true )
	end
end
addEventHandler( "onClientRender", root, drawBox )

function animBox(  )
	if animState == false then
		textState = false
		boxAnimValue = interpolateBetween( 0, 0, 0, 520, 0, 0, getProgress(1200, boxAnimTick), "OutElastic" )
	elseif animState == true then
		textState = true
		boxAnimValue = interpolateBetween( 520, 0, 0, 0, 0, 0, getProgress(1200, boxAnimTick), "OutBounce" )
	end
end

local animWState = false
local wTick = 0

function animWeapon(  )
	if animWState == true then
		alpha = interpolateBetween( 0, 0, 0, 255, 0, 0, getProgress(800, wTick), "OutQuad" )
	elseif animWState == false then
		alpha = interpolateBetween( 255, 0, 0, 0, 0, 0, getProgress(800, wTick), "OutQuad" )
		if alpha == 0 then
			removeEventHandler( "onClientRender", root, animWeapon )
		end
	end
end

randomValue = 0
local weaponName = "none"

function setWeaponNameBox(  )
	if randomValue == 0 then
		weaponName = "none"
	elseif randomValue == 1 then
		knifeValue = math.random( 2 )
		if knifeValue == 1 then
			weaponName = "knife"
			boxImg = "img/weapons/knife.png"
		elseif knifeValue == 2 then
			weaponName = "knife"
			boxImg = "img/weapons/knife.png"
		end
	elseif randomValue >=2 and randomValue <=22 then
		pistolValue = math.random( 2 )
		if pistolValue == 1 then
			weaponName = "pistol"
			boxImg = "img/weapons/colt.png"
		elseif pistolValue == 2 then
			weaponName = "pistol"
			boxImg = "img/weapons/colt.png"
		end
	elseif randomValue >=23 and randomValue <=33 then
		deagleValue = math.random( 2 )
		if deagleValue == 1 then
			weaponName = "deagle"
			boxImg = "img/weapons/deagle.png"
		elseif deagleValue == 2 then
			weaponName = "deagle"
			boxImg = "img/weapons/deagle.png"
		end
	elseif randomValue >=34 and randomValue <=54 then
		silencedValue = math.random( 2 )
		if silencedValue == 1 then
			weaponName = "silenced"
			boxImg = "img/weapons/silenced.png"
		elseif silencedValue == 2 then
			weaponName = "silenced"
			boxImg = "img/weapons/silenced.png"
		end
	elseif randomValue >=55 and randomValue <=65 then
		shotgunValue = math.random( 6 )
		if shotgunValue == 1 then
			weaponName = "shotgun"
			boxImg = "img/weapons/shotgun.png"
		elseif shotgunValue == 2 then
			weaponName = "shotgun"
			boxImg = "img/weapons/shotgun.png"
		elseif shotgunValue == 3 then
			weaponName = "sawnoff"
			boxImg = "img/weapons/sawnoff.png"
		elseif shotgunValue == 4 then
			weaponName = "sawnoff"
			boxImg = "img/weapons/sawnoff.png"
		elseif shotgunValue == 5 then
			weaponName = "spaz"
			boxImg = "img/weapons/spaz.png"
		elseif shotgunValue == 6 then
			weaponName = "spaz"
			boxImg = "img/weapons/spaz.png"
		end
	elseif randomValue >=66 and randomValue <=86 then
		subValue = math.random( 6 )
		if subValue == 1 then
			weaponName = "uzi"
			boxImg = "img/weapons/uzi.png"
		elseif subValue == 2 then
			weaponName = "uzi"
			boxImg = "img/weapons/uzi.png"
		elseif subValue == 3 then
			weaponName = "mp5"
			boxImg = "img/weapons/mp5.png"
		elseif subValue == 4 then
			weaponName = "mp5"
			boxImg = "img/weapons/mp5.png"
		elseif subValue == 5 then
			weaponName = "tec9"
			boxImg = "img/weapons/tec9.png"
		elseif subValue == 6 then
			weaponName = "tec9"
			boxImg = "img/weapons/tec9.png"
		end
	elseif randomValue >=87 and randomValue <=92 then
		assaultValue = math.random( 4 )
		if assaultValue == 1 then
			weaponName = "ak47"
			boxImg = "img/weapons/ak47.png"
		elseif assaultValue == 2 then
			weaponName = "ak47"
			boxImg = "img/weapons/ak47.png"
		elseif assaultValue == 3 then
			weaponName = "m4"
			boxImg = "img/weapons/m4.png"
		elseif assaultValue == 4 then
			weaponName = "m4"
			boxImg = "img/weapons/m4.png"
		end
	elseif randomValue >=93 and randomValue <=98 then
		rifleValue = math.random( 2 )
		if rifleValue == 1 then
			weaponName = "rifle"
			boxImg = "img/weapons/rifle.png"
		elseif rifleValue == 2 then
			weaponName = "rifle"
			boxImg = "img/weapons/rifle.png"
		end
	elseif randomValue == 99 then
		sniperValue = math.random( 2 )
		if sniperValue == 1 then
			weaponName = "sniper"
			boxImg = "img/weapons/sniper.png"
		elseif sniperValue == 2 then
			weaponName = "sniper"
			boxImg = "img/weapons/sniper.png"
		end
	elseif randomValue == 100 then
		heavyValue = math.random ( 8 )
		if heavyValue == 1 then
			weaponName = "rocket"
			boxImg = "img/weapons/rocket.png"
		elseif heavyValue == 2 then
			weaponName = "rocket"
			boxImg = "img/weapons/rocket.png"
		elseif heavyValue == 3 then
			weaponName = "rockeths"
			boxImg = "img/weapons/rockeths.png"
		elseif heavyValue == 4 then
			weaponName = "rockeths"
			boxImg = "img/weapons/rockeths.png"
		elseif heavyValue == 5 then
			weaponName = "flame"
			boxImg = "img/weapons/flame.png"
		elseif heavyValue == 6 then
			weaponName = "flame"
			boxImg = "img/weapons/flame.png"
		elseif heavyValue == 7 then
			weaponName = "minigun"
			boxImg = "img/weapons/minigun.png"
		elseif heavyValue == 8 then
			weaponName = "minigun"
			boxImg = "img/weapons/minigun.png"
		end
	end
end

function startBox(  )
	animState = false
	giveAnimState = true
	boxAnimTick = getTickCount(  )
	addEventHandler( "onClientRender", root, animBox )
	setTimer ( function() 
		randomValue = math.random( 100 )
		setWeaponNameBox(  ) 
		animWState = true 
		wTick = getTickCount(  ) 
		addEventHandler( "onClientRender", root, animWeapon ) 
		localPlayer = getLocalPlayer(  )
		triggerServerEvent ( "onWeaponBuy", root, localPlayer, weaponName )
	end, 6000, 1 )
	setTimer ( function() closeBox(  ) showCursor( false ) end, 15000, 1 )
end

function closeBox(  )
	animState = true
	boxAnimTick = getTickCount(  ) 
	wTick = getTickCount(  )
	addEventHandler( "onClientRender", root, animBox )
	animWState = false
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

function getProgress(ms, tick)
	return (getTickCount() - tick) / ms
end

function renderWeaponModel(  )
	for i=335, 375 do
		if fileExists( "models/"..i..".txd" ) and fileExists( "models/"..i..".dff" ) then
			renderTexture = engineLoadTXD ( "models/"..i..".txd" )
			engineImportTXD ( renderTexture, i )
			renderModel = engineLoadDFF ( "models/"..i..".dff" )
			engineReplaceModel ( renderModel, i )
		end
	end
end
addEventHandler( "onClientResourceStart", resourceRoot, renderWeaponModel )