addEvent( "onPlayerEnterShop", true )
addEvent( "onPlayerExitShop", true )
playerXs = 0
playerYs = 0
playerZs = 0
shopPanelState = 0
function enterTeleport ( hitPlayer, playerX, playerY, playerZ )
	playerXs = playerX
	playerYs = playerY
	playerZs = playerZ
	if isPedInVehicle( hitPlayer ) == false then
		fadeCamera( hitPlayer, false )
		setTimer ( function() fadeCamera( hitPlayer, true ) end, 2000, 1 )
		setTimer ( function() setElementInterior( hitPlayer, 4 ) setElementPosition( hitPlayer, 286, -84, 1002 ) setElementRotation( hitPlayer, 0, 0, 0 ) end, 1000, 1 )
	else
		outputChatBox( "#FFFFFFPlease #FFB000exit #FFFFFFthe #FFB000vehicle #FFFFFF!", hitPlayer, 255, 255, 255, true )
	end
end
addEventHandler( "onPlayerEnterShop", resourceRoot, enterTeleport )

function exitTeleport ( hitPlayer, warnMarkerState )
	if isPedInVehicle( hitPlayer ) == false then
		fadeCamera( hitPlayer, false )
		setTimer ( function() fadeCamera( hitPlayer, true ) end, 2000, 1 )
		setTimer ( function() setElementInterior( hitPlayer, 0 ) if warnMarkerState == true then setElementPosition( hitPlayer, playerXs - 5, playerYs, playerZs ) else setElementPosition( hitPlayer, playerXs + 5, playerYs, playerZs ) end setElementRotation( hitPlayer, 0, 0, 0 ) end, 1000, 1 )
	else
		outputChatBox( "#FFFFFFPlease #FFB000exit #FFFFFFthe #FFB000vehicle #FFFFFF!", hitPlayer, 255, 255, 255, true )
	end
end
addEventHandler( "onPlayerExitShop", resourceRoot, exitTeleport )

