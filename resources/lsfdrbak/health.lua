--[[ -- ألإصدار القادم سيتم فتح هذا -
---addCommandHandler("alive", getAlivePlayers, false, false)
--function getAlivePlayers( alivePlayersList )
function alivePlayers( getAlivePlayers, alivePlayersList ) --()
if ( alivePlayers ) then -- if we got the table
    alivePlayersList = "none"
    -- Loop through the table
    for playerKey, playerValue in ipairs(alivePlayers) do
        -- add their name to the list
        if ( alivePlayersList == "none" ) then
            alivePlayersList = getPlayerName ( playerValue )
        else
            alivePlayersList = alivePlayersList .. ", " .. getPlayerName ( playerValue )
        end
    end
    outputChatBox ( alivePlayersList .. " : اللاعبين الذين هم على قيد الحياة: ")    
end
addCommandHandler("aaa" ,getAlivePlayers, alivePlayersList)
]]
--revive script by: sRT, Richard C' Lugovoi
function revivePlayerFromPK(thePlayer, commandName, targetPlayer)
	--local theTeam = getPlayerTeam(thePlayer)

		--if (teamID==1 or teamID==2 or teamID==3 or teamID==47 or teamID==59) then
							--	if exports.global:hasItem(thePlayer, 70) then
                     --   exports.global:takeItem(thePlayer, 70)
					--	outputChatBox("You have revived And Take From You 500$", thePlayer, 0, 255, 0)
		if getPlayerTeam( thePlayer ) == getTeamFromName( "Los Santos Fire Department" ) then
		if not (targetPlayer) then
			outputChatBox("SYNTAX: /" .. commandName .. " [Player Partial Name / ID]", thePlayer, 255, 194, 14)
		else
			local targetPlayer, targetPlayerName = exports.global:findPlayerByPartialNick(thePlayer, targetPlayer)
			
			if targetPlayer then
				if getElementData(targetPlayer, "dead") == 1 then
					triggerClientEvent(targetPlayer,"es-system:closeRespawnButton",targetPlayer)
					--fadeCamera(thePlayer, true)
					--outputChatBox("Respawning...", thePlayer)
					if isTimer(changeDeathViewTimer) == true then
						killTimer(changeDeathViewTimer)
					end
					
					
					local x,y,z = getElementPosition(targetPlayer)
					local int = getElementInterior(targetPlayer)
					local dim = getElementDimension(targetPlayer)
					local skin = getElementModel(targetPlayer)
					local team = getPlayerTeam(targetPlayer)
					
					setPedHeadless(targetPlayer, false)
					setCameraInterior(targetPlayer, int)
					setCameraTarget(targetPlayer, targetPlayer)
					setElementData(targetPlayer, "dead", 0)	 
					spawnPlayer(targetPlayer, x, y, z, 0)--, team)
					--(team ~= "Los Santos Emergency Services")
					
					setElementModel(targetPlayer,skin)
					setPlayerTeam(targetPlayer, team)
					setElementInterior(targetPlayer, int)
					setElementDimension(targetPlayer, dim)
					triggerEvent("updateLocalGuns", targetPlayer)
					--local adminTitle = tostring(exports.global:getPlayerAdminTitle(thePlayer))
					outputChatBox("The medic  "..tostring(getPlayerName(thePlayer):gsub("_"," ")).." has been revived you", targetPlayer, 0, 255, 0)
					outputChatBox("You have revived "..tostring(getPlayerName(targetPlayer):gsub("_"," "))..".", thePlayer, 0, 255, 0)
						--if exports.global:hasItem(thePlayer, 34) then
                      --  exports.global:takeItem(thePlayer, 34)
					--	outputChatBox("You have revived And Take From You 500$", thePlayer, 0, 255, 0)
					exports.global:sendMessageToAdmins("AdmCmd: "..getPlayerName(thePlayer).." mrevived "..tostring(getPlayerName(targetPlayer))..".")
					exports.logs:dbLog(thePlayer, 4, targetPlayer, "REVIVED from PK")
				else
					outputChatBox(tostring(getPlayerName(targetPlayer):gsub("_"," ")).." is not dead.", thePlayer, 255, 0, 0)
				end
			end
		end
	end
end
addCommandHandler("frevive", revivePlayerFromPK, false, false)

-- /mrevive  system by sRT
function adminHeal(thePlayer, commandName, targetPlayer)
		if getPlayerTeam( thePlayer ) == getTeamFromName( "Los Santos Fire Department" ) then  -- اسم الفاكشن
		local health = 100
		local targetPlayerName = getPlayerName(thePlayer):gsub("_", " ")
		if not (targetPlayer) then
			targetPlayer = thePlayer
		else
			targetPlayer, targetPlayerName = exports.global:findPlayerByPartialNick(thePlayer, targetPlayer)
		end

			if exports.global:hasMoney(thePlayer, 200) then -- سعرالمعالجة
                exports.global:takeMoney(thePlayer, 200)  -- سعر المعالجة
			    outputChatBox("You have been revived and take from you 200$", thePlayer, 0, 255, 0) -- رسالةتم اذ منك 200 ومعالجتك 
				else
				outputChatBox("You dont have money", thePlayer, 0, 255, 0)
		end
		
		if targetPlayer then
			setElementHealth(targetPlayer, tonumber(health))
		--	outputChatBox("The Medic " .. targetPlayerName .. " Has Treat You , Now Your Health : " .. getAlivePlayers .. " Health.", thePlayer, 0, 255, 0)
			outputChatBox("The medic " .. targetPlayerName .. " has treah you , now your health : " .. health .. " health.", thePlayer, 0, 255, 0)
			else
			triggerEvent("onPlayerHeal", targetPlayer, true)
			exports.logs:dbLog(thePlayer, 4, targetPlayer, "AHEAL "..health)
		end
	end
end
addCommandHandler("maheal", adminHeal, false, false) -- ألتكملةالحلقة القادمة sRT, Richard C' Lugovoi