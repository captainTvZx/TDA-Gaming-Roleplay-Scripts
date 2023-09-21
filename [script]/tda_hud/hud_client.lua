local sX, sY = guiGetScreenSize()
local screenWidth, screenHeight = guiGetScreenSize()
local animOffset = 0
local scale = sY * 4 / 720
local radarSize = math.floor(scale * 43)
local radarPosX = math.floor(0 + radarSize / 1.35)
local radarPosY = math.floor(sY - radarSize / 1.35)
local outerFrameScale = 1
local centerArrowSize = math.floor(radarSize / 10)
local maxRingAngle = 360
local drawRange = 200
local criticalHealthPulse = 0
local speedScaleIntensity = 250
local blipSizes = {square = math.floor(radarSize / 16), up = math.floor(radarSize / 16), down = math.floor(radarSize / 16)}
local healthSections = {180, 180, 90, 45, 30, 20, 10, 5, 3, 2, 1}
local map = dxCreateTexture("images/map.jpg")
local mask = dxCreateTexture("images/mask.png")
local mapShader = dxCreateShader("shader.fx")
dxSetShaderValue(mapShader, "maskTex0", mask)
dxSetShaderValue(mapShader, "tex0", map)
dxSetShaderValue(mapShader, "finalAlpha", 1)
showPlayerHudComponent( "radar", false )
local renderTarget = dxCreateRenderTarget(radarSize, radarSize, false)
local tick = getTickCount()

function getProgress(addtick, tick)
	local now = getTickCount()
	local elapsedTime = now - tick
	local duration = tick+addtick - tick
	local progress = elapsedTime / duration
	return progress
end

function drawRadar()
	animOffset = interpolateBetween(0,0,0,1,0,0,getProgress(1500,tick),"OutBack")
	local posX, posY, posZ = getElementPosition(localPlayer)
	local cX, cY, cZ, tX, tY, tZ = getCameraMatrix()
	local pedRot = getPedRotation(localPlayer)
	local camRot = findRotation(cX, cY, tX, tY)
	local health = 0
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle then
		health = math.max((getElementHealth(vehicle) or 1000) - 250, 0) / 750 * 100
	else
		health = getElementHealth(localPlayer)
	end
	local healthDegrees = maxRingAngle / 100 * health
	local scaleDifference = speedScaleIntensity * getScalingFactorBasedOnSpeed()
	local drawRange = drawRange + scaleDifference
	local scaledMapSize = 3000 / (drawRange / 180)
	local mapPosX, mapPosY = 0 - (math.map(posX + 3000, 0, 6000, 0, scaledMapSize) - radarSize / 2), 0 - (math.map(-posY + 3000, 0, 6000, 0, scaledMapSize) - radarSize / 2)
	dxSetRenderTarget(renderTarget, true)
	dxDrawRectangle(0, 0, scaledMapSize, scaledMapSize, tocolor(125,170,230,255))
	dxDrawImage(mapPosX*animOffset, mapPosY*animOffset, scaledMapSize*animOffset, scaledMapSize*animOffset, map, camRot, -scaledMapSize / 2 - mapPosX + radarSize / 2, -scaledMapSize / 2 - mapPosY + radarSize / 2, tocolor(255, 255, 255, 255))
	dxSetRenderTarget()
	dxSetShaderValue(mapShader, "tex0", renderTarget)
	dxDrawImage(radarPosX - radarSize / 2*animOffset, radarPosY - radarSize / 2*animOffset, radarSize*animOffset, radarSize*animOffset, mapShader)
	
	dxDrawImage(radarPosX - radarSize / 2*animOffset, radarPosY - radarSize / 2*animOffset, radarSize*animOffset, radarSize*animOffset, "images/radar-disc.png")
	dxDrawImage(radarPosX - radarSize * outerFrameScale / 2*animOffset, radarPosY - radarSize * outerFrameScale / 2*animOffset, radarSize * outerFrameScale*animOffset, radarSize * outerFrameScale*animOffset, "images/radar-outerframe.png")
	local sectionsToDraw = {}
	local healthToProcess = healthDegrees
	local drawLimit = 10
	if health >= 0.1 then
		for i, degree in ipairs(healthSections) do
			if drawLimit > 0 then
				if healthToProcess / degree >= 1 then
					table.insert(sectionsToDraw, degree)
					healthToProcess = healthToProcess - degree
					drawLimit = drawLimit - 1
				end
				if healthToProcess == 0 then
					do break end
				end
			end
		end
		local degreeProgress = 0
		for i, section in ipairs(sectionsToDraw) do
			dxDrawImage(radarPosX - radarSize * outerFrameScale /2*animOffset, radarPosY - radarSize * outerFrameScale /2*animOffset, radarSize * outerFrameScale*animOffset, radarSize * outerFrameScale*animOffset, "images/ring/"..section..".png", degreeProgress, 0, 0, tocolor(255, 176, 0, 255))
			degreeProgress = degreeProgress + section
		end
	end
	for id, player in ipairs(getElementsByType("player")) do
		local dimension = getElementDimension(player)
		local interior = getElementInterior(player)
		if dimension == getElementDimension(localPlayer) and interior == getElementInterior(localPlayer) and player ~= localPlayer then
			local pX, pY, pZ = getElementPosition(player)
			local distance = math.min(drawRange, getDistanceBetweenPoints2D(posX, posY, pX, pY))
			local blipName = "square"
			if posZ - pZ >= 4 then
				blipName = "down"
			elseif pZ - posZ >= 4 then
				blipName = "up"
			else
				blipName = "square"
			end
			local angle = 180 - camRot + findRotation(posX, posY, pX, pY)
			local blipX, blipY = getDistanceRotation(0, 0, radarSize / 1.177 * (distance / drawRange) / 2, angle)
			local blipX = radarPosX + radarSize / 2 + blipX - blipSizes[blipName] / 2
			local blipY = radarPosY + radarSize / 2 + blipY - blipSizes[blipName] / 2
			local r, g, b, a = 255, 255, 255, 240
			if getPlayerTeam(player) then
				r, g, b = getTeamColor(getPlayerTeam(player))
			end
			dxDrawImage(blipX - radarSize / 2, blipY - radarSize / 2, blipSizes[blipName], blipSizes[blipName], "images/blip-" .. blipName .. ".png", 0, 0, 0, tocolor(r, g, b, a))
		end
	end
	for id, blip in ipairs(getElementsByType("blip")) do
		if getElementDimension(blip) == getElementDimension(localPlayer) then
			local pX, pY, pZ = getElementPosition(blip)
			local distance = getDistanceBetweenPoints2D(posX, posY, pX, pY)
			if distance <= getBlipVisibleDistance(blip) then
				local angle = 180 - camRot + findRotation(posX, posY, pX, pY)
				local blipIcon = getBlipIcon(blip)

				if blipIcon ~= 0 then
					local blipSize = 32
					local blipX, blipY = getDistanceRotation(0, 0, radarSize / 1.177 * (math.min(drawRange, distance) / drawRange) / 2, angle)
					local blipX = radarPosX + radarSize / 2 + blipX - blipSize / 2
					local blipY = radarPosY + radarSize / 2 + blipY - blipSize / 2
					local r, g, b, a = 255, 255, 255, 240
					if getPlayerTeam(localPlayer) then
						r, g, b = getTeamColor(getPlayerTeam(localPlayer))
					end
					dxDrawImage(blipX - radarSize / 2, blipY - radarSize / 2, blipSize, blipSize, "images/blip/" .. blipIcon .. ".png", 0, 0, 0, tocolor(r, g, b, a))
				end
			end
		end
	end
	dxDrawImage(radarPosX - radarSize / 1.07 / 2*animOffset, radarPosY - radarSize / 1.07 / 2*animOffset, radarSize / 1.07*animOffset, radarSize / 1.07*animOffset, "images/radar-north.png", camRot)
	dxDrawImage(radarPosX + radarSize / 2 - centerArrowSize / 2 - radarSize / 2, radarPosY + radarSize / 2 - centerArrowSize / 2 - radarSize / 2, centerArrowSize, centerArrowSize, "images/radar-center.png", camRot - pedRot)
