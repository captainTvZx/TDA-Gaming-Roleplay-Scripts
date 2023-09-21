vehicleName = {
	[400] = "Ford F-150",
	[402] = "Lykan Hypersport",
	[401] = "Bugatti Veyron S.E",
	[409] = "Dodge Viper S.R.T",
	[410] = "Maserati Ghibli",
	[411] = "Pagani Huayra",
	[415] = "Lamborghini Aventador LP 700-4",
	[421] = "Bugatti Veyron",
	[429] = "Mazda Rx-7",
	[434] = "Chevrolet Camaro SS",
	[436] = "Jaguar C-X75",
	[439] = "Koenigsegg Agera R.S",
	[451] = "Ferrari F12 Berlinetta",
	[467] = "Shelby GT500",
	[470] = "Jeep Wrangler Unlimited Series III",
	[475] = "Ford Mustang Boss 302",
	[480] = "Aston Martin DB9 S.E",
	[489] = "Range Rover Evoque",
	[491] = "Aston Martin DB9",
	[492] = "Porsche Cayenne",
	[494] = "Pagani Zonda Cinque",
	[495] = "Bowler Nemesis",
	[496] = "Ford GT-40",
	[502] = "Audi R8",
	[503] = "BMW Z3 GT4",
	[506] = "McLaren P1",
	[516] = "Shelby GT500",
	[517] = "BMW 4 Series Coupe M",
	[533] = "Corvette C7",
	[534] = "Mercedes SLS",
	[536] = "Dodge Challenger RT426",
	[541] = "Mazda Rx-8",
	[542] = "Dodge Challenger SRT8",
	[545] = "Lexus LFA",
	[549] = "Nissan Skyline R34",
	[551] = "Porsche Cayman",
	[555] = "Toyota Supra",
	[559] = "Lamborghini Sesto Elemento",
	[560] = "Mitsubishi Lancer Evo X",
	[562] = "Honda S2000",
	[565] = "Corvette Grand Sport",
	[567] = "CaddySeries Cadillac",
	[579] = "Dodge Ram 3500 Heavy",
	[587] = "Ferrari 2015",
	[602] = "Prosche GT3 R",
	[603] = "Chevrolet Camaro ZL1",
}

function dxDraw3DText( text, worldX, worldY, worldZ, scale, color, distanceX )
	local playerX, playerY, playerZ = getElementPosition( getLocalPlayer() )
	local distance = getDistanceBetweenPoints3D ( worldX, worldY, worldZ, playerX, playerY, playerZ )
	if distance <= distanceX then
		local screenX, screenY = getScreenFromWorldPosition ( worldX, worldY, worldZ )
		if not screenX then return end
		dxDrawText ( text, screenX, screenY, screenX, screenY, color, scale, "default-bold", "center", "top", false, false, false, true )
	end
end

function drawNameTag(  )
	for index,player in ipairs(getElementsByType("player")) do
		setPlayerNametagShowing (player, false)
		if player ~= getLocalPlayer( ) then
			if getPedOccupiedVehicle(player) then
				if player == getVehicleOccupant( getPedOccupiedVehicle(player) ) then
					local vehicleX, vehicleY, vehicleZ = getElementPosition(getPedOccupiedVehicle(player))
					dxDraw3DText(getPlayerName( player ).."#FFFFFF : #FFB000"..vehicleName[getVehicleModelFromName( getVehicleName( getPedOccupiedVehicle( player ) ) )], vehicleX, vehicleY, vehicleZ + 1, 1.2, tocolor( 255, 255, 255, 255 ), 15)
				end
			else
				local playerX, playerY, playerZ = getElementPosition(player)
				dxDraw3DText(getPlayerName( player ), playerX, playerY, playerZ + 1, 1.2, tocolor( 255, 255, 255, 255 ), 15)
			end
		end
	end
end
addEventHandler( "onClientRender", root, drawNameTag )