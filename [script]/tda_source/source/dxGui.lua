local sX, sY = guiGetScreenSize()
segoeui = dxCreateFont('font/segoeui.ttf', 20)
design = {
	alpha = {1,1}
}

function dxDrawColorPicker(x, y, element, postGUI)
	local cx, cy = 0,0
	if isCursorShowing() then
		cx, cy = getCursorPosition()
	end
	local cx, cy = cx * sX, cy * sY
	dxDrawImage(x, y, 250, 250, "img/colorwheel.png", 0,0,0,tocolor(255,255,255,design.alpha[2]*255), postGUI)
	local distanceFromCenter = math.sqrt((math.abs( x+123 - cx ))^2 + (math.abs(y+125 - cy))^2)
	local darkness = getElementData(element, "darkness") or setElementData(element, "darkness", 0)
	local quickFixRed = getElementData(element, "r") or setElementData(element, "r", 255)
	local quickFixGreen	= getElementData(element, "g") or setElementData(element, "g", 255)
	local quickFixBlue = getElementData(element, "b") or setElementData(element, "b", 255)
	if cx >= ( x+250+25 ) and cx <= ( x+250+25+20 ) and cy >= (y) and cy <= ( y + 250 ) then
		if getKeyState("mouse1") then
			setElementData(element, "darkness", ( cy - y ) / 250)
			local darkness = getElementData(element, "darkness")
			setElementData(element, "r", math.floor(( 1-darkness) * getElementData(element, "red")))
			setElementData(element, "g", math.floor(( 1-darkness) * getElementData(element, "green")))
			setElementData(element, "b", math.floor(( 1-darkness) * getElementData(element, "blue")))
			setElementData(element, "darknessClick", true)
		end
	else
		setElementData(element, "darknessClick", false)
	end
	if distanceFromCenter <= 118 then
		drawCircle(cx, cy, 5, tocolor(0,0,0,design.alpha[2]*255))
		if getKeyState("mouse1") then
			cx = cx - x
			cy = cy - y
			local a = 123 - cx
			local b = 125 - cy
			local c = distanceFromCenter
			local angle = math.abs(math.deg(math.asin(a/c)))
			if a >= 0 and b < 0 then
				angle = 90 + ( 90 - angle )
			elseif a < 0 and b < 0 then
				angle = 180 + angle
			elseif a < 0 and b >= 0 then
				angle = 270 + ( 90 - angle )
			end
			setElementData(element, "angle", angle)
			local r,g,b
			if ( angle >= 0 and angle < 60 ) or ( angle >= 300 and angle <= 360 ) then
				r = 255
			elseif angle >= 60 and angle < 120 then
				r = ( ( angle - 60 ) / 60 ) * 255
				r = 255 - math.floor(r)
			elseif angle >= 240 and angle < 300 then
				r = ( ( angle - 240 ) / 60 ) * 255
			else
				r = 0
			end
			if angle >= 180 and angle < 300 then
				g = 255
			elseif angle >= 300 and angle < 360 then
				g = ( ( angle - 300 ) / 60 ) * 255
				g = 255 - math.floor(g)
			elseif angle >= 120 and angle < 180 then
				g = ( ( angle - 120 ) / 60 ) * 255
			else
				g = 0
			end
			if angle >= 60 and angle < 180 then
				b = 255
			elseif angle >= 0 and angle < 60 then
				b = ( angle / 60 ) * 255
			elseif angle >= 180 and angle < 240 then
				b = ( ( angle - 180 ) / 60 ) * 255
				b = 255 - math.floor(b)
			else
				b = 0
			end
			r = math.min(255, r + ( 255 * ( ( 118 - distanceFromCenter ) / 118 ) ) )
			g = math.min(255, g + ( 255 * ( ( 118 - distanceFromCenter ) / 118 ) ) )
			b = math.min(255, b + ( 255 * ( ( 118 - distanceFromCenter ) / 118 ) ) )
			r = math.floor(r)
			g = math.floor(g)
			b = math.floor(b)
			setElementData(element, "red", r)
			setElementData(element, "green", g)
			setElementData(element, "blue", b)
			local darkness = getElementData(element, "darkness") or setElementData(element, "darkness", 0)
			setElementData(element, "r", math.floor( ( 1 - darkness) * r))
			setElementData(element, "g", math.floor( ( 1 - darkness) * g))
			setElementData(element, "b", math.floor( ( 1 - darkness) * b))
			setElementData(element, "mouseClick", true)
		else
			setElementData(element, "mouseClick", false)
		end
	else
		if getKeyState("mouse1") then
			setElementData(element, "mouseClick", false)
		end
	end
	for i = 0, 500 do
		local degree = (500 - i) / 500
		dxDrawRectangle( x+250+25, y + i*0.5, 20, 0.5, tocolor(math.floor((getElementData(element, "red") or setElementData(element, "red", 255)) * degree), math.floor((getElementData(element, "green") or setElementData(element, "green", 255)) * degree), math.floor((getElementData(element, "blue") or setElementData(element, "blue", 255)) * degree), design.alpha[2]*255), postGUI)
	end
	dxDrawRectangle(x+250+20, y + ( (getElementData(element, "darkness") or setElementData(element, "darkness", 0)) * 250 ), 30, 2, tocolor(255,255,255,design.alpha[2]*255), postGUI)
