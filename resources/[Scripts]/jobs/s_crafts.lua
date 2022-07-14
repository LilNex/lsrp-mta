-- addCommandHandler("createCraft",function(player, cmd)


-- end)
fo ={
    [94] = 1,
    [92] = 1,
    [95] = 1,
    -- [93] = 1,
    [97] = 1,
    [98] = 1,
}

cArea = {}
mysql = exports.mysql

addEvent("jobs:addCraft",true)
addEventHandler("jobs:addCraft",root,function(s)

    -- outputChatBox(toJSON(s.Needs),source)
    mysql:query_insert_free("INSERT INTO crafts ( name, type, idJob, giveItemID, giveItemValue,needs ) VALUES ('"..tostring(s.name).."', "..tostring(s.Type)..", "..tostring(s.idJob)..", "..tostring(s.giveItemID )..", "..tostring(s.giveItemValue)..",  '"..toJSON(s.Needs).."' )")
    outputChatBox("Craft added",source)
end)

function hasItemC(player,id,qte)
    local inv = exports["item-system"]:getItems(player)
    i = 0
    for k,v in ipairs(inv)do 
        if v[1] == id then 
            i=i+1
        end
    end
    if i >= qte then return true 
    else return false end
end

function takeItemC(player,id,qte)
    local inv = exports["item-system"]:getItems(player)
    if hasItemC(player,id,qte) then
        i = 0
        -- outputChatBox("start loop inv",player)
        for k,v in ipairs(inv)do 
           if v[1] == id then 
                -- outputChatBox("v[1] == id",player)
               exports["item-system"]:takeItem(player,id)
               i=i+1
            --    outputChatBox("i :"..tostring(i),player)
               if i == qte then  return true end
            end
        end
    else
        return false
    end
end


function craftItem(player,craft)
    -- if getElementData(player,"job") == craft.idJob then 
        for k,v in ipairs(craft.Needs) do 
            if not hasItemC(player,v.NeededID,v.Qte) then 
                outputChatBox("You don't have needed items",player)
                return false
            end

        end
        for k,v in ipairs(craft.Needs) do 
            -- outputChatBox("needed ID:"..v.NeededID)
            takeItemC(player,v.NeededID,v.Qte)
        end
        if tonumber(craft.type) == 2 then 
            local dbid = tonumber(getElementData(player,"dbid"))
            local x = math.random(1000,9999)
            local mySerial = "2727xxx2727jbl"..tostring(x)
			give, error = exports.global:giveItem(player, 115, craft.giveItemValue..":"..mySerial..":"..getWeaponNameFromID(craft.giveItemValue).."::")
            local line = "Player : "..getPlayerName(player).." has crafted weapon ("..getWeaponNameFromID(craft.giveItemValue)..") id : "..tostring(craft.giveItemValue).." ."
            -- exports.ddhooker:sendCraftDiscord(line)
            mysql:query_insert_free("INSERT INTO craftlogs (line) VALUES ('"..tostring(line).."' )")
            outputChatBox("You crafted succesfully a weapon", player)
            -- triggerEvent("onMakeGun",player,player,"craftGun",player, craft.giveItemValue)
        else
            exports["item-system"]:giveItem(player,craft.giveItemID,craft.giveItemValue)
            outputChatBox("You crafted succesfully an "..exports['item-system']:getItemName(craft.giveItemID),player)

        end

    -- else 
    --     outputChatBox("You can't do that job.",player)
    --     -- outputChatBox("job player : "..getElementData(player,"job") )
    --     -- outputChatBox("job needed : "..craft.idJob )
    -- end


end

