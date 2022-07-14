-- ITEM CREATOR BY MAXIME
function spawnItem (thePlayer, targetPlayerID, itemID, itemValue )
	--giveItem( targetPlayer, itemID, itemValue)
	executeCommandHandler ( "giveitem", thePlayer, targetPlayerID.." "..itemID.." "..itemValue )
	-- exports.webhooker:sendItemsDiscord(getPlayerName(thePlayer).."gives to ID"..getPlayerName(targetPlayerID).." item : "..exports["item-system"]:getItemName(itemID , itemValue).." with value "..)
end
addEvent("itemCreator:spawnItem", true)
addEventHandler("itemCreator:spawnItem", getRootElement(), spawnItem)