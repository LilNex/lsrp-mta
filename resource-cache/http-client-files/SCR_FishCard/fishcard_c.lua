local screenW, screenH = guiGetScreenSize()

local IdCardpanelshowing = false

local hkpedx, hkpedz, hkpedy = 2310.3349609375, -2377.056640625, 13.88413143158

local IdCardPed = createPed(185, hkpedx, hkpedz, hkpedy)

setPedRotation(IdCardPed,  40.586)

setElementDimension(IdCardPed, 0)

setElementInterior(IdCardPed, 0)

setElementFrozen(IdCardPed, true)



local closebtnf1clr = tocolor(255, 255, 255, 255)

addEventHandler("onClientRender", root,

function()

	if (IdCardpanelshowing) then

        dxDrawRectangle(screenW * 0.3777, screenH * 0.2292, screenW * 0.2357, screenH * 0.5286, tocolor(0, 0, 0, 197), false)

        dxDrawRectangle(screenW * 0.4949, screenH * 0.2292, screenW * 0.1186, screenH * 0.5286, tocolor(0, 0, 0, 148), false)

        dxDrawLine(screenW * 0.3785, screenH * 0.2292, screenW * 0.6135, screenH * 0.2292, tocolor(45, 160, 224, 255), 2, false)

        dxDrawImage(screenW * 0.4546, screenH * 0.2474, screenW * 0.0900, screenH * 0.1823, ":dark_image/img/card.png", 0, 0, 0, tocolor(45, 255, 255, 255), false)

        dxDrawImage(screenW * 0.4319, screenH * 0.6081, screenW * 0.1340, screenH * 0.0547, ":dark_image/img/hk_shape2.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)

        dxDrawImage(screenW * 0.4319, screenH * 0.6849, screenW * 0.1340, screenH * 0.0547, ":dark_image/img/hk_shape2.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)

        dxDrawImage(screenW * 0.4392, screenH * 0.5951, screenW * 0.1340, screenH * 0.0547, ":dark_image/img/hk_shape2.png", 0, 0, 0, tocolor(45, 160, 224, 255), false)

        dxDrawImage(screenW * 0.4392, screenH * 0.6719, screenW * 0.1340, screenH * 0.0547, ":dark_image/img/hk_shape2.png", 0, 0, 0, tocolor(45, 160, 224, 255), false)

        dxDrawLine(screenW * 0.3777, screenH * 0.7578, screenW * 0.6127, screenH * 0.7578, tocolor(45, 160, 224, 255), 2, false)

        dxDrawText("Buy >", screenW * 0.5447, screenH * 0.6107, screenW * 0.6098, screenH * 0.6497, tocolor(45, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("< Close Panel", screenW * 0.4466, screenH * 0.6875, screenW * 0.5117, screenH * 0.7266, tocolor(45, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("* Los Santos RP | Fishing Card Panel *", screenW * 0.4319, screenH * 0.4349, screenW * 0.6245, screenH * 0.4727, tocolor(40, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText(" Now you can fishing", screenW * 0.4619, screenH * 0.4661, screenW * 0.6545, screenH * 0.5039, tocolor(255, 255, 224, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Without any issuess", screenW * 0.4656, screenH * 0.4961, screenW * 0.6581, screenH * 0.5339, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("You can sell fish with -30% , For 5000$", screenW * 0.4283, screenH * 0.5273, screenW * 0.6208, screenH * 0.5651, tocolor(40, 160, 224, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        --dxDrawRectangle(screenW * 0.4334, screenH * 0.6341, screenW * 0.1413, screenH * 0.0417, tocolor(255, 255, 255, 255), false)

       -- dxDrawRectangle(screenW * 0.4334, screenH * 0.6888, screenW * 0.1413, screenH * 0.0417, tocolor(255, 255, 255, 255), false)

    	if isInSlot(screenW * 0.5886, screenH * 0.3190, screenW * 0.0183, screenH * 0.0313) then

		    closebtnf1clr = tocolor(254, 106, 79, 255)

		else

		    closebtnf1clr = tocolor(255, 255, 255, 255)

		end

	end

end

)





function clickHandler(button, state, x, y, wx, wy, wz, ped)

	if (button == "left" and state == "down") then

		if ped and isElement(ped) and ped == IdCardPed then

            IdCardpanelshowing = true

			setElementFrozen(localPlayer, true)

		end

	end

end

addEventHandler("onClientClick", getRootElement(), clickHandler)



function teszt(b,s)

    if (b == "mouse1") then

        if (s) then

            -----------------------------------------------------------------------------------------------

            if (IdCardpanelshowing) then

                if isInSlot(screenW * 0.4392, screenH * 0.6719, screenW * 0.1340, screenH * 0.0547) then

				    IdCardpanelshowing = false

					setElementFrozen(localPlayer, false)

                end	

                if isInSlot(screenW * 0.4392, screenH * 0.5951, screenW * 0.1340, screenH * 0.0547) then

					if getElementData(localPlayer, "money") > 5000 then

					    triggerServerEvent("sBuyPasseport1", localPlayer)

						IdCardpanelshowing = false

						setElementFrozen(localPlayer, false)

					else

	                exports.SCR_Info:addNotification("You don't have money","info",5000)

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