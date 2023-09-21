local screenWidth, screenHeight = guiGetScreenSize(  )
camera = {
	state = false,
	moveValue = 1,
	blur = 0,
	blurTick = 0,
	blurElement = nil,
	pos = { [1] = 285, [2] = 1485, [3] = 40 },
	look = { [1] = 200, [2] = 1400, [3] = 10 },
	fov = 70,
	tick = 0,
}

function startLogin(  )
	showChat( false )
	showCursor( true )
	setPlayerHudComponentVisible( "all", false )
	exports.tda_hud:showPlayerHud("all", false)
	exports.tda_phone:showPlayerPhone( false )
	exports.tda_radio:showPlayerRadio( false )
	exports.tda_levels:showPlayerLevel( false )
	exports.tda_scoreboard:showPlayerScoreboard( false )
	fadeCamera( false )
	fadeCamera( true, 5 )
	camera.state = true
	camera.tick = getTickCount(  )
	camera.blurTick = getTickCount(  )
	addEventHandler( "onClientRender", root, cameraAnimation )
	addEventHandler( "onClientRender", root, cameraControl )
	camera.blurElement = exports.tda_source:createGuassianBlur( 0, 0, screenWidth, screenHeight, 255, 255, 255, 255, 3, 3, camera.blur, false )
	panel.clickState = 1
	panel.state = true
	panel.animTick = getTickCount(  )
	addEventHandler( "onClientRender", root, drawLogin )
	addEventHandler( "onClientRender", root, animLogin )
	addEventHandler( "onClientRender", root, drawError )
end
addEventHandler( "onClientResourceStart", resourceRoot, startLogin )

function cameraAnimation(  )
	if camera.state == true then
		camera.blur = interpolateBetween( 0, 0, 0, 3, 0, 0, getProgress( 5000, camera.blurTick ), "Linear" )
		exports.tda_source:setBlurIntensity( camera.blur )
		if camera.moveValue == 1 then
			if camera.pos[1] >= 100 then
				camera.pos[1] = interpolateBetween( 285, 0, 0, 100, 0, 0, getProgress( 80000, camera.tick ), "OutQuad" )
				if camera.pos[1] <= 120 then
					fadeCamera( false, 18 )
				end
			end
		elseif camera.moveValue == 2 then
			fadeCamera( true, 5 )
			camera.pos[1] = interpolateBetween( 270, 0, 0, 259, 0, 0, getProgress( 10000, camera.tick ), "OutQuad" )
			camera.pos[2] = interpolateBetween( 1455, 0, 0, 1405, 0, 0, getProgress( 10000, camera.tick ), "OutQuad" )
			camera.look[3] = interpolateBetween( 10, 0, 0, 15, 0, 0, getProgress( 10000, camera.tick ), "OutQuad" )
			if camera.pos[1] <= 262 then
				fadeCamera( false, 3 )
			end
		elseif camera.moveValue == 3 then
			fadeCamera( true, 5 )
			camera.pos[1] = interpolateBetween( 235, 0, 0, 190, 0, 0, getProgress( 15000, camera.tick ), "OutQuad" )
			if camera.pos[1] <= 210 then
				fadeCamera( false, 8 )
			end
		elseif camera.moveValue == 4 then
			fadeCamera( true, 5 )
			camera.pos[1] = interpolateBetween( 235, 0, 0, 145, 0, 0, getProgress( 35000, camera.tick ), "OutQuad" )
			if camera.pos[1] <= 150 then
				fadeCamera( false, 5 )
			end
		elseif camera.moveValue == 5 then
			fadeCamera( true, 5 )
			camera.pos[1] = interpolateBetween( 180, 0, 0, 120, 0, 0, getProgress( 10000, camera.tick ), "Linear" )
			camera.pos[2] = interpolateBetween( 1430, 0, 0, 1480, 0, 0, getProgress( 10000, camera.tick ), "Linear" )
			camera.pos[3] = interpolateBetween( 30, 0, 0, 15, 0, 0, getProgress( 10000, camera.tick ), "Linear" )
			camera.look[1] = interpolateBetween( 135, 0, 0, 200, 0, 0, getProgress( 10000, camera.tick ), "Linear" )
			camera.look[2] = interpolateBetween( 1395, 0, 0, 1350, 0, 0, getProgress( 10000, camera.tick ), "Linear" )
			camera.look[3] = interpolateBetween( 10, 0, 0, 20, 0, 0, getProgress( 10000, camera.tick ), "Linear" )
			if camera.pos[1] <= 130 then
				fadeCamera( false, 1 )
			end
		elseif camera.moveValue == 6 then
			fadeCamera( true, 5 )
			camera.pos[1] = interpolateBetween( -230, 0, 0, -150, 0, 0, getProgress( 90000, camera.tick ), "Linear" )
			camera.pos[2] = interpolateBetween( 1543, 0, 0, 1250, 0, 0, getProgress( 90000, camera.tick ), "Linear" )
			camera.pos[3] = interpolateBetween( 80, 0, 0, 100, 0, 0, getProgress( 90000, camera.tick ), "Linear" )
			camera.look[1] = interpolateBetween( -352, 0, 0, -320, 0, 0, getProgress( 90000, camera.tick ), "Linear" )
			camera.look[2] = interpolateBetween( 1335, 0, 0, 1440, 0, 0, getProgress( 90000, camera.tick ), "Linear" )
			camera.look[3] = interpolateBetween( 90, 0, 0, 60, 0, 0, getProgress( 90000, camera.tick ), "Linear" )
			if camera.pos[1] >= -165 then
				fadeCamera( false, 18 )
			end
		elseif camera.moveValue == 7 then
			fadeCamera( true, 15 )
		end
		setCameraMatrix( camera.pos[1], camera.pos[2], camera.pos[3], camera.look[1], camera.look[2], camera.look[3], 0, camera.fov )
	end
