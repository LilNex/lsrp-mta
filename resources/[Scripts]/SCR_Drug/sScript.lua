--------------------------------------------------
--------------------------------------------------
--												--
--				Script By : Acenox				--
--		 https://discord.gg/Q5qktjYDZb			--
--												--
--------------------------------------------------
--------------------------------------------------
mysql = exports.mysql
setDevelopmentMode(true)
local Marker_Take = createMarker(1108.1650390625, -343.962890625, 74 -1, "arrow", 1.5, 0, 255, 0, 100) 

local Marker_Plant = createMarker(1095.697265625, -317.197265625, 73.9921875 -1, "cylinder", 1.5, 255, 255, 255, 100) 

local Marker_Harvest = createMarker(1095.697265625, -317.197265625, 73.9921875 -1, "cylinder", 1.5, 255, 255, 255, 2) 
local pArea = {}

addCommandHandler("addFarm", function(player, cmd, idFaction, type)
    if idFaction and type then
     if tonumber(getElementData(player,"admin_level")) >= 4 then
        local strType = ""
        if tonumber(type) == 1 then strType = "marijuana"
        elseif tonumber(type) == 2 then strType = "cocaine"
        end
        fName = mysql:query_fetch_assoc("SELECT name FROM `factions` WHERE `id`='" .. tostring(idFaction) .. "'")
        outputChatBox("This planting area ("..strType..") was set to faction "..fName["name"], player,0,250,0)
        local x,y,z = getElementPosition(player)
        p = {}
        p.col = createColRectangle(x-10,y-10,25,25)
        p.factionID = tonumber(idFaction)
        p.type = tonumber(type)
        p.strType = strType
        addEventHandler("onColShapeHit",p.col,function(x)
            outputChatBox("You entered a farm area", x)
    
       end)
       mysql:query_insert_free("INSERT INTO farms ( x, y, z, factionid, type, strtype) VALUES ("..tostring(x)..", "..tostring(y)..", "..tostring(z)..", "..tostring(p.factionID)..", "..tostring(p.type)..", '"..tostring(p.strType).."' )")
       table.insert(pArea,p)
     else
        outputChatBox("Can't do that homie ! Call an admin")
     end

    else
        outputChatBox("Syntax use: /addfarm [idFaction] [Type]",player)
        outputChatBox("Types : ",player)
        outputChatBox("1 - Marijuana ",player)
        outputChatBox("2 - Cocaine ",player)
    end
end,false,false)

-----------------------------------------------
setElementVisibleTo(Marker_Plant, root, false) 
setElementVisibleTo(Marker_Harvest, root, false) 
-------------------------------------------------


function info (source)
    outputChatBox("[System] To get the marijuana plant type /takemarijuana", source, 51, 145, 251, true) 
    
end
addEventHandler("onMarkerHit", Marker_Take, info)

function takemarijuana (source)


    if isElementWithinMarker(source, Marker_Take) then 
        -- if (getElementData(getPlayerTeam(source), "type")) == 2 then 
            if not (exports.global:hasItem( source, 38)) then
                if  not getElementData(source, "Taking", true) then
                               exports["SCR_Notifs"]:show_box(source, "You are taking the marijuana , stand by.", "info")
                               setElementData(source, "Taking", true)
                               setPedFrozen(source, true)
                               setPedAnimation(source, "BD_FIRE", "BD_Panic_Loop", 20000, true, false, false, false) 
                            setTimer(function()
                                setPedFrozen(source, false)
                                executeCommandHandler("ame", source,"Takes the marijuana from the man in front of him.")
                                exports["SCR_Notifs"]:show_box(source, "You got the marijuana plant > Take it to the plantation area and type [/plant].", "info")
                                exports.global:giveItem (source, 276, 1 )
                                setElementData(source, "Queue", false)
                                setElementData(source, "Taking", false)
                                setElementVisibleTo(Marker_Plant, source, false)
                            end, Take_Time, 1)
                else 
                    exports["SCR_Notifs"]:show_box(source, "You already taking marijuana , stand by.", "error") 
                end
            else 
                exports["SCR_Notifs"]:show_box(source, "You have already a marijuana on you , put it away or in a trunk.", "error") 
            end
        -- else
        --     exports["SCR_Notifs"]:show_box(source, "You are not a gang membre", "error") 
        -- end
    end
