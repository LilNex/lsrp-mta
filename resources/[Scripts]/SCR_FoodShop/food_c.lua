

--[[ 

 

       Los Santos Roleplay ;

	   Script Name : Food Shop

	   Created By : ClegaryStriZex

	   Time : 17 / 3 / 2020 ------ Hour : 15 : 29

	]]--





local screenW, screenH = guiGetScreenSize()

local fdshoppanelshowing = false

local Sxpedx, Sxpedz, Sxpedy = 1915.7578125, -1776.9501953125, 13.546875

local fdshopped = createPed(33, Sxpedx, Sxpedz, Sxpedy)

setPedRotation(fdshopped, 268) --93

setElementDimension(fdshopped, 0)

setElementInterior(fdshopped, 0)

setElementFrozen(fdshopped, true)



local closebtnf1clr = tocolor(255, 255, 255, 255)

addEventHandler("onClientRender", root,

function()

	if (fdshoppanelshowing) then

        dxDrawRectangle(screenW * 0.3426, screenH * 0.1393, screenW * 0.3089, screenH * 0.7057, tocolor(0, 0, 0, 182), false)

        dxDrawRectangle(screenW * 0.4963, screenH * 0.1393, screenW * 0.1552, screenH * 0.7057, tocolor(0, 0, 0, 51), false)

        dxDrawLine(screenW * 0.3419, screenH * 0.1380, screenW * 0.6515, screenH * 0.1380, tocolor(249, 171, 230, 255), 3, false)

        dxDrawImage(screenW * 0.4502, screenH * 0.1016, screenW * 0.1018, screenH * 0.1849, ":dark_image/img/UlogoW.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Welcome To Los Santos Roleplay Food Shop Panel", screenW * 0.4034, screenH * 0.2487, screenW * 0.6120, screenH * 0.2865, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Click To", screenW * 0.4392, screenH * 0.2734, screenW * 0.6479, screenH * 0.3112, tocolor(249, 171, 230, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Shopping Basket ", screenW * 0.4736, screenH * 0.2734, screenW * 0.6823, screenH * 0.3112, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("To buy", screenW * 0.5447, screenH * 0.2734, screenW * 0.7533, screenH * 0.3112, tocolor(249, 171, 230, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawRectangle(screenW * 0.3580, screenH * 0.3268, screenW * 0.2804, screenH * 0.0573, tocolor(0, 0, 0, 157), false)

        dxDrawRectangle(screenW * 0.3580, screenH * 0.3971, screenW * 0.2804, screenH * 0.0573, tocolor(0, 0, 0, 157), false)

        dxDrawRectangle(screenW * 0.3580, screenH * 0.4727, screenW * 0.2804, screenH * 0.0573, tocolor(0, 0, 0, 157), false)

        dxDrawRectangle(screenW * 0.3580, screenH * 0.5521, screenW * 0.2804, screenH * 0.0573, tocolor(0, 0, 0, 157), false)

        dxDrawRectangle(screenW * 0.3580, screenH * 0.6302, screenW * 0.2804, screenH * 0.0573, tocolor(0, 0, 0, 157), false)

        dxDrawRectangle(screenW * 0.3580, screenH * 0.7083, screenW * 0.2804, screenH * 0.0573, tocolor(0, 0, 0, 157), false)

        dxDrawLine(screenW * 0.3565, screenH * 0.3281, screenW * 0.3565, screenH * 0.3815, tocolor(252, 169, 206, 255), 2, false)

        dxDrawLine(screenW * 0.3580, screenH * 0.3971, screenW * 0.3580, screenH * 0.4505, tocolor(252, 169, 206, 255), 2, false)

        dxDrawLine(screenW * 0.3580, screenH * 0.4727, screenW * 0.3580, screenH * 0.5260, tocolor(252, 169, 206, 255), 2, false)

        dxDrawLine(screenW * 0.3580, screenH * 0.5521, screenW * 0.3580, screenH * 0.6055, tocolor(252, 169, 206, 255), 2, false)

        dxDrawLine(screenW * 0.3580, screenH * 0.6302, screenW * 0.3580, screenH * 0.6836, tocolor(252, 169, 206, 255), 2, false)

        dxDrawLine(screenW * 0.3580, screenH * 0.7083, screenW * 0.3580, screenH * 0.7617, tocolor(252, 169, 206, 255), 2, false)

        dxDrawLine(screenW * 0.6384, screenH * 0.3268, screenW * 0.6384, screenH * 0.3802, tocolor(254, 255, 254, 255), 2, false)

        dxDrawLine(screenW * 0.6384, screenH * 0.3971, screenW * 0.6384, screenH * 0.4505, tocolor(254, 255, 254, 255), 2, false)

        dxDrawLine(screenW * 0.6384, screenH * 0.4766, screenW * 0.6384, screenH * 0.5299, tocolor(254, 255, 254, 255), 2, false)

        dxDrawLine(screenW * 0.6384, screenH * 0.5521, screenW * 0.6384, screenH * 0.6055, tocolor(254, 255, 254, 255), 2, false)

        dxDrawLine(screenW * 0.6384, screenH * 0.6302, screenW * 0.6384, screenH * 0.6836, tocolor(254, 255, 254, 255), 2, false)

        dxDrawLine(screenW * 0.6384, screenH * 0.7122, screenW * 0.6384, screenH * 0.7656, tocolor(254, 255, 254, 255), 2, false)

        dxDrawImage(screenW * 0.3638, screenH * 0.3281, screenW * 0.0322, screenH * 0.0547, ":item-system/images/11.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", 544, 252, 605, 270, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Taco", screenW * 0.4290, screenH * 0.3281, screenW * 0.4736, screenH * 0.3516, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.3982, screenH * 0.3516, screenW * 0.4429, screenH * 0.3750, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("45 $", screenW * 0.4261, screenH * 0.3516, screenW * 0.4707, screenH * 0.3750, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Quantity :", screenW * 0.4736, screenH * 0.3411, screenW * 0.5183, screenH * 0.3646, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5146, screenH * 0.3411, screenW * 0.5593, screenH * 0.3646, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.3638, screenH * 0.3984, screenW * 0.0322, screenH * 0.0521, ":item-system/images/12.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", 544, 306, 605, 324, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Burger", screenW * 0.4290, screenH * 0.3984, screenW * 0.4736, screenH * 0.4219, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.3982, screenH * 0.4219, screenW * 0.4429, screenH * 0.4453, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("50 $", screenW * 0.4290, screenH * 0.4219, screenW * 0.4736, screenH * 0.4453, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Quantity :", screenW * 0.4736, screenH * 0.4089, screenW * 0.5183, screenH * 0.4323, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5146, screenH * 0.4089, screenW * 0.5593, screenH * 0.4323, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.3653, screenH * 0.4727, screenW * 0.0307, screenH * 0.0534, ":item-system/images/13.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", 544, 367, 605, 385, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Donute", screenW * 0.4290, screenH * 0.4779, screenW * 0.4736, screenH * 0.5013, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.3982, screenH * 0.5013, screenW * 0.4429, screenH * 0.5247, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("40 $", screenW * 0.4290, screenH * 0.5013, screenW * 0.4736, screenH * 0.5247, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawLine(screenW * 0.3426, screenH * 0.8451, screenW * 0.6523, screenH * 0.8451, tocolor(249, 171, 230, 255), 3, false)

        dxDrawText("Quantity :", screenW * 0.4736, screenH * 0.4909, screenW * 0.5183, screenH * 0.5143, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5146, screenH * 0.4909, screenW * 0.5593, screenH * 0.5143, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.3653, screenH * 0.5521, screenW * 0.0307, screenH * 0.0534, ":item-system/images/14.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", 544, 428, 605, 446, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Cookie", screenW * 0.4290, screenH * 0.5573, screenW * 0.4736, screenH * 0.5807, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.3982, screenH * 0.5807, screenW * 0.4429, screenH * 0.6042, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("35 $", screenW * 0.4290, screenH * 0.5820, screenW * 0.4736, screenH * 0.6055, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Quantity :", screenW * 0.4736, screenH * 0.5677, screenW * 0.5183, screenH * 0.5911, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5146, screenH * 0.5690, screenW * 0.5593, screenH * 0.5924, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.3653, screenH * 0.6302, screenW * 0.0307, screenH * 0.0573, ":item-system/images/92.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", 544, 484, 605, 502, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Turkey", screenW * 0.4290, screenH * 0.6302, screenW * 0.4736, screenH * 0.6536, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.3982, screenH * 0.6536, screenW * 0.4429, screenH * 0.6771, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("60 $", screenW * 0.4290, screenH * 0.6536, screenW * 0.4736, screenH * 0.6771, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Quantity :", screenW * 0.4736, screenH * 0.6432, screenW * 0.5183, screenH * 0.6667, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5146, screenH * 0.6432, screenW * 0.5593, screenH * 0.6667, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.3653, screenH * 0.7083, screenW * 0.0307, screenH * 0.0573, ":item-system/images/1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", 544, 548, 605, 566, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Hotdog", screenW * 0.4290, screenH * 0.7135, screenW * 0.4736, screenH * 0.7370, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.3982, screenH * 0.7370, screenW * 0.4429, screenH * 0.7604, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("30$", screenW * 0.4290, screenH * 0.7370, screenW * 0.4736, screenH * 0.7604, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Quantity :", screenW * 0.4736, screenH * 0.7240, screenW * 0.5183, screenH * 0.7474, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5146, screenH * 0.7240, screenW * 0.5593, screenH * 0.7474, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.6061, screenH * 0.3346, screenW * 0.0227, screenH * 0.0365, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.6061, screenH * 0.4089, screenW * 0.0227, screenH * 0.0365, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.6061, screenH * 0.4805, screenW * 0.0227, screenH * 0.0365, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.6061, screenH * 0.5599, screenW * 0.0227, screenH * 0.0365, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.6061, screenH * 0.6380, screenW * 0.0227, screenH * 0.0365, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.6061, screenH * 0.7161, screenW * 0.0227, screenH * 0.0365, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawText("All Rights Reserved To ", screenW * 0.3865, screenH * 0.8177, screenW * 0.5256, screenH * 0.8385, tocolor(255, 255, 255, 34), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Los Santos Roleplay", screenW * 0.4824, screenH * 0.8177, screenW * 0.6215, screenH * 0.8385, tocolor(251, 184, 252, 50), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("© 2020", screenW * 0.5717, screenH * 0.8177, screenW * 0.7108, screenH * 0.8385, tocolor(255, 255, 255, 34), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("X", screenW * 0.6325, screenH * 0.1576, screenW * 0.6552, screenH * 0.2005, tocolor(251, 184, 252, 255), 1.50, "default-bold", "left", "top", false, false, false, false, false)

        --- dxDrawRectangle(screenW * 0.6603, screenH * 0.1875, screenW * 0.0183, screenH * 0.0326, tocolor(255, 255, 255, 255), false)

    	if isInSlot(screenW * 0.6603, screenH * 0.1875, screenW * 0.0183, screenH * 0.0326) then

		    closebtnf1clr = tocolor(253, 160, 224, 255)

		else

		    closebtnf1clr = tocolor(255, 255, 255, 255)

		end

	end

end

)





function clickHandler(button, state, x, y, wx, wy, wz, ped)

	if (button == "left" and state == "down") then

		if ped and isElement(ped) and ped == fdshopped then

            fdshoppanelshowing = true

		end

	end

end

addEventHandler("onClientClick", getRootElement(), clickHandler)



function teszt(b,s)

    if (b == "mouse1") then

        if (s) then

            -----------------------------------------------------------------------------------------------

            if (fdshoppanelshowing) then

                if isInSlot(screenW * 0.6325, screenH * 0.1576, screenW * 0.6552, screenH * 0.2005) then --close

				    fdshoppanelshowing = false

                end		

                if isInSlot(screenW * 0.6061, screenH * 0.3346, screenW * 0.0227, screenH * 0.0365) then --1

				    if getElementData(localPlayer, "money") >= 12 then

				        triggerServerEvent("fd1", localPlayer)

					else

                        exports["HkNotifications"]:show_box("You don't enought money", "error")					

					end	

                end		

                if isInSlot(screenW * 0.6061, screenH * 0.4089, screenW * 0.0227, screenH * 0.0365) then --2

				    if getElementData(localPlayer, "money") >= 20 then

					triggerServerEvent("fd2", localPlayer)

					else

                        exports["HkNotifications"]:show_box("You don't enought money", "error")					

					end						

                end

				if isInSlot(screenW * 0.6061, screenH * 0.4805, screenW * 0.0227, screenH * 0.0365) then --3

				    if getElementData(localPlayer, "money") >= 6 then

					triggerServerEvent("fd3", localPlayer)

					else

                        exports["HkNotifications"]:show_box("You don't enought money", "error")					

					end						

                end

				if isInSlot(screenW * 0.6061, screenH * 0.5599, screenW * 0.0227, screenH * 0.0365) then --4

				    if getElementData(localPlayer, "money") >= 5 then

					triggerServerEvent("fd4", localPlayer)

					else

                        exports["HkNotifications"]:show_box("You don't enought money", "error")					

					end						

                end

				if isInSlot(screenW * 0.6061, screenH * 0.6380, screenW * 0.0227, screenH * 0.0365) then --5

				    if getElementData(localPlayer, "money") >= 44 then

					triggerServerEvent("fd5", localPlayer)

					else

                        exports["HkNotifications"]:show_box("You don't enought money", "error")					

					end						

                end

                if isInSlot(screenW * 0.6061, screenH * 0.7161, screenW * 0.0227, screenH * 0.0365) then --6

				    if getElementData(localPlayer, "money") >= 9 then

					triggerServerEvent("fd6", localPlayer)

					else

                        exports["HkNotifications"]:show_box("You don't enought money", "error")					

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