end

function drawHud(  )
	dxDrawRectangle( screenWidth - dxGetTextWidth( "Money: "..getElementData(getLocalPlayer( ), "Money").." $ ", 1.2, "default-bold") - 4, 32, 256, dxGetFontHeight( 1.2, "default-bold" ), tocolor(31, 31, 31, 75), true)
	dxDrawText ( "#00FF00Money#FFFFFF: "..getElementData(getLocalPlayer( ), "Money").." #00FF00$ ", 0, 32, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1.2, "default-bold", "right", "top", false, false, true, true )
	dxDrawRectangle( screenWidth - dxGetTextWidth( "TDA//Point: "..getElementData(getLocalPlayer( ), "TDAPoint"), 1.2, "default-bold") - 8, 52, 256, dxGetFontHeight( 1.2, "default-bold" ), tocolor(31, 31, 31, 75), true)
	dxDrawText ( "TDA#313131//#FFB000Point#FFFFFF: "..getElementData(getLocalPlayer( ), "TDAPoint").." ", 0, 52, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1.2, "default-bold", "right", "top", false, false, true, true )
end

function showPlayerHud( statestr, state )
	if statestr == "all" and not state then
		removeEventHandler("onClientRender", root, drawHud)
		removeEventHandler("onClientRender", root, drawRadar, true, "low-9")
	elseif statestr == "radar" and not state then
		removeEventHandler("onClientRender", root, drawRadar, true, "low-9")
	elseif statestr == "hud" and not state then
		removeEventHandler("onClientRender", root, drawHud)
	end
	if statestr == "all" and state then
		addEventHandler("onClientRender", root, drawHud)
		addEventHandler("onClientRender", root, drawRadar, true, "low-9")
	elseif statestr == "radar" and state then
		addEventHandler("onClientRender", root, drawRadar, true, "low-9")
	elseif statestr == "hud" and state then
		addEventHandler("onClientRender", root, drawHud)
	end
end

function getScalingFactorBasedOnSpeed()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle then
		local velX, velY, velZ = getElementVelocity(vehicle)
		local speed = math.abs(velX) + math.abs(velY) + math.abs(velZ)
		local minSpeed = 0.3
		local maxSpeed = 1.5
		if minSpeed <= speed then
			return math.min(speed - minSpeed, maxSpeed)
		end
	end
	return 0
end

function getDistanceRotation(x, y, distance, angle)
	return x+math.cos(math.rad(90-angle))*distance, y+math.sin(math.rad(90-angle))*distance
end

function findRotation(x1, y1, x2, y2)
	local rotation = -math.deg(math.atan2(x2-x1, y2-y1))
	if rotation < 0 then rotation = rotation + 360 end
	return rotation
end

function math.map(a, b, c, d, e)
	return d + (a - b) * (e - d) / (c - b)
end