end
addCommandHandler("takemarijuana", takemarijuana) 

plants = {}

function plantmarijuana (source)
for k,v in ipairs(pArea) do
    if isElementWithinColShape(source, pArea[k].col) then
        local tItem = nil
        if tonumber(pArea[k].type) == 1 then
            tItem = 276

        elseif tonumber(pArea[k].type) == 2 then 
            tItem = 31
        end
        -- outputChatBox(tostring(tItem),source)
        if tonumber(getElementData(source, "faction")) == pArea[k].factionID then
            if (exports.global:hasItem( source, tItem))  then
                if not getElementData(source, "Planting", true) then
                    if not getElementData(source, "Queue", true) then
                          executeCommandHandler("ame", source,"Kneels down and start planting.")
                          exports["SCR_Notifs"]:show_box(source, "You are planting the "..pArea[k].strType.." plant , wait for a while.", "info")
                          local x,y,z = getElementPosition(source)
                          z = z-0.75
                          setPedFrozen(source, true)
                          setElementData(source, "Planting", true)
                          setPedAnimation(source, "BOMBER", "BOM_Plant", 10000, true, false, false, false) 
                          local p = {}
                          p.obj = createObject(2203,x,y,z)
                          p.cObj = createColSphere(x,y,z,1.3)
                          p.type = pArea[k].type
                          p.strType = pArea[k].strType
                            
                        --   attachElements(cObj, obj)
                          setElementData(p.obj,"owner",tonumber(getElementData(source,"dbid")))

                          table.insert(plants, p)
                     ------------------------------------------    
                            setTimer(function(p)
                                setPedFrozen(source, false)
                                exports["SCR_Notifs"]:show_box(source, "You planted the "..pArea[k].strType.." , stand by.", "info")
                                exports.global:takeItem(source, tItem)
                                setElementData(source, "Queue", true)
                                setElementData(source, "Planting", false)
                                setElementData(p.obj, "ready", false)
                                
                                -- setElementVisibleTo(Marker_Plant, source, false)
                            end, Plant_Time1, 1,p)
                                 setTimer(function(p)
                                    -- Drug = createObject(675, 1095.697265625, -317.197265625, 73.9921875 -1) 
                                    setObjectModel(p.obj,2245)
                                    setElementData(p.obj, "ready", true)
                                    exports["SCR_Notifs"]:show_box(source, "The plant is ready to harvest type [/harvest] , and roll it into a joint.", "info")
                                end, Plant_Time2, 1,p)
                    else 
                        exports["SCR_Notifs"]:show_box(source, "You didn't harvest your plant.", "error") 
                    end
                else 
                    exports["SCR_Notifs"]:show_box(source, "You already planting", "error") 
                end
            else 
                exports["SCR_Notifs"]:show_box(source, "You don't have "..pArea[k].strType.." on you", "error") 
            end
        else 
            exports["SCR_Notifs"]:show_box(source, "It's not your farm!", "error") 
        end
    end
    -- else 
    --     exports["SCR_Notifs"]:show_box(source, "You are not in a planting area.", "error") 
    -- end
end
end
addCommandHandler("plant", plantmarijuana) 


