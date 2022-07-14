-- outputChatBox("start script")

-- addEvent("nxAnim1",true)
-- addEventHandler("nxAnim1",root,function()
--     outputChatBox("tetete")
-- end)
-- addEventHandler("onResourcePreStart",resourceRoot,function()
--     restartResource(getResourceFromName("nativeUI"))
-- end)

local ui = exports.NativeUI 
i = ui:CreatePool("Animations","Select an animation","NORMALE.PNG",true)
vis = false
ui:setVisible(i,vis)
bindKey("5","down",function()
    if not vis then 
        vis = true
        ui:setVisible(i,vis)
    else 
        vis = false
        ui:setVisible(i,vis)

    end
end)    
ui:addTab(i,"button","Cancel Animation")

ui:addTab(i,"select","Type","x",{"Divers", "Divers 2","Position","Police","Chat","Dance"})
ui:addTab(i,"button","Smoke Lean","a1")
ui:addTab(i,"button","Shake Head","a2")
ui:addTab(i,"button","Scratch Balls","a3")
ui:addTab(i,"button","Tla7iya","a4")
ui:addTab(i,"button","Drink Shot","a5")
ui:addTab(i,"button","Use Vending Mahine","a5")

addEventHandler("NativeUI.onWindowClose",localPlayer,function(win)
    -- win.isVisible = false
end)

addEventHandler("NativeUI.onSelectChange",localPlayer,function(win,tab)
    -- outputConsole("win : "..tostring(toJSON(win)).." tab : ".. tostring(toJSON(tab)))
    -- x = ui:getWindow(win)
    -- outputDebugString("winX : "..tostring(toJSON(x)))
    --  outputDebugString("winX : "..tostring(win.Tabs[3][2]))
    if tab == "Police" then 
        ui:ChangeTabName(i,3,"Cop Away")
        ui:ChangeTabName(i,4,"Cop Come")
        ui:ChangeTabName(i,5,"Cop Left")
        ui:ChangeTabName(i,6,"Foot Kick")
        ui:ChangeTabName(i,7,"Talk to driver")
        ui:ChangeTabName(i,8,"Shake No")
    elseif tab == "Divers" then 
        ui:ChangeTabName(i,3,"Smoke Lean")
        ui:ChangeTabName(i,4,"Shake Head")
        ui:ChangeTabName(i,5,"Scratch Balls")
        ui:ChangeTabName(i,6,"Tla7iya")
        ui:ChangeTabName(i,7,"Drink Shot")
        ui:ChangeTabName(i,8,"Use Vending Mahine")
    elseif tab == "Divers 2" then 
        ui:ChangeTabName(i,3,"Karate")
        ui:ChangeTabName(i,4,"F*ck")
        ui:ChangeTabName(i,5,"Hands cover")
        ui:ChangeTabName(i,6,"Watch")
        ui:ChangeTabName(i,7,"Celebrate")
        ui:ChangeTabName(i,8,"Laugh")
    elseif tab == "Chat" then 
        ui:ChangeTabName(i,3,"Idle Talking 1")
        ui:ChangeTabName(i,4,"Idle Talking 2")
        ui:ChangeTabName(i,5,"Idle Talking 3")
        ui:ChangeTabName(i,6,"Idle Talking 4")
        ui:ChangeTabName(i,7,"Think")
        ui:ChangeTabName(i,8,"Stop")
    elseif tab == "Dance" then 
        ui:ChangeTabName(i,3,"Dance 1")
        ui:ChangeTabName(i,4,"Dance 2")
        ui:ChangeTabName(i,5,"Dance 3")
        ui:ChangeTabName(i,6,"Dance 4")
        ui:ChangeTabName(i,7,"Rapping 1")
        ui:ChangeTabName(i,8,"Rapping 2")
    elseif tab == "Position" then 
        ui:ChangeTabName(i,3,"Sit")
        ui:ChangeTabName(i,4,"Lay")
        ui:ChangeTabName(i,5,"Lay 2")
        ui:ChangeTabName(i,6,"Crack")
        ui:ChangeTabName(i,7,"Crack 2")
        ui:ChangeTabName(i,8,"Bat")

    end

    -- win.isVisible = false
end)

