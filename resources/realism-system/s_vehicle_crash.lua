function throwPlayerThroughWindow(x, y, z)  
    --if source then
        --local occupants = getVehicleOccupants ( source )
        --local seats = getVehicleMaxPassengers( source )
    
        --if occupants[0] == client then
           -- for seat = 0, seats do          
               -- local occupant = occupants[seat] -- Get the occupant
				--if occupant and getElementType(occupant) == "player" then -- If the seat is occupied by a player...
					if isVehicleLocked(source) then
						setVehicleLocked(source, false)
					else
					end
					exports.anticheat:changeProtectedElementDataEx(client, "realinvehicle", 0, false)
					removePedFromVehicle(client, vehicle)
					setElementPosition(client, x, y, z)
					setPedAnimation(client, "CRACK", "crckdeth2", 10000, true, false, false)
					setTimer(setPedAnimation, 10005, 1, client)
				--end
			--end
        --end
    --end
end
addEvent("crashThrowPlayerFromVehicle", true)
addEventHandler("crashThrowPlayerFromVehicle", getRootElement(), throwPlayerThroughWindow)

function unhookTrailer(thePlayer)
   if (isPedInVehicle(thePlayer)) then
        local theVehicle = getPedOccupiedVehicle(thePlayer)
        if theVehicle then
            detachTrailerFromVehicle(theVehicle) 
        end
   end
end
addCommandHandler("detach", unhookTrailer)
addCommandHandler("unhook", unhookTrailer)

local noBelt = { [431] = true, [437] = true }
function seatbelt(thePlayer)
	if getPedOccupiedVehicle(thePlayer) then
		local theVehicle = getPedOccupiedVehicle(thePlayer)
		if (getVehicleType(theVehicle) == "BMX" or getVehicleType(theVehicle) == "Bike") or (noBelt[getElementModel(theVehicle)] and getVehicleOccupant(theVehicle, 0) ~= thePlayer) then
			outputChatBox("Odd... There's no seatbelt on this vehicle!", thePlayer, 255, 0, 0)
		else
			if 	(getElementData(thePlayer, "seatbelt") == true) then
				exports.anticheat:changeProtectedElementDataEx(thePlayer, "seatbelt", false, true)
				outputChatBox("You unbuckled your seatbelt.", thePlayer, 255, 0, 0)
				exports.global:sendLocalMeAction(thePlayer, "unbuckles their seatbelt.")
			else
				exports.anticheat:changeProtectedElementDataEx(thePlayer, "seatbelt", true, true)
				outputChatBox("You buckled your seatbelt.", thePlayer, 0, 255, 0)
				exports.global:sendLocalMeAction(thePlayer, "buckles in their seatbelt.")
			end
		end
	end
end
addCommandHandler("seatbelt", seatbelt)
addCommandHandler("belt", seatbelt)
addEvent('realism:seatbelt:toggle', true)
addEventHandler('realism:seatbelt:toggle', root, seatbelt)

function removeSeatbelt(thePlayer)
	if getElementData(thePlayer, "seatbelt") and not isPedInVehicle(thePlayer) then
		exports.anticheat:changeProtectedElementDataEx(thePlayer, "seatbelt", false, true)
		exports.global:sendLocalMeAction(thePlayer, "unbuckles their seatbelt.")
	end
end
addEventHandler("onVehicleExit", getRootElement(), removeSeatbelt)

function seatbeltFix()
	local counter = 0
	for _, thePlayer in ipairs(getElementsByType("player")) do
		exports.anticheat:changeProtectedElementDataEx(thePlayer, "seatbelt", false, true)
		counter = counter + 1
	end
	--outputDebugString("Fixed for " .. counter .. " players")
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), seatbeltFix)
--addCommandHandler("fixbelts", seatbeltFix, false, false)
