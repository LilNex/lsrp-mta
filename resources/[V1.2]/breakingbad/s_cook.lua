


local needs = {
    ing1 = 14,
    ing2 = 64,
    ing3 = 34,
}

-- addCommandHandler("testx",function(plr,cmd)
--     veh = getPedOccupiedVehicle(plr)
--     setElementData(plr,"bbad:cookprocess",false)
--     setElementData(plr,"bbad:cooking",false)

--     setElementData(veh,"aLob\p:engine",not getElementData(veh,"aLob\p:engine"))


--     setElementData(veh,"cooking",not getElementData(veh,"cooking"))
--     -- outputChatBox("tttt",plr)
--     -- setVehicleEngineState(veh,false)
    


-- end)

-- addCommandHandler("cook",function(plr,cmd)
--     veh = getPedOccupiedVehicle(plr)
--     addEventHandler("onElementDataChange", veh, outputChange)



--     setElementData(veh,"cooking",not getElementData(veh,"cooking"))
--     -- outputDebugString("cooking set",plr)
    


-- end)



function outputChange(theKey, oldValue, newValue)
    if theKey == "engine" and newValue == 1 then 
        if getElementData(source,"cooking") == true then 
            cancelEvent()
            local driver = getVehicleOccupant(source)
            outputChatBox("You can't turn engine on while cooking wait until you finish")
            setVehicleEngineState(source,false)

        end
    end 
end

addEvent("bbad:cook",true)
addEventHandler("bbad:cook",root,function(veh)
    t = mysql:query_fetch_assoc("SELECT bTool1, bTool2, bTool3 FROM `vehicles` WHERE `id`= '" .. tostring(getElementData(veh,"dbid")) .. "'")
    if t['bTool1'] == "1" and t['bTool2'] == "1" and t['bTool3'] == "1" then 
        
        -- outputChatBox("SUCCES",source,0,255,0)
        local inv = exports["item-system"]:getItems(source)
        local ing1, ing2, ing3 = nil
        for k,v in pairs(inv) do 
            if v[1] == 551 then 
                ing1 = v
            elseif v[1] == 552 then 
                ing2 = v
            elseif v[1]==553 then 
                ing3 = v
            end 
        end 
        -- outputConsole(toJSON(inv))
        if ing1 and ing2 and ing3 then 
            triggerClientEvent(source, "bbad:openCookGui", source, ing1, ing2, ing3)
            triggerClientEvent(getElementsByType("player"),"bbad:showsmoke",source)
        else 
        outputChatBox("You don't have necessary ingredients",source,255,0,0)

        end
    else 
        outputChatBox("You can't cook meth without chemistry tools. Install it on your Journey first.",source, 220,0,0)

    end

end)


addEvent("bbad:S_cookprocess",true)
addEventHandler("bbad:S_cookprocess",root,function(ings)
    local inv = exports['item-system']:getItems(source)
    local i1,i2,i3 = nil
    for k,v in pairs(inv) do
        if v[1] == 551 and ings[1] <= v[2] then 
            i1 = v
            -- outputChatBox("SUCCESS 1 : "..tostring(v[2]),source,0,255,0)
        elseif v[1] == 552 and ings[2] <= v[2] then 
            i2 = v
            -- outputChatBox("SUCCESS 2 : "..tostring(v[2]),source,0,255,0)
        elseif v[1]==553 and ings[3] <= v[2] then 
            i3 = v
            -- outputChatBox("SUCCESS 3 : "..tostring(v[2]),source,0,255,0)
        end 
    end

    --ING1
    local r1,r2,r3=0
    if not i1 or not i2 or not i3 then 
        outputChatBox("You don't have necessary ingredients",source,255,0,0)
        return 
    end
    triggerEvent("bbad:sendsmoke",source)

    if i1 then 
        exports['item-system']:takeItem(source,i1[1],i1[2])
        r1 = i1[2] - ings[1]
        exports['item-system']:giveItem(source,i1[1],r1)

    else 
        outputChatBox("You don't have necessary ingredients",source,255,0,0)
    end
    if i2 then 
        exports['item-system']:takeItem(source,i2[1],i2[2])
        r2 = i2[2] - ings[2]
        exports['item-system']:giveItem(source,i2[1],r2)

    else 
        outputChatBox("You don't have necessary ingredients",source,255,0,0)
    end
    if i3 then 
        exports['item-system']:takeItem(source,i3[1],i3[2])
        r3 = i3[2] - ings[3]
        exports['item-system']:giveItem(source,i3[1],r3)

    else 
        outputChatBox("You don't have necessary ingredients",source,255,0,0)
        return
    end
    
    local y1 = math.abs(ings[1]-needs.ing1)
    local y2 = math.abs(ings[2]-needs.ing2)
    local y3 = math.abs(ings[3]-needs.ing3)


    local _q = (y1+y2+y3) * 100 / 250 
    local quality = 100 - _q 
    if ings[1] == 0 or ings[2] == 0 or ings[3] == 0 then
        quality = math.random(0,4)
    end
    if not getElementData(source,"bbad:cookprocess") then 
    setElementData(source,"bbad:cookprocess",true)

        triggerClientEvent(source,"bbad:processGUI",source)
        setTimer(function(p)
            setElementData(p,"bbad:cookprocess",false)
            exports['item-system']:giveItem(p,555,quality)
        
        end,45000,1,source)

    end    --

end)
-- addCommandHandler("elemveh",function(plr,cmd)
--     veh = getPedOccupiedVehicle(plr)

--     setElementData(veh,"engine",0)
--     setElementData(veh,"cooking",true)
--     data = getAllElementData(veh)
--     for k, v in pairs ( data ) do                    -- loop through the table that was returned
--         outputConsole ( k .. ": " .. tostring ( v ) )             -- print the name (k) and value (v) of each element data, we need to make the value a string, since it can be of any data type
--     end


-- end)

-- addEventHandler ( "onPlayerVehiclePreExit", getRootElement(), function()
--     outputChatBox("EVENT",root)
--     if getElementData(source,"bbad:cooking") == true then
--         outputChatBox("COND",root)

--         cancelEvent()
--     end
-- end)

addEvent("bbad:sendsmoke",true)
addEventHandler("bbad:sendsmoke",root,function()
    triggerClientEvent(getElementsByType("player"),"bbad:showsmoke",source)
    -- local pTable = {}
    for k,v in ipairs(getElementsByType("player")) do 
        if getElementData(v,"faction") == 1 then 
            outputChatBox("[RADIO] : A suspect camping car was seen near "..getElementZoneName(source)..".",v,0,20,220)
            -- table.insert(pTable )
        end 

    end 

end)