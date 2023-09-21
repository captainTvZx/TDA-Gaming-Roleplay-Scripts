function loginPlayer( player, username, password )
	local database = xmlLoadFile( "database.xml" )
	local accounts = xmlFindChild( database, "accounts", 0 )
	local accPass = nil

	if username == "" then
		triggerClientEvent( player, "onClientRequestError", player, 1, 1, true )
	else
		triggerClientEvent( player, "onClientRequestError", player, 1, 1, false )
		if username == getAccountName( getAccount( username ) ) then
			triggerClientEvent( player, "onClientRequestError", player, 1, 3, true )
		elseif username ~= getAccountName( getAccount( username ) ) then
			triggerClientEvent( player, "onClientRequestError", player, 1, 2, true )
		end
	end
	if password == "" then
		triggerClientEvent( player, "onClientRequestError", player, 2, 1, true )
	else
		triggerClientEvent( player, "onClientRequestError", player, 2, 1, false )

		for id, acc in ipairs( xmlNodeGetChildren( accounts ) ) do
			if username == xmlNodeGetAttribute( acc, "Username" ) and password == xmlNodeGetAttribute( acc, "Password" ) then
				accPass = xmlNodeGetAttribute( acc, "Password" )
			end
		end
		if password == accPass then
			for index, players in ipairs(getElementsByType("player")) do
				if username == getAccountName( getPlayerAccount( players ) ) then
					triggerClientEvent( player, "onClientRequestError", player, 1, 5, true )
					break
				else
					logIn( player, getAccount( username, password ), password )
					setTimer( function( ) triggerClientEvent( player, "onClientAccountLoginned", player ) end, 5000, 1 )
					setTimer( function( ) spawnPlayer( player, 2335.57, 6, 26.8, -90, 0, 0, nil ) setCameraTarget( player, player ) end, 8000, 1 )
					setElementData(player, "Money", getAccountData(getPlayerAccount(player), "Money"))
					setElementData(player, "TDAPoint", getAccountData(getPlayerAccount(player), "TDAPoint"))
					break
				end
			end
			triggerClientEvent( player, "onClientRequestError", player, 2, 3, true )
		elseif password ~= accPass then
			triggerClientEvent( player, "onClientRequestError", player, 2, 2, true )
		end
	end
end
addEvent( "onRequestLogin", true )
addEventHandler( "onRequestLogin", root, loginPlayer )

