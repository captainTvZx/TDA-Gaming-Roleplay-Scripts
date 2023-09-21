toggleControl( "enter_exit", true )
setDevelopmentMode( true )
local screenWidth, screenHeight = guiGetScreenSize(  )

local towSystem = {
	colShape = { 
	[1] = createColCuboid( 2756, -2483, 10, 10.3, 60, 8 ),
	[2] = createColCuboid( 1617, 2183.2, 9, 61, 40, 8 ),
	[3] = createColCuboid( -1925, 277.6, 39, 15.4, 32.1, 8 ),
	},
	colBlip = {},
	state = true,
	ped = {
	[1] = createPed( 268, 2767, -2422, 13, 90 ),
	[2] = createPed( 268, 1663.5, 2200, 10.8, 180 ),
	[3] = createPed( 268, -1908.9, 277, 41, 180 ),
	},
	marker = {
	[1] = createMarker( 2767, -2422, 12, "cylinder", 3, 255, 255, 255, 25, getLocalPlayer(  ) ),
	[2] = createMarker( 1663.5, 2200, 10, "cylinder", 3, 255, 255, 255, 25, getLocalPlayer(  ) ),
	[3] = createMarker( -1908.9, 277, 40, "cylinder", 3, 255, 255, 255, 25, getLocalPlayer(  ) ),
	},
	blip = {
	[1] = createBlip( 2767, -2422, 13, 58, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer(  ) ),
	[2] = createBlip( 1663.5, 2200, 10.8, 58, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer(  ) ),
	[3] = createBlip( -1908.9, 277, 41, 58, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer(  ) ),
	},
	button = {
	[1] = createElement( "button" ),
	[2] = createElement( "button" ),W
	},
	markerState = false,
	markerNumber = 0,
}

function godPed(  )
	setElementHealth( towSystem.ped[1], 100 )
	setElementFrozen( towSystem.ped[1], true )
	setElementHealth( towSystem.ped[2], 100 )
	setElementFrozen( towSystem.ped[2], true )
	if towSystem.markerState == false then
		dxDraw3DText( "#FFB000Tow #00FF00Job", 2767, -2422, 14.7, 1.2, tocolor( 255, 255, 255, 255 ), 14 )
		dxDraw3DText( "#FFB000Tow #00FF00Job", 1663.5, 2200, 11.9, 1.2, tocolor( 255, 255, 255, 255 ), 14 )
		dxDraw3DText( "#FFB000Tow #00FF00Job", -1908.9, 277, 42.1, 1.2, tocolor( 255, 255, 255, 255 ), 14 )
	else
		dxDraw3DText( "Press '#FFB000F#FFFFFF' to #FF0000start #00FF00job", 2767, -2422, 14.7, 1.2, tocolor( 255, 255, 255, 255 ), 14 )
		dxDraw3DText( "Press '#FFB000F#FFFFFF' to #FF0000start #00FF00job", 1663.5, 2200, 11.9, 1.2, tocolor( 255, 255, 255, 255 ), 14 )
		dxDraw3DText( "Press '#FFB000F#FFFFFF' to #FF0000start #00FF00job", -1908.9, 277, 42.1, 1.2, tocolor( 255, 255, 255, 255 ), 14 )
	end
end
addEventHandler( "onClientRender", root, godPed )

function joinMarker( hitElement )
	if hitElement == getLocalPlayer(  ) then
		towSystem.markerState = true
		if source == towSystem.marker[1] then
			towSystem.markerNumber = 1
		elseif source == towSystem.marker[2] then
			towSystem.markerNumber = 2
		elseif source == towSystem.marker[3] then
			towSystem.markerNumber = 2
		end
		bindKey( "f", "down", initTow, towSystem.markerNumber )
	end
end
addEventHandler( "onClientMarkerHit", towSystem.marker[1], joinMarker )
addEventHandler( "onClientMarkerHit", towSystem.marker[2], joinMarker )
addEventHandler( "onClientMarkerHit", towSystem.marker[3], joinMarker )

function leaveMarker( hitElement )
	if hitElement == getLocalPlayer(  ) then
		towSystem.markerState = false
		unbindKey( "f", "down", initTow )
	end
end
addEventHandler( "onClientMarkerLeave", towSystem.marker[1], leaveMarker )
addEventHandler( "onClientMarkerLeave", towSystem.marker[2], leaveMarker )
addEventHandler( "onClientMarkerLeave", towSystem.marker[3], leaveMarker )

function initTow( key, keyState, marker )
	if towSystem.markerState == true then
		triggerServerEvent("onInitTow", getLocalPlayer(  ), getLocalPlayer(  ), marker)
		unbindKey( "f", "down", initTow )
	end
end


function attahedElements( player, attachvehicle )
	setElementData( player, "towedvehicle", attachvehicle )
	towSystem.colBlip[1] = createBlip( 2760, -2453, 13, 41, 2, 255, 0, 0, 255, 0, 99999.0, player )
	towSystem.colBlip[2] = createBlip( 1645, 2200, 10, 41, 2, 255, 0, 0, 255, 0, 99999.0, player )
	towSystem.colBlip[3] = createBlip( -1917, 291.5, 10, 41, 2, 255, 0, 0, 255, 0, 99999.0, player )
end
addEvent( "onClientAttachedElements", true )
addEventHandler( "onClientAttachedElements", root, attahedElements )

function finishTow( hitElement )
	if hitElement == getLocalPlayer(  ) then
		if getElementType( hitElement ) == "player" then
			if getPedOccupiedVehicle( hitElement ) then
				if getVehicleModelFromName( getVehicleName( getPedOccupiedVehicle( hitElement ) ) ) == 578 then
					if towSystem.state == true then
						destroyElement( towSystem.colBlip[1] )
						destroyElement( towSystem.colBlip[2] )
						destroyElement( towSystem.colBlip[3] )
						triggerServerEvent( "onFinishedTow", hitElement, hitElement, getElementData( hitElement, "towedvehicle" ) )
						exports.tda_source:outputNotification( "Vehicles were delivered. Again after 5 min.", 1 )
						towSystem.state = false
						setTimer( function() towSystem.state = true exports.tda_source:outputNotification( "New vehicle can delivered", 2 ) end, 35000, 1 )
					else
						exports.tda_source:outputNotification( "Try again in 5 minutes.", 2 )
					end
				end
			end
		end
	end
end
addEventHandler( "onClientColShapeHit", towSystem.colShape[1], finishTow )
addEventHandler( "onClientColShapeHit", towSystem.colShape[2], finishTow )
addEventHandler( "onClientColShapeHit", towSystem.colShape[3], finishTow )

function dxDraw3DText( text, worldX, worldY, worldZ, scale, color, distanceX )
	local playerX, playerY, playerZ = getElementPosition( getLocalPlayer() )
	local distance = getDistanceBetweenPoints3D ( worldX, worldY, worldZ, playerX, playerY, playerZ )
	if distance <= distanceX then
		local screenX, screenY = getScreenFromWorldPosition ( worldX, worldY, worldZ )
		if not screenX then return end
		dxDrawText ( text, screenX, screenY, screenX, screenY, color, scale, "default-bold", "center", "top", false, false, false, true )
	end
end