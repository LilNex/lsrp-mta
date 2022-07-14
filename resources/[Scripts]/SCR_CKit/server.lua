--------------------------------------------------
--------------------------------------------------
--												--
--				Script By : Acenox				--
--		 https://discord.gg/Q5qktjYDZb			--
--												--
--------------------------------------------------
--------------------------------------------------
setDevelopmentMode(true)
local KitMaker = createMarker(2225.892578125, -1988.3537597656, 13.891930580139-0.75, "cylinder", 1.5, 0, 255, 0, 100) 
local KitMaker2 = createMarker(1433.38671875, -2446.9619140625, 13.770312309265 -0.75, "cylinder", 1.5, 0, 255, 0, 100) 
setElementDimension(KitMaker2,1536)
setElementInterior(KitMaker2,38)

-----------------------------------------------
setElementVisibleTo(KitMaker, root, true) 
setElementData(root, "Crafting", false)




function infom (source)
    if (getElementData(getPlayerTeam(source), "type")) == 7 or tonumber(getElementData(source,"job")) == 5 then 
       outputChatBox("[Mechanic] To craft the repair kit , make sure that you have 300$ on you.", source, 255, 174, 0, true) 
       outputChatBox("[Mechanic] Type [/craftrepair] , you will pay 800$ for the items required.", source, 255, 174, 0, true) 
       setElementData(source, "Crafting", false)
    else 
        outputChatBox("[Mechanic] You are not a mechanic.", source, 255, 174, 0, true)
    end 
end
addEventHandler("onMarkerHit", KitMaker, infom)
addEventHandler("onMarkerHit", KitMaker2, infom)

function CraftRepair (source)
    if isElementWithinMarker(source, KitMaker) or isElementWithinMarker(source, KitMaker2) then 
         if (getElementData(getPlayerTeam(source), "type")) == 7 or tonumber(getElementData(source,"job")) == 5 then 
                if  not getElementData(source, "Crafting", true) then
                    if exports.global:hasMoney(source,300) then
                               exports["SCR_Notifs"]:show_box(source, "You are crafting the kit , stand by.", "info")
                               setElementData(source, "Crafting", true)
                               setPedFrozen(source, true)
                               setPedAnimation(source, "BD_FIRE", "BD_Panic_Loop", 20000, true, false, false, false) 
                               executeCommandHandler("ame", source,"Takes the items needed and starts crafting the kit.")
                            
                            setTimer(function()
                                setPedFrozen(source, false)
                                exports["SCR_Notifs"]:show_box(source, "You crafted the repair kit.", "info")
                                exports.global:takeMoney(source, 300)
                                exports.global:giveItem (source, 405, 1 )
                                setElementData(source, "Crafting", false)
                            end, Craft_Kit, 1)
                    else 
                        exports["SCR_Notifs"]:show_box(source, "You don't have enough money.", "error") 
                    end
                else 
                    exports["SCR_Notifs"]:show_box(source, "You already Crafting , stand by.", "error") 
                end
        else 
            exports["SCR_Notifs"]:show_box(source, "You are not a mechanic.", "error") 
        end
    end 
end 
addCommandHandler("craftrepair", CraftRepair) 