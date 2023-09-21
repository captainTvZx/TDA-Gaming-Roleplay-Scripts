local screenWidth, screenHeight = guiGetScreenSize( )

phone = {
	state = false,
	red = 255,
	green = 255,
	blue = 255,
	alpha = 255,
	bg = {red = 31, green = 31, blue = 31, alpha = 255},
	anim = { tick = 0, posY = 0, _posY = 0, },
	see = 1,
	seeAnim = {[1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0},
	maxSee = 6,
}

spawn  = {
	vehicle = 1,
	maxVehicle = 0,
	state = false,
	nowVehicle = nil,
}

setElementData(getLocalPlayer(  ), "lastlock", nil)

function drawPhone( )
	dxDrawImage(screenWidth - 320, screenHeight - phone.anim.posY, 320, 570, "img/phone.png", 0, 0, 0, tocolor(phone.red, phone.green, phone.blue, phone.alpha), true)
	dxDrawRectangle(screenWidth - 292, screenHeight  - (phone.anim.posY - 58), 264, 454, tocolor(phone.bg.red, phone.bg.green, phone.bg.blue, phone.bg.alpha), false)
	dxDrawImage(screenWidth - 270 - phone.seeAnim[1]/2, screenHeight - (phone.anim.posY - 78) - phone.seeAnim[1]/2, 64 + phone.seeAnim[1], 64 + phone.seeAnim[1], "img/vehicle.png", 0, 0, 0, tocolor(phone.red, phone.green, phone.blue, phone.alpha), true)
	dxDrawImage(screenWidth - 272 + 80 - phone.seeAnim[2]/2, screenHeight - (phone.anim.posY - 78) - phone.seeAnim[2]/2, 64 + phone.seeAnim[2], 64 + phone.seeAnim[2], "img/localication.png", 0, 0, 0, tocolor(phone.red, phone.green, phone.blue, phone.alpha), true)
	dxDrawImage(screenWidth - 272 + 80*2 - phone.seeAnim[3]/2, screenHeight - (phone.anim.posY - 78) - phone.seeAnim[3]/2, 64 + phone.seeAnim[3], 64 + phone.seeAnim[3], "img/message.png", 0, 0, 0, tocolor(phone.red, phone.green, phone.blue, phone.alpha), true)
	dxDrawImage(screenWidth - 270 - phone.seeAnim[4]/2, screenHeight - (phone.anim.posY - 78*2) - phone.seeAnim[4]/2, 64 + phone.seeAnim[4], 64 + phone.seeAnim[4], "img/directory.png", 0, 0, 0, tocolor(phone.red, phone.green, phone.blue, phone.alpha), true)
	dxDrawImage(screenWidth - 270 + 80 - phone.seeAnim[5]/2, screenHeight - (phone.anim.posY - 78*2) - phone.seeAnim[5]/2, 64 + phone.seeAnim[5], 64 + phone.seeAnim[5], "img/user.png", 0, 0, 0, tocolor(phone.red, phone.green, phone.blue, phone.alpha), true)
	dxDrawImage(screenWidth - 270 + 80*2 - phone.seeAnim[6]/2, screenHeight - (phone.anim.posY - 78*2) - phone.seeAnim[6]/2, 64 + phone.seeAnim[6], 64 + phone.seeAnim[6], "img/team.png", 0, 0, 0, tocolor(phone.red, phone.green, phone.blue, phone.alpha), true)
	phone.maxSee = 6
	if getElementData(getLocalPlayer(), "lastlock") ~= nil then
		dxDrawImage(screenWidth - 270 - phone.seeAnim[7]/2, screenHeight - (phone.anim.posY - 78*3) - phone.seeAnim[7]/2, 64 + phone.seeAnim[7], 64 + phone.seeAnim[7], "img/lock.png", 0, 0, 0, tocolor(phone.red, phone.green, phone.blue, phone.alpha), true)
		phone.maxSee = 7
	end
	if getPedOccupiedVehicleSeat(getLocalPlayer(  )) == 0 then
		if getPedOccupiedVehicle(getLocalPlayer(  )) then
			dxDrawImage(screenWidth - 270 - phone.seeAnim[7]/2, screenHeight - (phone.anim.posY - 78*3) - phone.seeAnim[7]/2, 64 + phone.seeAnim[7], 64 + phone.seeAnim[7], "img/lock.png", 0, 0, 0, tocolor(phone.red, phone.green, phone.blue, phone.alpha), true)
			phone.maxSee = 7
		end
		if getPedOccupiedVehicle( getLocalPlayer(  ) ) then
			if getElementData(getPedOccupiedVehicle(getLocalPlayer(  )), "author") == getLocalPlayer(  ) then
				dxDrawImage(screenWidth - 270 + 80 - phone.seeAnim[8]/2, screenHeight - (phone.anim.posY - 78*3) - phone.seeAnim[8]/2, 64 + phone.seeAnim[8], 64 + phone.seeAnim[8], "img/destroy.png", 0, 0, 0, tocolor(phone.red, phone.green, phone.blue, phone.alpha), true)
				phone.maxSee = 8
			end
		end
	end
	if phone.state then
		phone.anim.posY = interpolateBetween( phone.anim._posY, 0, 0, 580, 0, 0, getProgress( 1000, phone.anim.tick ), "OutElastic" )
	elseif not phone.state then
		phone.anim.posY = interpolateBetween( phone.anim._posY, 0, 0, 0, 0, 0, getProgress( 1000, phone.anim.tick ), "OutElastic" )
	end

	if phone.state then
		if phone.see == 1 then
			phone.seeAnim[1] = 8
			phone.seeAnim[2] = 0
			phone.seeAnim[3] = 0
			phone.seeAnim[4] = 0
			phone.seeAnim[5] = 0
			phone.seeAnim[6] = 0
			phone.seeAnim[7] = 0
			phone.seeAnim[8] = 0
		elseif phone.see == 2 then
			phone.seeAnim[1] = 0
			phone.seeAnim[2] = 8
			phone.seeAnim[3] = 0
			phone.seeAnim[4] = 0
			phone.seeAnim[5] = 0
			phone.seeAnim[6] = 0
			phone.seeAnim[7] = 0
			phone.seeAnim[8] = 0
		elseif phone.see == 3 then
			phone.seeAnim[1] = 0
			phone.seeAnim[2] = 0
			phone.seeAnim[3] = 8
			phone.seeAnim[4] = 0
			phone.seeAnim[5] = 0
			phone.seeAnim[6] = 0
			phone.seeAnim[7] = 0
			phone.seeAnim[8] = 0
		elseif phone.see == 4 then
			phone.seeAnim[1] = 0
			phone.seeAnim[2] = 0
			phone.seeAnim[3] = 0
			phone.seeAnim[4] = 8
			phone.seeAnim[5] = 0
			phone.seeAnim[6] = 0
			phone.seeAnim[7] = 0
			phone.seeAnim[8] = 0
		elseif phone.see == 5 then
			phone.seeAnim[1] = 0
			phone.seeAnim[2] = 0
			phone.seeAnim[3] = 0
			phone.seeAnim[4] = 0
			phone.seeAnim[5] = 8
			phone.seeAnim[6] = 0
			phone.seeAnim[7] = 0
			phone.seeAnim[8] = 0
		elseif phone.see == 6 then
			phone.seeAnim[1] = 0
			phone.seeAnim[2] = 0
			phone.seeAnim[3] = 0
			phone.seeAnim[4] = 0
			phone.seeAnim[5] = 0
			phone.seeAnim[6] = 8
			phone.seeAnim[7] = 0
			phone.seeAnim[8] = 0
		elseif phone.see == 7 then
			phone.seeAnim[1] = 0
			phone.seeAnim[2] = 0
			phone.seeAnim[3] = 0
			phone.seeAnim[4] = 0
			phone.seeAnim[5] = 0
			phone.seeAnim[6] = 0
			phone.seeAnim[7] = 8
			phone.seeAnim[8] = 0
		elseif phone.see == 8 then
			phone.seeAnim[1] = 0
			phone.seeAnim[2] = 0
			phone.seeAnim[3] = 0
			phone.seeAnim[4] = 0
			phone.seeAnim[5] = 0
			phone.seeAnim[6] = 0
			phone.seeAnim[7] = 0
			phone.seeAnim[8] = 8
		end
	end
	if spawn.state then
		dxDrawText ( "Press '#FF0000Q#FFFFFF' #FF0000Quit #FFFFFFto world", 0, 0, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, true, true )
		dxDrawText ( "Press '#00FF00Enter#FFFFFF' Spawn #FFB000Vehicle", screenWidth/2 - dxGetTextWidth( "Press 'Enter' Spawn Vehicle", 1.5, "default-bold" )/2, screenHeight - dxGetFontHeight( 1.5, "default-bold" ) - 128, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1.5, "default-bold", "left", "top", false, false, true, true )
	end
end
addEventHandler("onClientRender", root, drawPhone)

function togglePhone( )
	if not phone.state then
		phone.state = true
		phone.anim._posY = phone.anim.posY
		phone.anim.tick = getTickCount(  )
		phone.see = 1
		bindKey("mouse_wheel_up", "down", nextApp)
		bindKey("mouse_wheel_down", "down", prevApp)
		bindKey("enter", "down", selectApp)
		bindKey("mouse1", "down", selectApp)
		unbindKey("arrow_r", "down", nextVeh)
		unbindKey("arrow_l", "down", prevVeh)
		toggleControl( "fire", false )
		toggleControl( "next_weapon", false )
		toggleControl( "previous_weapon", false )
		exports.tda_speedometer:showPlayerSpeed(false)
	elseif phone.state then
		phone.state = false
		phone.anim._posY = phone.anim.posY
		phone.anim.tick = getTickCount(  )
		phone.see = 1
		unbindKey("mouse_wheel_up", "down", nextApp)
		unbindKey("mouse_wheel_down", "down", prevApp)
		unbindKey("enter", "down", selectApp)
		unbindKey("mouse1", "down", selectApp)
		unbindKey("arrow_r", "down", nextVeh)
		unbindKey("arrow_l", "down", prevVeh)
		toggleControl( "fire", true )
		toggleControl( "next_weapon", true )
		toggleControl( "previous_weapon", true )
		exports.tda_speedometer:showPlayerSpeed(true)
	end
end

function showPlayerPhone( state )
	if state then
		bindKey("F1", "down", togglePhone)
	elseif not state then
		unbindKey("F1", "down", togglePhone)
	end
end

for i=1,512 do
	setElementData(getLocalPlayer(  ), "spawnvehicle"..i, nil)
end

function nextApp( )
	if phone.see < phone.maxSee then
		phone.see = phone.see + 1
	end
end

function prevApp( )
	if phone.see ~= 1 then
		phone.see = phone.see - 1
	end
end

function selectApp( )
	if phone.state then
		if phone.see == 1 then
			if not getPedOccupiedVehicle(getLocalPlayer( )) then
				phone.seeAnim[1] = 0
				phone.state = true
				spawn.state = true
				togglePhone( )
				exports.tda_hud:showPlayerHud("all", false)
				triggerServerEvent( "onSavePlayerPos", getLocalPlayer(  ), getLocalPlayer(  ) )
				fadeCamera( false, 1 )
				setTimer( function() 
					triggerServerEvent("onLoadVeh", getLocalPlayer(  ), getLocalPlayer(  ))
					fadeCamera( true, 1 ) 
					setElementDimension(getLocalPlayer(  ), 1)
					setElementPosition(getLocalPlayer(), 2037.5, 1009.4, 10.3)
					setElementFrozen( getLocalPlayer(  ), true )
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
					bindKey("arrow_r", "down", nextVeh)
					bindKey("arrow_l", "down", prevVeh)
					bindKey("enter", "down", selectVeh)
					bindKey("q", "down", quitApp)
					unbindKey("F1", "down", togglePhone)
				end, 1500, 1 )
			elseif getPedOccupiedVehicle(getLocalPlayer( )) then
				exports.tda_source:outputNotification("Please get out of the car", 2)
				phone.seeAnim[1] = 0
			end
		elseif phone.see == 2 then
			exports.tda_source:outputNotification("Applications will be added soon", 2)
			phone.seeAnim[2] = 0
		elseif phone.see == 3 then
			exports.tda_source:outputNotification("Applications will be added soon", 2)
			phone.seeAnim[3] = 0
		elseif phone.see == 4 then
			exports.tda_source:outputNotification("Applications will be added soon", 2)
			phone.seeAnim[4] = 0
		elseif phone.see == 5 then
			exports.tda_source:outputNotification("Applications will be added soon", 2)
			phone.seeAnim[5] = 0
		elseif phone.see == 6 then
			exports.tda_source:outputNotification("Applications will be added soon", 2)
			phone.seeAnim[6] = 0
		elseif phone.see == 7 then
			phone.seeAnim[7] = 0
			if getPedOccupiedVehicle(getLocalPlayer( )) then
				if getPedOccupiedVehicleSeat(getLocalPlayer(  )) == 0 then
					if not getElementData(getPedOccupiedVehicle(getLocalPlayer( )), "lock") then
						triggerServerEvent("onLockVehicle", getLocalPlayer( ), getLocalPlayer( ), true)
						exports.tda_source:outputNotification("Vehicle locked", 2)
					elseif getElementData(getPedOccupiedVehicle(getLocalPlayer( )), "lock") then
						triggerServerEvent("onLockVehicle", getLocalPlayer( ), getLocalPlayer( ), false)
						exports.tda_source:outputNotification("Vehicle unlocked", 2)
					end
				else
					if not getElementData(getElementData(getLocalPlayer(), "lastlock"), "lock") then
						triggerServerEvent("onLockVehicle", getLocalPlayer( ), getLocalPlayer( ), true)
						exports.tda_source:outputNotification("Vehicle locked", 2)
					elseif getElementData(getElementData(getLocalPlayer(), "lastlock"), "lock") then
						triggerServerEvent("onLockVehicle", getLocalPlayer( ), getLocalPlayer( ), false)
						exports.tda_source:outputNotification("Vehicle unlocked", 2)
					end
				end
			else
				if not getElementData(getElementData(getLocalPlayer(), "lastlock"), "lock") then
					triggerServerEvent("onLockVehicle", getLocalPlayer( ), getLocalPlayer( ), true)
					exports.tda_source:outputNotification("Vehicle locked", 2)
				elseif getElementData(getElementData(getLocalPlayer(), "lastlock"), "lock") then
					triggerServerEvent("onLockVehicle", getLocalPlayer( ), getLocalPlayer( ), false)
					exports.tda_source:outputNotification("Vehicle unlocked", 2)
				end
			end
		elseif phone.see == 8 then
			phone.seeAnim[8] = 0
			if getPedOccupiedVehicleSeat(getLocalPlayer(  )) == 0 then
				if getPedOccupiedVehicle( getLocalPlayer(  ) ) then
					if getElementData(getPedOccupiedVehicle(getLocalPlayer(  )), "author") == getLocalPlayer(  ) then
						triggerServerEvent("onDestroyVehicle", getLocalPlayer( ), getLocalPlayer( ), getElementData(getPedOccupiedVehicle(getLocalPlayer( )), "id"))
					end
				end
			end
		end
	end
end

function vehValue(value, vehicle)
	spawn.maxVehicle = value
	setElementData(getLocalPlayer(  ), "vehicle"..value, vehicle )
	if value == 1 then
		for index,vehicle in ipairs(getElementsByType("vehicle")) do
				setElementAlpha( vehicle, 0 )
			end
		spawn.nowVehicle = createVehicle(getElementData( getLocalPlayer(  ), "vehicle1"), 2037.3, 1009.4, 10.5 )
		setElementDimension( spawn.nowVehicle, 1 )
		for index,vehicle in ipairs(getElementsByType("vehicle")) do
			setElementCollidableWith(vehicle, getLocalPlayer(  ), false)
			if getPedOccupiedVehicle( getLocalPlayer(  ) ) then
				setElementCollidableWith(vehicle, getPedOccupiedVehicle( getLocalPlayer(  ) ), false)
			end
		end
		for index,player in ipairs(getElementsByType("player")) do
			setElementAlpha( player, 0 )
		end
		for index,player in ipairs(getElementsByType("player")) do
			setElementCollidableWith(player, getLocalPlayer(  ), false)
		end
	end
end
addEvent("onClientLoadVeh", true)
addEventHandler("onClientLoadVeh", root, vehValue)

function nextVeh( )
	if spawn.state then
		if spawn.vehicle < spawn.maxVehicle then
			spawn.vehicle = spawn.vehicle + 1
			if spawn.nowVehicle ~= nil then
				destroyElement( spawn.nowVehicle )
			end
			for index,vehicle in ipairs(getElementsByType("vehicle")) do
				setElementAlpha( vehicle, 0 )
			end
			spawn.nowVehicle = createVehicle(getElementData( getLocalPlayer(  ), "vehicle"..spawn.vehicle), 2037.3, 1009.4, 10.5 )
			setElementDimension( spawn.nowVehicle, 1 )
			for index,vehicle in ipairs(getElementsByType("vehicle")) do
				setElementCollidableWith(vehicle, getLocalPlayer(  ), false)
				if getPedOccupiedVehicle( getLocalPlayer(  ) ) then
					setElementCollidableWith(vehicle, getPedOccupiedVehicle( getLocalPlayer(  ) ), false)
				end
			end
			for index,player in ipairs(getElementsByType("player")) do
				setElementAlpha( player, 0 )
			end
			for index,player in ipairs(getElementsByType("player")) do
				setElementCollidableWith(player, getLocalPlayer(  ), false)
			end
		end
	end
end

function prevVeh( )
	if spawn.state then
		if spawn.vehicle ~= 1 then
			spawn.vehicle = spawn.vehicle - 1
			if spawn.nowVehicle ~= nil then
				destroyElement( spawn.nowVehicle )
			end
			for index,vehicle in ipairs(getElementsByType("vehicle")) do
				setElementAlpha( vehicle, 0 )
			end
			spawn.nowVehicle = createVehicle(getElementData( getLocalPlayer(  ), "vehicle"..spawn.vehicle), 2037.3, 1009.4, 10.5 )
			setElementDimension( spawn.nowVehicle, 1 )
			for index,vehicle in ipairs(getElementsByType("vehicle")) do
				setElementCollidableWith(vehicle, getLocalPlayer(  ), false)
				if getPedOccupiedVehicle( getLocalPlayer(  ) ) then
					setElementCollidableWith(vehicle, getPedOccupiedVehicle( getLocalPlayer(  ) ), false)
				end
			end
			for index,player in ipairs(getElementsByType("player")) do
				setElementAlpha( player, 0 )
			end
			for index,player in ipairs(getElementsByType("player")) do
				setElementCollidableWith(player, getLocalPlayer(  ), false)
			end
		end
	end
end

function selectVeh()
	if spawn.state then
		triggerServerEvent( "onSpawnVehicle", getLocalPlayer(  ), getLocalPlayer(  ), spawn.vehicle )
	end
end

blip = {}

function spawnPlayerVehicle(player, vehicle, id)
	blip[id] = createBlipAttachedTo(vehicle, 51, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer( ))
	setElementData(vehicle, "id", id)
	setElementData(vehicle, "blip", blip[id])
	setElementData(vehicle, "author", player)
	addEventHandler("onClientVehicleEnter", vehicle, function(thePlayer, seat) if seat == 0 and getElementData(source, "author") == thePlayer then destroyElement(getElementData(source, "blip")) end end)
	addEventHandler("onClientVehicleExit", vehicle, function(thePlayer, seat) if seat == 0 and getElementData(source, "author") == thePlayer then blip[getElementData(source, "id")] = createBlipAttachedTo(source, 51, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer) setElementData(source, "blip", blip[getElementData(source, "id")]) end end)
	addEventHandler("onClientVehicleExplode", vehicle, function() setElementData(getLocalPlayer( ), "spawnvehicle"..getElementData(source, "id"), nil) destroyElement(getElementData(source, "blip")) end)
	spawn.state = false
	fadeCamera( false, 1 )
	setTimer( function() 
		fadeCamera( true, 1 ) 
		setElementFrozen( getLocalPlayer(  ), false )
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
		toggleControl( "next_weapon", true )
		toggleControl( "previous_weapon", true )
		setCameraViewMode( 3 )
		toggleControl( "change_camera", true )
		unbindKey("arrow_r", "down", nextVeh)
		unbindKey("arrow_l", "down", prevVeh)
		unbindKey("enter", "down", selectVeh)
		unbindKey("q", "down", quitApp)
		bindKey("F1", "down", togglePhone)
		exports.tda_hud:showPlayerHud("all", true)
		spawn.vehicle = 1
		spawn.maxVehicle = 0
		if spawn.nowVehicle ~= nil then
			destroyElement( spawn.nowVehicle )
		end
		for index,vehicle in ipairs(getElementsByType("vehicle")) do
			setElementAlpha( vehicle, 255 )
		end
		for index,vehicle in ipairs(getElementsByType("vehicle")) do
			setElementCollidableWith(vehicle, getLocalPlayer(  ), true)
			if getPedOccupiedVehicle( getLocalPlayer(  ) ) then
				setElementCollidableWith(vehicle, getPedOccupiedVehicle( getLocalPlayer(  ) ), true)
			end
		end
		for index,player in ipairs(getElementsByType("player")) do
			setElementAlpha( player, 255 )
		end
		for index,player in ipairs(getElementsByType("player")) do
			setElementCollidableWith(player, getLocalPlayer(  ), true)
		end
	end, 1500, 1 )
end
addEvent("onClientSpawnVehicle", true)
addEventHandler("onClientSpawnVehicle", root, spawnPlayerVehicle)

function warnApp(state)
	if state == 0 then
		exports.tda_source:outputNotification("This vehicle is already in the world", 2)
		if spawn.state then
			fadeCamera( false, 1 )
			setTimer( function() 
				fadeCamera( true, 1 ) 
				setElementFrozen( getLocalPlayer(  ), false )
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
				unbindKey("arrow_r", "down", nextVeh)
				unbindKey("arrow_l", "down", prevVeh)
				unbindKey("enter", "down", selectVeh)
				unbindKey("q", "down", quitApp)
				toggleControl( "next_weapon", true )
				toggleControl( "previous_weapon", true )
				bindKey("F1", "down", togglePhone)
				spawn.vehicle = 1
				spawn.maxVehicle = 0
				exports.tda_hud:showPlayerHud("all", true)
				if spawn.nowVehicle ~= nil then
					destroyElement( spawn.nowVehicle )
				end
				for index,vehicle in ipairs(getElementsByType("vehicle")) do
					setElementAlpha( vehicle, 255 )
				end
				for index,vehicle in ipairs(getElementsByType("vehicle")) do
					setElementCollidableWith(vehicle, getLocalPlayer(  ), true)
					if getPedOccupiedVehicle( getLocalPlayer(  ) ) then
						setElementCollidableWith(vehicle, getPedOccupiedVehicle( getLocalPlayer(  ) ), true)
					end
				end
				for index,player in ipairs(getElementsByType("player")) do
					setElementAlpha( player, 255 )
				end
				for index,player in ipairs(getElementsByType("player")) do
					setElementCollidableWith(player, getLocalPlayer(  ), true)
				end
				triggerServerEvent( "onSetPlayerPos", getLocalPlayer(  ), getLocalPlayer(  ) )
				spawn.state = false
			end, 1500, 1 )
		end
	elseif state == 1 then
		exports.tda_source:outputNotification("Destroy Vehicle", 2)
	end
end
addEvent("onWarnVehicleSpawn", true)
addEventHandler("onWarnVehicleSpawn", root, warnApp)

function quitApp( )
	if spawn.state then
		spawn.state = false
		fadeCamera( false, 1 )
		setTimer( function() 
			fadeCamera( true, 1 ) 
			setElementFrozen( getLocalPlayer(  ), false )
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
			unbindKey("arrow_r", "down", nextVeh)
			unbindKey("arrow_l", "down", prevVeh)
			unbindKey("enter", "down", selectVeh)
			unbindKey("q", "down", quitApp)
			toggleControl( "next_weapon", true )
			toggleControl( "previous_weapon", true )
			bindKey("F1", "down", togglePhone)
			spawn.vehicle = 1
			spawn.maxVehicle = 0
			exports.tda_hud:showPlayerHud("all", true)
			if spawn.nowVehicle ~= nil then
				destroyElement( spawn.nowVehicle )
			end
			for index,vehicle in ipairs(getElementsByType("vehicle")) do
				setElementAlpha( vehicle, 255 )
			end
			for index,vehicle in ipairs(getElementsByType("vehicle")) do
				setElementCollidableWith(vehicle, getLocalPlayer(  ), true)
				if getPedOccupiedVehicle( getLocalPlayer(  ) ) then
					setElementCollidableWith(vehicle, getPedOccupiedVehicle( getLocalPlayer(  ) ), true)
				end
			end
			for index,player in ipairs(getElementsByType("player")) do
				setElementAlpha( player, 255 )
			end
			for index,player in ipairs(getElementsByType("player")) do
				setElementCollidableWith(player, getLocalPlayer(  ), true)
			end
			triggerServerEvent( "onSetPlayerPos", getLocalPlayer(  ), getLocalPlayer(  ) )
		end, 1500, 1 )
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

addEventHandler("onClientVehicleExplode", root, function() if source == getElementData(getLocalPlayer( ), "lastlock") then setElementData(getLocalPlayer( ), "lastlock", nil) end end)