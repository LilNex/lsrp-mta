function createCraftPoint(player, cmd)
    local x, y, z = getElementPosition(player)
    -- x = x+2
    z = z - 0.3
    local marker = createMarker(x,y,z,"cylinder", 0.8)
    addEventHandler ("onMarkerHit", marker, t)
    mysql:query_insert_free("INSERT INTO lockpickmarker ( x, y, z) VALUES ("..x..", "..y..", "..z..")")
end

addCommandHandler("createCraftLockpick", createCraftPoint)

function t(hitElement)
    if getElementType(hitElement) == "player" and getPedOccupiedVehicle(hitElement) == false then
        triggerClientEvent(hitElement,"craft-menu:open" , getResourceRootElement(),hitElement)

    end
end

addEventHandler("onResourceStart",getResourceRootElement(),function()

    -- db =  mysql_connect(exports.mysql:getMySQLHost(), exports.mysql:getMySQLUsername(), exports.mysql:getMySQLPassword(), exports.mysql:getMySQLDBName(), exports.mysql:getMySQLPort())
    db = dbConnect("mysql","dbname="..exports.mysql:getMySQLDBName()..";host="..exports.mysql:getMySQLHost()..";charset=utf8",exports.mysql:getMySQLUsername(),exports.mysql:getMySQLPassword())
    dbQuery(function(query) 
        local res = dbPoll(query,1000)
        for id, mark in pairs(res) do
            local marker = createMarker(mark.x,mark.y,mark.z,"cylinder", 0.8)
            addEventHandler ("onMarkerHit", marker, t)
         end
    
    end,db, "SELECT * FROM lockpickmarker")
end)


addEvent("craft-menu:success", true)
addEventHandler("craft-menu:success", root, function (player)
    if exports.global:hasItem(player,400,1 ) and exports.global:hasItem(player,10020,1 ) and exports.global:hasMoney(player,5000) then
        if exports.global:hasSpaceForItem(player, 222, 1) then
            exports.global:takeItem(player,400,1,1 )
            exports.global:takeItem(player,10020,1,1 )
            exports.global:takeMoney(player,5000)
            exports.global:giveItem(player,222,1,1)
            outputChatBox("Lockpick crafted ! Check your inventory.",player,0,255,0)

        else
            outputChatBox("Inventory Full", player)
        end

    else 
        outputChatBox("Ma3ndkch l items bach t crafti lockpick", player)
    end
end)