function getWindowPosition (w, h)
    local sw, sh= guiGetScreenSize()
    local x = (sw / 2) - (w/2)
    local y = (sh / 2) - (h/2)

    return x,y,w,h
end
-- setElementFrozen(localPlayer, false)

local process = false

function openGUI(point)
if not op then
    -- outputChatBox(tostring(getElementType(point)))
    op = true

    showCursor(true,false)
    local x,y,w,h = getWindowPosition(400,400)
    local window = guiCreateWindow(x,y,w,128,"$$ Money Launder $$", false)
    
    local lblCraft = guiCreateLabel(8,16, w - 20, 48,"Launder $"..tostring(point.maxlaunder).." ,the fee is 10%", false,window)
    local prg = guiCreateProgressBar(8 ,32,w -20 , 32,false, window)
    local btn = guiCreateButton(8, 72,w -256, 48, "Start Laundering", false, window)
    local btn2 = guiCreateButton(8+ w -256 + 92, 72,w -256, 48, "Cancel", false, window)


    --Craft
    addEventHandler("onClientGUIClick", btn, function()
        player = getLocalPlayer()
        if not process then
            if not cancel[player] then
            triggerServerEvent("startLaunder",root,player,point)
            process = true
            guiSetEnabled(btn2,false)
            local progress = 0
            setTimer(function()
                progress = progress + 5
                guiProgressBarSetProgress(prg, progress)
            end,1000 ,20)
            setTimer(function () 
                setPedAnimation(player)
               if progress >= 95 then
                    guiSetEnabled(btn2,true)

                    process = false
                end
            end, 20500, 1)
            else
                outputChatBox("Wait... Not too fast !")

            end
        else 
            outputChatBox("Wait... Not too fast !")
        end
    end)

    --Cancel
    addEventHandler("onClientGUIClick", btn2, function()
        if process then return else
        showCursor(localPlayer,false,true)
        showCursor(false,true)

        setElementFrozen(localPlayer, false)
        op = false
        guiSetVisible(window, false)
        window = {}
        end
    end)
end
end

addEvent("launder-menu:open", true)
addEventHandler("launder-menu:open", localPlayer ,openGUI)
