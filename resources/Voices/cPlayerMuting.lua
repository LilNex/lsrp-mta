local DATA_NAME = "voice:chatting"

local xmlCache = {}



local VOICE_IDLE = {

	type = "image",

	src = ":voice/images/voice_small.png",

	color = tocolor(255,255,255,64),

	width = 20,

	height = 20,

}



local VOICE_CHATTING = {

	type = "image",

	src = ":voice/images/voice_small.png",

	color = tocolor(255,255,255,255),

	width = 20,

	height = 20,

}



local VOICE_MUTED = {

	type = "image",

	src = ":voice/images/voice_small_muted.png",

	color = tocolor(255,255,255,255),

	width = 20,

	height = 20,

}





addEventHandler ( "onClientPlayerVoiceStart", root,

	function()

		if globalMuted[source] then

			cancelEvent()

			return

		end



		setElementData ( source, DATA_NAME, VOICE_CHATTING, false )

	end

)



addEventHandler ( "onClientPlayerVoiceStop", root,

	function()

		setElementData ( source, DATA_NAME, VOICE_IDLE, false )

	end

)



--Mute a remote player for the local player only.  It informs the server as an optimization, so speech is never sent.

function setPlayerVoiceMuted ( player, muted, synchronise )

	if not checkValidPlayer ( player ) then return false end

	if player == localPlayer then return false end



	if muted and not globalMuted[player] then

		globalMuted[player] = true

		addMutedToXML ( player )

		setElementData ( player, DATA_NAME, VOICE_MUTED, false )

		if synchronise ~= false then

			triggerServerEvent ( "voice_mutePlayerForPlayer", player )

		end

	elseif not muted and globalMuted[player] then

		globalMuted[player] = nil

		removeMutedFromXML ( player )

		setElementData ( player, DATA_NAME, VOICE_IDLE, false )

		if synchronise ~= false then

			triggerServerEvent ( "voice_unmutePlayerForPlayer", player )

		end

	end

	return false

end



function isPlayerVoiceMuted ( player )

	if not checkValidPlayer ( player ) then return false end

	return not not globalMuted[player]

end






--Scoreboard/muted player list hook



addEventHandler ( "onClientResourceStart", resourceRoot,

	function()

		if isVoiceEnabled() then

			cacheMutedFromXML ()




			local notifyServerPlayers = {}

			for i,player in ipairs(getElementsByType"player") do

				if xmlCache[getPlayerName(player)] then

					-- Don't synchronise the player muting.  Instead let's send one bigger packet

					setPlayerVoiceMuted ( player, true, false )

					table.insert(notifyServerPlayers,player)

				end



				if #notifyServerPlayers ~= 0 then

					triggerServerEvent ( "voice_muteTableForPlayer", localPlayer, notifyServerPlayers )

				end



				setElementData ( player, DATA_NAME, isPlayerVoiceMuted ( player ) and VOICE_MUTED or VOICE_IDLE, false )

			end

		end

	end

)



function handleJoinedPlayer()

	player = source

	if xmlCache[getPlayerName(player)] then

		setPlayerVoiceMuted ( player, true )

	end

	setElementData ( player, DATA_NAME, isPlayerVoiceMuted ( player ) and VOICE_MUTED or VOICE_IDLE, false )

end








--Player muting XML parsing

function cacheMutedFromXML ()

	local file = xmlLoadFile ( "mutedlist.xml" )

	if not file then return end



	local nodes = xmlNodeGetChildren ( file )

	for i,node in ipairs(nodes) do

		local name = xmlNodeGetAttribute ( node, "name" )

		if name then

			xmlCache[name] = true

		end

	end



	xmlUnloadFile(file)

end



function addMutedToXML ( player )

	if not isElement(player) then return end

	if xmlCache[getPlayerName(player)] then return end

	local name = getPlayerName ( player )



	local file = xmlLoadFile ( "mutedlist.xml" )

	file = file or xmlCreateFile ( "mutedlist.xml", "mutedlist" )



	local node = xmlCreateChild ( file, "mute" )

	xmlNodeSetAttribute ( node, "name", name )



	xmlSaveFile(file)

	xmlUnloadFile(file)



	xmlCache[name] = true

end



function removeMutedFromXML ( player )

	if not isElement(player) then return end

	local name = getPlayerName ( player )



	local file = xmlLoadFile ( "mutedlist.xml" )

	if not file then return end



	local nodes = xmlNodeGetChildren ( file )

	for i,node in ipairs(nodes) do

		if xmlNodeGetAttribute ( node, "name" ) == name then

			xmlDestroyNode ( node )

			break

		end

	end



	xmlSaveFile(file)

	xmlUnloadFile(file)



	xmlCache[name] = nil

end



-- Functions for backward compatibility only

-- DO NOT USE THESE AS THEY WILL BE REMOVED IN A LITTLE WHILE --

function isPlayerMuted ( player )			return isPlayerVoiceMuted ( player ) end

function setPlayerMuted ( player, muted )	return setPlayerVoiceMuted ( player, muted ) end



isVoiceEnabled = isVoiceEnabled or function() return getElementData(resourceRoot,"voice_enabled") end

-- DO NOT USE THESE AS THEY WILL BE REMOVED IN A LITTLE WHILE --

