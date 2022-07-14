mysql = exports.mysql

addEvent("lockpickVeh", true)

function openLockVeh(veh, player) 
    setElementFrozen(player, false)
    setPedAnimation(player,false)
    -- local data = getAllElementData ( veh)     -- get all the element data of the player who entered the command
    -- for k, v in pairs ( data ) do                    -- loop through the table that was returned
    --     outputConsole ( k .. ": " .. tostring ( v ) )             -- print the name (k) and value (v) of each element data, we need to make the value a string, since it can be of any data type
    -- end


    
	if veh then
		exports.global:takeItem(player, 450)
        exports["vehicle-system"]:unlockpickVeh(veh, player)
        exports['vehicle-manager']:addVehicleLogs(tonumber(getElementData(veh,"dbid")), "lockpicked the car", player)

    end

end



addEventHandler("lockpickVeh", root, openLockVeh)
addEvent("startLockpickVeh", true)
addEventHandler("startLockpickVeh", root, function (player)
	executeCommandHandler("ame", player,"ki lockpick tonobil ")
    -- setTimer( function ()
    setPedAnimation(player, "CASINO","dealone",-1)   

    setElementFrozen(player, true)
    -- end, 10, 500, source, false)
end)

addEvent("failLockpick", true)
addEventHandler("failLockpick", root, function (player)
        setPedAnimation(player)
		exports.global:takeItem(player, 450)
        setElementFrozen(player, false)

end)








