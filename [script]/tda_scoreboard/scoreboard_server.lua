function sendMax()
	for id, player in ipairs(getElementsByType("player")) do
		setElementData(player, "maxplayers", getMaxPlayers())
		local country = exports.admin:getPlayerCountry(player)
		if country then
			setElementData(player, "country", country)
		else
			setElementData(player, "country", "Unknown")
		end
	end
end
addEventHandler("onResourceStart",resourceRoot,sendMax)
addEventHandler("onPlayerJoin",root,sendMax)

addEventHandler("onPlayerLogin",root,
function()
	local account = getPlayerAccount(source)
	if getAccountData(account,"team") == "donator" then
		setElementData(source,"donator",true)
	elseif getAccountData(account,"team") == "clan" then
		setElementData(source,"clan",true)
	end
end)

addCommandHandler("team",
function(source,command,target,team)
	local account = getPlayerAccount(source)
	if isObjectInACLGroup("user."..getAccountName(account),aclGetGroup("Admin")) or isObjectInACLGroup("user."..getAccountName(account),aclGetGroup("Console")) then
		player = lowerName(target)
		if team == "clan" then
			setAccountData(account,"team","clan")
			setElementData(player,"donator",false)
			setElementData(player,"clan",true)
		elseif team == "donator" then
			setAccountData(account,"team","donator")
			setElementData(player,"clan",false)
			setElementData(player,"donator",true)
		elseif team == "user" then
			setAccountData(account,"team",false)
			setElementData(player,"clan",false)
			setElementData(player,"donator",false)
		end
	end
end)

function lowerName(namePart)
	local count = 0
	local result, found1, found2
	for id, player in ipairs(getElementsByType("player")) do
		found1, found2 = string.find(string.lower(string.gsub(getPlayerName(player), "#%x%x%x%x%x%x", "")), string.lower(namePart))
		if found1 and found2 then
			if found2 - found1 > count then
				count = found2 - found1
				result = player
			end
		end
	end
	if result then
		return result
	else
		return false
	end
end

function getPlayerData( player )
	local kill = getAccountData( getPlayerAccount( player ), "Kills" )
	local death = getAccountData( getPlayerAccount( player ), "Death" )
	local level = getAccountData( getPlayerAccount( player ), "Level" )
	local league = getAccountData( getPlayerAccount( player ), "League" )
	local lp = getAccountData( getPlayerAccount( player ), "Leaguepoint" )
	triggerClientEvent( player, "onClientGetPlayerData", player, player, kill, death, level, league, lp )
end
addEvent( "onGetPlayerData", true )
addEventHandler( "onGetPlayerData", root, getPlayerData )