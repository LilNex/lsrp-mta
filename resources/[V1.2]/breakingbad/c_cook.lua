

local ui = exports.NativeUI 
vis = false
i = nil
-- ui:setVisible(i,vis)
-- bindKey("5","down",function()
addEvent("bbad:openCookGui",true)
addEventHandler("bbad:openCookGui",root,function(ing1,ing2,ing3)
    if getElementData(localPlayer,"bbad:cooking") then 
        outputChatBox("You are already cooking meth")
        return
    end 
    i = ui:CreatePool("Cooking Meth","Mix Ingredients","NORMALE.PNG",false)
    t1 = {}
    t2 = {}
    t3 = {}
    for i=0,ing1[2] do 
        table.insert(t1,i)
    end 
    for i=0,ing2[2] do 
        table.insert(t2,i)
    end 
    for i=0,ing3[2] do 
        table.insert(t3,i)
    end 
    ui:addTab(i,"select","Pseudophedrine (grams)","x",t1)
    ui:addTab(i,"select","Ammonium Chloride (grams)","x",t2)
    ui:addTab(i,"select","Sulfamic Acid (grams)","x",t3)
    ui:addTab(i,"button","Cook","bbad:cookprocess")




    -- if not vis then 
    --     vis = true
    --     ui:setVisible(i,vis)
    -- else 
    --     vis = false
    --     ui:setVisible(i,vis)

    -- end
    ui:addTab(i,"button","Close","bbad:Close2")
    setElementData(localPlayer,"bbad:cooking",true)
    showCursor(true)
end)    


-- ui:addTab(i,"button","Steal Pseudoephedrine","bbad:C1") 

-- ui:addTab(i,"button","Use Vending Mahine","a5")


addEvent("bbad:C1",true)
addEventHandler("bbad:C1",root,function()
    -- outputChatBox("rttete")
    vis = false
    ui:setVisible(i,vis)
    -- triggerServerEvent("bbad:StealPseudo",localPlayer)

end)

addEvent("bbad:cookprocess",true)
addEventHandler("bbad:cookprocess",root,function()
    -- outputChatBox("rttete")
    -- vis = false
    -- ui:setVisible(i,vis)
    local ings = {}
    for y=1,4 do 
        table.insert(ings,y,(ui:GetCurrentSelect(i,y))-1) 
        -- outputConsole(type(ui:GetCurrentSelect(i,y)).." Val : "..tostring(ui:GetCurrentSelect(i,y)))

    end
    local isCooking = getElementData(localPlayer,"bbad:cookprocess")
    if not isCooking then 
        -- triggerServerEvent()
        triggerServerEvent("bbad:S_cookprocess",localPlayer,ings)
    else 
        outputChatBox("You are already cooking",255,0,0)

    end
end)

addEvent("bbad:Close2",true)
addEventHandler("bbad:Close2",root,function()
    vis = false
    ui:setVisible(i,vis)
    if not getElementData(localPlayer,"bbad:cookprocess") then 
        showCursor(false)

    end

    setElementData(localPlayer,"bbad:cooking",false)

    -- toggleControl(',false)
    -- toggle

end)
progressBar = nil
addEvent("bbad:processGUI",true)
addEventHandler("bbad:processGUI",root,function()
    progressBar = guiCreateProgressBar( 0.4, 0.8, 0.3, 0.1, true, nil ) --create the gui-progressbar
    setTimer(function(pbar)
        guiProgressBarSetProgress(pbar, guiProgressBarGetProgress(pbar)+ (1*100/45))
        if guiProgressBarGetProgress(pbar) >= 94 then 
            guiSetVisible(pbar,false)
            destroyElement(pbar)
            showCursor(false)
        end
    end,1000,48,progressBar)
end)
smokes = {}
addEvent("bbad:showsmoke",true)
addEventHandler("bbad:showsmoke",root,function()
    local veh = getPedOccupiedVehicle(source)
    -- outputChatBox("event test")
    if veh then 
        local x,y,z = getElementPosition(veh)
        local effect = createEffect("prt_smoke_huge",x,y,z+3,0,0,0,400)
        setEffectDensity(effect,0.1)
        -- local effect2 = createEffect("prt_smoke_huge",x,y,z+2.7,0,0,0,120)
        setTimer(function(e1,p)
            if not getElementData(p,"bbad:cooking") or not getElementData(p,"bbad:cookprocess") then  
                destroyElement(e1)
            -- destroyElement(e2)

            end
        end,60000,10,effect,source)

    end

end)


