end

function dxDrawEdit(x, y, width, height, alpha, title, element, password, postGUI)
	if x and y and width and height and title and element then
		local cx, cy = 0, 0
		if isCursorShowing() then
			cx, cy = getCursorPosition()
		end
		cx, cy = cx*sX, cy*sY
		local text = getElementData(element, "text") or setElementData(element, "text", "")
		local enabled = getElementData(element, "enabled") or setElementData(element, "enabled", false)
		local tick = getElementData(element, "tick") or setElementData(element, "tick", getTickCount())
		dxDrawRectangle(x, y, width, height, tocolor(230,230,230,200*alpha), postGUI)
		if getKeyState("mouse1") then
			if cx >= x and cx <= x+width and cy >= y and cy <= y+height then
				setElementData(element, "enabled", true)
			else
				setElementData(element, "enabled", false)
			end
		end
		if getElementData(element, "enabled") then
			if ( getTickCount() - getElementData(element, "tick") >= 500 ) then
				if ( getTickCount() - getElementData(element, "tick") >= 1000 ) then
					setElementData(element, "tick", getTickCount())
				end
				dxDrawLine(x+5+dxGetTextWidth(password and getElementData(element, "text"):gsub(".","*") or getElementData(element, "text"), 0.5, segoeui), y+1, x+5+dxGetTextWidth(password and getElementData(element, "text"):gsub(".","*") or getElementData(element, "text"), 0.5, segoeui), y+height-2, tocolor(0,0,0,255*alpha), 1, postGUI)
			end
		end
		if #getElementData(element, "text") == 0 then
			dxDrawText(title, x+5+1, y+1, x+width-10, y+height-2, tocolor(100,100,100,255*alpha), 0.5, segoeui, "left", "center", true, false, postGUI, false)
		end
		dxDrawText(password and getElementData(element, "text"):gsub(".","•") or getElementData(element, "text"), x+5, y+1, x+width-10, y+height-2, tocolor(50,50,50,255*alpha), 0.5, segoeui, "left", "center", true, false, postGUI, false)
	else
		outputDebugString("ERROR: bad argument (dxDrawEdit)", 3, 255,0,0)
		return false
	end
end

