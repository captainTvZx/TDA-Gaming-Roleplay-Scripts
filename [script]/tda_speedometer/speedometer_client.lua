local screenWidth, screenHeight = guiGetScreenSize(  )

speedSystem = {
	speed = 0,
	nitro = 0,
}

function drawSpeedometer(  )
	if getPedOccupiedVehicle( getLocalPlayer(  ) ) then
		if getVehicleType( getPedOccupiedVehicle( getLocalPlayer(  ) ) ) == "Automobile" or getVehicleType( getPedOccupiedVehicle( getLocalPlayer(  ) ) ) == "Bike" or getVehicleType( getPedOccupiedVehicle( getLocalPlayer(  ) ) ) == "Train" or getVehicleType( getPedOccupiedVehicle( getLocalPlayer(  ) ) ) == "Monster Truck" or getVehicleType( getPedOccupiedVehicle( getLocalPlayer(  ) ) ) == "Quad" then 
			local vehicleX, vehicleY, vehicleZ = getElementVelocity( getPedOccupiedVehicle( getLocalPlayer(  ) ) )
			speedSystem.speed = math.floor( ( ( vehicleX^2 + vehicleY^2 + vehicleZ^2 ) ^ ( 0.5 ) )*195 ) --Calculate speed
			dxDrawImage( screenWidth - 256 - 44, screenHeight - 256 - 28, 256, 256, "img/speedometer.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), false )
			dxDrawImage( screenWidth - 256 - 44, screenHeight - 256 - 28, 256, 256, "img/arrow.png", speedSystem.speed, 0, 0, tocolor( 255, 255, 255, 255 ), false )
   			for upgradeKey, upgradeValue in ipairs ( getVehicleUpgrades ( getPedOccupiedVehicle( getLocalPlayer(  ) ) ) ) do
       			if upgradeValue == 1010 or upgradeValue == 1009 or upgradeValue == 1008 then
       				speedSystem.nitro = getVehicleNitroLevel( getPedOccupiedVehicle( getLocalPlayer(  ) ) )
       				dxDrawRectangle( screenWidth - 38, screenHeight - 274, 32, 212, tocolor( 31, 31, 31, 255 ), true )
       				dxDrawRectangle( screenWidth - 38, screenHeight - 62, 32, -speedSystem.nitro*212, tocolor( 0, 127, 255, 150 ), true )
       				dxDrawImage( screenWidth - 40, screenHeight - 128 - 70, 32, 64, "img/nitrous.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
       			end
    		end
		end
	end
end
addEventHandler( "onClientRender", root, drawSpeedometer )

function showPlayerSpeed( state )
	if state then
		addEventHandler( "onClientRender", root, drawSpeedometer )
	else
		removeEventHandler( "onClientRender", root, drawSpeedometer )
	end
end