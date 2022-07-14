addEvent("checkACL_blitz", true)
addEventHandler("checkACL_blitz", root, 
function()
	if (getElementData(getPlayerTeam(source), "type")) == 2 then
		triggerClientEvent(source, "openBlitzDx", source)
		--outputChatBox("[Rbs-System] To spawn RBS - Open the panel by 'h' - Select an object - Close the panel and start spawning by 'L'.", localPlayer, 8, 251, 255)
	else
		outputChatBox("[Rbs-System] Faction Error", localPlayer, 255, 0, 0)
	end
end
)

addEvent("putObjectBlitz", true)
addEventHandler("putObjectBlitz", root, 
function(objeto, idobject)
	local posx, posy, posz = getElementPosition(source)
	local rotx, roty, rotz = getElementRotation(source)
	if objeto == "Barreira_1" or objeto == "Barreira_2" or objeto == "Cone" then
		variavel = 0.6
	--elseif objeto == "Fura_Pneus" then
		--variavel = 0.9
	elseif objeto == "Cone_Grande_2" then
		variavel = 1.2	
	else
		variavel = 0
	end
	if objeto == "Barreira_2" then
		variavelrotation = 0
	else
		variavelrotation = 90
	end
	objetoBlitz = createObject(idobject, posx, posy, posz - variavel, rotx, roty, rotz + variavelrotation)
	--outputChatBox("Você colocou: "..objeto, source, 255,255,255, true)
	setElementData(objetoBlitz, "elementFromBlitz", true)
	table.insert(objs, objetoBlitz)
end)

addEvent("deleteObjectBlitz", true)
addEventHandler("deleteObjectBlitz", root, 
function(objeto)
	if objeto then
		destroyElement(objeto)
		outputChatBox("[Rbs-System] Rbs Removed.", source,23, 255, 0)
	end
end)