function dxDrawButton(title, x, y, width, height, element, color, postGUI)
	if title and x and y and width and height and element and color then
		local cx, cy = 0, 0
		if isCursorShowing() then
			cx, cy = getCursorPosition()
		end
		cx, cy = cx*sX, cy*sY
		local alpha = string.format("%08X", color):sub(1,2)
		setElementData(element, "title", title)
		setElementData(element, "x", x)
		setElementData(element, "y", y)
		setElementData(element, "width", width)
		setElementData(element, "height", height)
		dxDrawRectangle(x, y, width, height, color, postGUI)
		dxDrawLine(x, y, x+width, y, tocolor(getColorFromString("#ffffff"..alpha)), 1, postGUI)
		dxDrawLine(x, y+height, x+width, y+height, tocolor(getColorFromString("#ffffff"..alpha)), 1, postGUI)
		dxDrawLine(x, y, x, y+height, tocolor(getColorFromString("#ffffff"..alpha)), 1, postGUI)
		dxDrawLine(x+width, y, x+width, y+height, tocolor(getColorFromString("#ffffff"..alpha)), 1, postGUI)
		if cx >= x and cx <= x+width and cy >= y and cy <= y+height then
			setElementData(element, "mouseEnter", true)
			if getKeyState("mouse1") then
				dxDrawRectangle(x, y, width, height, tocolor(255,255,255,100), postGUI)
			else
				dxDrawRectangle(x, y, width, height, tocolor(255,255,255,50), postGUI)
			end
		else
			setElementData(element, "mouseEnter", false)
		end
		dxDrawText(title, x+10, y+2, x+width-10, y+height, tocolor(getColorFromString("#000000"..alpha)), 1, "default-bold", "center", "center", true, false, postGUI, false)
		dxDrawText(title, x+10, y, x+width-10, y+height, tocolor(getColorFromString("#ffffff"..alpha)), 1, "default-bold", "center", "center", true, false, postGUI, false)
	else
		outputDebugString("ERROR: bad argument (dxDrawButton)", 3, 255,0,0)
		return false
	end
end

