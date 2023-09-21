local sX, sY = guiGetScreenSize()
local notifications = {}

function outputNotification(text, level)
	if type(text) == "string" and text ~= "" and type(level) == "number" then
		local image = "img/succes.png"
		if level == 1 then
			image = "img/succes.png"
		elseif level == 2 then
			image = "img/warn.png"
		elseif level == 3 then
			image = "img/error.png"
		end
		table.insert(notifications, {text = text, level = image, tick = getTickCount(), animPos = {0,0}, state = "up"})
		return true
	else
		outputDebugString("outputNotification: Bad arg",3,255,0,0)
		return false
	end
end
addEvent("addNotification", true)
addEventHandler("addNotification", root, outputNotification)

addEventHandler("onClientRender", root,
function()
	for id, notif in ipairs(notifications) do
		if id == 1 and #notifications >= 7 then
			notif.tick = getTickCount()
			notif.state = "down"
		end
		if notif.state == "up" then
			notif.animPos[1], notif.animPos[2] = interpolateBetween(0,0,0,1,1,0,getProgress(750,notif.tick),"InOutQuad")
			if notif.animPos[1] == 1 then
				notif.tick = getTickCount()
				notif.state = "idle"
			end
		end
		if notif.state == "idle" then
			if notif.tick + (5*1000) <= getTickCount() then
				notif.tick = getTickCount()
				notif.state = "down"
			end
		end
		if notif.state == "down" then
			notif.animPos[2] = interpolateBetween(1,0,0,0,0,0,getProgress(750,notif.tick),"InOutQuad")
			if notif.animPos[2] == 0 then
				table.remove(notifications, id)
				return
			end
		end
		dxDrawRectangle(sX-5-230, 5+((45*(id-1))*notif.animPos[1]), 230, 40, tocolor(20,20,20,255*notif.animPos[2]), true)
		dxDrawImage(sX-230, 5+(40/2-32/2)+((45*(id-1))*notif.animPos[1]), 32, 32, notif.level, 0, 0, 0, tocolor(255,255,255,255*notif.animPos[2]), true)
		dxDrawShadowText(notif.text, sX-230+32+10, 5+((45*(id-1))*notif.animPos[1]), 230-32-25, 40, tocolor(255,255,255,255*notif.animPos[2]), 1, "default-bold", "left", "center", true, true, true, false, false)
	end
end,true,"low-9")