function Harvemarijuana (source)

    for _, p in ipairs(plants)do
    if isElementWithinColShape(source, p.cObj) then
        local gItem = nil
        if p.type == 1 then
            gItem = 38
        elseif p.type == 2 then 
            gItem = 34
        end
        -- if (getElementData(getPlayerTeam(source), "type")) == 2 then
            if  getElementData(p.obj,"ready")  and tonumber(getElementData(source , "dbid")) == tonumber(getElementData(p.obj,"owner")) then
                if not getElementData(source, "Harvesting", true) then
                              exports["SCR_Notifs"]:show_box(source, "You are harvesting, stand by", "info")
                              executeCommandHandler("ame", source,"Kneels and start harvesting the plant.")
                              setElementData(source, "Harvesting", true)
                              setPedFrozen(source, true)
                              setPedAnimation(source, "BOMBER", "BOM_Plant", 10000, true, false, false, false)
                              setTimer(function()
                                setPedFrozen(source, false)
                                setPedAnimation(source, false)
                                exports["SCR_Notifs"]:show_box(source, "You harvested the "..p.strType.." plant.", "info") 
                                executeCommandHandler("ame", source,"Takes the plant.")
                                exports.global:giveItem(source, gItem, 1)
                                setElementData(source, "Harvesting", false)
                                setElementData(source, "Queue", false)

                                 destroyElement(p.obj)
                                 destroyElement(p.cObj)
                              end, Harvest_Time, 1)
                else
                    exports["SCR_Notifs"]:show_box(source, "You already harvesting", "error") 
                end
            else
                exports["SCR_Notifs"]:show_box(source, "The plant is not ready.", "error") 
            end
        -- else
        --     exports["SCR_Notifs"]:show_box(source, "You are not a gang member.", "error") 
        -- end
    -- end
    end
    -- else
    --     exports["SCR_Notifs"]:show_box(source, "Wait the plant to grow , or you didn't plant the marijuana.", "error") 
    -- end
    end
end
addCommandHandler("harvest", Harvemarijuana) 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------- Cannabis Section --------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
addEventHandler("onResourceStart",getResourceRootElement(),function()
    for k,v in ipairs(getElementsByType("player")) do
        setElementData(v, "Taking", false)
        setElementData(v, "Planting", false)
        setElementData(v, "Queue", false)
        setElementData(v, "Harvesting", false) 
    end
    local q = mysql:query("SELECT * FROM farms")
	while true do
		local row = mysql:fetch_assoc(q)
		if not row then break end
        local x = row["x"]
        local y = row["y"]
        local z = row["z"]
        p = {}
        p.col = createColRectangle(x-10,y-10,25,25)
        p.factionID = tonumber(row["factionid"])
        p.type = tonumber(row["type"])
        p.strType = tostring(row["strType"])
        addEventHandler("onColShapeHit",p.col,function(x)
            exports["SCR_Notifs"]:show_box(x,"Type /plant to plant.","info")
    
       end)
        
        
       table.insert(pArea,p)
	end
	mysql:free_result(q)
    for k1,v1 in ipairs(getElementsByType("player")) do
    for k,v in ipairs(pArea) do
        
        if pArea[k].factionID == tonumber(getElementData(v1,"faction"))then 
            local x,y,z = getElementPosition(pArea[k].col)
            -- createBlip(x+10,y+10,z,62)
            

        end
        end
    end
    

end)

addEventHandler("onPlayerSpawn",root,function()
    for k,v in ipairs(pArea) do
        if pArea[k].factionID == tonumber(getElementData(source,"faction"))then 
            local x,y,z = getElementPosition(pArea[k].col)
            -- createBlip(x+10,y+10,z,62)

        end
    end


end)

-- function getMyData ( thePlayer, command )
--     local data = getAllElementData ( thePlayer )     -- get all the element data of the player who entered the command
--     for k, v in pairs ( data ) do                    -- loop through the table that was returned
--         outputConsole ( k .. ": " .. tostring ( v ) )             -- print the name (k) and value (v) of each element data, we need to make the value a string, since it can be of any data type
--     end
-- end
-- addCommandHandler ( "elemdata", getMyData )