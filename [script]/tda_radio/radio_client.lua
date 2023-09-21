local screenWidth, screenHeight = guiGetScreenSize(  )

radio = {
	state = false,
	slowState = false,
	blurElement = nil,
	number = 1,
	openState = false,
}

function closeDefaultRadio(  )
	if getPedOccupiedVehicle( getLocalPlayer(  ) ) then
		setRadioChannel( 0 )
	end
end
addEventHandler( "onClientRender", root, closeDefaultRadio )

function drawRadioPanel(  )
	if radio.state == true then
		dxDrawImage (  screenWidth/2 - 64, screenHeight/2 - 256, 128, 128, "img/radio_1.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
		dxDrawImage (  screenWidth/2 - 64, screenHeight/2 + 128, 128, 128, "img/radio_2.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
		dxDrawImage (  screenWidth/2 - 256, screenHeight/2 - 64, 128, 128, "img/radio_3.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
		dxDrawImage (  screenWidth/2 + 128, screenHeight/2 - 64, 128, 128, "img/radio_4.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
		dxDrawImage (  screenWidth/2 + 64, screenHeight/2 + 64, 128, 128, "img/radio_5.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
		dxDrawImage (  screenWidth/2 - 194, screenHeight/2 + 64, 128, 128, "img/radio_6.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
		dxDrawImage (  screenWidth/2 - 194, screenHeight/2 - 194, 128, 128, "img/radio_7.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
		dxDrawImage (  screenWidth/2 + 64, screenHeight/2 - 194, 128, 128, "img/radio_8.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), true )
		if radio.openState == false then	
			if radio.number == 1 then
				dxDrawImage (  screenWidth/2 - 64, screenHeight/2 - 256, 128, 128, "img/circle.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), false )
			elseif radio.number == 2 then
				dxDrawImage (  screenWidth/2 + 64, screenHeight/2 - 194, 128, 128, "img/circle.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), false )
			elseif radio.number == 3 then
				dxDrawImage (  screenWidth/2 + 128, screenHeight/2 - 64, 128, 128, "img/circle.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), false )
			elseif radio.number == 4 then
				dxDrawImage (  screenWidth/2 + 64, screenHeight/2 + 64, 128, 128, "img/circle.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), false )
			elseif radio.number == 5 then
				dxDrawImage (   screenWidth/2 - 64, screenHeight/2 + 128, 128, 128, "img/circle.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), false )
			elseif radio.number == 6 then
				dxDrawImage (  screenWidth/2 - 194, screenHeight/2 + 64, 128, 128, "img/circle.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), false )
			elseif radio.number == 7 then
				dxDrawImage (  screenWidth/2 - 256, screenHeight/2 - 64, 128, 128, "img/circle.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), false )
			elseif radio.number == 8 then
				dxDrawImage (  screenWidth/2 - 194, screenHeight/2 - 194, 128, 128, "img/circle.png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), false )
			end
		end
		if radio.openState == false then
			dxDrawImage (  screenWidth/2 - 47, screenHeight/2 - 47, 94, 94, "img/radio_on.png", 0, 0, 0, tocolor( 0, 0, 0, 255 ), true )
		end
		if radio.openState == true then
			dxDrawImage (  screenWidth/2 - 62, screenHeight/2 - 58, 112, 112, "img/radio_off.png", 0, 0, 0, tocolor( 0, 0, 0, 255 ), true )
		end
	end
end

function changeRadioUp(  )
	if radio.slowState == true and radio.openState == false then
		if radio.number ~= 9 then
			radio.number = radio.number + 1
			if radio.number == 2 then
				stopSound( radio_1 )
				radio_2 = playSound( "http://46.20.3.201/listen.pls", false )
			elseif radio.number == 3 then
				stopSound( radio_2 )
				radio_3 = playSound( "http://77.223.136.16:1860/listen.pls", false )
			elseif radio.number == 4 then
				stopSound( radio_3 )
				radio_4 = playSound( "http://icast.powergroup.com.tr/PowerTurk/mpeg/128/home", false )
			elseif radio.number == 5 then
				stopSound( radio_4 )
				radio_5 = playSound( "http://sh.mncdn.com:8092/listen.pls", false )
			elseif radio.number == 6 then
				stopSound( radio_5 )
				radio_6 = playSound( "http://sc.powergroup.com.tr:80/PowerXL/mpeg/128/home", false )
			elseif radio.number == 7 then
				stopSound( radio_6 )
				radio_7 = playSound( "http://provisioning.streamtheworld.com/pls/METRO_FMAAC.pls", false )
			elseif radio.number == 8 then
				stopSound( radio_7 )
				radio_8 = playSound( "http://icast.powergroup.com.tr/PowerFM/mpeg/128/home", false )
			end
		end
		if radio.number == 9 then
			radio.number = 1
			if radio.number == 1 then
				stopSound( radio_8 )
				radio_1 = playSound( "music.mp3", false )
			end
		end
	end
end
bindKey( "mouse_wheel_up", "down", changeRadioUp )

function changeRadioDown(  )
	if radio.slowState == true and radio.openState == false then
		if radio.number ~= 0 then
			radio.number = radio.number - 1
			if radio.number == 1 then
				stopSound( radio_2 )
				radio_1 = playSound( "music.mp3", false )
			elseif radio.number == 2 then
				stopSound( radio_3 )
				radio_2 = playSound( "http://46.20.3.201/listen.pls", false )
			elseif radio.number == 3 then
				stopSound( radio_4 )
				radio_3 = playSound( "http://77.223.136.16:1860/listen.pls", false )
			elseif radio.number == 4 then
				stopSound( radio_5 )
				radio_4 = playSound( "http://icast.powergroup.com.tr/PowerTurk/mpeg/128/home", false )
			elseif radio.number == 5 then
				stopSound( radio_6 )
				radio_5 = playSound( "http://sh.mncdn.com:8092/listen.pls", false )
			elseif radio.number == 6 then
				stopSound( radio_7 )
				radio_6 = playSound( "http://sc.powergroup.com.tr:80/PowerXL/mpeg/128/home", false )
			elseif radio.number == 7 then
				stopSound( radio_8 )
				radio_7 = playSound( "http://provisioning.streamtheworld.com/pls/METRO_FMAAC.pls", false )
			end
		end
		if radio.number == 0 then
			radio.number = 8
			if radio.number == 8 then
				stopSound( radio_1 )
				radio_8 = playSound( "http://icast.powergroup.com.tr/PowerFM/mpeg/128/home", false )
			end
		end
	end
end
bindKey( "mouse_wheel_down", "down", changeRadioDown )

function closeRadio( )
	if radio.openState == false and radio.state == true then
		if radio.number == 1 then
			stopSound( radio_1 )
		elseif radio.number == 2 then
			stopSound( radio_2 )
		elseif radio.number == 3 then
			stopSound( radio_3 )
		elseif radio.number == 4 then
			stopSound( radio_4 )
		elseif radio.number == 5 then
			stopSound( radio_5 )
		elseif radio.number == 6 then
			stopSound( radio_6 )
		elseif radio.number == 7 then
			stopSound( radio_7 )
		elseif radio.number == 8 then
			stopSound( radio_8 )
		end
		exports.tda_source:outputNotification( "Set radio volume: %0", 2 )
		radio.openState = true
	elseif radio.openState == true and radio.state == true then
		if radio.number == 1 then
			radio_1 = playSound( "music.mp3", false )
		elseif radio.number == 2 then
			radio_2 = playSound( "http://46.20.3.201/listen.pls", false )
		elseif radio.number == 3 then
			radio_3 = playSound( "http://77.223.136.16:1860/listen.pls", false )
		elseif radio.number == 4 then
			radio_4 = playSound( "http://icast.powergroup.com.tr/PowerTurk/mpeg/128/home", false )
		elseif radio.number == 5 then
			radio_5 = playSound( "http://sh.mncdn.com:8092/listen.pls", false )
		elseif radio.number == 6 then
			radio_6 = playSound( "http://sc.powergroup.com.tr:80/PowerXL/mpeg/128/home", false )
		elseif radio.number == 7 then
			radio_7 = playSound( "http://provisioning.streamtheworld.com/pls/METRO_FMAAC.pls", false )
		elseif radio.number == 8 then
			radio_8 = playSound( "http://icast.powergroup.com.tr/PowerFM/mpeg/128/home", false )
		end
		exports.tda_source:outputNotification( "Set radio volume: %100", 2 )
		radio.openState = false
	end
end

function bindDownRadio( )
	--if sourcePlayer == getLocalPlayer( ) and radio.state == true then
		if radio.slowState == false then
			setGameSpeed( 0.2 )
			radio.slowState = true
			radio.blurElement = exports.tda_source:createGuassianBlur(0, 0, screenWidth, screenHeight, 255, 255, 255, 255, 3, 3, 3, false)
			addEventHandler( "onClientRender", root, drawRadioPanel )
		end
	--end
end

function bindUpRadio( )
	--if sourcePlayer == getLocalPlayer( ) and radio.state == true then
		if radio.slowState == true then
			setGameSpeed( 1 )
			radio.slowState = false
			radio.blurElement = not exports.tda_source:destroyBlurBox( radio.blurElement )
			removeEventHandler( "onClientRender", root, drawRadioPanel )
		end
	--end
end

function showPlayerRadio( state )
	if state then
		radio.openState = true 
		radio.state = true
		bindKey( "f2", "down", bindDownRadio )
		bindKey( "f2", "up", bindUpRadio )
		bindKey( "m", "down", closeRadio )
	else
		unbindKey( "f2", "down", bindDownRadio )
		unbindKey( "f2", "up", bindUpRadio )
		unbindKey( "m", "down", closeRadio )
	end
end