local explodeVehicle = {}
local colShape = {}
-- oç anan
addEventHandler( "onVehicleExplode", root, 
function( )
	for i,vehicle in ipairs(getElementsByType("vehicle")) do
		if source == vehicle then
			local colX, colY, colZ = getElementPosition( source )
			colShape[i] = createColTube( colX, colY, colZ, 12, 6 )
			attachElements(colShape[i], source)
			table.insert(explodeVehicle, source)
			setElementData( colShape[i], "colvehicle", source )
		end
	end
end)

addEventHandler( "onColShapeHit", root, 
function( hitElement )
	if getElementType( hitElement ) == "player" then
		if getPedOccupiedVehicle( hitElement ) then
			if getVehicleModelFromName( getVehicleName( getPedOccupiedVehicle( hitElement ) ) ) == 578 then
				toggleControl( hitElement, "enter_exit", false )
				bindKey( hitElement, "f", "down", startTow, source )
			end
		end
	end
end)

function startTow( player, key, keyState, colShape )
	if getVehicleModelFromName( getVehicleName( getPedOccupiedVehicle( player ) ) ) == 578 then
		attachElements(getElementData( colShape, "colvehicle" ), getPedOccupiedVehicle( player ), 0, -1.5, 0.5)
		triggerClientEvent( player, "onClientAttachedElements", player, player, getElementData( colShape, "colvehicle" ) )
		detachElements( colShape )
		destroyElement( colShape )
		unbindKey( player, "f", "down", startTow, source )
		setTimer( function() toggleControl( player, "enter_exit", true ) end, 1000, 1 )
	end
end

function finishTow( player, vehicle )
	destroyElement( vehicle )
	exports.tda_database:givePlayerPrice( player, 15000, "Money" )
	exports.tda_hud:updatePlayerHud( player )
	exports.tda_levels:givePlayerExp( player, 5000 )
	exports.tda_levels:controlPlayerExp( player )
	exports.tda_levels:getPlayerData( player )
end
addEvent( "onFinishedTow", true )
addEventHandler( "onFinishedTow", root, finishTow )

function initTow( player, marker )
	if marker == 1 then

	elseif marker == 2 then
		createVehicle( 578, -1921, 250, 41 )
	elseif marker == 3 then

	end
end
addEvent( "onInitTow", true )
addEventHandler( "onInitTow", root, initTow )