end

function cameraControl(  )
	if camera.state == true then
		if camera.moveValue == 1 then
			if camera.pos[1] == 100 then
				camera.pos[1], camera.pos[2], camera.pos[3] = 270, 1455, 18
				camera.look[1], camera.look[2], camera.look[3] = 259, 1405, 10
				camera.tick = getTickCount(  )
				camera.fov = 70
				camera.moveValue = 2
			end
		elseif camera.moveValue == 2 then
			if camera.pos[1] == 259 and camera.pos[2] == 1405 and camera.look[3] == 15 then
				camera.pos[1], camera.pos[2], camera.pos[3] = 235, 1380, 11
				camera.look[1], camera.look[2], camera.look[3] = 190, 1382, 17
				camera.tick = getTickCount(  )
				camera.fov = 70
				camera.moveValue = 3
			end
		elseif camera.moveValue == 3 then
			if camera.pos[1] == 190 then
				camera.pos[1], camera.pos[2], camera.pos[3] = 235, 1355, 30
				camera.look[1], camera.look[2], camera.look[3] = 200, 1405, 10
				camera.tick = getTickCount(  )
				camera.fov = 70
				camera.moveValue = 4
			end
		elseif camera.moveValue == 4 then
			if camera.pos[1] == 145 then
				camera.pos[1], camera.pos[2], camera.pos[3] = 185, 1430, 30
				camera.look[1], camera.look[2], camera.look[3] = 135, 1395, 10
				camera.tick = getTickCount(  )
				camera.fov = 70
				camera.moveValue = 5
			end
		elseif camera.moveValue == 5 then
			if camera.pos[1] == 120 and camera.pos[2] == 1480 and camera.pos[3] == 15 then
				camera.pos[1], camera.pos[2], camera.pos[3] = -230, 1543, 80
				camera.look[1], camera.look[2], camera.look[3] = -352, 1335, 90
				camera.tick = getTickCount(  )
				camera.fov = 70
				camera.moveValue = 6
			end
		elseif camera.moveValue == 6 then
			if camera.pos[1] == -150 and camera.pos[2] == 1250 and camera.pos[3] == 100 then
				camera.pos[1], camera.pos[2], camera.pos[3] = 420, -2045, 30
				camera.look[1], camera.look[2], camera.look[3] = 270, -1840, 30
				camera.fov = 94
				camera.moveValue = 7
			end
		end
	end
end

