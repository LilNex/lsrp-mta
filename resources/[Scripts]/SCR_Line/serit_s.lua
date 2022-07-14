--[[
* ***********************************************************************************************************************
* Copyright (c) 2018 Nostalaji Roleplay - All Rights Reserved
* Written by Enes Ep aka Dumper <dumper.scripter@gmail.com>, 23.01.2018
* ***********************************************************************************************************************
]]

SERITLER = {}

function findEmptyID(plr)
	local i = 1
	if not SERITLER[plr] then
		SERITLER[plr] = {}
	end
	while (SERITLER[plr][i]) do
		i = i + 1
	end
	return i
end

SERIT_MODE = {}

function reloadPlayers()
	triggerClientEvent(root,"serit.loadSerits",root,SERITLER)
end

function sendToServer(id,data)
	if not SERITLER[source] then
		SERITLER[source] = {}
	end
	SERITLER[source][id] = data
	reloadPlayers()
end
addEvent("serit.sendToServer",true)
addEventHandler("serit.sendToServer",root,sendToServer)

function seritMode(plr)
	local fact = getElementData(plr,"faction") or 0
	if not(fact == 1) then return end
	if SERIT_MODE[plr] then
		local eid = SERIT_MODE[plr]
		triggerClientEvent( plr, "serit.openSeritModeClient", plr, false, eid )
		outputChatBox("[!] #E21313Line LineAddedByHunter: ID: "..eid,plr,255,0,0,true)
		outputChatBox("[!] #16B84EDelline Bash Tmas7ou Dir /delline [ID].",plr,255,0,0,true)
		SERIT_MODE[plr] = false
		return
	end
	outputChatBox("[!] #E21313Line Bash T7bs Line 3awd CMD/Line.",plr,255,0,0,true)
	local eid = findEmptyID(plr)
	SERIT_MODE[plr] = eid
	triggerClientEvent( plr, "serit.openSeritModeClient", plr, true, eid )
end
addCommandHandler("line",seritMode,false,false)

function seritsil(plr,cmd,id)
	if SERITLER[plr] and tonumber(id) and SERITLER[plr][tonumber(id)] then
		SERITLER[plr][tonumber(id)] = nil
		reloadPlayers()
		outputChatBox("[!] #E21313Line .",plr,255,0,0,true)
	end
end
addCommandHandler("delline",seritsil,false,false)

function quitPlayer ( quitType )
	if SERITLER[source] then
		SERITLER[source] = nil
	end
	reloadPlayers()
end
addEventHandler ( "onPlayerQuit", getRootElement(), quitPlayer )
