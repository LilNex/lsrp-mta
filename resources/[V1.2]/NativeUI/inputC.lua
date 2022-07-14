
local screenW, screenH = guiGetScreenSize()

local isInputFieldShowing = false 

local title = ""

local type = 0

local element = createElement("FX_Msg_Login")

local inputType

addEvent("onInputEnter", true)

function ShowInputField(_title, _type, _inputStyle)
    if not isInputFieldShowing then 
        _inputStyle = tostring(_inputStyle) or "STRING"
    _type = tonumber(_type) or 0
    setElementData(element,"FX_Texto_Login","0")
    
     isInputFieldShowing = true
     title = _title
     inputType = _inputStyle
     addEventHandler("onClientRender", root,_render_)

     setElementData(element,"state",true)

     
    end
end

----------------

function HideInputField()

    _type =  0
    --destroyElement(element)
    
    isInputFieldShowing = false 
    title = ""
    removeEventHandler("onClientRender", root,_render_)

end

function GetInputFieldText()
return getElementData(element,"FX_Texto_Login") or ""
end



    function _render_()
        if type < 0 then 
        dxDrawRectangle(screenW * 0.1801, screenH * 0.3086, screenW * 0.5556, screenH * 0.4219, tocolor(0, 0, 0, 185), true)
        dxDrawText(title or "", screenW * 0.1859, screenH * 0.3112, screenW * 0.7284, screenH * 0.3763, tocolor(255, 255, 255, 255), 1.54, "default-bold", "left", "top", false, false, true, false, false)
        dxDrawEditBox("",screenW * 0.1874, screenH * 0.3789, screenW * 0.5410, screenH * 0.3281,false,150,element)
        else 
         dxDrawRectangle(screenW * 0.1801, screenH * 0.3086, screenW * 0.5556, screenH * 0.1536, tocolor(0, 0, 0, 185), true)
        dxDrawText(title or "", screenW * 0.1859, screenH * 0.3112, screenW * 0.7284, screenH * 0.3763, tocolor(255, 255, 255, 255), 1.54, "default-bold", "left", "top", false, false, true, false, false)
        dxDrawEditBox("",screenW * 0.1874, screenH * 0.3789, screenW * 0.5410, screenH * 0.0625,false,150,element)
        end
    end







--if isInputFieldShowing then


--end
























------------- DX ELEMENTS




local sx, sy = guiGetScreenSize()