panel = {
	state = true,
	editBox = {
		[1] = createElement( "edit" ),
		[2] = createElement( "edit" ),
		[3] = createElement( "edit" ),
	},
	button ={
		[1] = createElement( "button" ),
		[2] = createElement( "button" ),
	},
	clickState = 0,
	animTick = 0,
	pos = {
		[1] = 0,
		[2] = 0,
		[3] = 0,
		[4] = 0,
		[5] = 0,
		[6] = 0,
	},
	alpha = {
		[1] = 255,
		[2] = 255,
		[3] = 0,
		[4] = 0,
		[5] = 0,
		[6] = 0,
		[7] = 0,
	},
	request = {
		[1] = false,
		[2] = false,
		[3] = false,
	},
	color = { 
		[1] = { [1] = 0, [2] = 0, [3] = 0 },
		[2] = { [1] = 0, [2] = 0, [3] = 0 },
		[3] = { [1] = 0, [2] = 0, [3] = 0 },
	},
	time = { },
	banned = { },
	bannedButton = createElement( "button" ),
}

function drawLogin(  )
	if panel.state == true then
		dxDrawImage( screenWidth/2 - panel.pos[1]/2, screenHeight/2 - 134 - panel.pos[2]/2, panel.pos[1], panel.pos[2], "img/logo.png", 0, 0, 0, tocolor( 255, 255, 255, panel.alpha[1] ), true )
		dxDrawText ( "Welcome To #FFBB00Turkish Drift Acells", screenWidth, screenHeight/2 - 70, 0, 0, tocolor ( 255, 255, 255, panel.alpha[2] ), panel.pos[3], "default-bold", "center", "top", false, false, true, true )
		exports.tda_source:dxDrawEdit( screenWidth/2 - 258 - panel.pos[4], screenHeight/2 - 50, 256, 40, panel.alpha[4], "Username", panel.editBox[1], false, true )
		exports.tda_source:dxDrawEdit( screenWidth/2 - panel.pos[5], screenHeight/2 - 50, 256, 40, panel.alpha[5], "Password", panel.editBox[2], true, true )	
		exports.tda_source:dxDrawEdit( screenWidth/2 + 130, screenHeight/2 - 50, 256, 40, panel.alpha[3], "Re-Password", panel.editBox[3], true, true )
		exports.tda_source:dxDrawButton("Login", screenWidth/2 - 258, screenHeight/2 - 8, 255, 40, panel.button[1], tocolor( 255, 176, 0, panel.alpha[6] ), true)
		exports.tda_source:dxDrawButton("Register", screenWidth/2, screenHeight/2 - 8, 255, 40, panel.button[2], tocolor( 255, 176, 0, panel.alpha[7] ), true)
	end
end

