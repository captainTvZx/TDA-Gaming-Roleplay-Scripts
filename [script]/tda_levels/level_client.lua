local screenWidth, screenHeight = guiGetScreenSize(  )

levelSystem = {
	state = false,
	player = { level = 0, exp = 0, },
	exp = {},
	panel = {
		state = false,
		animTick = 0,
		shaderPos = 90,
		panelPos = -168,
		renderTarget = dxCreateRenderTarget ( 512, 168, true ),
		shaderTarget = dxCreateShader( "texture.fx" ),
	},
}

local exp = 0
for level=1,100 do
	exp = exp + 5000*level
	table.insert( levelSystem.exp, exp )
end

function playerLogin(  )
	levelSystem.state = true
	triggerServerEvent( "onGetPlayerLevel", getLocalPlayer(  ), getLocalPlayer(  ) )
end
addEvent( "onClientPlayerLogin", true )
addEventHandler( "onClientPlayerLogin", root, playerLogin )

function getPlayerData( level, exp )
	levelSystem.player.level = level
	levelSystem.player.exp = exp
end
addEvent( "onClientGetPlayerLevel", true )
addEventHandler( "onClientGetPlayerLevel", root, getPlayerData )

function controlPlayerExp( player )
	triggerServerEvent( "onControlPlayerLevel", player, player, levelSystem.exp[levelSystem.player.level + 1], levelSystem.player.level + 1 )
	outputChatBox( "Tested" )
end
addEvent( "onClientControlPlayerExp", true )
addEventHandler( "onClientControlPlayerExp", root, controlPlayerExp )

function drawExp(  )
	dxDrawRectangle( 0, screenHeight - 8, screenWidth, 8, tocolor( 31, 31, 31, 150 ), true )
	if levelSystem.state == true then
		dxDrawText( "Current Level: #FFB000"..levelSystem.player.level, 2, screenHeight - 22, screenWidth, screenHeight, tocolor( 255, 255, 255, 255 ), 1, "default-bold", "left", "top", false, false, false, true )
		dxDrawText( "Next Level: #00FF00"..levelSystem.player.level + 1, screenWidth - 74, screenHeight - 22, screenWidth, screenHeight, tocolor( 255, 255, 255, 255 ), 1, "default-bold", "right", "top", false, false, false, true )
		dxDrawRectangle( 0, screenHeight - 8, (levelSystem.player.exp - levelSystem.exp[levelSystem.player.level])/(levelSystem.exp[levelSystem.player.level + 1] - levelSystem.exp[levelSystem.player.level]) * screenWidth, 8, tocolor( 128, 0, 128, 255 ), true )
	end
	if checkHover( 0, screenHeight - 8, (levelSystem.player.exp - levelSystem.exp[levelSystem.player.level])/(levelSystem.exp[levelSystem.player.level + 1] - levelSystem.exp[levelSystem.player.level]) * screenWidth, 8 ) then
		dxDrawText( "#FFB000"..levelSystem.player.exp.."#FFFFFF / #00FF00"..levelSystem.exp[levelSystem.player.level + 1], cX, cY - 24, cX, cY, tocolor( 255, 255, 255, 255 ), 1, "default-bold", "center", "top", false, false, true, true )
	end
end

function checkHover( x, y, width, height )
	if isCursorShowing(  ) then
		local screenWidth, screenHeight = guiGetScreenSize(  )
		cX, cY = getCursorPosition()
		cX, cY = cX*screenWidth,cY*screenHeight
		if (cX >= x and cX <= (x + width) and cY >= y and cY <= (y + height)) then
			return true
		end
		return false
	end
end

function pauseGame(  )
	if isCursorShowing(  ) then
		showCursor( false )
		exports.tda_source:outputNotification( "Resume game", 2 )
		toggleAllControls( true )
		setGameSpeed( 1 )
	else
		showCursor( true )
		exports.tda_source:outputNotification( "Game paused", 2 )
		toggleAllControls( false )
		setGameSpeed( 0 )
	end
end
bindKey( "F10", "down", pauseGame )

