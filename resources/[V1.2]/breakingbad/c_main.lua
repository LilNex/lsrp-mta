

local ui = exports.NativeUI 
i = ui:CreatePool("Depot","Select an action","NORMALE.PNG",true)
i = tonumber(i)
vis = false
-- outputChatBox("bbad: "..tostring(i))

ui:setVisible(i,vis)
-- bindKey("5","down",function()
    addEvent("bbad:openDepotGui",true)
addEventHandler("bbad:openDepotGui",root,function()

    if not vis then 
        vis = true
        ui:setVisible(i,vis)
    else 
        vis = false
        ui:setVisible(i,vis)

    end
end)    

-- ui:addTab(i,"select","Type","x",{"Divers", "Divers 2","Position","Police","Chat","Dance"})

ui:addTab(i,"button","Steal Ammonium Chloride","bbad:C1") 
ui:addTab(i,"button","Close","bbad:Close")

-- ui:addTab(i,"button","Use Vending Mahine","a5")


addEvent("bbad:C1",true)
addEventHandler("bbad:C1",root,function()
    -- outputChatBox("rttete")
    vis = false
    ui:setVisible(i,vis)
    triggerServerEvent("bbad:StealPseudo",localPlayer)

end)

addEvent("bbad:Close",true)
addEventHandler("bbad:Close",root,function()
    vis = false
    ui:setVisible(i,vis)

end)