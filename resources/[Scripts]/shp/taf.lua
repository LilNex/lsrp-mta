
smokeloop = false
j = nil
function taf (commandName )


    thePlayer = getLocalPlayer()
     

    smokingJoint = getElementData(thePlayer, "realism:joint")
    if smokingJoint then
        if j == nil then
            j = 6
        end  
        if j ~= 0 then
            j = j -1
        end 

     if j > 0 then
        

        setPedAnimation(thePlayer,"SMOKING","M_smk_drag",1,false)
        if not getElementData(thePlayer, "taf") then
           setElementData(thePlayer, "taf", true)
            if getElementHealth(thePlayer) < 100 then
                setElementHealth(thePlayer, getElementHealth(thePlayer) + 5)
            
            end
            triggerEvent("enableBloom",localPlayer)
            setTimer(function()
                triggerEvent("disableBloom",localPlayer)              
            end,300000,1)
            toggleControl ("jump", false)
            toggleControl ("sprint", false)
            toggleControl ("crouch", false)
            setTimer(function()
                setElementData(thePlayer, "taf", false)
             end,5000,15)
            setTimer(function()
                setPedAnimation(thePlayer, "SMOKING", "m_smkstnd_loop",-1,true,false)
                smokeloop = true
            end,3500,1)
            setTimer(function()
                if smokeloop then 
                    setElementHealth(thePlayer, getElementHealth(thePlayer) + 0.6)
                    
                end
            end,5000,0)
        end
     else 
            -- executeCommandHandler("throwaway")
            triggerServerEvent("realism:stopsmoking",localPlayer)
            triggerEvent("disableBloom",localPlayer)
            j = nil

     end
    -- else 
        -- triggerEvent("disableBloom",localPlayer)
        

    end

    
    
end
addCommandHandler ( "taf", taf )
bindKey("n","down",taf)


function playerPressedKey(button, press)
    if smokeloop then
        if button == "z" or button == "q" or button == "s" or button == "d" then 
            triggerServerEvent("stopanim", localPlayer, getLocalPlayer())
                smokeloop = false
        end
    end
end
addEventHandler("onClientKey", root, playerPressedKey)

