-- function handleVehicleDamage(attacker, weapon, loss, x, y, z, tire)
--  ---- MAX LOSS 60 - 65 with bike


--  --- to check loss with vehicle
--     -- outputChatBox("Loss : "..tostring(loss))
--     -- if (weapon and getElementModel(source) == 601) then

--     --     -- A weapon was used and the vehicle model ID is that of the SWAT tank so cancel the damage.
--     --     cancelEvent()
--     -- end
--     local veh = getPedOccupiedVehicle(localPlayer)
--     if veh then -- Check there is a player in the vehicle
--          -- Display the message

--         if loss > 40 then
--             outputChatBox("sssss")
--         end
--     end
-- end
-- addEventHandler("onClientVehicleDamage", root, handleVehicleDamage)