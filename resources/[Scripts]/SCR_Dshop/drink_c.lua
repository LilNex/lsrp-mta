local screenW, screenH = guiGetScreenSize()

local fdshoppanelshowing = false

local hkpedx, hkpedz, hkpedy =  1915.7578125, -1778.0478515625, 13.546875

local fdshopped = createPed(44, hkpedx, hkpedz, hkpedy)

setPedRotation(fdshopped, 268)

setElementDimension(fdshopped, 0)

setElementInterior(fdshopped, 0)

setElementFrozen(fdshopped, true)



local closebtnf1clr = tocolor(255, 255, 255, 255)

addEventHandler("onClientRender", root,

function()

	if (fdshoppanelshowing) then

dxDrawRectangle(screenW * 0.2130, screenH * 0.2448, screenW * 0.5739, screenH * 0.5625, tocolor(0, 0, 0, 200), false)

        dxDrawRectangle(screenW * 0.2130, screenH * 0.2448, screenW * 0.5739, screenH * 0.5625, tocolor(0, 0, 0, 40), false) -- 0, 0, 0, 200 (65)

        dxDrawImage(screenW * 0.4290, screenH * 0.0404, screenW * 0.1406, screenH * 0.2409, ":dark_image/img/UlogoW.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawRectangle(screenW * 0.5007, screenH * 0.2448, screenW * 0.2862, screenH * 0.5625, tocolor(0, 0, 0, 51), false)

        dxDrawLine(screenW * 0.2130, screenH * 0.2435, screenW * 0.7855, screenH * 0.2435, tocolor(248, 161, 221, 255), 3, false)

        dxDrawRectangle(screenW * 0.2555, screenH * 0.3320, screenW * 0.5066, screenH * 0.0469, tocolor(0, 0, 0, 149), false)

        dxDrawRectangle(screenW * 0.2555, screenH * 0.3919, screenW * 0.5066, screenH * 0.0469, tocolor(0, 0, 0, 149), false)

        dxDrawRectangle(screenW * 0.2555, screenH * 0.4518, screenW * 0.5066, screenH * 0.0469, tocolor(0, 0, 0, 149), false)

        dxDrawRectangle(screenW * 0.2555, screenH * 0.5247, screenW * 0.5066, screenH * 0.0469, tocolor(0, 0, 0, 149), false)

        dxDrawRectangle(screenW * 0.2555, screenH * 0.5924, screenW * 0.5066, screenH * 0.0469, tocolor(0, 0, 0, 149), false)

        dxDrawRectangle(screenW * 0.2555, screenH * 0.6628, screenW * 0.5066, screenH * 0.0469, tocolor(0, 0, 0, 171), false)

        dxDrawRectangle(screenW * 0.2555, screenH * 0.7279, screenW * 0.5066, screenH * 0.0469, tocolor(0, 0, 0, 149), false)

        dxDrawLine(screenW * 0.2555, screenH * 0.3320, screenW * 0.2548, screenH * 0.3776, tocolor(253, 160, 224, 255), 2, false)

        dxDrawLine(screenW * 0.7621, screenH * 0.3320, screenW * 0.7613, screenH * 0.3776, tocolor(255, 255, 255, 255), 2, false)

        dxDrawLine(screenW * 0.7621, screenH * 0.3932, screenW * 0.7613, screenH * 0.4388, tocolor(255, 255, 255, 255), 2, false)

        dxDrawLine(screenW * 0.7613, screenH * 0.4531, screenW * 0.7606, screenH * 0.4987, tocolor(255, 255, 255, 255), 2, false)

        dxDrawLine(screenW * 0.7621, screenH * 0.5247, screenW * 0.7613, screenH * 0.5703, tocolor(255, 255, 255, 255), 2, false)

        dxDrawLine(screenW * 0.7621, screenH * 0.5938, screenW * 0.7613, screenH * 0.6393, tocolor(255, 255, 255, 255), 2, false)

        dxDrawLine(screenW * 0.7628, screenH * 0.6628, screenW * 0.7621, screenH * 0.7083, tocolor(255, 255, 255, 255), 2, false)

        dxDrawLine(screenW * 0.7635, screenH * 0.7279, screenW * 0.7628, screenH * 0.7734, tocolor(255, 255, 255, 255), 2, false)

        dxDrawLine(screenW * 0.2548, screenH * 0.3906, screenW * 0.2540, screenH * 0.4362, tocolor(253, 160, 224, 255), 2, false)

        dxDrawLine(screenW * 0.2540, screenH * 0.4531, screenW * 0.2533, screenH * 0.4987, tocolor(253, 160, 224, 255), 2, false)

        dxDrawLine(screenW * 0.2540, screenH * 0.5260, screenW * 0.2533, screenH * 0.5716, tocolor(253, 160, 224, 255), 2, false)

        dxDrawLine(screenW * 0.2548, screenH * 0.5924, screenW * 0.2540, screenH * 0.6380, tocolor(253, 160, 224, 255), 2, false)

        dxDrawLine(screenW * 0.2555, screenH * 0.6641, screenW * 0.2548, screenH * 0.7096, tocolor(253, 160, 224, 255), 2, false)

        dxDrawLine(screenW * 0.2555, screenH * 0.7279, screenW * 0.2548, screenH * 0.7734, tocolor(253, 160, 224, 255), 2, false)

        dxDrawText("Welcome To Los Santos City Drinks Shop", screenW * 0.4114, screenH * 0.2695, screenW * 0.6091, screenH * 0.3073, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Click To ", screenW * 0.4290, screenH * 0.2943, screenW * 0.6266, screenH * 0.3320, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Shopping Basket", screenW * 0.4641, screenH * 0.2943, screenW * 0.6618, screenH * 0.3320, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("To buy", screenW * 0.5373, screenH * 0.2943, screenW * 0.7350, screenH * 0.3320, tocolor(254, 255, 254, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.2628, screenH * 0.3359, screenW * 0.0264, screenH * 0.0417, ":item-system/images/15.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", screenW * 0.2921, screenH * 0.3359, screenW * 0.3382, screenH * 0.3542, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Water", screenW * 0.3236, screenH * 0.3359, screenW * 0.3697, screenH * 0.3542, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.2921, screenH * 0.3542, screenW * 0.3382, screenH * 0.3724, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("25 $", screenW * 0.3236, screenH * 0.3542, screenW * 0.3697, screenH * 0.3724, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Quantity :", screenW * 0.4810, screenH * 0.3451, screenW * 0.5271, screenH * 0.3633, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5227, screenH * 0.3451, screenW * 0.5688, screenH * 0.3633, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.2628, screenH * 0.3919, screenW * 0.0264, screenH * 0.0443, ":item-system/images/58.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", screenW * 0.2921, screenH * 0.3971, screenW * 0.3382, screenH * 0.4154, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Ziebrand Beer", screenW * 0.3236, screenH * 0.3971, screenW * 0.3697, screenH * 0.4154, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.2921, screenH * 0.4154, screenW * 0.3382, screenH * 0.4336, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("77 $", screenW * 0.3236, screenH * 0.4154, screenW * 0.3697, screenH * 0.4336, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Quantity :", screenW * 0.4810, screenH * 0.4049, screenW * 0.5271, screenH * 0.4232, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5227, screenH * 0.4049, screenW * 0.5688, screenH * 0.4232, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.2628, screenH * 0.4518, screenW * 0.0256, screenH * 0.0469, ":item-system/images/62.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", screenW * 0.2921, screenH * 0.4544, screenW * 0.3382, screenH * 0.4727, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Bastradov Vodka", screenW * 0.3236, screenH * 0.4544, screenW * 0.3697, screenH * 0.4727, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.2921, screenH * 0.4727, screenW * 0.3382, screenH * 0.4909, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("180 $", screenW * 0.3236, screenH * 0.4727, screenW * 0.3697, screenH * 0.4909, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Quantity :", screenW * 0.4810, screenH * 0.4648, screenW * 0.5271, screenH * 0.4831, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5227, screenH * 0.4648, screenW * 0.5688, screenH * 0.4831, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.2599, screenH * 0.5247, screenW * 0.0286, screenH * 0.0456, ":item-system/images/63.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", screenW * 0.2921, screenH * 0.5260, screenW * 0.3382, screenH * 0.5443, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Scottish Whiskey", screenW * 0.3236, screenH * 0.5260, screenW * 0.3697, screenH * 0.5443, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.2921, screenH * 0.5443, screenW * 0.3382, screenH * 0.5625, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("260 $", screenW * 0.3236, screenH * 0.5443, screenW * 0.3697, screenH * 0.5625, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Quantity :", screenW * 0.4810, screenH * 0.5378, screenW * 0.5271, screenH * 0.5560, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5227, screenH * 0.5378, screenW * 0.5688, screenH * 0.5560, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.2628, screenH * 0.5938, screenW * 0.0227, screenH * 0.0456, ":item-system/images/83.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", screenW * 0.2928, screenH * 0.5951, screenW * 0.3389, screenH * 0.6133, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Coffe", screenW * 0.3236, screenH * 0.5951, screenW * 0.3697, screenH * 0.6133, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.2928, screenH * 0.6133, screenW * 0.3389, screenH * 0.6315, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("40 $", screenW * 0.3236, screenH * 0.6133, screenW * 0.3697, screenH * 0.6315, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Quantity :", screenW * 0.4810, screenH * 0.6055, screenW * 0.5271, screenH * 0.6237, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5227, screenH * 0.6055, screenW * 0.5688, screenH * 0.6237, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.2628, screenH * 0.6628, screenW * 0.0227, screenH * 0.0443, ":item-system/images/100.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", screenW * 0.2928, screenH * 0.6641, screenW * 0.3389, screenH * 0.6823, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Small Milk Carton", screenW * 0.3236, screenH * 0.6641, screenW * 0.3697, screenH * 0.6823, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.2928, screenH * 0.6823, screenW * 0.3389, screenH * 0.7005, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("30 $", screenW * 0.3236, screenH * 0.6823, screenW * 0.3697, screenH * 0.7005, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Quantity :", screenW * 0.4810, screenH * 0.6771, screenW * 0.5271, screenH * 0.6953, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5227, screenH * 0.6771, screenW * 0.5688, screenH * 0.6953, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.2613, screenH * 0.7292, screenW * 0.0242, screenH * 0.0443, ":item-system/images/101.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText("Name : ", screenW * 0.2928, screenH * 0.7292, screenW * 0.3389, screenH * 0.7474, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Small Juice Carton", screenW * 0.3236, screenH * 0.7292, screenW * 0.3697, screenH * 0.7474, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Price :", screenW * 0.2928, screenH * 0.7474, screenW * 0.3389, screenH * 0.7656, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("40 $", screenW * 0.3236, screenH * 0.7474, screenW * 0.3697, screenH * 0.7656, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Quantity :", screenW * 0.4810, screenH * 0.7409, screenW * 0.5271, screenH * 0.7591, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("1", screenW * 0.5227, screenH * 0.7409, screenW * 0.5688, screenH * 0.7591, tocolor(0, 150, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawLine(screenW * 0.2130, screenH * 0.8073, screenW * 0.7855, screenH * 0.8073, tocolor(248, 161, 221, 255), 3, false)

        dxDrawText("All Rights Reserved To", screenW * 0.3624, screenH * 0.7865, screenW * 0.6061, screenH * 0.8438, tocolor(255, 255, 255, 46), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Los Santos Roleplay", screenW * 0.4568, screenH * 0.7865, screenW * 0.7006, screenH * 0.8438, tocolor(246, 143, 250, 52), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("© 2020", screenW * 0.5432, screenH * 0.7878, screenW * 0.7870, screenH * 0.8451, tocolor(255, 255, 255, 46), 1.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("X", screenW * 0.7577, screenH * 0.2617, screenW * 0.7796, screenH * 0.3073, closebtnf1clr, 2.00, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawImage(screenW * 0.7233, screenH * 0.3320, screenW * 0.0227, screenH * 0.0443, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.7233, screenH * 0.3932, screenW * 0.0227, screenH * 0.0443, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.7233, screenH * 0.4544, screenW * 0.0227, screenH * 0.0443, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.7233, screenH * 0.5247, screenW * 0.0227, screenH * 0.0443, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.7233, screenH * 0.5924, screenW * 0.0227, screenH * 0.0443, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.7233, screenH * 0.6641, screenW * 0.0227, screenH * 0.0443, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

        dxDrawImage(screenW * 0.7233, screenH * 0.7279, screenW * 0.0227, screenH * 0.0443, ":dark_image/img/hk_weight.png", 0, 0, 0, tocolor(0, 150, 255, 255), false)

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

                if isInSlot(screenW * 0.7577, screenH * 0.2617, screenW * 0.7796, screenH * 0.3073) then --close

				    fdshoppanelshowing = false

                end		

                if isInSlot(screenW * 0.7233, screenH * 0.3320, screenW * 0.0227, screenH * 0.0443) then --1

				    if getElementData(localPlayer, "money") >= 12 then

				        triggerServerEvent("bd1", localPlayer)

					else

                        exports["HkNotifications"]:show_box("You don't enought money", "error")					

					end	

                end		

                if isInSlot(screenW * 0.7233, screenH * 0.3932, screenW * 0.0227, screenH * 0.0443) then --2

				    if getElementData(localPlayer, "money") >= 77 then

					triggerServerEvent("buydrink2", localPlayer)

					else

                        exports["HkNotifications"]:show_box("You don't enought money", "error")					

					end						

                end

				if isInSlot(screenW * 0.7233, screenH * 0.4544, screenW * 0.0227, screenH * 0.0443) then --3

				    if getElementData(localPlayer, "money") >= 180 then

					triggerServerEvent("buydrink3", localPlayer)

					else

                        exports["HkNotifications"]:show_box("You don't enought money", "error")					

					end						

                end

				if isInSlot(screenW * 0.7233, screenH * 0.5247, screenW * 0.0227, screenH * 0.0443) then --4

				    if getElementData(localPlayer, "money") >= 260 then

					triggerServerEvent("buydrink4", localPlayer)

					else

                        exports["HkNotifications"]:show_box("You don't enought money", "error")					

					end						

                end

				if isInSlot(screenW * 0.7233, screenH * 0.5924, screenW * 0.0227, screenH * 0.0443) then --5

				    if getElementData(localPlayer, "money") >= 8 then

					triggerServerEvent("buydrink5", localPlayer)

					else

                        exports["HkNotifications"]:show_box("You don't enought money", "error")					

					end						

                end

                if isInSlot(screenW * 0.7233, screenH * 0.6641, screenW * 0.0227, screenH * 0.0443) then --6

				    if getElementData(localPlayer, "money") >= 3 then

					triggerServerEvent("buydrink6", localPlayer)

					else

                        exports["HkNotifications"]:show_box("You don't enought money", "error")					

					end							

                end

                if isInSlot(screenW * 0.7233, screenH * 0.7279, screenW * 0.0227, screenH * 0.0443) then --7

				    if getElementData(localPlayer, "money") >= 6 then

				    triggerServerEvent("buydrink7", localPlayer)

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