function onPlayerWeaponBuy ( localPlayer, weaponName )
	if weaponName == "knife" then
		giveWeapon( localPlayer, 4, 1, true )
		setAccountData( getPlayerAccount( localPlayer ), "Knifes", 1 )
	elseif weaponName == "pistol" then
		giveWeapon( localPlayer, 22, 50, true )
		setAccountData( getPlayerAccount( localPlayer ), "Silenced", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Deagle", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Pistol", getPedTotalAmmo( localPlayer, 2 ) )
	elseif weaponName == "deagle" then
		giveWeapon( localPlayer, 24, 28, true )
		setAccountData( getPlayerAccount( localPlayer ), "Silenced", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Pistol", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Deagle", getPedTotalAmmo( localPlayer, 2 ) )
	elseif weaponName == "silenced" then
		giveWeapon( localPlayer, 23, 50, true )
		setAccountData( getPlayerAccount( localPlayer ), "Pistol", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Deagle", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Silenced", getPedTotalAmmo( localPlayer, 2 ) )
	elseif weaponName == "shotgun" then
		giveWeapon( localPlayer, 25, 24, true )
		setAccountData( getPlayerAccount( localPlayer ), "Spaz", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Sawnoff", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Shotgun", getPedTotalAmmo( localPlayer, 3 ) )
	elseif weaponName == "sawnoff" then
		giveWeapon( localPlayer, 26, 24, true )
		setAccountData( getPlayerAccount( localPlayer ), "Spaz", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Shotgun", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Sawnoff", getPedTotalAmmo( localPlayer, 3 ) )
	elseif weaponName == "spaz" then
		giveWeapon( localPlayer, 27, 24, true )
		setAccountData( getPlayerAccount( localPlayer ), "Sawnoff", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Shotgun", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Spaz", getPedTotalAmmo( localPlayer, 3 ) )
	elseif weaponName == "uzi" then
		giveWeapon( localPlayer, 28, 80, true )
		setAccountData( getPlayerAccount( localPlayer ), "Mp5", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Tec9", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Uzi", getPedTotalAmmo( localPlayer, 4 ) )
	elseif weaponName == "mp5" then
		giveWeapon( localPlayer, 29, 80, true )
		setAccountData( getPlayerAccount( localPlayer ), "Uzi", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Tec9", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Mp5", getPedTotalAmmo( localPlayer, 4 ) )
	elseif weaponName == "tec9" then
		giveWeapon( localPlayer, 32, 80, true )
		setAccountData( getPlayerAccount( localPlayer ), "Uzi", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Mp5", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Tec9", getPedTotalAmmo( localPlayer, 4 ) )
	elseif weaponName == "ak47" then
		giveWeapon( localPlayer, 30, 100, true )
		setAccountData( getPlayerAccount( localPlayer ), "M4", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Ak47", getPedTotalAmmo( localPlayer, 5 ) )
	elseif weaponName == "m4" then
		giveWeapon( localPlayer, 31, 100, true )
		setAccountData( getPlayerAccount( localPlayer ), "Ak47", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "M4", getPedTotalAmmo( localPlayer, 5 ) )
	elseif weaponName == "rifle" then
		giveWeapon( localPlayer, 33, 40, true )
		setAccountData( getPlayerAccount( localPlayer ), "Sniper", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Rifle", getPedTotalAmmo( localPlayer, 6 ) )
	elseif weaponName == "sniper" then
		giveWeapon( localPlayer, 34, 40, true )
		setAccountData( getPlayerAccount( localPlayer ), "Rifle", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Sniper", getPedTotalAmmo( localPlayer, 6 ) )
	elseif weaponName == "rocket" then
		giveWeapon( localPlayer, 35, 5, true )
		setAccountData( getPlayerAccount( localPlayer ), "RocketHS", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Minigun", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Flame", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Rocket", getPedTotalAmmo( localPlayer, 7 ) )
	elseif weaponName == "rockeths" then
		giveWeapon( localPlayer, 36, 5, true )
		setAccountData( getPlayerAccount( localPlayer ), "Rocket", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Minigun", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Flame", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "RocketHS", getPedTotalAmmo( localPlayer, 7 ) )
	elseif weaponName == "flame" then
		giveWeapon( localPlayer, 37, 200, true )
		setAccountData( getPlayerAccount( localPlayer ), "Rocket", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Minigun", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "RocketHS", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Flame", getPedTotalAmmo( localPlayer, 7 ) )
	elseif weaponName == "minigun" then
		giveWeapon( localPlayer, 38, 500, true )
		setAccountData( getPlayerAccount( localPlayer ), "Rocket", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Flame", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "RocketHS", 0 )
		setAccountData( getPlayerAccount( localPlayer ), "Minigun", getPedTotalAmmo( localPlayer, 7 ) )
	end
end
addEvent( "onWeaponBuy", true )
addEventHandler( "onWeaponBuy", root, onPlayerWeaponBuy )

function setPlayerWeapon(  )
	if getAccountName( getPlayerAccount( source ) ) ~= "guest" then
		if getAccountData( getPlayerAccount( source ), "Knifes" ) ~= 0 then
			giveWeapon( source, 4, getAccountData( getPlayerAccount( source ), "Knifes" ), false )
		end
		if getAccountData( getPlayerAccount( source ), "Pistol" ) ~= 0 then
			giveWeapon( source, 22, getAccountData( getPlayerAccount( source ), "Pistol" ), false )
		elseif getAccountData( getPlayerAccount( source ), "Silenced" ) ~= 0 then
			giveWeapon( source, 23, getAccountData( getPlayerAccount( source ), "Silenced" ), false )
		elseif getAccountData( getPlayerAccount( source ), "Deagle" ) ~= 0 then
			giveWeapon( source, 24, getAccountData( getPlayerAccount( source ), "Deagle" ), false )
		end
		if getAccountData( getPlayerAccount( source ), "Shotgun" ) ~= 0 then
			giveWeapon( source, 25, getAccountData( getPlayerAccount( source ), "Shotgun" ), false )
		elseif getAccountData( getPlayerAccount( source ), "Sawnoff" ) ~= 0 then
			giveWeapon( source, 26, getAccountData( getPlayerAccount( source ), "Sawnoff" ), false )
		elseif getAccountData( getPlayerAccount( source ), "Spaz" ) ~= 0 then
			giveWeapon( source, 27, getAccountData( getPlayerAccount( source ), "Spaz" ), false )
		end
		if getAccountData( getPlayerAccount( source ), "Uzi" ) ~= 0 then
			giveWeapon( source, 28, getAccountData( getPlayerAccount( source ), "Uzi" ), false )
		elseif getAccountData( getPlayerAccount( source ), "Mp5" ) ~= 0 then
			giveWeapon( source, 29, getAccountData( getPlayerAccount( source ), "Mp5" ), false )
		elseif getAccountData( getPlayerAccount( source ), "Tec9" ) ~= 0 then
			giveWeapon( source, 32, getAccountData( getPlayerAccount( source ), "Tec9" ), false )
		end
		if getAccountData( getPlayerAccount( source ), "Ak47" ) ~= 0 then
			giveWeapon( source, 30, getAccountData( getPlayerAccount( source ), "Ak47" ), false )
		elseif getAccountData( getPlayerAccount( source ), "M4" ) ~= 0 then
			giveWeapon( source, 31, getAccountData( getPlayerAccount( source ), "M4" ), false )
		end
		if getAccountData( getPlayerAccount( source ), "Rifle" ) ~= 0 then
			giveWeapon( source, 33, getAccountData( getPlayerAccount( source ), "Rifle" ), false )
		elseif getAccountData( getPlayerAccount( source ), "Sniper" ) ~= 0 then
			giveWeapon( source, 34, getAccountData( getPlayerAccount( source ), "Sniper" ), false )
		end
		if getAccountData( getPlayerAccount( source ), "Rocket" ) ~= 0 then
			giveWeapon( source, 35, getAccountData( getPlayerAccount( source ), "Rocket" ), false )
		elseif getAccountData( getPlayerAccount( source ), "RocketHS" ) ~= 0 then
			giveWeapon( source, 36, getAccountData( getPlayerAccount( source ), "RocketHS" ), false )
		elseif getAccountData( getPlayerAccount( source ), "Flame" ) ~= 0 then
			giveWeapon( source, 37, getAccountData( getPlayerAccount( source ), "Flame" ), false )
		elseif getAccountData( getPlayerAccount( source ), "Minigun" ) ~= 0 then
			giveWeapon( source, 38, getAccountData( getPlayerAccount( source ), "Minigun" ), false )
		end
	end
end
addEventHandler( "onPlayerSpawn", root, setPlayerWeapon )

function savePlayerWeapon(  )
	if getPedWeapon( source, 1 ) == 4 then
		if getPedTotalAmmo( source, 1 ) ~= 0 then
			setAccountData( getPlayerAccount( source ), "Knifes", getPedTotalAmmo( source, 1 ) )
		end
	end
	if getPedTotalAmmo( source, 2 ) ~= 0 then
		if getPedWeapon( source, 2 ) == 22 then
			setAccountData( getPlayerAccount( source ), "Pistol", getPedTotalAmmo( source, 2 ) )
		elseif getPedWeapon( source, 2 ) == 23 then
			setAccountData( getPlayerAccount( source ), "Silenced", getPedTotalAmmo( source, 2 ) )
		elseif getPedWeapon( source, 2 ) == 24 then
			setAccountData( getPlayerAccount( source ), "Deagle", getPedTotalAmmo( source, 2 ) )
		end
	end
	if getPedTotalAmmo( source, 3 ) ~= 0 then
		if getPedWeapon( source, 3 ) == 25 then
			setAccountData( getPlayerAccount( source ), "Shotgun", getPedTotalAmmo( source, 3 ) )
		elseif getPedWeapon( source, 3 ) == 26 then
			setAccountData( getPlayerAccount( source ), "Sawnoff", getPedTotalAmmo( source, 3 ) )
		elseif getPedWeapon( source, 3 ) == 27 then
			setAccountData( getPlayerAccount( source ), "Spaz", getPedTotalAmmo( source, 3 ) )
		end
	end
	if getPedTotalAmmo( source, 4 ) ~= 0 then
		if getPedWeapon( source, 4 ) == 28 then
			setAccountData( getPlayerAccount( source ), "Uzi", getPedTotalAmmo( source, 4 ) )
		elseif getPedWeapon( source, 4 ) == 29 then
			setAccountData( getPlayerAccount( source ), "Mp5", getPedTotalAmmo( source, 4 ) )
		elseif getPedWeapon( source, 4 ) == 32 then
			setAccountData( getPlayerAccount( source ), "Tec9", getPedTotalAmmo( source, 4 ) )
		end
	end
	if getPedTotalAmmo( source, 5 ) ~= 0 then
		if getPedWeapon( source, 5 ) == 30 then
			setAccountData( getPlayerAccount( source ), "Ak47", getPedTotalAmmo( source, 5 ) )
		elseif getPedWeapon( source, 5 ) == 31 then
			setAccountData( getPlayerAccount( source ), "M4", getPedTotalAmmo( source, 5 ) )
		end
	end
	if getPedTotalAmmo( source, 6 ) ~= 0 then
		if getPedWeapon( source, 6 ) == 33 then
			setAccountData( getPlayerAccount( source ), "Rifle", getPedTotalAmmo( source, 6 ) )
		elseif getPedWeapon( source, 6 ) == 34 then
			setAccountData( getPlayerAccount( source ), "Sniper", getPedTotalAmmo( source, 6 ) )
		end
	end
	if getPedTotalAmmo( source, 7 ) ~= 0 then
		if getPedWeapon( source, 7 ) == 35 then
			setAccountData( getPlayerAccount( source ), "Rocket", getPedTotalAmmo( source, 7 ) )
		elseif getPedWeapon( source, 7 ) == 36 then
			setAccountData( getPlayerAccount( source ), "RocketHS", getPedTotalAmmo( source, 7 ) )
		elseif getPedWeapon( source, 7 ) == 37 then
			setAccountData( getPlayerAccount( source ), "Flame", getPedTotalAmmo( source, 7 ) )
		elseif getPedWeapon( source, 7 ) == 38 then
			setAccountData( getPlayerAccount( source ), "Minigun", getPedTotalAmmo( source, 7 ) )
		end
	end
end
addEventHandler( "onPlayerWasted", root, savePlayerWeapon )
addEventHandler( "onPlayerQuit", root, savePlayerWeapon )

function getLoadMoneyWS( player, cashtype, item )
	if cashtype == "Money" then
		triggerClientEvent( player, "onClientLoadMoneyWS", player, player, cashtype, item, getAccountData( getPlayerAccount( player ), "Money" ) )
	elseif cashtype == "TDAPoint" then
		triggerClientEvent( player, "onClientLoadMoneyWS", player, player, cashtype, item, getAccountData( getPlayerAccount( player ), "TDAPoint" ) )
	end
end
addEvent( "onLoadMoneyWS", true )
addEventHandler( "onLoadMoneyWS", root, getLoadMoneyWS )

function takePlayerCash( player, cashtype, value )
	if cashtype == "Money" then
		setAccountData( getPlayerAccount( player ), "Money", getAccountData( getPlayerAccount( player ), "Money" ) - value )
	elseif cashtype == "TDAPoint" then
		setAccountData( getPlayerAccount( player ), "TDAPoint", getAccountData( getPlayerAccount( player ), "TDAPoint" ) - value )
	end
end
addEvent( "onClientTakePlayerCash", true )
addEventHandler( "onClientTakePlayerCash", root, takePlayerCash )

function test( cmd )
	setAccountData( getPlayerAccount( cmd ), "Money", 9000000 )
	setAccountData( getPlayerAccount( cmd ), "TDAPoint", 200000 )
end
addCommandHandler( "cash", test )

--[[	--Pistol--
	dxDrawImageSection( screenWidth/2 - 768/2 + 16 + 15, screenHeight/2 - 768/2 + 168 + posY, 94, -94 + sectionImgY1, 0, 0, 256, -256 + sectionImgY2, 'img/weapons/firstpack/colt.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--dxDrawImageSection( screenWidth/2 - 768/2 + 149 + 20 + 15, screenHeight/2 - 768/2 + 168 + posY, 94, -94 + sectionImgY1, 0, 0, 256, -256 + sectionImgY2, 'img/weapons/secondpack/colt.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Silenced--
	dxDrawImageSection( screenWidth/2 - 768/2 + 149*2 + 24 + 15, screenHeight/2 - 768/2 + 168 + posY, 94, -94 + sectionImgY1, 0, 0, 256, -256 + sectionImgY2, 'img/weapons/firstpack/silenced.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--dxDrawImageSection( screenWidth/2 - 768/2 + 149*3 + 28 + 15, screenHeight/2 - 768/2 + 168 + posY, 94, -94 + sectionImgY1, 0, 0, 256, -256 + sectionImgY2, 'img/weapons/secondpack/silenced.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Deagle--
	--dxDrawImageSection( screenWidth/2 - 768/2 + 149*4 + 32 + 15, screenHeight/2 - 768/2 + 168 + posY, 94, -94 + sectionImgY1, 0, 0, 256, -256 + sectionImgY2, 'img/weapons/firstpack/deagle.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	dxDrawImageSection( screenWidth/2 - 768/2 + 16 + 15, screenHeight/2 - 768/2 + 149 + 168 + posY, 94, -94 + sectionImgY3, 0, 0, 256, -256 + sectionImgY4, 'img/weapons/secondpack/deagle.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Shoutgun--
	--dxDrawImageSection( screenWidth/2 - 768/2 + 149 + 20 + 15, screenHeight/2 - 768/2 + 149 + 168 + posY, 94, -94 + sectionImgY3, 0, 0, 256, -256 + sectionImgY4, 'img/weapons/firstpack/shotgun.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	dxDrawImageSection( screenWidth/2 - 768/2 + 149*2 + 24 + 15, screenHeight/2 - 768/2 + 149 + 168 + posY, 94, -94 + sectionImgY3, 0, 0, 256, -256 + sectionImgY4, 'img/weapons/secondpack/shotgun.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Sawnoff--
	dxDrawImageSection( screenWidth/2 - 768/2 + 149*3 + 28 + 15, screenHeight/2 - 768/2 + 149 + 168 + posY, 94, -94 + sectionImgY3, 0, 0, 256, -256 + sectionImgY4, 'img/weapons/firstpack/sawnoff.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--dxDrawImageSection( screenWidth/2 - 768/2 + 149*4 + 32 + 15, screenHeight/2 - 768/2 + 149 + 168 + posY, 94, -94 + sectionImgY3, 0, 0, 256, -256 + sectionImgY4, 'img/weapons/secondpack/sawnoff.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true )
	--Spaz--	
	dxDrawImage ( screenWidth/2 - 768/2 + 16 + 15, screenHeight/2 - 768/2 + 149*2 + 76 + posY, 94, 94, 'img/weapons/firstpack/spaz.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--dxDrawImage ( screenWidth/2 - 768/2 + 149 + 20 + 15, screenHeight/2 - 768/2 + 149*2 + 76 + posY, 94, 94, 'img/weapons/secondpack/spaz.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--Uzi--	
	--dxDrawImage ( screenWidth/2 - 768/2 + 149*2 + 8, screenHeight/2 - 768/2 + 149*2 + 76 + posY, 168, 94, 'img/weapons/firstpack/uzi.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	dxDrawImage ( screenWidth/2 - 768/2 + 149*3 + 28 + 15, screenHeight/2 - 768/2 + 149*2 + 76 + posY, 94, 94, 'img/weapons/secondpack/uzi.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--Mp5--	
	--dxDrawImage ( screenWidth/2 - 768/2 + 149*4 + 46, screenHeight/2 - 768/2 + 149*2 + 76 + posY, 94, 94, 'img/weapons/firstpack/mp5.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	dxDrawImage ( screenWidth/2 - 768/2 + 32, screenHeight/2 - 768/2 + 149*3 + 80 + posY, 94, 94, 'img/weapons/secondpack/mp5.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--Tec9--	
	--dxDrawImage ( screenWidth/2 - 768/2 + 149 + 36, screenHeight/2 - 768/2 + 149*3 + 80 + 15 + posY, 94, 64, 'img/weapons/firstpack/tec9.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	dxDrawImage ( screenWidth/2 - 768/2 + 149*2 + 40, screenHeight/2 - 768/2 + 149*3 + 80 + posY, 94, 94, 'img/weapons/secondpack/tec9.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--AK47--	
	dxDrawImage ( screenWidth/2 - 768/2 + 149*3 + 44, screenHeight/2 - 768/2 + 149*3 + 80 + posY, 94, 94, 'img/weapons/firstpack/ak47.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--dxDrawImage ( screenWidth/2 - 768/2 + 149*4 + 48, screenHeight/2 - 768/2 + 149*3 + 80 + posY, 94, 94, 'img/weapons/secondpack/ak47.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--M4--	
	--dxDrawImage ( screenWidth/2 - 768/2 + 32, screenHeight/2 - 768/2 + 149*4 + 84 + posY, 94, 94, 'img/weapons/firstpack/m4.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	dxDrawImage ( screenWidth/2 - 768/2 + 149 + 36, screenHeight/2 - 768/2 + 149*4 + 88 + posY, 94, 94, 'img/weapons/secondpack/m4.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--Rifle--	
	dxDrawImage ( screenWidth/2 - 768/2 + 149*2 + 40, screenHeight/2 - 768/2 + 149*4 + 84 + posY, 94, 94, 'img/weapons/firstpack/rifle.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--dxDrawImage ( screenWidth/2 - 768/2 + 149*3 + 44 - 20, screenHeight/2 - 768/2 + 149*4 + 88 + posY, 128, 94, 'img/weapons/secondpack/rifle.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	--Sniper--
	--dxDrawImage ( screenWidth/2 - 768/2 + 149*4 + 48, screenHeight/2 - 768/2 + 149*4 + 84 + posY, 94, 94, 'img/weapons/firstpack/sniper.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
	dxDrawImageSection(screenWidth/2 - 768/2 + 32, screenHeight/2 - 768/2 + 149*5 + 88 + posY, 94, sectionLine1Y, 0, 0, 256, sectionLine2Y, 'img/weapons/secondpack/sniper.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true)
	--Rocket--
	dxDrawImageSection(screenWidth/2 - 768/2 + 149 + 36, screenHeight/2 - 768/2 + 149*5 + 88 + posY, 94, sectionLine1Y, 0, 0, 256, sectionLine2Y, 'img/weapons/firstpack/rocket.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true)
	--dxDrawImageSection(screenWidth/2 - 768/2 + 149*2 + 40, screenHeight/2 - 768/2 + 149*5 + 88 + posY, 94, sectionLine1Y, 0, 0, 256, sectionLine2Y, 'img/weapons/secondpack/rocket.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true)
	--RocketHs--
	dxDrawImageSection(screenWidth/2 - 768/2 + 149*3 + 44, screenHeight/2 - 768/2 + 149*5 + 88 + posY, 94, sectionLine1Y, 0, 0, 256, sectionLine2Y, 'img/weapons/firstpack/rockeths.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true)
	--dxDrawImageSection(screenWidth/2 - 768/2 + 149*4 + 48, screenHeight/2 - 768/2 + 149*5 + 88 + posY, 94, sectionLine1Y, 0, 0, 256, sectionLine2Y, 'img/weapons/secondpack/rockeths.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true)
	--Flame--
	dxDrawImageSection(screenWidth/2 - 768/2 + 32, screenHeight/2 - 768/2 + 149*6 + 92 + posY, 94, sectionLine3Y, 0, 0, 256, sectionLine4Y, 'img/weapons/firstpack/flame.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true)
	--dxDrawImageSection(screenWidth/2 - 768/2 + 149 + 36, screenHeight/2 - 768/2 + 149*6 + 92 + posY, 94, sectionLine3Y, 0, 0, 256, sectionLine4Y, 'img/weapons/secondpack/flame.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true)
	--Minigun--
	--dxDrawImageSection(screenWidth/2 - 768/2 + 149*2 + 40, screenHeight/2 - 768/2 + 149*6 + 92 + posY, 94, sectionLine3Y, 0, 0, 256, sectionLine4Y, 'img/weapons/firstpack/minigun.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true)
	dxDrawImageSection(screenWidth/2 - 768/2 + 149*3 + 44, screenHeight/2 - 768/2 + 149*6 + 92 + posY, 94, sectionLine3Y, 0, 0, 256, sectionLine4Y, 'img/weapons/secondpack/minigun.png', 0, 0, 0,tocolor( 255, 255, 255, 255 ), true)
	--Box--
	dxDrawImageSection(screenWidth/2 - 768/2 + 149*4 + 48, screenHeight/2 - 768/2 + 149*6 + 92 + posY, 94, sectionLine3Y, 0, 0, 256, sectionLine4Y, 'img/box.png', 0, 0, 0, tocolor( 255, 255, 255, 255 ), true)]]









	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------













--[[elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y ) and button == "left" and state == "down" and shopPanelState == true then
			triggerServerEvent( "onLoadMoneyWS", getLocalPlayer(  ), getLocalPlayer(  ), "Money", "Box" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Box", "TDAPoint" )
		
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Pistol-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Pistol-1", "TDAPoint" )
		
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Pistol-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Pistol-2", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Silenced-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Silenced-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Silenced-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Silenced-2", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Deagle-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 44 + posY + lineSize1Y, 149, 149 - lineSize1Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Deagle-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Deagle-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Deagle-2", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Shotgun-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Shotgun-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Shotgun-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Shotgun-2", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Sawnoff-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Sawnoff-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Sawnoff-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149 + 48 + posY + lineSize2Y, 149, 149 - lineSize2Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Sawnoff-2", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Spaz-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Spaz-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Spaz-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Spaz-2", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Uzi-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Uzi-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Uzi-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Uzi-2", "TDAPoint" )
		
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Mp5-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*2 + 52 + posY + lineSize3Y, 149, 149 - lineSize3Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Mp5-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Mp5-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Mp5-2", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Tec9-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Tec9-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Tec9-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Tec9-2", "TDAPoint" )
		
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Ak47-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Ak47-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Ak47-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*3 + 56 + posY, 149, 149 ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Ak47-2", "TDAPoint" )
		
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "M4-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "M4-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "M4-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "M4-2", "TDAPoint" )
		
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Rifle-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Rifle-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Rifle-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Rifle-2", "TDAPoint" )
		
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Sniper-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*4 + 60 + posY, 149, 109 + recSizeY ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Sniper-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Sniper-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Sniper-2", "TDAPoint" )
		
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Rocket-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Rocket-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Rocket-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Rocket-2", "TDAPoint" )
		
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "RocketHS-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "RocketHS-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "RocketHS-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*4 + 20, screenHeight/2 - 768/2 + 149*5 + 64 + posY, 149, lineSize6Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "RocketHS-2", "TDAPoint" )
	
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Flame-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 4, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Flame-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Flame-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149 + 8, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Flame-2", "TDAPoint" )
		
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Minigun-1", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*2 + 12, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Minigun-1", "TDAPoint" )

		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y ) and button == "left" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "Money", "Minigun-2", "Money" )
		elseif checkHover( screenWidth/2 - 768/2 + 149*3 + 16, screenHeight/2 - 768/2 + 149*6 + 68 + posY, 149, lineSize7Y ) and button == "right" and state == "down" and shopPanelState == true then
			exports.tda_database:getClientPlayerPrice( getLocalPlayer(  ), "TDAPoint", "Minigun-2", "TDAPoint" )]]