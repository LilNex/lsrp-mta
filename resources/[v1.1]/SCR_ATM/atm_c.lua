

local screenW, screenH = guiGetScreenSize() 
local atmp = false
local closeatm = tocolor(255, 255, 255, 255)
local btn1 = tocolor(255, 255, 255, 255)
local dxfont0_font = dxCreateFont(":lsimage/img/font.ttf", 10)
local dxfont1_VA = dxCreateFont(":lsimage/img/VA.ttf", 13)
local dxfont2_VA = dxCreateFont(":lsimage/img/VA.ttf", 10)
local screenW, screenH = guiGetScreenSize()
local effect1 = tocolor(0, 0, 0, 254)

local effect2 = tocolor(0, 0, 0, 254)
local effect3 = tocolor(0, 0, 0, 254)
local effect4 = tocolor(255, 255, 255, 255)

function getWindowPosition (w, h)
    local sw, sh= guiGetScreenSize()
    local x = (sw / 2) - (w/2)
    local y = (sh / 2) - (h/2)

    return x,y,w,h
end


function clickObject(button, state, absX, absY, wx, wy, wz, element)

	if (element) and (getElementType(element)=="object") and (button=="right") and (state=="down") then --if it's a right-click on a object

		local model = getElementModel(element)

		if(model == 2942) then -- 
		local isStaff = exports.integration:isPlayerTrialAdmin(localPlayer)
		local Dutyadmin = getElementData( localPlayer,"duty_admin" )
		local on = 1
		local off = 0
			Menu = exports.rightclick:create("Menu")

			local openwindow = exports.rightclick:addRow("Open Panel")
            addEventHandler("onClientGUIClick", openwindow,function()
			openwtr()
			--setElementData(root, "Robbing", false)
            end)
			if isStaff then
			if Dutyadmin == on then
			local deleteObject = exports.rightclick:addRow("ADM: Delete Object")
			addEventHandler("onClientGUIClick", deleteObject,  function () --define what happens when user clicks the row
                triggerServerEvent("Mk", element)

			end, true)
	end
	end
	end
	Watercoller = element 
end	
end
addEventHandler("onClientClick", getRootElement(), clickObject, true)


function openwtr() 
    atmp = true
end


