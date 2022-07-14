local ENDLIFTINGTIME = 100000 -- وقت انتهاء السرقة
local STARTLIFTINGAGINTIME = 20000 -- وقت اعادة تعين السرقة مرة اخري

local POLICEMEMBER = 0 -- عدد الشرطة المطلوب تواجدها لبداء السرقة

function isPedAiming (thePedToCheck)
	if isElement(thePedToCheck) then
		if getElementType(thePedToCheck) == "player" or getElementType(thePedToCheck) == "ped" then
			if getPedTask(thePedToCheck, "secondary", 0) == "TASK_SIMPLE_USE_GUN" or isPedDoingGangDriveby(thePedToCheck) then
				return true
			end
		end
	end
	return false    
end

local pedLifting = { }
local liftingNum = 0
setDevelopmentMode(true)

function targetingActivated ( target )
    if ( isPedAiming(localPlayer) ) and ( isPlayerHudComponentVisible("crosshair")) then
      if ( target ) and ( getElementType(target) == "ped" ) and ((getElementData(target, "ped:type") or "none") == "shop") then
        if getElementInterior(localPlayer) == 0 and getElementDimension(localPlayer) == 0 then

          if getPedWeaponSlot(localPlayer) ~= 1 and getPedWeaponSlot(localPlayer) ~= 0 and getPedWeaponSlot(localPlayer) ~= 10 and getPedWeaponSlot(localPlayer) ~= 9 then 
            local x1, y1, z1 = getElementPosition(localPlayer)
            local x2, y2, z2 = getElementPosition(target)
            factionType = getElementData(getPlayerTeam(localPlayer),"type") or "none"
            if  factionType ~= 2 then
                local numPolice = #getPlayersInTeam(exports.factions:getTeamFromFactionID(1))
                if numPolice >= POLICEMEMBER then --(  )
                    if ( getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2) <= 5 ) then
                        if not getElementData(target, "robbed") then 
                            setElementData(target, "robbed", true)   
                            setElementData(localPlayer, "robbing", true)   
                            exports["SCR_Notifs"]:show_box("You are robbing the shop, it will takes 2 minutes", "info")
                            outputChatBox("#00FF00[INFO] : #FFFFFF You are robbing the shop, it will takes 2 minutes" ,255, 255, 255, true)
                            setPedAnimation(target, "ped", "handsup", -1, false, true, true, true)
                            local x, y = getElementPosition(target)
                            colCircle = createColCircle ( x, y, 6 )
                            sendMessageToTeam(1, "[RADIO] : A shop is being robbed , an armed civilian was seen there", target)
                            addEventHandler("onClientColShapeHit", colCircle, onClientColShapeHit)
                            addEventHandler("onClientColShapeLeave", colCircle, onClientColShapeLeave)
                            liftingNum = 1
                            setTimer(function()
                                setPedAnimation(target, "rob_bank" , "cat_safe_rob" , 100000, true, true, true, true)
                            end,2000,1)
                            endTimerLift = setTimer(function()
                                setPedAnimation(target)
                                triggerServerEvent("shop-lifting:end", localPlayer, target)
                                destroyElement(colCircle)

                            end,ENDLIFTINGTIME,1)
                            -- setTimer(function(pedLifting,target,resetPedTarget)
                            --     pedLifting[target] = true
                            --     ped = target
                            --     resetPedTarget(ped)
                            
                            -- end,60000,0,pedLifting,target,resetPedTarget)
                            
                        else
                            outputChatBox("#FF0000[WARNING] : #FFFFFF This shop was robbed recently",255, 255, 255, true)
                        end
                    end
                else
                    outputChatBox("#FF0000[WARNING] : #FFFFFF There is no cops enough on city, try later.",255, 255, 255, true)
                end
            else
                outputChatBox("#00FF00[INFO] : #FFFFFF What do you want ?",255, 255, 255, true)
            end
          end
        else
            outputChatBox("#00FF00[INFO] : #FFFFFF Can't do that in an interior at the moment",255, 255, 255, true)
    
        end
      end
      
    end
end
addEventHandler ( "onClientPlayerTarget", getRootElement(), targetingActivated )



function resetPedTarget(ped)

    if  ( pedLifting[ped] == true ) then

        setTimer(function()
            pedLifting[ped] = nil
            liftingNum = 0
        end,STARTLIFTINGAGINTIME,1)

    end

end

function onClientColShapeHit( theElement, matchingDimension )
    if ( theElement == localPlayer ) and ( source == colCircle ) then
        if fieldedLift or isTimer(fieldedLift) then
            exports["SCR_Notifs"]:show_box("Stay near the cashier to scare him.", "Info")
            killTimer(fieldedLift)
        end
    end
end



function onClientColShapeLeave( theElement, matchingDimension )
    if ( theElement == localPlayer ) and ( source == colCircle ) then
        exports["SCR_Notifs"]:show_box("Come back near the shop or it will be canceled in 5 seconds", "ban")
        fieldedLift = setTimer(function()
            exports["SCR_Notifs"]:show_box("You failed the robbing !","error")
            killTimer(endTimerLift)
            setPedAnimation(ped)
            destroyElement(colCircle)
            setElementData(localPlayer, "robbing", false)   
            triggerServerEvent("delTheBlipLift", root)
        end,6000,1)
    end
end

function wastedMessage ( killer, weapon, bodypart )
    if ( source == localPlayer ) and (getElementData(localPlayer,"robbing"))then
        setTimer(function()
            exports["SCR_Notifs"]:show_box("You failed the robbing !", "error")
            killTimer(endTimerLift)
            setPedAnimation(ped)
            destroyElement(colCircle)
            setElementData(localPlayer, "robbing", false)   
            triggerServerEvent("delTheBlipLift", root)
        end,100,1)
    end
end
addEventHandler ( "onClientPlayerWasted", root, wastedMessage )

function onQuitGame( reason )
    if ( source == localPlayer ) and (getElementData(localPlayer,"robbing")) then
        setTimer(function()
            exports["SCR_Notifs"]:show_box("You failed the robbing !", "error")
            killTimer(endTimerLift)
            setPedAnimation(ped)
            destroyElement(colCircle)
            setElementData(localPlayer, "robbing", false)   
            triggerServerEvent("delTheBlipLift", root)
        end,100,1)
    end
end
addEventHandler( "onClientPlayerQuit", root, onQuitGame )

addEvent("endLiftingShop", true)
addEventHandler("endLiftingShop", root, function()
    if ( source == localPlayer ) and (getElementData(localPlayer,"robbing")) then
        setTimer(function()
            exports["SCR_Notifs"]:show_box("You failed the robbing !", "error")
            killTimer(endTimerLift)
            setPedAnimation(ped)
            destroyElement(colCircle)
            setElementData(localPlayer, "robbing", false)   
            triggerServerEvent("delTheBlipLift", root)
        end,100,1)
    end
end)

function sendMessageToTeam(teamName, message, theLift)
    triggerServerEvent("sendMessageToTeam", localPlayer, teamName, message, theLift)
end