function animLogin(  )
	if panel.state == true then
		if panel.clickState == 1 then
			panel.pos[1] = interpolateBetween( 0, 0, 0, 378, 0, 0, getProgress( 1200, panel.animTick ), "OutElastic" )
			panel.pos[2] = interpolateBetween( 0, 0, 0, 213, 0, 0, getProgress( 1200, panel.animTick ), "OutElastic" )
			panel.pos[3] = interpolateBetween( 0, 0, 0, 1.4, 0, 0, getProgress( 1200, panel.animTick ), "OutElastic" )
			panel.alpha[1] = interpolateBetween( 0, 0, 0, 255, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			panel.alpha[2] = interpolateBetween( 0, 0, 0, 255, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			panel.alpha[4] = interpolateBetween( 0, 0, 0, 1, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			panel.alpha[5] = interpolateBetween( 0, 0, 0, 1, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			panel.alpha[6] = interpolateBetween( 0, 0, 0, 255, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			panel.alpha[7] = interpolateBetween( 0, 0, 0, 255, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
		elseif panel.clickState == 2 then
			panel.alpha[3] = interpolateBetween( 0, 0, 0, 1, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			panel.pos[4] = interpolateBetween( 0, 0, 0, 128, 0, 0, getProgress( 1200, panel.animTick ), "OutBack" )
			panel.pos[5] = interpolateBetween( 0, 0, 0, 128, 0, 0, getProgress( 1200, panel.animTick ), "OutBack" )
		elseif panel.clickState == 3 then
			panel.alpha[3] = interpolateBetween( 1, 0, 0, 0, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			panel.pos[4] = interpolateBetween( 128, 0, 0, 0, 0, 0, getProgress( 1200, panel.animTick ), "InElastic" )
			panel.pos[5] = interpolateBetween( 128, 0, 0, 0, 0, 0, getProgress( 1200, panel.animTick ), "InElastic" )
		elseif panel.clickState == 4 then
			panel.alpha[1] = interpolateBetween( 255, 0, 0, 0, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			panel.alpha[2] = interpolateBetween( 255, 0, 0, 0, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			panel.alpha[4] = interpolateBetween( 1, 0, 0, 0, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			panel.alpha[5] = interpolateBetween( 1, 0, 0, 0, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			panel.alpha[6] = interpolateBetween( 255, 0, 0, 0, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			panel.alpha[7] = interpolateBetween( 255, 0, 0, 0, 0, 0, getProgress( 1200, panel.animTick ), "OutQuad" )
			if getProgress( 1200, panel.animTick ) >= 1 then
				panel.clickState = 1
				removeEventHandler( "onClientRender", root, drawLogin )
				removeEventHandler( "onClientRender", root, animLogin )
				removeEventHandler( "onClientRender", root, drawError )
				camera.blurElement = not exports.tda_source:destroyBlurBox( camera.blurElement )
				camera.blurElement = nil
			end
		end
	end
end

function clickLogin(  )
	if panel.state == true then
		if panel.clickState == 2 then
			panel.clickState = 3
			panel.request[1] = false
			panel.request[2] = false
			panel.request[3] = false
			panel.animTick = getTickCount(  )
		else
			triggerServerEvent( "onRequestLogin", getLocalPlayer(  ), getLocalPlayer(  ), getElementData( panel.editBox[1], "text" ), getElementData( panel.editBox[2], "text" ) )
		end
	end
end
addEvent( "onClientDXClick", true )
addEventHandler( "onClientDXClick", panel.button[1], clickLogin )

function clickRegister(  )
	if panel.state == true then
		if panel.clickState ~= 2 then
			panel.clickState = 2
			panel.animTick = getTickCount(  )
		else
			triggerServerEvent( "onRequestRegister", getLocalPlayer(  ), getLocalPlayer(  ), getElementData( panel.editBox[1], "text" ), getElementData( panel.editBox[2], "text" ), getElementData( panel.editBox[3], "text" ) )
		end
	end
end
addEvent( "onClientDXClick", true )
addEventHandler( "onClientDXClick", panel.button[2], clickRegister )

function drawError( )
	if panel.state == true then
		if panel.request[1] == true then
			dxDrawRectangle( screenWidth/2 - 256 - panel.pos[4], screenHeight/2 - 50, 256, 40,  tocolor ( panel.color[1][1], panel.color[1][2], panel.color[1][3], 255 ), false )
		end
		if panel.request[2] == true then
			dxDrawRectangle( screenWidth/2 - panel.pos[5], screenHeight/2 - 50, 256, 40,  tocolor ( panel.color[2][1], panel.color[2][2], panel.color[2][3], 255 ), false )
		end
		if panel.request[3] == true then
			dxDrawRectangle( screenWidth/2 + 130, screenHeight/2 - 50, 256, 40,  tocolor ( panel.color[3][1], panel.color[3][2], panel.color[3][3], 255 ), false )
		end
	end
end

function requestError( state, degress, warn )
	if state == 1 and degress == 1 and warn == true then
		panel.color[1][1] = 255
		panel.color[1][2] = 176
		panel.color[1][3] = 0
		panel.request[1] = true
	elseif state == 1 and degress == 1 and warn == false then
		panel.request[1] = false
	end

	if state == 1 and degress == 2 and warn == true then
		panel.color[1][1] = 255
		panel.color[1][2] = 0
		panel.color[1][3] = 0
		panel.request[1] = true
	elseif state == 1 and degress == 2 and warn == false then
		panel.request[1] = false
	end

	if state == 1 and degress == 3 and warn == true then
		panel.color[1][1] = 0
		panel.color[1][2] = 255
		panel.color[1][3] = 0
		panel.request[1] = true
	elseif state == 1 and degress == 3 and warn == false then
		panel.request[1] = false
	end


	if state == 2 and degress == 1 and warn == true then
		panel.color[2][1] = 255
		panel.color[2][2] = 176
		panel.color[2][3] = 0
		panel.request[2] = true
	elseif state == 2 and degress == 1 and warn == false then 
		panel.request[2] = false
	end

	if state == 2 and degress == 2 and warn == true then
		panel.color[2][1] = 255
		panel.color[2][2] = 0
		panel.color[2][3] = 0
		panel.request[2] = true
	elseif state == 2 and degress == 2 and warn == false then 
		panel.request[2] = false
	end

	if state == 2 and degress == 3 and warn == true then
		panel.color[2][1] = 0
		panel.color[2][2] = 255
		panel.color[2][3] = 0
		panel.request[2] = true
	elseif state == 2 and degress == 3 and warn == false then 
		panel.request[2] = false
	end

	if state == 1 and degress == 5 and warn == true then
		panel.color[1][1] = 207
		panel.color[1][2] = 0
		panel.color[1][3] = 255
		panel.request[1] = true
	elseif state == 1 and degress == 5 and warn == false then 
		panel.request[1] = false
	end

--------------------------------------------------------------------

	if state == 1 and degress == 4 and warn == true then
		panel.color[1][1] = 0
		panel.color[1][2] = 204
		panel.color[1][3] = 255
		panel.request[1] = true
	elseif state == 1 and degress == 4 and warn == false then 
		panel.request[1] = false
	end

	if state == 3 and degress == 1 and warn == true then
		panel.color[3][1] = 255
		panel.color[3][2] = 176
		panel.color[3][3] = 0
		panel.request[3] = true
	elseif state == 3 and degress == 1 and warn == false then 
		panel.request[3] = false
	end

	if state == 3 and degress == 2 and warn == true then
		panel.color[3][1] = 255
		panel.color[3][2] = 0
		panel.color[3][3] = 0
		panel.request[3] = true
	elseif state == 3 and degress == 2 and warn == false then 
		panel.request[3] = false
	end

	if state == 3 and degress == 3 and warn == true then
		panel.color[3][1] = 0
		panel.color[3][2] = 255
		panel.color[3][3] = 0
		panel.request[3] = true
	elseif state == 3 and degress == 3 and warn == false then 
		panel.request[3] = false
	end
	
end
addEvent( "onClientRequestError", true )
addEventHandler( "onClientRequestError", root, requestError )

--><

function clickedOk(  )
	if panel.state == true then
		panel.clickState = 1
		panel.animTick = getTickCount(  )
		addEventHandler( "onClientRender", root, drawLogin )
		addEventHandler( "onClientRender", root, animLogin )
		addEventHandler( "onClientRender", root, drawError )
		panel.request[1] = false
		panel.request[2] = false
		panel.request[3] = false
		setElementData( panel.editBox[1], "text", "" )
		setElementData( panel.editBox[2], "text", "" )
		setElementData( panel.editBox[3], "text", "" )
	end
end
addEvent( "onClientDXClick", true )
addEventHandler( "onClientDXClick", panel.bannedButton, clickedOk )

function loginnedAccount(  )
	if panel.state == true then
		panel.clickState = 4
		panel.animTick = getTickCount(  )
		addEventHandler( "onClientRender", root, drawLogin )
		addEventHandler( "onClientRender", root, animLogin )
		addEventHandler( "onClientRender", root, drawError )
		removeEventHandler( "onClientRender", root, cameraAnimation )
		removeEventHandler( "onClientRender", root, cameraControl )
		panel.request[1] = false
		panel.request[2] = false
		panel.request[3] = false
		setElementData( panel.editBox[1], "text", "" )
		setElementData( panel.editBox[2], "text", "" )
		setElementData( panel.editBox[3], "text", "" )
		showCursor( false )
		fadeCamera( false, 3 )
		setTimer( function( ) 
			camera.blurElement = not exports.tda_source:destroyBlurBox( camera.blurElement )
			camera.blurElement = nil
			fadeCamera( true, 15 )
			showChat( true ) 
			exports.tda_hud:showPlayerHud("all", true)
			exports.tda_phone:showPlayerPhone( true )
			exports.tda_radio:showPlayerRadio( true )
			exports.tda_levels:showPlayerLevel( true )
			exports.tda_scoreboard:showPlayerScoreboard( true )
		end, 3000, 1 )
	end
end
addEvent( "onClientAccountLoginned", true )
addEventHandler( "onClientAccountLoginned", root, loginnedAccount )

function getProgress(ms, tick)
	return (getTickCount() - tick) / ms
end