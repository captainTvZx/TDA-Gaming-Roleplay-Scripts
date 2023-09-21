function getPlayerData( player )
	triggerClientEvent( player, "onClientGetPlayerLevel", player, getAccountData( getPlayerAccount( player ), "Level" ), getAccountData( getPlayerAccount( player ), "Exp" ) )
end
addEvent( "onGetPlayerLevel", true )
addEventHandler( "onGetPlayerLevel", root, getPlayerData )

function controlPlayerExp( player, exp, level )
	if getAccountData( getPlayerAccount( player ), "Exp" ) >= exp then
		setAccountData( getPlayerAccount( player ), "Level", level )
		triggerClientEvent( player, "onClientPlayerLevelUp", player, player, level )
	end
end
addEvent( "onControlPlayerLevel", true )
addEventHandler( "onControlPlayerLevel", root, controlPlayerExp )

function controlPlayerExp( player )
	triggerClientEvent( player, "onClientControlPlayerExp", player, player )
end

function givePlayerExp( player, exp )
	setAccountData( getPlayerAccount( player ), "Exp", getAccountData( getPlayerAccount( player ), "Exp" ) + exp )
	triggerClientEvent( player, "onClientGetPlayerLevel", player, getAccountData( getPlayerAccount( player ), "Level" ), getAccountData( getPlayerAccount( player ), "Exp" ) )
	controlPlayerExp( player )
end