local count = 0
local state = 0
local mgTimer = nil
local escapeTimer = nil
local pFish = nil
local pSound = nil

local fishermanJohn = createPed( 209, 2306.3330078125, -2375.2900390625, 13.546875 )
setPedRotation(fishermanJohn, 137.2240)
setElementDimension(fishermanJohn,  0)
setElementInterior(fishermanJohn , 0)
setElementData(fishermanJohn, "nametag", true)
setElementData(fishermanJohn, "name", "Fisherman J.Smith")
setElementFrozen(fishermanJohn, true)

col = createColRectangle( 2295.931640625, -2420.9970703125, 3.1963167190552, 3)
col2 = createColRectangle( 2302.310546875, -2414.4033203125, 3.1963167190552, 3)
col3 = createColRectangle( 2308.962890625, -2407.6708984375, 3.1963167190552, 3)
col4 = createColRectangle( 2315.1650390625, -2401.7646484375, 3.1963167190552, 3)

function startFishingSession()
    if not exports['item-system']:hasItem(localPlayer, 10026) or not exports['item-system']:hasItem(localPlayer, 49) then 
	    --return exports["SCR_Notifs"]:show_box("You don't have Doud or Fish Rod to fish.","info",5000)
		return exports.SCR_Info:addNotification("You don't have Doud or Fish Rod to fish ","info",5000)
	end	
    if exports['item-system']:hasItem(localPlayer, 49, 1) or exports['item-system']:hasItem(localPlayer, 10026) then
        if getElementData(localPlayer, "isfishing") then
            outputChatBox("You're already fishing...", 255, 0, 0)
        else 
            if isPedInVehicle(localPlayer) then
                return outputChatBox("You cannot fish while sailing.", 255, 0, 0) 
            end
            if onBoat() or isElementWithinColShape(localPlayer,col2) or isElementWithinColShape(localPlayer,col) or isElementWithinColShape(localPlayer,col3) or isElementWithinColShape(localPlayer,col4) then
                triggerServerEvent("sendAme",localPlayer, "Casts his line out to sea with douda.")
                triggerServerEvent("artifacts:add", localPlayer, localPlayer, "rod")
				triggerServerEvent("fishing:takeDoud", localPlayer, localPlayer)
                setElementData(localPlayer, "isfishing", true)
                
                mgTimer = setTimer(
                    function()
                        -- if not onBoat() then
                        --     endFishingSession()
                        --     return outputChatBox("You failed to stay on the water.", 255, 0, 0)
                        -- end
                        pFish = guiCreateProgressBar(0.425, 0.75, 0.2, 0.035, true)
						pSound = playSound("fishing/reel.mp3", true)
                        --exports["SCR_Notifs"]:show_box("You've got a bite! Press J to reel it in.","info",5000)
						exports.SCR_Info:addNotification("You've got a bite! Press J to reel it in ","info",5000)
                        bindKey("J", "down", beginFishingGame)
                        -- Start the timer which determins if the fish would get away.
                        escapeTimer = setTimer(
                            function() 
                                endFishingSession()
                                outputChatBox("On reeling in your line you would notice it would be snapped.", 255, 0, 0)
                                triggerServerEvent("fishing:takeRod", localPlayer, localPlayer)
                            end, 
                        math.random(15000, 30000), 1)
                    end
                , math.random(10000, 30000), 1)  
                outputChatBox("You can stop fishing at any time by typing /stopfishing.", 0, 255, 0)
		   
            else  
				exports.SCR_Info:addNotification("You can't fish here","info",5000)
            end
			
			  
        end
    else
        outputChatBox("You do not have a fishing rod.", 255, 0, 0)
    end
end

function endFishingSession()
    if (getElementData(localPlayer, "isfishing")) then

        if isTimer(mgTimer) then
            killTimer(mgTimer)
        end

        if isTimer(escapeTimer) then
            killTimer(escapeTimer)
        end

        if isElement(pFish) then
            destroyElement(pFish)
            pFish = nil
            count = 0
            unbindKey("J", "down", reelItIn)
            -- unbindKey(")", "down", reelItIn)
        end

        triggerServerEvent("artifacts:remove", localPlayer, localPlayer, "rod")
        triggerServerEvent("sendAme", localPlayer, "Reels in his line and he lost douda.")
        setElementData(localPlayer, "isfishing", false)
    end
