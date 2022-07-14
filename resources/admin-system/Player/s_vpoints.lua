function givedonPoint(thePlayer, commandName, targetPlayer, donPoints, ...)
	if exports.integration:isPlayerSeniorAdmin(thePlayer) then
		if (not targetPlayer or not donPoints or not (...)) then
			outputChatBox("SYNTAX: /" .. commandName .. " [Player] [GCs] [Reason]", thePlayer, 255, 194, 14)
		else
			
			local tplayer, targetPlayerName = exports.global:findPlayerByPartialNick(thePlayer, targetPlayer)
			if (tplayer) then
				local loggedIn = getElementData(tplayer, "loggedin")
				if loggedIn == 1 then
					donPoints = tonumber(donPoints)
					if not donPoints or donPoints <= 0 then
						outputChatBox("You can not give a negative amount of GCs.", thePlayer, 255, 0, 0)
						return false
					end
					donPoints = math.floor(donPoints)
					local reasonStr = table.concat({...}, " ")
					local accountID = getElementData(tplayer, "account:id")
					
					local playerName = exports.global:getPlayerFullIdentity(thePlayer,1)
					local targetName = exports.global:getPlayerFullIdentity(tplayer, 1)
					local targetNameFull = exports.global:getPlayerFullIdentity(tplayer)
					
					exports.achievement:awardPlayer(tplayer, "FREE GAMECOINS AWARD! ("..string.upper(playerName)..")", reasonStr, donPoints)
					
					outputChatBox("You gave "..targetName.." "..donPoints.." GameCoins for: ".. reasonStr, thePlayer)
					
					local targetUsername = string.gsub(getElementData(tplayer, "account:username"), "_", " ")
					local username = string.gsub(getElementData(thePlayer, "account:username"), "_", " ")
					targetUsername = mysql:escape_string(targetUsername)
					local targetCharacterName = mysql:escape_string(targetPlayerName)
					
					local content = "[B]Give Game Coins money to username:[/B][INDENT]"..targetUsername.."[/INDENT][B]Character name: [/B][INDENT]"..targetCharacterName.."[/INDENT][B]Amount: [/B][INDENT]"..donPoints.." GC[/INDENT][B]Reason: [/B][INDENT]"..mysql:escape_string(reasonStr)..".[/INDENT][INDENT][/INDENT][U][I]Note: Please make a reply to this post with any additional information you may have.[/I][/U]"
					exports["integration"]:createForumThread(thePlayer, thePlayer, 144, "Gave "..donPoints.." GC to ("..targetUsername..") "..targetCharacterName, content, "Please make a reply to this post with any additional information you may have") 
					exports.global:sendMessageToAdmins("[GAMECOINS] " .. playerName .. " has given "..donPoints.." GC to "..targetNameFull..".")
					exports.global:sendMessageToAdmins("Reason: "..reasonStr..".")
					exports.global:sendMessageToAdmins("Info: http://forums.owlgaming.net/forumdisplay.php?144")
				else
					outputChatBox("This player is not logged in.", thePlayer)
				end
			else
				outputChatBox("Something went wrong with picking the player.", thePlayer)
			end
		end
	end
end
addCommandHandler("givegc", givedonPoint, false, false)
addCommandHandler("givegamecoins", givedonPoint, false, false)
addCommandHandler("givegamecoin", givedonPoint, false, false)