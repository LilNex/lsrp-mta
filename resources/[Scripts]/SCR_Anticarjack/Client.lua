addEventHandler("onClientVehicleStartEnter", root, function(player,seat,door)
	local occupant = getVehicleOccupant(source,0)
	if occupant then
		if (occupant ~= localPlayer and seat == 0)then
		cancelEvent()
		outputChatBox("You cannot carjack")
		end
	end
end)