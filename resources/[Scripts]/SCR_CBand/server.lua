--------------------------------------------------
--------------------------------------------------
--												--
--				Script By : Acenox				--
--		 https://discord.gg/Q5qktjYDZb			--
--												--
--------------------------------------------------
--------------------------------------------------
setDevelopmentMode(true)
local BandageMaker = createMarker(1573.8376464844, 1787.1934814453, 2083.3837890625 -1, "arrow", 1.5, 0, 255, 0, 100) 
setElementInterior ( BandageMaker, 10 )
setElementDimension ( BandageMaker, 180 ) 


-----------------------------------------------
setElementVisibleTo(BandageMaker, root, true) 
setElementData(root, "Crafting", false)




function infob (source)
    if (getElementData(getPlayerTeam(source), "type")) == 4 then 
       outputChatBox("[Medic] To craft the bandage , make sure that you have the required item on you.", source, 255, 125, 123, true) 
       outputChatBox("[Medic] Type [/craftbandage] , you need to have the leather on you.", source, 255, 125, 123, true) 
       setElementData(source, "Crafting", false)
    else 
        outputChatBox("[Medic] You are not a medic.", source, 255, 125, 123, true)
    end 
end
addEventHandler("onMarkerHit", BandageMaker, infob)

function CraftBandage (source)
    if isElementWithinMarker(source, BandageMaker) then 
         if (getElementData(getPlayerTeam(source), "type")) == 4 then 
                if  not getElementData(source, "Crafting", true) then
                    if (exports.global:hasItem( source, 403)) then
                               exports["SCR_Notifs"]:show_box(source, "You are crafting the bandage , stand by.", "info")
                               setElementData(source, "Crafting", true)
                               setPedFrozen(source, true)
                               setPedAnimation(source, "BD_FIRE", "BD_Panic_Loop", 20000, true, false, false, false) 
                            setTimer(function()
                                setPedFrozen(source, false)
                                executeCommandHandler("ame", source,"Takes the items needed and starts crafting the bandage.")
                                exports["SCR_Notifs"]:show_box(source, "You crafted 3x bandages.", "info")
                                exports.global:takeItem(source, 403, 1)
                                exports.global:giveItem (source, 400, 1 )
                                exports.global:giveItem (source, 400, 1 )
                                exports.global:giveItem (source, 400, 1 )
                                setElementData(source, "Crafting", false)
                                end, Craft_Bandage, 1)
                    else 
                        exports["SCR_Notifs"]:show_box(source, "You don't have the item needed.", "error") 
                    end
                else 
                    exports["SCR_Notifs"]:show_box(source, "You already Crafting , stand by.", "error") 
                end
        else 
            exports["SCR_Notifs"]:show_box(source, "You are not a medic.", "error") 
        end
    end 
end 
addCommandHandler("craftbandage", CraftBandage) 