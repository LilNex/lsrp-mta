local mascaras = {}

function addMask(player,mask,rotz)
	
		removeMask(player)
		local x,y,z = getElementPosition(player)
		mascaras[player] = createObject(mask,x,y,z)
		exports.bone_attach:attachElementToBone(mascaras[player],player,1,-0.003,0,-0.6,0,0,rotz)
end

function removeMask(player)
	if (mascaras[player]) then

		if (exports.bone_attach:isElementAttachedToBone(mascaras[player])) then
			exports.bone_attach:detachElementFromBone(mascaras[player])
			if isElement(mascaras[player]) then destroyElement(mascaras[player]) end
			mascaras[player] = nil
		end
	end
end

addEvent("setMask",true)
addEventHandler("setMask", resourceRoot,
	function(id,rotz)
		addMask(client,id,rotz)
	end
)

addEvent("removeMask",true)
addEventHandler("removeMask", resourceRoot,
	function()
		outputChatBox(getPlayerName(client),client)

		removeMask(client)
	end
)

addEventHandler ( "onPlayerQuit", root,
	function()
		removeMask(source)
	end
)
