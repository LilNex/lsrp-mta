function getMyData ( thePlayer, command )
    local data = getAllElementData ( getPedOccupiedVehicle(thePlayer) )     -- get all the element data of the player who entered the command
    for k, v in pairs ( data ) do                    -- loop through the table that was returned
        outputConsole ( k .. ": " .. tostring ( v ) ,root)             -- print the name (k) and value (v) of each element data, we need to make the value a string, since it can be of any data type
    end
end
addCommandHandler ( "vehdata", getMyData )


function VehicleLoss(loss)
    local player = getVehicleOccupant(source)
    if(source) then -- Check there is a player in the vehicle

        if loss > 120 then
            exports.anticheat:changeProtectedElementDataEx(source, "enginebroke", 1, false)
            setElementData(source, "enginebroke", 1)
            setElementData(source, "engine", 0)

            outputChatBox("Your vehicle's engine was brook due to accident", player) -- Display the message
            setVehicleEngineState(source,false)
        end
    end
end

addEventHandler("onVehicleDamage", root, VehicleLoss)