end

-- Old minigame made by Maxime
function beginFishingGame()
    if (state==0) then
		bindKey("J", "down", beginFishingGame)
		-- unbindKey(")", "down", beginFishingGame)
		state = 1
	elseif (state==1) then
		bindKey("J", "down", beginFishingGame)
		-- unbindKey(")", "down", beginFishingGame)
		state = 0
	end
	
    count = count + 1
    guiProgressBarSetProgress(pFish, count)
	
    if (count>=100) then
        killTimer(escapeTimer)
		destroyElement(pFish)
		destroyElement(pSound)
        pFish = nil
        count = 0
		unbindKey("J", "down", reelItIn)
        -- unbindKey(")", "down", reelItIn)
        endFishingSession()
        triggerServerEvent("fishing:giveCatch", localPlayer, localPlayer)
    end
end

function onBoat()
    local element = getPedContactElement(localPlayer)
    local px, py, pz = getElementPosition(localPlayer)

    if (isElement(element)) and (getVehicleType(element) == "Boat") and testLineAgainstWater(px, py, pz, px, py, pz - 25) then
        return true
    else 
        return false
    end
end

function fishermanJohnRightClick(button, state, absX, absY, wx, wy, wz, element)

    if (element) --[[and exports.global:hasItem(element, 10025)]]  and (getElementType(element)=="ped") and (button=="right") and (state=="down") then
		local pedName = getElementData(element, "name") or "pedName"
		pedName = tostring(pedName):gsub("_", " ")
		

        local rcMenu
        if(pedName == "Fisherman J.Smith")  then 
            rcMenu = exports.rightclick:create(pedName)
            local row = exports.rightclick:addRow("Sell")
            addEventHandler("onClientGUIClick", row,  function (button, state)
                triggerServerEvent("fishing:GeneratePayment", localPlayer, localPlayer)
            end, false)

            local row2 = exports.rightclick:addRow("Close")
            addEventHandler("onClientGUIClick", row2,  function (button, state)
                exports.rightclick:destroy(rcMenu)
            end, false)
        end
    end
	

end


function sellFish(fish, price)

    DestroySellingGUI()

    sellfishGUI = guiCreateWindow(744, 301, 303, 117, "Sell Fish", false)
    exports.global:centerWindow(sellfishGUI)
    showCursor(true)
    guiWindowSetSizable(sellfishGUI, false)

    sellfishLabel = guiCreateLabel(4, 18, 295, 44, "You currently have " .. fish .. " fish and you'll make $" .. price .. ".", false, sellfishGUI)
    guiLabelSetHorizontalAlign(sellfishLabel, "center", true)
    guiLabelSetVerticalAlign(sellfishLabel, "center")
    sellfishbutton = guiCreateButton(10, 68, 140, 34, "Sell Fish", false, sellfishGUI)
    cancelfishbutton = guiCreateButton(153, 68, 140, 34, "Cancel", false, sellfishGUI) 
    
    addEventHandler("onClientGUIClick", sellfishbutton, function(button) 
	
        if button == "left" then
            triggerServerEvent("fishing:sellFish", localPlayer, localPlayer, price)
            DestroySellingGUI()
        end
    end)

    addEventHandler("onClientGUIClick", cancelfishbutton, function(button)
        if button == "left" then
            DestroySellingGUI()
        end
    end)


end
--addCommandHandler("sfish", sellFish)

function DestroySellingGUI()
    if isElement(sellfishGUI) then
        destroyElement(sellfishGUI)
        showCursor(false)
    end
end


-- Commands
addCommandHandler("fish", startFishingSession)
addCommandHandler("stopfishing", endFishingSession)
addEvent("fishing:SellFishGUI", true)
addEventHandler("fishing:SellFishGUI", root, sellFish)
addEventHandler("onClientChangeChar", root, endFishingSession)
addEventHandler("onClientClick", root, fishermanJohnRightClick)