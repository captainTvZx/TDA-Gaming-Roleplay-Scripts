local blockDecompilers = {{{{"Hayla decompile ediyor pezevenk !!11bir1bir!1"}}}}
local sX, sY = guiGetScreenSize()
local scoreboard = {
	pos = {(sX/2)-(800/2),0},
	size = {800,0},
	state = false,
	teams = {user = {}, donator = {}, clan = {}},
}

local titleText = "TDA//Gaming - Turkish Drift Acells - | Roleplay - Reallife | Turkey - International"
local titleWidth = dxGetTextWidth(titleText, 1, "default-bold")
local textHeight = dxGetFontHeight(1, "default-bold")

function playerLogins(  )
	triggerServerEvent( "onGetPlayerData", root, getLocalPlayer(  ) )
end
addEvent( "onClientPlayerLogin", true )
addEventHandler( "onClientPlayerLogin", getLocalPlayer(  ), playerLogins )


function tabDown(  )
	if not scoreboard.state then
		scoreboard.state = true
		triggerServerEvent( "onGetPlayerData", root, getLocalPlayer(  ) )
		addEventHandler("onClientRender", root, drawScoreboard)
	end
end
bindKey( "tab", "down", tabDown )

function tabUp(  )
	if scoreboard.state then
		scoreboard.state = false
		removeEventHandler("onClientRender", root, drawScoreboard)
	end
end
bindKey( "tab", "up", tabUp )

function showPlayerScoreboard( state )
	if state then
		bindKey( "tab", "up", tabUp )
		bindKey( "tab", "down", tabDown )
	else
		unbindKey( "tab", "up", tabUp )
		unbindKey( "tab", "down", tabDown )
	end
end

function getPlayerData( player, kill, death, level, league, lp )
	setElementData( player, "kill", kill )
	setElementData( player, "death", death )
	setElementData( player, "level", level )
	setElementData( player, "league", league )
	setElementData( player, "lp", lp )
end
addEvent( "onClientGetPlayerData", true )
addEventHandler( "onClientGetPlayerData", root, getPlayerData )