function registerPlayer( player, username, password, repassword )
	if not fileExists("database.xml") then
		local database = xmlCreateFile("database.xml", "database")
		xmlCreateChild(database, "accounts")
		xmlSaveFile(database)
	end
	local database = xmlLoadFile( "database.xml" )
	local accounts = xmlFindChild( database, "accounts", 0 )
	if username == "" then
		triggerClientEvent( player, "onClientRequestError", player, 1, 1, true )
	else
		if username == getAccountName( getAccount( username ) ) then
			triggerClientEvent( player, "onClientRequestError", player, 1, 4, true )
		else
			triggerClientEvent( player, "onClientRequestError", player, 1, 3, true )
			if password ~= "" and repassword ~= "" then
				if password == repassword then
					for id, acc in ipairs( xmlNodeGetChildren( accounts ) ) do
						if username ~= xmlNodeGetAttribute( acc, "Username" ) then
							local child = xmlCreateChild( accounts, "user" )
							xmlNodeSetAttribute( child, "Username", username )
							xmlNodeSetAttribute( child, "Password", password )
							xmlNodeSetAttribute( child, "Serial", getPlayerSerial( player ) )
							xmlNodeSetAttribute( child, "PlayerName", getPlayerName( player ):gsub('#%x%x%x%x%x%x', '') )
							xmlSaveFile(database)
							addAccount( username, password )
							setAccountData( getAccount( username ), "Username", getPlayerName( player ) )
							setAccountData( getAccount( username ), "Money", 250000 )
							setAccountData( getAccount( username ), "TDAPoint", 0 )
							setAccountData( getAccount( username ), "Kills", 0 )
							setAccountData( getAccount( username ), "Death", 0 )
							setAccountData( getAccount( username ), "Totaldrift", 0 )
							setAccountData( getAccount( username ), "Latestdrift", 0 )
							setAccountData( getAccount( username ), "Bestdrift", 0 )
							setAccountData( getAccount( username ), "Exp", 5000 )
							setAccountData( getAccount( username ), "Level", 1 )
							setAccountData( getAccount( username ), "Leaguepoint", 0 )
							setAccountData( getAccount( username ), "League", 0 )
							setAccountData( getAccount( username ), "Knifes", 0 )
							setAccountData( getAccount( username ), "Pistol", 0 )
							setAccountData( getAccount( username ), "Silenced", 0 )
							setAccountData( getAccount( username ), "Deagle", 0 )
							setAccountData( getAccount( username ), "Shotgun", 0 )
							setAccountData( getAccount( username ), "Sawnoff", 0 )
							setAccountData( getAccount( username ), "Spaz", 0 )
							setAccountData( getAccount( username ), "Uzi", 0 )
							setAccountData( getAccount( username ), "Mp5", 0 )
							setAccountData( getAccount( username ), "Tec9", 0 )
							setAccountData( getAccount( username ), "Ak47", 0 )
							setAccountData( getAccount( username ), "M4", 0 )
							setAccountData( getAccount( username ), "Rifle", 0 )
							setAccountData( getAccount( username ), "Sniper", 0 )
							setAccountData( getAccount( username ), "Rocket", 0 )
							setAccountData( getAccount( username ), "RocketHS", 0 )
							setAccountData( getAccount( username ), "Flame", 0 )
							setAccountData( getAccount( username ), "Minigun", 0 )
							for i=1,512 do
								setAccountData( getAccount( username ), "vehicle"..i, 0 )
								setAccountData( getAccount( username ), "vehicle"..i.."red", 0 )
								setAccountData( getAccount( username ), "vehicle"..i.."green", 0 )
								setAccountData( getAccount( username ), "vehicle"..i.."blue", 0 )
								setAccountData( getAccount( username ), "vehicle"..i.."red2", 0 )
								setAccountData( getAccount( username ), "vehicle"..i.."green2", 0 )
								setAccountData( getAccount( username ), "vehicle"..i.."blue2", 0 )
								setAccountData( getAccount( username ), "vehicle"..i.."nos", 0 )
								setAccountData( getAccount( username ), "vehicle"..i.."lightr", 255 )
								setAccountData( getAccount( username ), "vehicle"..i.."lightg", 255 )
								setAccountData( getAccount( username ), "vehicle"..i.."lightb", 255 )
								setAccountData( getAccount( username ), "vehicle"..i.."wheel", 0 )
							end
							break
						end
					end
				end
			end
		end
	end
	if password == "" then
		triggerClientEvent( player, "onClientRequestError", player, 2, 1, true )
	end
	if repassword == "" then
		triggerClientEvent( player, "onClientRequestError", player, 3, 1, true )
	end
	if password ~= "" then
		triggerClientEvent( player, "onClientRequestError", player, 2, 3, true )
		if password ~= repassword then
			triggerClientEvent( player, "onClientRequestError", player, 2, 2, true )
		else
			triggerClientEvent( player, "onClientRequestError", player, 2, 3, true )
		end
	end
	if repassword ~= "" then
		triggerClientEvent( player, "onClientRequestError", player, 3, 3, true )
		if repassword ~= password then
			triggerClientEvent( player, "onClientRequestError", player, 3, 2, true )
		else
			triggerClientEvent( player, "onClientRequestError", player, 3, 3, true )
		end
	end
end
addEvent( "onRequestRegister", true )
addEventHandler( "onRequestRegister", root, registerPlayer )

addEventHandler("onPlayerCommand", root,
function(cmd)
	if cmd == "register" or cmd == "login" or cmd == "logout" then
		cancelEvent()
	end
end)

function playerLogins(  )
	triggerClientEvent(source, "onClientPlayerLogin", source )
end
addEventHandler( "onPlayerLogin", root, playerLogins )