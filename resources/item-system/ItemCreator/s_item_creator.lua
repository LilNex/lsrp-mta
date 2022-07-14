-- ITEM CREATOR BY MAXIME
function spawnItem (thePlayer, targetPlayerID, itemID, itemValue )
	--giveItem( targetPlayer, itemID, itemValue)
	executeCommandHandler ( "giveitem", thePlayer, targetPlayerID.." "..itemID.." "..itemValue )
	local targetPlayer, targetName = exports.global:findPlayerByPartialNick(thePlayer, tostring(targetPlayerID))
	exports.ddhooker:sendItemsDiscord(getPlayerName(thePlayer).." gives to Player : "..getPlayerName(targetPlayer).." item : "..exports["item-system"]:getItemName(tonumber(itemID),tonumber(itemValue)).." with value "..tostring(itemValue))
end
addEvent("itemCreator:spawnItem", true)
addEventHandler("itemCreator:spawnItem", getRootElement(), spawnItem)