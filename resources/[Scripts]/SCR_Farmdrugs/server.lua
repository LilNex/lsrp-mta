function spawnCannabis()
iprint("Spawned Cannabis (collected by player)")
exports.global:giveItem(source, 277, 1)
exports.global:giveItem(source, 278, 1)
end
addEvent("onGrow",true)
addEventHandler("onGrow",root,spawnCannabis)

function deletePot(element,id)
iprint("Pot deleted")
local db = exports.db:getDBDetails()
      id = (id)
      dbExec(db, "DELETE FROM weedpot WHERE id = ?", id)
	 local attachedElements = getAttachedElements ( element )
	for ElementKey, ElementValue in ipairs ( attachedElements ) do
	  outputChatBox(ElementValue)
	  	destroyElement(element)
	  end
end
addEvent("delpot",true)
addEventHandler("delpot",getRootElement(),deletePot)