addEventHandler("onClientRender", root,
    function()
		local name = getPlayerName (localPlayer)
	    if (atmp) then
		showCursor(true)
		setElementFrozen(localPlayer, true)
		dxDrawImage(screenW * 0.4012, screenH * 0.3568, screenW * 0.1896, screenH * 0.2448, ":lsimage/img/background.png", 0, 0, 0, tocolor(13, 13, 13, 235), false)
        dxDrawImage(screenW * 0.4012, screenH * 0.3568, screenW * 0.1911, screenH * 0.0339, ":lsimage/img/button.png", 0, 0, 0, tocolor(0, 0, 0, 235), false)
        dxDrawLine(screenW * 0.4012, screenH * 0.3906, screenW * 0.5908, screenH * 0.3906, tocolor(78, 162, 234, 235), 2, false)
        dxDrawImage(screenW * 0.4048, screenH * 0.3984, screenW * 0.1830, screenH * 0.0560, ":lsimage/img/background.png", 0, 0, 0, tocolor(0, 0, 0, 254), false)
        dxDrawRectangle(screenW * 0.4048, screenH * 0.4245, screenW * 0.1830, screenH * 0.0299, effect1, false)
        dxDrawLine(screenW * 0.4048, screenH * 0.4245, screenW * 0.5878, screenH * 0.4245, tocolor(116, 116, 116, 254), 1, false)
        dxDrawLine(screenW * 0.4048, screenH * 0.4544, screenW * 0.5878, screenH * 0.4544, tocolor(116, 116, 116, 254), 1, false)
        dxDrawText("ATM - SYSTEM , BETA", screenW * 0.4012, screenH * 0.3581, screenW * 0.4846, screenH * 0.3906, tocolor(255, 255, 255, 255), 1.00, dxfont0_font, "center", "center", false, false, false, false, false)
        dxDrawText("Name", screenW * 0.4122, screenH * 0.3997, screenW * 0.4363, screenH * 0.4245, tocolor(255, 255, 255, 255), 1.00, dxfont1_VA, "left", "top", false, false, false, false, false)
        dxDrawText("".. name, screenW * 0.4122, screenH * 0.4245, screenW * 0.5110, screenH * 0.4544, tocolor(255, 255, 255, 255), 1.00, dxfont1_VA, "left", "top", false, false, false, false, false) -- cHARACTER NAME
        dxDrawImage(screenW * 0.4568, screenH * 0.5052, screenW * 0.0710, screenH * 0.0312, ":lsimage/img/button.png", 0, 0, 0, effect2, false)
        dxDrawImage(screenW * 0.4568, screenH * 0.5495, screenW * 0.0710, screenH * 0.0312, ":lsimage/img/button.png", 0, 0, 0, effect3, false)
        dxDrawText("Withdraw  500$", screenW * 0.4561, screenH * 0.5052, screenW * 0.5278, screenH * 0.5365, tocolor(255, 255, 255, 255), 1.00, dxfont2_VA, "center", "center", false, false, false, false, false)
        dxDrawText("Rob", screenW * 0.4561, screenH * 0.5495, screenW * 0.5278, screenH * 0.5807, tocolor(255, 255, 255, 255), 1.00, dxfont2_VA, "center", "center", false, false, false, false, false)
        dxDrawText("X", screenW * 0.5732, screenH * 0.3568, screenW * 0.5908, screenH * 0.3906, effect4, 1.00, "default-bold", "center", "center", false, false, false, false, false)

        
        if isInSlot(screenW * 0.4048, screenH * 0.4245, screenW * 0.1830, screenH * 0.0299) then
            effect1 = tocolor(47, 47, 47, 254)
        else
            effect1 = tocolor(0, 0, 0, 254)
        end

		if isInSlot(screenW * 0.4568, screenH * 0.5052, screenW * 0.0710, screenH * 0.0312) then
		    effect2 = tocolor(78, 162, 234, 235)
		else
		    effect2 = tocolor(0, 0, 0, 254)
		end
		if isInSlot(screenW * 0.4568, screenH * 0.5495, screenW * 0.0710, screenH * 0.0312) then
		    effect3 = tocolor(78, 162, 234, 235)
		else
		    effect3 = tocolor(0, 0, 0, 254)
		end
		if isInSlot(screenW * 0.5732, screenH * 0.3568, screenW * 0.5908, screenH * 0.3906) then
		    effect4 = tocolor(78, 162, 234, 235)
		else
		    effect4 = tocolor(255, 255, 255, 255)
		end
		
		end
	end
)

function CC(b,s)
    if (b == "mouse1") then
        if (s) then
            -----------------------------------------------------------------------------------------------
            if (atmp) then
                if isInSlot(screenW * 0.5732, screenH * 0.3568, screenW * 0.5908, screenH * 0.3906) then
				    atmp = false
					setElementFrozen(localPlayer, false)
					showCursor(false)
                end	
                if isInSlot(screenW * 0.4568, screenH * 0.5052, screenW * 0.0710, screenH * 0.0312) then -- buy
					local amount = 500
				    if getElementData(localPlayer, "bankmoney") >= amount then
				        triggerServerEvent("withdraw", localPlayer)
						atmp = false
						setElementFrozen(localPlayer, false)
						showCursor(false)
					else
						--outputChatBox("Error")
                        exports["SCR_Notifs"]:show_box("You don't have money on your bank account.", "error")	
						showCursor(false)				
					end	
                end	
                if isInSlot(screenW * 0.4568, screenH * 0.5495, screenW * 0.0710, screenH * 0.0312) then -- buy
					--local amount = 500
				    if (getElementData(getPlayerTeam(localPlayer), "type")) == 0 or (getElementData(getPlayerTeam(localPlayer), "type")) == 1 then
						triggerServerEvent("rob", localPlayer)
						atmp = false
						showCursor(false)
					else
						--outputChatBox("Faction Error")
                        exports["SCR_Notifs"]:show_box("You are not a gang membre.", "error")
						showCursor(false)					
					end	
                end	
				
				
            end
            	
        end
    end
end
addEventHandler("onClientKey", root, CC)





function isInSlot(xS,yS,wS,hS)
	if(isCursorShowing()) then
		XY = {guiGetScreenSize()}
		local cursorX, cursorY = getCursorPosition()
		cursorX, cursorY = cursorX*XY[1], cursorY*XY[2]
		if (isInBox(xS,yS,wS,hS, cursorX, cursorY)) then
			return true
		else
			return false
		end
	end	
end
function isInBox(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end