function dxDrawGridList(x, y, width, height, barCount, alpha, element, barList, postGUI, colorCoded)
	if x and y and width and height and element and barCount and barList then
		local cx, cy = 0, 0
		if isCursorShowing() then
			cx, cy = getCursorPosition()
		end
		cx, cy = cx*sX, cy*sY
		setElementData(element, "x", x)
		setElementData(element, "y", y)
		setElementData(element, "width", width)
		setElementData(element, "height", height)
		setElementData(element, "barCount", barCount)
		setElementData(element, "barList", barList)
		local scrollAlpha = getElementData(element, "scrollAlpha") or setElementData(element, "scrollAlpha", 100)
		local scrollOffset = getElementData(element, "scrollOffset") or setElementData(element, "scrollOffset", 0)
		local selected = getElementData(element, "selected") or setElementData(element, "selected", {0, ""})
		local barAttached = getElementData(element, "barAttached") or setElementData(element, "barAttached", { false, 0, ""})
		local barSize = height / barCount
		local scrollSpace = #barList > barCount and 11 or 0
		dxDrawRectangle(x, y, width-scrollSpace, height, tocolor(0,0,0,50*alpha), postGUI)
		if cx >= x and cx <= x+width and cy >= y and cy <= y+height then
			setElementData(element, "mouseEnter", true)
		else
			setElementData(element, "mouseEnter", false)
		end
		for id=1,#barList do
			if id > scrollOffset and id <= scrollOffset+barCount then
				local c = id - scrollOffset
				if cx >= x and cx <= x+width-scrollSpace and cy >= y+(c-1)*barSize and cy <= y+c*barSize-1 and not getElementData(element, "scrollAttached") then
					if getKeyState("mouse1") then
						dxDrawRectangle(x, y+(c-1)*barSize, width-scrollSpace, barSize, tocolor(255,255,255,50*alpha), postGUI)
						setElementData(element, "barAttached", { id, barList[id] or ""})
					else
						setElementData(element, "barAttached", { getElementData(element, "barAttached")[1], getElementData(element, "barAttached")[2] or ""})
						dxDrawRectangle(x, y+(c-1)*barSize, width-scrollSpace, barSize, tocolor(255,255,255,20*alpha), postGUI)
					end
				end
				if id == getElementData(element, "selected")[1] then
					dxDrawRectangle(x, y+(c-1)*barSize, width-scrollSpace, barSize, tocolor(255,176,0,50*alpha), postGUI)
				end
				dxDrawRectangle(x, y+(c-1)*barSize, width-scrollSpace, barSize, tocolor(0,0,0,(id % 2 == 0) and 50*alpha or 0), postGUI)
				dxDrawText(barList[id]:gsub("#%x%x%x%x%x%x", ""), x+15, y+2+(c-1)*barSize, x+width-scrollSpace-5, y+c*barSize, tocolor(0,0,0,255*alpha), 1, "default-bold", "left", "center", true, false, postGUI, false)
				dxDrawText(barList[id], x+15, y+(c-1)*barSize, x+width-scrollSpace-5, y+c*barSize, tocolor(255,255,255,255*alpha), 1, "default-bold", "left", "center", true, false, postGUI, colorCoded)
			end
		end
		if #barList > barCount then
			dxDrawRectangle(x+width-scrollSpace, y, 11, height, tocolor(0,0,0,75*alpha), postGUI)
			local size = barCount/#barList
			local a = scrollOffset/#barList
			setElementData(element, "scrollY", scrollOffset/(#barList-barCount))
			if getElementData(element, "scrollAttached") then
				local scrollAttachedOffset = getElementData(element, "scrollAttachedOffset")
				local scroll = math.min(1, math.max(0, ((cy-y-scrollAttachedOffset)/((1-size)*height))))
				setElementData(element, "scrollOffset", math.ceil(scroll*(#barList-barCount)))
			end
			dxDrawRectangle(x+width-scrollSpace+1, y+a*height+1, 11-2, size*height-2, tocolor(200,200,200,getElementData(element, "scrollAlpha")*alpha), postGUI)
		end
	else
		outputDebugString("ERROR: bad argument (dxDrawGridList)", 3, 255,0,0)
		return false
	end
end

bindKey("mouse_wheel_up", "down",
function()
	for id, element in ipairs(getElementsByType("gridlist")) do
		if getElementData(element, "mouseEnter") and not getElementData(element, "scrollAttached") then
			local scrollOffset = getElementData(element, "scrollOffset")
			scrollOffset = math.max(0, scrollOffset-1)
			setElementData(element, "scrollOffset", scrollOffset)
		end
	end
end)

bindKey("mouse_wheel_down", "down",
function()
	for id, element in ipairs(getElementsByType("gridlist")) do
		if getElementData(element, "mouseEnter") and not getElementData(element, "scrollAttached") then
			local barCount = getElementData(element, "barCount")
			local barList = getElementData(element, "barList")
			if #barList > barCount then
				local scrollOffset = getElementData(element, "scrollOffset")
				scrollOffset = math.min(scrollOffset+1, #barList-barCount)
				setElementData(element, "scrollOffset", scrollOffset)
			end
		end
	end
end)

addEventHandler("onClientClick", root,
function(button, state, cx, cy)
	if button == "left" then
		for id, element in ipairs(getElementsByType("gridlist")) do
			if getElementData(element, "mouseEnter") then
				local barCount = getElementData(element, "barCount")
				local barList = getElementData(element, "barList")
				if #barList > barCount then
					local x = getElementData(element, "x")
					local y = getElementData(element, "y")
					local width = getElementData(element, "width")
					local height = getElementData(element, "height")
					local scrollOffset = getElementData(element, "scrollOffset")
					local scrollAlpha = getElementData(element, "scrollAlpha")
					local scrollY = getElementData(element, "scrollY")
					local scrollSpace = #barList > barCount and 11 or 0
					local size = barCount/#barList
					local a = scrollOffset/#barList
					if state == "down" then
						if cx >= x+width-scrollSpace and cx <= x+width-scrollSpace+11 and cy >= y+a*height and cy <= y+a*height+size*height then
							setElementData(element, "scrollAlpha", 75)
							setElementData(element, "scrollAttached", true)
							local mouseOffset = y+scrollY*((1-size)*height)
							setElementData(element, "scrollAttachedOffset", cy-mouseOffset)
						end
					end
				end
				if state == "up" and not getElementData(element, "scrollAttached") then
					setElementData(element, "selected", { getElementData(element, "barAttached")[1], getElementData(element, "barAttached")[2] or "" })
					triggerEvent("onClientDXClick", element)
				end
			end
			if state == "up" then
				setElementData(element, "scrollAttached", false)
				setElementData(element, "scrollAlpha", 100)
			end
		end
		for id, element in ipairs(getElementsByType("button")) do
			if state == "down" then
				setElementData(element, "mouseEnter", false)
			elseif state == "up" then
				if getElementData(element, "mouseEnter") then
					triggerEvent("onClientDXClick", element)
				end
			end
		end
		local edit = 0
		for id, element in ipairs(getElementsByType("edit")) do
			if state == "up" then
				if getElementData(element, "enabled") then
					edit = edit + 1
				end
			end
		end
		if edit == 0 then
			guiSetInputEnabled(false)
			guiSetInputMode("allow_binds")
		else
			guiSetInputEnabled(true)
			guiSetInputMode ("no_binds")
		end
	end
end)

addEventHandler("onClientCharacter", root,
function(button)
	if isChatBoxInputActive() or isConsoleActive() or isMainMenuActive() then
		return
	end
	for id, element in ipairs(getElementsByType("edit")) do
		if getElementData(element, "enabled") then
			if #getElementData(element, "text") < 16 then
				setElementData(element, "text", getElementData(element, "text")..button)
			end
		end
	end
end)

addEventHandler("onClientKey", root,
function(button, press)
	if isChatBoxInputActive() or isConsoleActive() or isMainMenuActive() then
		return
	end
	if press and button == "backspace" then
		for id, element in ipairs(getElementsByType("edit")) do
			if getElementData(element, "enabled") then
				if #getElementData(element, "text") > 0 then
					setElementData(element, "text", string.sub(getElementData(element, "text"), 1, #getElementData(element, "text") - 1))
				end
			end
		end
	end
	if press and button == "tab" then
		local enabledID = false
		for id, element in ipairs(getElementsByType("edit")) do
			if getElementData(element, "enabled") then
				enabledID = id
			end
		end
		if enabledID then
			if isElement(getElementsByType("edit")[enabledID+1]) then
				setElementData(getElementsByType("edit")[enabledID], "enabled", false)
				setElementData(getElementsByType("edit")[enabledID+1], "enabled", true)
			else
				setElementData(getElementsByType("edit")[enabledID], "enabled", false)
				setElementData(getElementsByType("edit")[1], "enabled", true)
			end
		end
	end
end)

function dxDrawShadowText(text, x, y, width, height, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning)
	dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), x, y+scale, x+width, y+height, tocolor(getColorFromString("#000000"..string.format("%08X", color):sub(1,2))), scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning)
	dxDrawText(text, x, y, x+width, y+height, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning)
end

function getProgress(addtick, tick)
	local now = getTickCount()
	local elapsedTime = now - tick
	local duration = tick+addtick - tick
	local progress = elapsedTime / duration
	return progress
end

function drawCircle( x,y, radius, color )
    local numPoints = 45
    local step = math.pi * 2 / numPoints
    local sx,sy
    for p=0,numPoints do
        local ex = math.cos ( p * step ) * radius
        local ey = math.sin ( p * step ) * radius
        if sx then
            dxDrawLine( x+sx, y+sy, x+ex, y+ey, color, 1, true )
        end
        sx,sy = ex,ey
    end
end

function drawCircle( x,y, radius, color )
    local numPoints = 45
    local step = math.pi * 2 / numPoints
    local sx,sy
    for p=0,numPoints do
        local ex = math.cos ( p * step ) * radius
        local ey = math.sin ( p * step ) * radius
        if sx then
            dxDrawLine( x+sx, y+sy, x+ex, y+ey, color, 1, true )
        end
        sx,sy = ex,ey
    end
end

--[[bindKey("m", "down",
function()
	showCursor((isCursorShowing() == false) and true)
end)]]--

