function getWindowPosition (w, h)
    local sw, sh= guiGetScreenSize()
    local x = (sw / 2) - (w/2)
    local y = (sh / 2) - (h/2)

    return x,y,w,h
end

addEvent("craft-menu:open", true)
addEventHandler("craft-menu:open", root,function(player)
    setElementFrozen(player, true)
    showCursor(true,false)
    local x,y,w,h = getWindowPosition(400,400)
    local window = guiCreateWindow(x,y,w,128,"Craft Lockpick", false)
    
    local lblCraft = guiCreateLabel(8,16, w - 20, 48,"You need 1 Flathead Screwdriver, 1 Vise Grip and 5000$ to craft a lockpick", false,window)
    local prg = guiCreateProgressBar(8 ,32,w -20 , 32,false, window)
    local btn = guiCreateButton(8, 72,w -256, 48, "Start Craft", false, window)
    local btn2 = guiCreateButton(8+ w -256 + 92, 72,w -256, 48, "Cancel", false, window)


    --Craft
    addEventHandler("onClientGUIClick", btn, function()
        player = getLocalPlayer()
        -- outputChatBox(tostring(exports.global:hasItem(player,400,1 )))

        if exports.global:hasItem(player,400,1 ) and exports.global:hasItem(player,10020,1 ) and exports.global:hasMoney(player,500) then
        local progress = 0
        setPedAnimation(player, "CASINO","dealone",-1,true, false,true)
        setTimer(function()
            progress = progress + 6.66
            guiProgressBarSetProgress(prg, progress)
            setPedAnimation(player, "CASINO","dealone",-1,true, false,true)   
        end,1000,15)
        setTimer(function () 
            setPedAnimation(player)
            setElementFrozen(player, false)
            guiSetVisible(window, false)
            showCursor(false,true)
            if progress > 95 then
                triggerServerEvent("craft-menu:success", root, player)
            end
        end, 16000, 1)
        else
            outputChatBox("Ma3ndkch l items bach t crafti lockpick")
        end
    end)

    --Cancel
    addEventHandler("onClientGUIClick", btn2, function()
        showCursor(localPlayer, false, true)
        setElementFrozen(player, false)
        showCursor(false,true)


        guiSetVisible(window, false)
    end)

end)
