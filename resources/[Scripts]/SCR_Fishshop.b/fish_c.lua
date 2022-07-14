local screenW, screenH = guiGetScreenSize()

local fdshoppanelshowing7 = false

local pedx, pedz, pedy = 2287.703125, -2397.109375, 13.546875

local fdshopped4 = createPed(160, pedx, pedz, pedy)

setElementData(fdshopped4, "nametag", true)

setPedRotation(fdshopped4, 313.80)

setElementDimension(fdshopped4, 0)

setElementInterior(fdshopped4, 0)

setElementFrozen(fdshopped4, true)

area = createColRectangle( 2288.201171875, -2396.6162109375, 13.546875, 3)



--local dxfont0_DarkFn2 = dxCreateFont(":dark_image/img/DarkFn2.ttf", 10)

local screenW, screenH = guiGetScreenSize()



local closebtnf1clrs = tocolor(255, 255, 255, 255)

addEventHandler("onClientRender", root,

function()

	if (fdshoppanelshowing7) then

        dxDrawRectangle(screenW * 0.2855, screenH * 0.2578, screenW * 0.4239, screenH * 0.4492, tocolor(0, 0, 0, 125), false)

        dxDrawRectangle(screenW * 0.4978, screenH * 0.2591, screenW * 0.2116, screenH * 0.4479, tocolor(0, 0, 0, 43), false)

        dxDrawLine(screenW * 0.2855, screenH * 0.2578, screenW * 0.2855, screenH * 0.7057, tocolor(45, 191, 247, 255), 3, false)

        dxDrawLine(screenW * 0.7094, screenH * 0.2591, screenW * 0.7094, screenH * 0.7070, tocolor(45, 191, 247, 255), 3, false)

        dxDrawRectangle(screenW * 0.3141, screenH * 0.3177, screenW * 0.1486, screenH * 0.3385, tocolor(0, 0, 0, 156), false)

        dxDrawRectangle(screenW * 0.5322, screenH * 0.3177, screenW * 0.1486, screenH * 0.3385, tocolor(0, 0, 0, 156), false)

        dxDrawLine(screenW * 0.3141, screenH * 0.3177, screenW * 0.4627, screenH * 0.3177, tocolor(45, 175, 241, 255), 2, false)

        dxDrawLine(screenW * 0.5322, screenH * 0.3177, screenW * 0.6808, screenH * 0.3177, tocolor(45, 150, 255, 255), 2, false)

        dxDrawImage(screenW * 0.3302, screenH * 0.5951, screenW * 0.1157, screenH * 0.0482, ":dark_image/img/hk_shape2.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.5476, screenH * 0.5951, screenW * 0.1157, screenH * 0.0482, ":dark_image/img/hk_shape2.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.3389, screenH * 0.3542, screenW * 0.0952, screenH * 0.1237, ":dark_image/img/fish.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawImage(screenW * 0.5761, screenH * 0.3516, screenW * 0.0703, screenH * 0.1263, ":dark_image/img/doud.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText(" Name: ", screenW * 0.3543, screenH * 0.4909, screenW * 0.4700, screenH * 0.5260, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" Fish Rod", screenW * 0.3821, screenH * 0.4909, screenW * 0.4978, screenH * 0.5260, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" Description: ", screenW * 0.3316, screenH * 0.5130, screenW * 0.4473, screenH * 0.5482, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" You can use for ", screenW * 0.3858, screenH * 0.5130, screenW * 0.5015, screenH * 0.5482, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" Fishing", screenW * 0.3660, screenH * 0.5352, screenW * 0.4817, screenH * 0.5703, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" For : 30$", screenW * 0.3660, screenH * 0.5573, screenW * 0.4817, screenH * 0.5924, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" ● 『Buy』 ●", screenW * 0.3660, screenH * 0.6055, screenW * 0.4817, screenH * 0.6406, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawRectangle(screenW * 0.2379, screenH * 0.1563, screenW * 0.5417, screenH * 0.0755, tocolor(0, 0, 0, 176), false)

        dxDrawText(" Name: ", screenW * 0.5864, screenH * 0.4909, screenW * 0.7020, screenH * 0.5260, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" Doud", screenW * 0.6142, screenH * 0.4909, screenW * 0.7299, screenH * 0.5260, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" Description: ", screenW * 0.5578, screenH * 0.5130, screenW * 0.6735, screenH * 0.5482, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" You can use for ", screenW * 0.6098, screenH * 0.5130, screenW * 0.7255, screenH * 0.5482, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" Fishing", screenW * 0.5937, screenH * 0.5378, screenW * 0.7094, screenH * 0.5729, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" For : 50$", screenW * 0.5900, screenH * 0.5599, screenW * 0.7057, screenH * 0.5951, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" ● 『Buy』 ●", screenW * 0.5864, screenH * 0.6081, screenW * 0.7020, screenH * 0.6432, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawRectangle(screenW * 0.4949, screenH * 0.1563, screenW * 0.2848, screenH * 0.0755, tocolor(255, 255, 255, 6), false)

        dxDrawLine(screenW * 0.2372, screenH * 0.1549, screenW * 0.2372, screenH * 0.2318, tocolor(45, 175, 241, 255), 2, false)

        dxDrawLine(screenW * 0.7796, screenH * 0.1563, screenW * 0.7796, screenH * 0.2331, tocolor(45, 175, 241, 255), 2, false)

        dxDrawText("●                   ", screenW * 0.3411, screenH * 0.1732, screenW * 0.5322, screenH * 0.2461, tocolor(45, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)
  
        dxDrawText("   Los Santos Roleplay -  ", screenW * 0.3411, screenH * 0.1732, screenW * 0.5322, screenH * 0.2461, tocolor(255, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)

        dxDrawText("     FishShop Panel ●", screenW * 0.5183, screenH * 0.1732, screenW * 0.7094, screenH * 0.2461, tocolor(45, 175, 241, 255), 2.00, "default", "left", "top", false, false, false, false, false)

        dxDrawText("X", screenW * 0.6881, screenH * 0.2708, screenW * 0.7086, screenH * 0.3021, tocolor(255, 255, 255, 255), 1.30, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("All Rights Reserved To", screenW * 0.3858, screenH * 0.6797, screenW * 0.5249, screenH * 0.7070, tocolor(45, 255, 255, 21), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("J.Smith v1.8", screenW * 0.4817, screenH * 0.6797, screenW * 0.6208, screenH * 0.7070, tocolor(45, 183, 247, 21), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        --- dxDrawRectangle(screenW * 0.6603, screenH * 0.1875, screenW * 0.0183, screenH * 0.0326, tocolor(255, 255, 255, 255), false)

    	if isInSlot(screenW * 0.6837, screenH * 0.2227, screenW * 0.7138, screenH * 0.2734) then

		    closebtnf1clrs = tocolor(254, 106, 79, 255)

		else

		    closebtnf1clrs = tocolor(255, 255, 255, 255)

		end

	end

end

)





function clickHandler(button, state, x, y, wx, wy, wz, ped)

	if (button == "left" and state == "down") then

		if ped and isElement(ped) and ped == fdshopped4  then

            fdshoppanelshowing7 = true
			
			setElementFrozen(localPlayer, true)

		end

	end

end

addEventHandler("onClientClick", getRootElement(), clickHandler)



function teszt(b,s)

    if (b == "mouse1") then

        if (s) then

            -----------------------------------------------------------------------------------------------

            if (fdshoppanelshowing7) then

                if isInSlot(screenW * 0.6881, screenH * 0.2708, screenW * 0.7086, screenH * 0.3021) or not isElementWithinColShape(localPlayer,area) then

				    fdshoppanelshowing7 = false

                end		

                if isInSlot(screenW * 0.3302, screenH * 0.5951, screenW * 0.1157, screenH * 0.0482) or not isElementWithinColShape(localPlayer,area) then

				    if getElementData(localPlayer, "money") >= 30 then

				    triggerServerEvent("spc1", localPlayer)
					
					setElementFrozen(localPlayer, false)
						

					else

	                    exports.SCR_Info:addNotification("You don't enought money ","info")			

					end	

                end		

                if isInSlot(screenW * 0.5476, screenH * 0.5951, screenW * 0.1157, screenH * 0.0482) or not isElementWithinColShape(localPlayer,area) then
			

				    if getElementData(localPlayer, "money") >= 50 then

					triggerServerEvent("spc2", localPlayer)
					
					setElementFrozen(localPlayer, false)

					else

	                    exports.SCR_Info:addNotification("You don't enought money ","info")				

					end						

                end			

            end

            -----------------------------------------------------------------------------------------------			       
		
		end					
    end
	

end

addEventHandler("onClientKey", root, teszt)





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