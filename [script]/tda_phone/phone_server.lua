vehicle = {}
local id = 0
function loadVeh( player )
	for i=1,512 do
		if getAccountData( getPlayerAccount( player ), "vehicle"..i ) ~= 0 then
			triggerClientEvent(player, "onClientLoadVeh", player, i, getAccountData( getPlayerAccount( player ), "vehicle"..i ))
		end
	end
end
addEvent("onLoadVeh", true)
addEventHandler("onLoadVeh", root, loadVeh)

function savePlayerPos( player )
	local x, y, z = getElementPosition( player )
	setElementData(player, "posX", x)
	setElementData(player, "posY", y)
	setElementData(player, "posZ", z)
end
addEvent("onSavePlayerPos", true)
addEventHandler("onSavePlayerPos", root, savePlayerPos)

function setPos( player )
	setElementPosition(player, getElementData(player, "posX"), getElementData(player, "posY"), getElementData(player, "posZ"))
	setElementDimension(player, 0 )
end
addEvent("onSetPlayerPos", true)
addEventHandler("onSetPlayerPos", root, setPos)

function spawnPlayerVehicle( player, i )
	id = id + 1
	local x, y ,z = getElementData(player, "posX"), getElementData(player, "posY"), getElementData(player, "posZ")
	if getElementData(player, "spawnvehicle"..i) == nil then
		vehicle[id] = createVehicle( getAccountData(getPlayerAccount(player), "vehicle"..i), x + 2.5, y, z + 1 )
		setVehicleColor(vehicle[id], getAccountData( getPlayerAccount( player ), "vehicle"..i.."red" ), getAccountData( getPlayerAccount( player ), "vehicle"..i.."green" ), getAccountData( getPlayerAccount( player ), "vehicle"..i.."blue" ), getAccountData( getPlayerAccount( player ), "vehicle"..i.."red2" ), getAccountData( getPlayerAccount( player ), "vehicle"..i.."green2" ), getAccountData( getPlayerAccount( player ), "vehicle"..i.."blue2" ) )
		setVehicleHeadLightColor(vehicle[id], getAccountData( getPlayerAccount( player ), "vehicle"..i.."lightr" ), getAccountData( getPlayerAccount( player ), "vehicle"..i.."lightg" ), getAccountData( getPlayerAccount( player ), "vehicle"..i.."lightb" ) )
		addVehicleUpgrade(vehicle[id], getAccountData( getPlayerAccount( player ), "vehicle"..i.."wheel" ) )
		setElementData(player, "spawnvehicle"..i, vehicle[id] )
		setVehicleLocked(vehicle[id], false)
		setElementData(vehicle[id], "lock", false)
		triggerClientEvent(player, "onClientSpawnVehicle", player, player, getElementData(player, "spawnvehicle"..i), i)
	elseif getElementData(player, "spawnvehicle"..i) ~= nil then
		triggerClientEvent(player, "onWarnVehicleSpawn", player, 0)
	end
	setTimer( function() 
		setElementPosition(player, x, y ,z)
		setElementDimension(player, 0 )
	end, 1500, 1 )
end
addEvent("onSpawnVehicle", true)
addEventHandler("onSpawnVehicle", root, spawnPlayerVehicle)

function lockVehicle(player, state)
	if getPedOccupiedVehicle(player) and getPedOccupiedVehicleSeat(player) == 0 then
		setElementData(player, "lastlock", getPedOccupiedVehicle(player))
	end
	setVehicleLocked(getElementData(player, "lastlock"), state)
	setElementData(getElementData(player, "lastlock"), "lock", state)
end
addEvent("onLockVehicle", true)
addEventHandler("onLockVehicle", root, lockVehicle)

function destroyVehicle(player, id)
	if getElementData(player, "spawnvehicle"..getElementData(getPedOccupiedVehicle(player), "id")) == getElementData(player, "lastlock") then
		setElementData(player, "lastlock", nil)
	end
	setElementData(getPedOccupiedVehicle(player), "blip", nil)
	setElementData(getPedOccupiedVehicle(player), "author", nil)
	destroyElement(getElementData(player, "spawnvehicle"..id))
	setElementData(player, "spawnvehicle"..id, nil)
	triggerClientEvent(player, "onWarnVehicleSpawn", player, 1)
end
addEvent("onDestroyVehicle", true)
addEventHandler("onDestroyVehicle", root, destroyVehicle)