addEventHandler("NativeUI.onButtonEnter",localPlayer,function(window,v)
    -- outputDebugString("win : "..tostring(toJSON(window)).." v : ".. tostring(toJSON(v)))
    -- outputDebugString(tostring(v[2]))
    --------------------POLICE
    if v[2] == "Cop Away" then
        triggerServerEvent("nxAnim",localPlayer,"POLICE","CopTraf_Away")
    elseif v[2] == "Cancel Animation" then
        triggerServerEvent("sAnim",localPlayer)
    elseif v[2] == "Cop Come" then
        triggerServerEvent("nxAnim",localPlayer,"POLICE","CopTraf_Come")
    elseif v[2] == "Cop Left" then
        triggerServerEvent("nxAnim",localPlayer,"POLICE","CopTraf_Left")
    elseif v[2] == "Foot Kick" then
        triggerServerEvent("nxAnim",localPlayer,"POLICE","Door_Kick")
    elseif v[2] == "Talk to driver" then
        triggerServerEvent("nxAnim",localPlayer,"car_chat","car_talkm_loop")
    elseif v[2] == "Shake No" then
        triggerServerEvent("nxAnim",localPlayer,"COP_AMBIENT","Coplook_shake")

    --------------------DIVERS 2
    elseif v[2] == "Karate" then
        triggerServerEvent("nxAnim",localPlayer,"PARK","tai_chi_loop")
    elseif v[2] == "F*ck" then
        triggerServerEvent("nxAnim",localPlayer,"ped","fucku")
    elseif v[2] == "Hands cover" then
        triggerServerEvent("nxAnim",localPlayer,"ped","handscower")    
    elseif v[2] == "Watch" then
        triggerServerEvent("nxAnim",localPlayer,"COP_AMBIENT","Coplook_watch")
    elseif v[2] == "Celebrate" then
        triggerServerEvent("nxAnim",localPlayer,"benchpress","gym_bp_celebrate")
    elseif v[2] == "Laugh" then
        triggerServerEvent("nxAnim",localPlayer,"RAPPING","Laugh_01")

    --------------------DIVERS 1
    elseif v[2] == "Drink Shot" then
        triggerServerEvent("nxAnim",localPlayer,"VENDING","VEND_Drink_P")
    elseif v[2] == "Smoke Lean" then
        triggerServerEvent("nxAnim",localPlayer,"LOWRIDER","M_smklean_loop")
    elseif v[2] == "Shake Head" then
        triggerServerEvent("nxAnim",localPlayer,"MISC","plyr_shkhead")    
    elseif v[2] == "Tla7iya" then
        triggerServerEvent("nxAnim",localPlayer,"MISC","Run_Dive")
    elseif v[2] == "Scratch Balls" then
        triggerServerEvent("nxAnim",localPlayer,"MISC","Scratchballs_01")
    elseif v[2] == "Use Vending Mahine" then
        triggerServerEvent("nxAnim",localPlayer,"ped","ATM")

    --------------------CHAT
    elseif v[2] == "Idle Talking 1" then
        triggerServerEvent("nxAnim",localPlayer,"MISC","Idle_Chat_02")
    elseif v[2] == "Idle Talking 2" then
        triggerServerEvent("nxAnim",localPlayer,"PLAYIDLES","time")
    elseif v[2] == "Idle Talking 3" then
        triggerServerEvent("nxAnim",localPlayer,"ped","XPRESSscratch")
    elseif v[2] == "Lose" then
        triggerServerEvent("nxAnim",localPlayer,"wtchrace_lose","time")
    elseif v[2] == "Think" then
        triggerServerEvent("nxAnim",localPlayer,"COP_AMBIENT","Coplook_think")
    elseif v[2] == "Stop" then
        triggerServerEvent("nxAnim",localPlayer,"ped","endchat_01")
    --------------------DANCE
    elseif v[2] == "Dance 1" then
        triggerServerEvent("nxAnim",localPlayer,"DANCING","DAN_Loop_A")
    elseif v[2] == "Dance 2" then
        triggerServerEvent("nxAnim",localPlayer,"DANCING","dance_loop")
    elseif v[2] == "Dance 3" then
        triggerServerEvent("nxAnim",localPlayer,"DANCING","DAN_Right_A")
    elseif v[2] == "Dance 4" then
        triggerServerEvent("nxAnim",localPlayer,"DANCING","dnce_M_d")
    elseif v[2] == "Rapping 1" then
        triggerServerEvent("nxAnim",localPlayer,"RAPPING","RAP_B_Loop")
    elseif v[2] == "Rapping 2" then
        triggerServerEvent("nxAnim",localPlayer,"RAPPING","RAP_A_Loop")

        --------------------POSTION
    elseif v[2] == "Sit" then
        triggerServerEvent("nxAnim",localPlayer,"INT_OFFICE","OFF_Sit_Idle_Loop")
    elseif v[2] == "Lay" then
        triggerServerEvent("nxAnim",localPlayer,"BEACH","Lay_Bac_Loop")
    elseif v[2] == "Crack 1" then
        triggerServerEvent("nxAnim",localPlayer,"CRACK","crckidle1")
    elseif v[2] == "Crack 2" then
        triggerServerEvent("nxAnim",localPlayer,"CRACK","crckidle4")
    elseif v[2] == "Lay 2" then
        triggerServerEvent("nxAnim",localPlayer,"BEACH","ParkSit_M_loop")
    elseif v[2] == "Bat" then
        triggerServerEvent("nxAnim",localPlayer,"CRACK","Bbalbat_Idle_02")
    end
end)