function playerLevelUp( player, level )
	levelSystem.player.level = level
	drawLevelPanel( )
	levelUpSound(  )
end
addEvent( "onClientPlayerLevelUp", true )
addEventHandler( "onClientPlayerLevelUp", root, playerLevelUp )

function drawLevelPanel( )
	drawPlayerLevelUpTarget( )
	levelSystem.panel.state = false 
	levelSystem.panel.animTick = getTickCount(  )
	addEventHandler( "onClientRender", root, animLevelUp )
	addEventHandler( "onClientRender", root, drawLevelUp )
	setTimer( function( ) levelSystem.panel.state = true levelSystem.panel.animTick = getTickCount(  ) end, 10000, 1 )
end

function drawPlayerLevelUpTarget( )
    dxSetRenderTarget( levelSystem.panel.renderTarget, true )
    dxDrawRectangle( 0 , 40, 512, 128, tocolor( 31, 31, 31, 255 ) )
    dxDrawRectangle( 0 , 0, 512, 40, tocolor( 255, 176, 0, 255 ) )
    dxDrawText( "Turkish Drift Acells", 148, 8, 0, 0, tocolor( 255, 255, 255, 255 ), 1.8, "default-bold" )
  	dxDrawText( "Level #FF0000UP#FFFFFF!", 206, 68, 0, 0, tocolor( 255, 255, 255, 255 ), 1.4, "default-bold", "left", "top", false, false, false, true )
  	dxDrawText( "New Level: "..levelSystem.player.level, 492, 98, 0, 0, tocolor( 255, 255, 255, 255 ), 1.4, "default-bold", "center", "top", false, false, false, true )
  	--dxDrawImage( 512 - 200, 44, 212, 128, "img/logo.png" )
    dxSetRenderTarget( )
    dxSetShaderValue( levelSystem.panel.shaderTarget, "tex", levelSystem.panel.renderTarget )
end

function drawLevelUp(  )
    dxDrawImage( screenWidth/2 - 512/2, levelSystem.panel.panelPos, 512, 168, levelSystem.panel.shaderTarget )
    dxSetShaderTransform( levelSystem.panel.shaderTarget, 0, 0, 0 )
end

function animLevelUp(  )
	if levelSystem.panel.state == false then
		levelSystem.panel.shaderPos = interpolateBetween( 90, 0, 0, 0, 0, 0, getProgress( 1200, levelSystem.panel.animTick ), "OutElastic" )
		levelSystem.panel.panelPos = interpolateBetween( -168, 0, 0, screenWidth/2 - 168*2 - 200, 0, 0, getProgress( 1200, levelSystem.panel.animTick ), "OutElastic" )

		dxSetShaderTransform( levelSystem.panel.shaderTarget, 0, levelSystem.panel.shaderPos, 0 )
	elseif levelSystem.panel.state == true then
		levelSystem.panel.shaderPos = interpolateBetween( 0, 0, 0, 90, 0, 0, getProgress( 1800, levelSystem.panel.animTick ), "InOutElastic" )
		levelSystem.panel.panelPos = interpolateBetween( screenWidth/2 - 168*2 - 200, 0, 0, -168, 0, 0, getProgress( 1800, levelSystem.panel.animTick ), "InOutElastic" )
		dxSetShaderTransform( levelSystem.panel.shaderTarget, 0, levelSystem.panel.shaderPos, 0 )
	end
	if levelSystem.panel.shaderPos >= 90 and levelSystem.panel.panelPos <= -168 and getProgress( 1800, levelSystem.panel.animTick ) >= 1 then
		removeEventHandler( "onClientRender", root, drawLevelUp )
		removeEventHandler( "onClientRender", root, animLevelUp )
	end
end

function levelUpSound(  )
	random =  math.random( 12 )
	playSound( "sound/complate"..random..".mp3", false )
end

function getProgress(ms, tick)
	return (getTickCount() - tick) / ms
end

function showPlayerLevel( state )
	if state then
		addEventHandler( "onClientRender", root, drawExp )
	else
		removeEventHandler( "onClientRender", root, drawExp )
	end
end