function drawScoreboard()
	local playerCount = #getElementsByType("player")
	local playersText = "Players: "..playerCount.."/"..getElementData(localPlayer,"maxplayers")
	local playersTextWidth = dxGetTextWidth(playersText, 1, "default-bold")
	scoreboard.size[2] = playerCount * 20 + 50
	scoreboard.pos[2] = (sY/2) - (scoreboard.size[2]/2)
	dxDrawRectangle(scoreboard.pos[1], scoreboard.pos[2], scoreboard.size[1], 50, tocolor(0,0,0,255), true)
	dxDrawImage(sX/2 - (256/2), scoreboard.pos[2] - 134, 256, 144, "logo.png", 0, 0, 0, tocolor(255,255,255,255), true)
	dxDrawShadowText(titleText, (scoreboard.pos[1] + 5), (scoreboard.pos[2] + 5), (scoreboard.pos[1] + 5) + titleWidth, (scoreboard.pos[2] + 5) + textHeight, tocolor(255,176,0,255), 1, "default-bold", "left", "top", tocolor(40,40,40,255))
	dxDrawShadowText(playersText, (scoreboard.pos[1] + scoreboard.size[1]) - playersTextWidth - 5, (scoreboard.pos[2] + 5), (scoreboard.pos[1] + scoreboard.size[1]) - playersTextWidth - 5 + playersTextWidth, (scoreboard.pos[2] + 5) + textHeight, tocolor(255,176,0,255), 1, "default-bold", "left", "top", tocolor(40,40,40,255))
	
	dxDrawShadowText("Name", (scoreboard.pos[1] + 10), (scoreboard.pos[2] + 32.5), (scoreboard.pos[1] + 10) + dxGetTextWidth("Name",1,"default-bold"), (scoreboard.pos[2] + 32.5) + textHeight, tocolor(150,150,150,255), 1, "default-bold", "left", "top")
	dxDrawShadowText("Kill", (scoreboard.pos[1] + 200), (scoreboard.pos[2] + 32.5), (scoreboard.pos[1] + 10) + dxGetTextWidth("Kill",1,"default-bold"), (scoreboard.pos[2] + 32.5) + textHeight, tocolor(150,150,150,255), 1, "default-bold", "left", "top")
	dxDrawShadowText("Death", (scoreboard.pos[1] + 250), (scoreboard.pos[2] + 32.5), (scoreboard.pos[1] + 10) + dxGetTextWidth("Death",1,"default-bold"), (scoreboard.pos[2] + 32.5) + textHeight, tocolor(150,150,150,255), 1, "default-bold", "left", "top")
	dxDrawShadowText("Level", (scoreboard.pos[1] + 315), (scoreboard.pos[2] + 32.5), (scoreboard.pos[1] + 10) + dxGetTextWidth("Level",1,"default-bold"), (scoreboard.pos[2] + 32.5) + textHeight, tocolor(150,150,150,255), 1, "default-bold", "left", "top")
	dxDrawShadowText("League", (scoreboard.pos[1] + 375), (scoreboard.pos[2] + 32.5), (scoreboard.pos[1] + 10) + dxGetTextWidth("League",1,"default-bold"), (scoreboard.pos[2] + 32.5) + textHeight, tocolor(150,150,150,255), 1, "default-bold", "left", "top")
	dxDrawShadowText("League Points", (scoreboard.pos[1] + 450), (scoreboard.pos[2] + 32.5), (scoreboard.pos[1] + 10) + dxGetTextWidth("League Points",1,"default-bold"), (scoreboard.pos[2] + 32.5) + textHeight, tocolor(150,150,150,255), 1, "default-bold", "left", "top")
	dxDrawShadowText("Country", (scoreboard.pos[1] + 560), (scoreboard.pos[2] + 32.5), (scoreboard.pos[1] + 10) + dxGetTextWidth("Country",1,"default-bold"), (scoreboard.pos[2] + 32.5) + textHeight, tocolor(150,150,150,255), 1, "default-bold", "left", "top")
	dxDrawShadowText("FPS", (scoreboard.pos[1] + 650), (scoreboard.pos[2] + 32.5), (scoreboard.pos[1] + 10) + dxGetTextWidth("FPS",1,"default-bold"), (scoreboard.pos[2] + 32.5) + textHeight, tocolor(150,150,150,255), 1, "default-bold", "left", "top")
	dxDrawShadowText("Ping", (scoreboard.pos[1] + 730), (scoreboard.pos[2] + 32.5), (scoreboard.pos[1] + 10) + dxGetTextWidth("Ping",1,"default-bold"), (scoreboard.pos[2] + 32.5) + textHeight, tocolor(150,150,150,255), 1, "default-bold", "left", "top")
	
	for id, player in ipairs(getElementsByType("player")) do
		scoreboard.name = getPlayerName(player) or ""
		scoreboard.kill = getElementData(player, "kill") or "-"
		scoreboard.death = getElementData(player, "death") or "-"
		scoreboard.level  = getElementData(player, "level") or "-"
		scoreboard.league  = getElementData(player, "league") or "-"
		scoreboard.lp  = getElementData(player, "lp") or "-"
		scoreboard.country = getElementData(player, "country") or "-"
		scoreboard.fps = getElementData(player, "scoreboard.fps") or "-"
		scoreboard.ping = getPlayerPing(player) or "0"
		
		local clan = getElementData(player, "clan")
		local donator = getElementData(player, "donator")
		
		if not donator and not clan then
			table.insert(scoreboard.teams.user, {name = scoreboard.name, kill = scoreboard.kill, death = scoreboard.death, level = scoreboard.level, league = scoreboard.league, lp = scoreboard.lp, country = scoreboard.country, fps = scoreboard.fps, ping = scoreboard.ping})
		elseif donator and not clan then
			table.insert(scoreboard.teams.donator, {name = scoreboard.name, kill = scoreboard.kill, death = scoreboard.death, level = scoreboard.level, league = scoreboard.league, lp = scoreboard.lp, country = scoreboard.country, fps = scoreboard.fps, ping = scoreboard.ping})
		elseif not donator and clan then
			table.insert(scoreboard.teams.clan, {name = scoreboard.name, kill = scoreboard.kill, death = scoreboard.death, level = scoreboard.level, league = scoreboard.league, lp = scoreboard.lp, country = scoreboard.country, fps = scoreboard.fps, ping = scoreboard.ping})
		elseif donator and clan then
			table.insert(scoreboard.teams.clan, {name = scoreboard.name, kill = scoreboard.kill, death = scoreboard.death, level = scoreboard.level, league = scoreboard.league, lp = scoreboard.lp, country = scoreboard.country, fps = scoreboard.fps, ping = scoreboard.ping})
		end
	end
	
	local clanCount, donatorCount = getTeamPlayersCount()
	
	scoreboard.row = 0
	scoreboard.row = scoreboard.row + 1
	
	for id, user in ipairs(scoreboard.teams.user) do
		dxDrawRectangle(scoreboard.pos[1], (scoreboard.pos[2] + 30) + (scoreboard.row * 20), scoreboard.size[1], 20, tocolor(0,0,0, (id % 2 == 0) and 150 or 125), true)
		dxDrawShadowText(user.name, (scoreboard.pos[1] + 10 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 10 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		dxDrawShadowText(user.kill, (scoreboard.pos[1] + 210 ), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 200 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		dxDrawShadowText(user.death, (scoreboard.pos[1] + 246), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 280 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		dxDrawShadowText(user.level, (scoreboard.pos[1] + 315 + 10), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 330 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		dxDrawShadowText(user.league, (scoreboard.pos[1] + 375 + 24), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 390 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		dxDrawShadowText(user.lp, (scoreboard.pos[1] + 450 + 64), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 470 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		if fileExists("flags/"..user.country..".png") then
			dxDrawImage((scoreboard.pos[1] + 560 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + (20/2 - 15/2), 15, 15, "flags/"..user.country..".png", 0, 0, 0, tocolor(255,255,255,255), true)
			dxDrawShadowText(user.country, (scoreboard.pos[1] + 560 + 25), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 560 + 25) + dxGetTextWidth(user.country,1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		else
			dxDrawShadowText(user.country, (scoreboard.pos[1] + 560 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 560 + 5) + dxGetTextWidth(user.country,1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		end
		dxDrawShadowText(user.fps, (scoreboard.pos[1] + 650 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 650 + 5) + dxGetTextWidth(user.fps,1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		dxDrawShadowText(user.ping, (scoreboard.pos[1] + 730 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 730 + 5) + dxGetTextWidth(user.ping,1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		scoreboard.row = scoreboard.row + 1
	end
	
	if donatorCount ~= 0 then
		dxDrawRectangle(scoreboard.pos[1], (scoreboard.pos[2] + 30) + (scoreboard.row * 20), scoreboard.size[1], 20, tocolor(20,20,20,255), true)
		dxDrawShadowText("Donators", (scoreboard.pos[1] + 10),  (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 10) + dxGetTextWidth("Donators",1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(0,89,45,255), 1, "default-bold", "left", "center")
		scoreboard.row = scoreboard.row + 1
	end
	
	for id, donator in ipairs(scoreboard.teams.donator) do
		dxDrawRectangle(scoreboard.pos[1], (scoreboard.pos[2] + 30) + (scoreboard.row * 20), scoreboard.size[1], 20, tocolor(0,0,0, (id % 2 == 0) and 150 or 125), true)
		dxDrawShadowText(donator.name, (scoreboard.pos[1] + 10 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 10 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		dxDrawShadowText(donator.kill, (scoreboard.pos[1] + 210 ), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 200 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		dxDrawShadowText(donator.death, (scoreboard.pos[1] + 246), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 280 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		dxDrawShadowText(donator.level, (scoreboard.pos[1] + 315 + 10), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 330 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		dxDrawShadowText(donator.league, (scoreboard.pos[1] + 375 + 24), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 390 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		dxDrawShadowText(donator.lp, (scoreboard.pos[1] + 450 + 64), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 470 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		if fileExists("flags/"..donator.country..".png") then
			dxDrawImage((scoreboard.pos[1] + 560 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + (20/2 - 15/2), 15, 15, "flags/"..donator.country..".png", 0, 0, 0, tocolor(255,255,255,255), true)
			dxDrawShadowText(donator.country, (scoreboard.pos[1] + 560 + 25), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 560 + 25) + dxGetTextWidth(donator.country,1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		else
			dxDrawShadowText(donator.country, (scoreboard.pos[1] + 560 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 560 + 5) + dxGetTextWidth(donator.country,1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		end
		dxDrawShadowText(donator.fps, (scoreboard.pos[1] + 650 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 650 + 5) + dxGetTextWidth(donator.fps,1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		dxDrawShadowText(donator.ping, (scoreboard.pos[1] + 730 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 730 + 5) + dxGetTextWidth(donator.ping,1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		scoreboard.row = scoreboard.row + 1
	end
	
	if clanCount ~= 0 then
		dxDrawRectangle(scoreboard.pos[1], (scoreboard.pos[2] + 30) + (scoreboard.row * 20), scoreboard.size[1], 20, tocolor(20,20,20,255), true)
		dxDrawShadowText("Turkish Drift Acells", (scoreboard.pos[1] + 10),  (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 10) + dxGetTextWidth("Turkish Drift Acells",1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,176,0,255), 1, "default-bold", "left", "center")
		scoreboard.row = scoreboard.row + 1
	end
	
	for id, clan in ipairs(scoreboard.teams.clan) do
		dxDrawRectangle(scoreboard.pos[1], (scoreboard.pos[2] + 30) + (scoreboard.row * 20), scoreboard.size[1], 20, tocolor(0,0,0, (id % 2 == 0) and 150 or 125), true)
		dxDrawShadowText(clan.name, (scoreboard.pos[1] + 10 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 10 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		dxDrawShadowText(clan.kill, (scoreboard.pos[1] + 210 ), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 200 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		dxDrawShadowText(clan.death, (scoreboard.pos[1] + 246), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 280 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		dxDrawShadowText(clan.level, (scoreboard.pos[1] + 315 + 10), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 330 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		dxDrawShadowText(clan.league, (scoreboard.pos[1] + 375 + 24), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 390 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		dxDrawShadowText(clan.lp, (scoreboard.pos[1] + 450 + 64), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 470 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "center", "center")
		if fileExists("flags/"..clan.country..".png") then
			dxDrawImage((scoreboard.pos[1] + 560 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + (20/2 - 15/2), 15, 15, "flags/"..clan.country..".png", 0, 0, 0, tocolor(255,255,255,255), true)
			dxDrawShadowText(clan.country, (scoreboard.pos[1] + 560 + 25), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 560 + 25) + dxGetTextWidth(clan.country,1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		else
			dxDrawShadowText(clan.country, (scoreboard.pos[1] + 560 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 560 + 5) + dxGetTextWidth(clan.country,1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		end
		dxDrawShadowText(clan.fps, (scoreboard.pos[1] + 650 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 650 + 5) + dxGetTextWidth(clan.fps,1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		dxDrawShadowText(clan.ping, (scoreboard.pos[1] + 730 + 5), (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 730 + 5) + dxGetTextWidth(clan.ping,1,"default-bold"), (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 20, tocolor(255,255,255,255), 1, "default-bold", "left", "center")
		scoreboard.row = scoreboard.row + 1
	end
	
	dxDrawRectangle(scoreboard.pos[1], (scoreboard.pos[2] + 30) + (scoreboard.row * 20), scoreboard.size[1], 15, tocolor(0,0,0,255), true)
	dxDrawShadowText("-Turkish Drift Acells-", (scoreboard.pos[1] + 10),  (scoreboard.pos[2] + 30) + (scoreboard.row * 20), (scoreboard.pos[1] + 10) + scoreboard.size[1], (scoreboard.pos[2] + 30) + (scoreboard.row * 20) + 15, tocolor(255,176,0,255), 0.9, "default-bold", "center", "center", tocolor(40,40,40,255))
	
	scoreboard.teams = {user = {}, donator = {}, clan = {}}
end

function getTeamPlayersCount()
	local clanCount	= 0
	local donatorCount	= 0
	for id, player in ipairs(getElementsByType("player")) do
		if getElementData(player, "clan") then
			clanCount = clanCount + 1
		elseif getElementData(player, "donator") then
			donatorCount = donatorCount + 1
		end
	end
	return clanCount, donatorCount
end

function dxDrawShadowText(text, x, y, width, height, color, scale, font, left, top, shadowColor)
	local shadowCol = shadowColor or tocolor(0,0,0,255)
	dxDrawText(string.gsub(text, "#%x%x%x%x%x%x", ""), x, y+1, width, height, shadowCol, scale, font, left, top, false, false, true, false)
	dxDrawText(text, x, y, width, height, color, scale, font, left, top, false, false, true, true)
end

local counter = 0
local starttick
local currenttick
addEventHandler("onClientRender", root,
function()
	if not starttick then starttick = getTickCount() end
	counter = counter + 1
	currenttick = getTickCount()
	if currenttick - starttick >= 1000 then
		setElementData(localPlayer,"scoreboard.fps",counter)
		counter = 0
		starttick = false
	end
end)