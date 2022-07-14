--Sx = StriZeX
 --- MRKHALID (Strizex)
-- Backup = LSrp





local screenW, screenH = guiGetScreenSize()

local trashpanelshowing = false

local closebtnf1clr = tocolor(255, 255, 255, 255)

function clickObject(button, state, absX, absY, wx, wy, wz, element)



	if (element) and (getElementType(element)=="object") and (button=="right") and (state=="down") then --if it's a right-click on a object



		local model = getElementModel(element)



		if(model == 1331) then

		local isStaff = exports.integration:isPlayerTrialAdmin(localPlayer)

		local Dutyadmin = getElementData( localPlayer,"duty_admin" )

		local on = 1

		local off = 0

			Menu = exports.rightclick:create("Menu")



			local openwindow = exports.rightclick:addRow("Open Rubbish Panel")

            addEventHandler("onClientGUIClick", openwindow,function()

			openrub()

            end)

			if isStaff then

			if Dutyadmin == on then

			local deleteObject = exports.rightclick:addRow("AD: Delete Object")

			addEventHandler("onClientGUIClick", deleteObject,  function () --define what happens when user clicks the row

                triggerServerEvent("Sx", element)



			end, true)

	end

	end

	end

	rubbish = element

end	

end

addEventHandler("onClientClick", getRootElement(), clickObject, true)



function pr()

if exports.global:hasItem(localPlayer, 216) then

triggerServerEvent("prub",rubbish,localPlayer)

end

end

function tr()

triggerServerEvent("trub",rubbish,localPlayer)

		end

function openrub()

    trashpanelshowing = true

end



function clickputbtn()

pr()

local n = 1

local num = getElementData(rubbish,"rubbs")

num = num + n

end

function clicktakebtn()

tr()

local n = 1

local num = getElementData(rubbish,"rubbs")

num = num - n

end





--------------------------------------------------------------

local sellrub = createMarker (2107.32421875, -1995.939453125, 13.546875-1, "cylinder", 1, 244 , 255, 4, 22)



function sellnow()

if getElementData(localPlayer, "faction") == 91 then

if exports.global:hasItem(localPlayer, 216) then

triggerServerEvent("sellnow",localPlayer)

else

outputChatBox("you dont have a rubbish to sell it",255,0,0)

end

end

end



addEventHandler('onClientMarkerHit', sellrub,

function ( hitPlayer )

         if ( hitPlayer == localPlayer ) then

		 sellnow()

    end

end

)











addEventHandler("onClientRender", root,

    function()

	    if (trashpanelshowing) then

		setElementFrozen(localPlayer, true)

		local num = getElementData(rubbish,"rubbs")

        dxDrawRectangle(screenW * 0.3836, screenH * 0.2747, screenW * 0.2225, screenH * 0.4362, tocolor(0, 0, 0, 141), false)
        dxDrawRectangle(screenW * 0.3807, screenH * 0.2695, screenW * 0.2225, screenH * 0.4362, tocolor(0, 0, 0, 61), false)
        dxDrawRectangle(screenW * 0.3763, screenH * 0.2617, screenW * 0.2225, screenH * 0.4362, tocolor(0, 0, 0, 61), false)
        dxDrawRectangle(screenW * 0.4941, screenH * 0.2617, screenW * 0.1120, screenH * 0.4440, tocolor(254, 255, 255, 4), false)
        dxDrawImage(screenW * 0.4327, screenH * 0.2487, screenW * 0.1266, screenH * 0.2031, ":Mk_Images/img/UlogoW.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.4231, screenH * 0.5742, screenW * 0.1435, screenH * 0.0534, ":Mk_Images/img/mk_shape2.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
        dxDrawImage(screenW * 0.4224, screenH * 0.6393, screenW * 0.1435, screenH * 0.0534, ":Mk_Images/img/mk_shape2.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
        dxDrawImage(screenW * 0.4187, screenH * 0.5612, screenW * 0.1435, screenH * 0.0534, ":Mk_Images/img/mk_shape2.png", 0, 0, 0, tocolor(252, 68, 68, 255), false)
        dxDrawImage(screenW * 0.4180, screenH * 0.6315, screenW * 0.1435, screenH * 0.0534, ":Mk_Images/img/mk_shape2.png", 0, 0, 0, tocolor(252, 68, 68, 255), false)
        dxDrawText("Welcome To Los Santos Roleplay", screenW * 0.4290, screenH * 0.4271, screenW * 0.5637, screenH * 0.4518, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Trash System Panel", screenW * 0.4524, screenH * 0.4531, screenW * 0.5439, screenH * 0.4740, tocolor(252, 68, 68, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Click On The button For Put Your Rubish", screenW * 0.4143, screenH * 0.4831, screenW * 0.5827, screenH * 0.5091, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
      --  dxDrawText("Current Rubbish : ", screenW * 0.4451, screenH * 0.5143, screenW * 0.6135, screenH * 0.5404, tocolor(252, 68, 68, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("> | Put | <", screenW * 0.4305, screenH * 0.5612, screenW * 0.5549, screenH * 0.6146, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("> | Take | <", screenW * 0.4297, screenH * 0.6315, screenW * 0.5542, screenH * 0.6849, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("X", screenW * 0.5871, screenH * 0.2826, screenW * 0.6032, screenH * 0.3125, tocolor(255, 255, 255, 255), 1.50, "default-bold", "left", "top", false, false, false, false, false)

        dxDrawText("Current Rubbish : ".. num .."/40", screenW * 0.4451, screenH * 0.5143, screenW * 0.6135, screenH * 0.5404, tocolor(252, 68, 68, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)

       -- dxDrawText("X", screenW * 0.6127, screenH * 0.2461, screenW * 0.6318, screenH * 0.2891, closebtnf1clr, 1.30, "default-bold", "center", "center", false, false, false, false, false)

        -- dxDrawRectangle(screenW * 0.6061, screenH * 0.2526, screenW * 0.0183, screenH * 0.0326, tocolor(255, 255, 255, 255), false)

        if isInSlot(screenW * 0.6061, screenH * 0.2526, screenW * 0.0183, screenH * 0.0326) then

		    closebtnf1clr = tocolor(241, 150, 244, 254)

		else

		    closebtnf1clr = tocolor(255, 255, 255, 255)

		end

		

		end

	end

)







function teszt(b,s)

    if (b == "mouse1") then

        if (s) then

            -----------------------------------------------------------------------------------------------

            if (trashpanelshowing) then

                if isInSlot(screenW * 0.5871, screenH * 0.2826, screenW * 0.6032, screenH * 0.3125) then

				    trashpanelshowing = false

					setElementFrozen(localPlayer, false)

                end	

                if isInSlot(screenW * 0.4187, screenH * 0.5612, screenW * 0.1435, screenH * 0.0534) then -- Put

                    if exports.global:hasItem(localPlayer, 216) then

					    clickputbtn()

					else

					    exports["HkNotifications"]:show_box("You Don't Have Rubbish", "error")

					end

                end	

                if isInSlot(screenW * 0.4180, screenH * 0.6315, screenW * 0.1435, screenH * 0.0534) then -- Take

                    local faction = getElementData(localPlayer, "faction")

					if (faction == 91) then

					    clicktakebtn()

					else

					    exports["HkNotifications"]:show_box("You need to be in City Cleaners Faction", "error")

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