function dxDrawEditBox(text, x, y, w, h, password, maxCharacter, element)
	local getText = getElementData(element, "FX_Texto_Login") or setElementData(element, "FX_Texto_Login", "")
	local state = getElementData(element, "state") or setElementData(element, "state", false)
	local character = getElementData(element, "maximum") or setElementData(element, "maximum", maxCharacter)
	dxDrawRectangle(x, y, w, h, tocolor(0, 0, 0, 180), true)
	if (#getElementData(element, "FX_Texto_Login") == 0) then
		dxDrawText(text, x + 5, y, x + w - 10, y + h, tocolor(255, 255, 255, 200), 1.4, "default-bold", "center", "top", false, true, true,true)
	end
	if (dxGetTextWidth(password and string.gsub(getElementData(element, "FX_Texto_Login"), ".", "•") or getElementData(element, "FX_Texto_Login"), 1, "default-bold") <= w - 10) then
		dxDrawText(password and string.gsub(getElementData(element, "FX_Texto_Login"), ".", "•") or getElementData(element, "FX_Texto_Login"), x + 5, y, x + w - 10, y + h, tocolor(255, 255, 255, 200), 1.4, "default-bold", "left", "top", false, true, true,true)
	else
		dxDrawText(password and string.gsub(getElementData(element, "FX_Texto_Login"), ".", "•") or getElementData(element, "FX_Texto_Login"), x + 5, y, x + w - 10, y + h, tocolor(255, 255, 255, 200), 1.4, "default-bold", "right", "top", false, true, true,true)
	end
	if (getElementData(element, "state") == true) then
		if (dxGetTextWidth(password and string.gsub(getElementData(element, "FX_Texto_Login"), ".", "•") or getElementData(element, "FX_Texto_Login"), 1.4, "default-bold") <= w - 10) then
			dxDrawLine(x + 5 + dxGetTextWidth(password and string.gsub(getElementData(element, "FX_Texto_Login"), ".", "•") or getElementData(element, "FX_Texto_Login"), 1.4, "default-bold"), y + 5, x + 5 + dxGetTextWidth(password and string.gsub(getElementData(element, "FX_Texto_Login"), ".", "•") or getElementData(element, "FX_Texto_Login"), 1.4, "default-bold"), y + h - 25, tocolor(255, 255, 255, math.abs(math.sin(getTickCount() / 255) * 255)), 1.4, true)
		else
			dxDrawLine(x + w - 10, y + 5, x + w - 10, y + h - 5, tocolor(255, 255, 255, math.abs(math.sin(getTickCount() / 255) * 255)), 1, true)
		end
	end
	if (isCursorOnElement(x, y, w, h)) then
		setElementData(element, "mouseState", "hovered")
	else
		setElementData(element, "mouseState", "normal")
	end
end

function dxClickElement(button, state, cx, cy)
	if (button == "left") and (state == "down") then
		local buttonId = false
		for id, element in ipairs(getElementsByType("dxButton")) do
			if (getElementData(element, "mouseState") == "hovered") then
				buttonId = id
			end
		end
		if (buttonId) then
			if (isElement(getElementsByType("dxButton")[buttonId])) then
				setElementData(getElementsByType("dxButton")[buttonId], "mouseState", "clicked")
				triggerEvent("onClickButton", getElementsByType("dxButton")[buttonId])
			end
		end
	end
	if (button == "left") and (state == "down") then
		local editBoxId = false
		for id, element in ipairs(getElementsByType("FX_Msg_Login")) do
			if (getElementData(element, "mouseState") == "hovered") then
				editBoxId = id
			elseif (getElementData(element, "mouseState") == "normal") then
				if (getElementData(element, "state") == true) then
					guiSetInputMode("allow_binds")
					setElementData(element, "state", false)
				end
			end
		end
		if (editBoxId) then
			if (isElement(getElementsByType("FX_Msg_Login")[editBoxId])) then
				if (getElementData(getElementsByType("FX_Msg_Login")[editBoxId], "state") == false) then
					guiSetInputMode("no_binds")
					setElementData(getElementsByType("FX_Msg_Login")[editBoxId], "state", true)
				end
			end
		end
	end
	if (button == "left") and (state == "down") then
		local checkBoxId = false
		for id, element in ipairs(getElementsByType("dxCheckBox")) do
			if (getElementData(element, "mouseState") == "hovered") then
				checkBoxId = id
			end
		end
		if (checkBoxId) then
			if (isElement(getElementsByType("dxCheckBox")[checkBoxId])) then
				if (getElementData(getElementsByType("dxCheckBox")[checkBoxId], "state") == true) then
					setElementData(getElementsByType("dxCheckBox")[checkBoxId], "state", false)
				else
					setElementData(getElementsByType("dxCheckBox")[checkBoxId], "state", true)
				end
			end
		end
	end
	if (button == "left") then
		for _, element in ipairs(getElementsByType("dxGridList")) do
			if (getElementData(element, "mouseState") == "hovered") then
				local barCount = getElementData(element, "barCount")
				local barList = getElementData(element, "barList")
				if (#barList > barCount) then
					local x = getElementData(element, "x")
					local y = getElementData(element, "y")
					local w = getElementData(element, "w")
					local h = getElementData(element, "h")
					local scrollOffset = getElementData(element, "scrollOffset")
					local scrollY = getElementData(element, "scrollY")
					local scrollSpace = #barList > barCount and 11 or 0
					local size = barCount / #barList
					local scrollList = scrollOffset / #barList
					if (state == "down") then
						if (cx >= x + w - scrollSpace) and (cx <= x + w - scrollSpace + 3) and (cy >= y + scrollList * h) and (cy <= y + scrollList * h + size * h) then
							setElementData(element, "scrollAlpha", 255)
							setElementData(element, "scrollAttached", true)
							local mouseOffset = y + scrollY * (1 - size) * h
							setElementData(element, "scrollAttachedOffset", cy - mouseOffset)
						end
					end
				end
				if (state == "up") and not (getElementData(element, "scrollAttached")) then
					setElementData(element, "selected", {getElementData(element, "barAttached")[1], getElementData(element, "barAttached")[2] or ""})
					triggerEvent("loginClick", element)
				end
			end
			if (state == "up") then
				setElementData(element, "scrollAttached", false)
				setElementData(element, "scrollAlpha", 150)
			end
		end
	end
end
addEventHandler("onClientClick", getRootElement(), dxClickElement)

function dxCharacterElement(button)
	if (isChatBoxInputActive()) or (isConsoleActive()) or (isMainMenuActive()) then
		return
	end
	for _, element in ipairs(getElementsByType("FX_Msg_Login")) do
        if (getElementData(element, "state") == true) then
            if inputType == "STRING" then 
			if (#getElementData(element, "FX_Texto_Login") < getElementData(element, "maximum")) then
				setElementData(element, "FX_Texto_Login", getElementData(element, "FX_Texto_Login"))
            end
        elseif inputType == "NUMBER" then
            if tonumber(button) then 
            if (#getElementData(element, "FX_Texto_Login") < getElementData(element, "maximum")) then
				setElementData(element, "FX_Texto_Login", getElementData(element, "FX_Texto_Login"))
            end
        end
        end
		end
	end
end
addEventHandler("onClientCharacter", getRootElement(), dxCharacterElement)

function dxKeyElement(button, press)
	if (isChatBoxInputActive()) or (isConsoleActive()) or (isMainMenuActive()) then
		return
	end
	if (press) and (button == "backspace") then
		for _, element in ipairs(getElementsByType("FX_Msg_Login")) do
			if (getElementData(element, "state") == true) then
				if (#getElementData(element, "FX_Texto_Login") > 0) then
					setElementData(element, "FX_Texto_Login", string.sub(getElementData(element, "FX_Texto_Login"), 1, #getElementData(element, "FX_Texto_Login")))
				end
			end
        end
    elseif (press) and (button == "enter") then 

        triggerEvent("onInputEnter", localPlayer,getElementData(element, "FX_Texto_Login") or "")

	end
end
addEventHandler("onClientKey", getRootElement(), dxKeyElement)

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end
	return false
end

function isCursorOnElement(x, y, w, h)
	local mx, my = getCursorPosition()
	local fullx, fully = guiGetScreenSize()
	cursorx, cursory = mx * fullx, my * fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
    end
end
