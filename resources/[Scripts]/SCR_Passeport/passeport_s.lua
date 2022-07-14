function BuyPasseport1()
    exports.global:takeMoney(source, 5000)
	exports.global:giveItem(source, 183,1)
	exports["HkNotifications"]:show_box(source, "You Have Buy A Passeport")
    characterName = getPlayerName(source):gsub("_", " ")
	gender = getElementData(source, "gender")
	characterDoB = exports.global:getPlayerDoB(source)
	--fingerprint = getElementData(source, "serial")
	skin = getElementModel(source)
	age = getElementData(source,"age")
  --  exports.global:giveItem( source, 183, characterName..";"..(gender==0 and "Male" or "Female")..";"..characterDoB..";"..fingerprint..";"..tonumber(skin)..";"..tonumber(age))
end
addEvent("BuyPasseport1", true)
addEventHandler("BuyPasseport1", root, BuyPasseport1)