function addCraft(player, cmd,  job)
    -- if job then
     if tonumber(getElementData(player,"admin_level")) >= 2 then
        local x,y,z = getElementPosition(player)
        z =z -0.75
        p = {}
        p.marker = createMarker (x,y, z, "cylinder", 2, 150, 130, 20, 50 )
        -- p.blip = createBlip (x,y, z, 62)
        addEventHandler("onMarkerHit",p.marker,function(plr)
            triggerEvent("gui:opencraft",plr,plr)
        end)
        p.type = tonumber(job)
         mysql:query_insert_free("INSERT INTO craftloc ( x, y, z) VALUES ("..tostring(x)..", "..tostring(y)..", "..tostring(z)..")")
       table.insert(cArea,p)
     else
        outputChatBox("Can't do that homie ! Call an admin")
     end

    -- else
    --     outputChatBox("Syntax use: /addCraftArea [Job]",player)
    --     outputChatBox("Types : ",player)
    --     for k,v in ipairs(getCraftsType()) do 
    --         outputChatBox(tostring(k).." - "..tostring(v))
    --     end
    -- end
end

addCommandHandler("addCraftArea", addCraft,false,false)


addEventHandler("onResourceStart",getResourceRootElement(),function()
    -- for k,v in ipairs(getElementsByType("player")) do
    --     setElementData(v, "Taking", false)
    --     setElementData(v, "Processing", false)
    -- end
    local q = mysql:query("SELECT * FROM craftloc")
	while true do
		local row = mysql:fetch_assoc(q)
		if not row then break end
        local x = row["x"]
        local y = row["y"]
        local z = row["z"]
        p = {}
        p.marker = createMarker (x,y, z, "cylinder", 2, 150, 130, 20, 50 )
        addEventHandler("onMarkerHit",p.marker,function(source)
            triggerEvent("gui:opencraft",source,source)
        end)
        -- p.blip = createBlip (x,y, z, 62)
        p.type = tonumber(row["type"])
        
       table.insert(cArea,p)
	end
    mysql:free_result(q)


    

end)

function getCraftsByPlayer(plr)
    local t = {}
    local fId = tonumber(getElementData(plr,"faction"))
    local isFo = fo[fId] or 0 
    local q = nil
    -- outputChatBox(tostring(isFo),plr)
    -- if isFo == 1 then 
    --     q = mysql:query("SELECT * FROM crafts")
    -- else 
    --     q = mysql:query("SELECT * FROM crafts WHERE fo = "..tostring(isFo).." ")

    -- end
    if fId ~= -1 then 
        q = mysql:query("SELECT * FROM crafts WHERE faction = "..tostring(fId).." ")

    else 
        q = mysql:query("SELECT * FROM crafts WHERE faction = 0 ")

    end

	while true do
		local row = mysql:fetch_assoc(q)
		if not row then break end
        p = {}
        p.id = row["id"]
        p.name = row["name"]
        p.idJob =  tonumber(row["idJob"])
        p.type = tonumber(row["type"])
        p.giveItemID = tonumber(row["giveItemID"])
        p.giveItemValue = tonumber(row["giveItemValue"])
        p.Needs = fromJSON(row["needs"])
        
       table.insert(t, p.id,p)
       addCrafts(p)

	end
    --    outputChatBox("t :"..toJSON(t),plr)

    -- crafts[idJob] =t
    mysql:free_result(q)
    -- crafts[idJob] = t
    return t
end 

addEvent("crafts:craftItem",true)
addEventHandler("crafts:craftItem",root,function(craft)
    -- outputChatBox(toJSON(craft))
    craftItem(source,craft)

end)

addEvent("crafts:updateID",true)
addEventHandler("crafts:updateID",root,getCraftsByPlayer)

addEvent("gui:opencraft",true)
addEventHandler("gui:opencraft",root,function(player)
    -- outputChatBox(tostring(getElementData(player,"job")))
    local crafts = getCraftsByPlayer(player)
    -- outputChatBox("len :"..#crafts)

    -- outputChatBox(toJSON(crafts),player)
    triggerClientEvent(player,"crafts:openGUI",player,crafts)
end)

addCommandHandler("addCraft",function(player, cmd)
    -- outputChatBox(tostring(getElementData(player,"job")))
    local crafts = getCraftsByPlayer(player)
    -- outputChatBox("len :"..#crafts)

    -- outputChatBox(toJSON(crafts),player)
    if tonumber(getElementData(player,"admin_level")) > 4 then
        triggerClientEvent(player,"crafts:addOpenGUI",player,crafts)
    end
end)

