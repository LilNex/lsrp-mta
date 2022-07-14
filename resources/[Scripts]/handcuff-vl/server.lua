local checkForWarpTimer = {}

function endGrab()
	if checkForWarpTimer[source] then
		if isTimer(checkForWarpTimer[source]) then
			killTimer(checkForWarpTimer[source])
		end

		checkForWarpTimer[source] = nil
	end

	local theGrabber = getElementData(source, "player.Grabbed")

	if isElement(theGrabber) then
		setElementData(theGrabber, "grabbingPlayer", false)
		setElementData(source, "cuffAnimation", false)
	end

	local grabbingPlayer = getElementData(source, "grabbingPlayer")

	if isElement(grabbingPlayer) then
		setElementData(grabbingPlayer, "player.Grabbed", false)

		if getElementData(grabbingPlayer, "player.Cuffed") then
			setElementData(grabbingPlayer, "cuffAnimation", 3)
		else
			setElementData(grabbingPlayer, "cuffAnimation", false)
		end
	end
end
addEventHandler("onPlayerQuit", getRootElement(), endGrab)
addEventHandler("onPlayerWasted", getRootElement(), endGrab)

function grabFunction(sourcePlayer, commandName, targetPlayer)
	if getElementData(sourcePlayer, "faction") == 1 or getElementData(sourcePlayer, "faction") == 102 then
	if not targetPlayer then
		outputChatBox("Use: #ffffff/" .. commandName .. " [ID]", sourcePlayer, 255, 194, 14, true)
	else
		targetPlayer, targetPlayerName = exports.global:findPlayerByPartialNick(sourcePlayer, targetPlayer)
		if sourcePlayer == targetPlayer then outputChatBox("[!]#ffffff You cannot do this on yourself.",sourcePlayer,255,0,0,true) return end
		if targetPlayer then
			triggerEvent("grabPlayer", sourcePlayer, targetPlayer)
			outputChatBox("[!]#ffffff "..targetPlayerName.." started dragging / you can drop by typing dragging.",sourcePlayer,0,0,255,true)
			end
		end
	end
end
addCommandHandler("drag", grabFunction)

function warpPlayerToGrabber(player, grabber)
	if isElement(player) and isElement(grabber) then
		local playerInterior = getElementInterior(player)
		local grabberInterior = getElementInterior(grabber)

		local playerDimension = getElementDimension(player)
		local grabberDimension = getElementDimension(grabber)

		local playerPosX, playerPosY, playerPosZ = getElementPosition(player)
		local grabberPosX, grabberPosY, grabberPosZ = getElementPosition(grabber)

		local _, _, playerRotZ = getElementRotation(player)
		local _, _, grabberRotZ = getElementRotation(grabber)

		local deltaX = grabberPosX - playerPosX
		local deltaY = grabberPosY - playerPosY

		local dist = deltaX * deltaX + deltaY * deltaY

		if playerInterior ~= grabberInterior or playerDimension ~= grabberDimension or dist > 10 then
			local customInterior = tonumber(getElementData(grabber, "currentCustomInterior") or 0)
			
			if customInterior and customInterior > 0 then
				triggerClientEvent(player, "loadCustomInterior", player, customInterior)
			end

			local angle = math.rad(grabberRotZ + 180 - playerRotZ)

			setElementPosition(player, grabberPosX + math.cos(angle) / 2, grabberPosY + math.sin(angle) / 2, grabberPosZ)
			setElementInterior(player, grabberInterior)
			setElementDimension(player, grabberDimension)
		end
	elseif isTimer(checkForWarpTimer[player]) then
		killTimer(checkForWarpTimer[player])
		checkForWarpTimer[player] = nil
	end
end

addEvent("grabPlayer", true)
addEventHandler("grabPlayer", getRootElement(),
	function (targetPlayer)
		if isElement(source) then
			if isElement(targetPlayer) then
				local sourcePosX, sourcePosY, sourcePosZ = getElementPosition(source)
				local targetPosX, targetPosY, targetPosZ = getElementPosition(targetPlayer)

				local sourceInterior = getElementInterior(source)
				local targetInterior = getElementInterior(targetPlayer)

				local sourceDimension = getElementDimension(source)
				local targetDimension = getElementDimension(targetPlayer)

				local distance = getDistanceBetweenPoints3D(sourcePosX, sourcePosY, sourcePosZ, targetPosX, targetPosY, targetPosZ)

				if distance <= 5 then
					if sourceInterior == targetInterior and sourceDimension == targetDimension then
						if getElementData(targetPlayer, "player.Cuffed") then
							if not getElementData(targetPlayer, "player.Grabbed") then
								local grabbingPlayer = getElementData(source, "grabbingPlayer")

								if not isElement(grabbingPlayer) then
									setElementData(source, "grabbingPlayer", targetPlayer)

									setElementData(targetPlayer, "player.Grabbed", source)

									setElementData(targetPlayer, "cuffAnimation", 1)

									if isTimer(checkForWarpTimer[targetPlayer]) then
										killTimer(checkForWarpTimer[targetPlayer])
									end
									outputChatBox(  "[!]#ffffff You are being dragged by a cop.", source, 255, 0, 0, true)

									checkForWarpTimer[targetPlayer] = setTimer(warpPlayerToGrabber, 1000, 0, targetPlayer, source)
								else
									outputChatBox(  "[!]#ffffff You can only lead one person!", source, 255, 0, 0, true)
								end
							else
								outputChatBox(  "[!]#ffffff The selected player is already managed by someone!", source, 255, 0, 0, true)
							end
						else
							outputChatBox(  "[!]#ffffff The selected player is not handcuffed!", source, 255, 0, 0, true)
						end
					end
				else
					outputChatBox(  "[!]#ffffff The chosen player is far from you!", source, 255, 0, 0, true)
				end
			end
		end
	end
)

function letgoFunction(sourcePlayer, commandName, targetPlayer)
	if getElementData(sourcePlayer, "faction") == 1 or getElementData(sourcePlayer, "faction") == 102 then
	if not targetPlayer then
		outputChatBox("Use: #ffffff/" .. commandName .. " [ID]", sourcePlayer, 255, 194, 14, true)
	else
		targetPlayer, targetPlayerName = exports.global:findPlayerByPartialNick(sourcePlayer, targetPlayer)
			if sourcePlayer == targetPlayer then outputChatBox("[!]#ffffff You cannot do this on yourself..",sourcePlayer,255,0,0,true) return end
		if targetPlayer then
			triggerEvent("grabPlayerOff", sourcePlayer, targetPlayer)
			end
		end
	end
end
addCommandHandler("dragging", letgoFunction)


addEvent("grabPlayerOff", true)
addEventHandler("grabPlayerOff", getRootElement(),
	function (targetPlayer)
		if isElement(source) then
			if isElement(targetPlayer) then
				local sourcePosX, sourcePosY, sourcePosZ = getElementPosition(source)
				local targetPosX, targetPosY, targetPosZ = getElementPosition(targetPlayer)

				local sourceInterior = getElementInterior(source)
				local targetInterior = getElementInterior(targetPlayer)

				local sourceDimension = getElementDimension(source)
				local targetDimension = getElementDimension(targetPlayer)

				local distance = getDistanceBetweenPoints3D(sourcePosX, sourcePosY, sourcePosZ, targetPosX, targetPosY, targetPosZ)

				if distance <= 5 then
					if sourceInterior == targetInterior and sourceDimension == targetDimension then
						if getElementData(targetPlayer, "player.Grabbed") then
							setElementData(source, "grabbingPlayer", false)

							setElementData(targetPlayer, "player.Grabbed", false)

							if getElementData(targetPlayer, "player.Cuffed") then
								setElementData(targetPlayer, "cuffAnimation", 3)
							else
								setElementData(targetPlayer, "cuffAnimation", false)
							end

							if isTimer(checkForWarpTimer[targetPlayer]) then
								killTimer(checkForWarpTimer[targetPlayer])
							end

							checkForWarpTimer[targetPlayer] = nil
						end
					end
				else
					outputChatBox(  "[!]#ffffff The person you want to handcuff is away from you.", source, 255, 0, 0, true)
				end
			end
		end
	end
)

function cuffFunction(sourcePlayer, commandName, targetPlayer)
	if getElementData(sourcePlayer, "faction") == 1 or getElementData(sourcePlayer, "faction") == 102 then
		if not targetPlayer then
			outputChatBox("Use: #ffffff/" .. commandName .. " [ID]", sourcePlayer, 255, 194, 14, true)
		else
		  targetPlayer, targetPlayerName = exports.global:findPlayerByPartialNick(sourcePlayer, targetPlayer)
			--if sourcePlayer == targetPlayer then outputChatBox("[!]#ffffff .",sourcePlayer,255,0,0,true) return end
			if targetPlayer then
				triggerEvent("cuffPlayer", sourcePlayer, targetPlayer)
			end
			end
	end
end
addCommandHandler("cuff", cuffFunction)


addEvent("cuffPlayer", true)
addEventHandler("cuffPlayer", getRootElement(),
	function (targetPlayer)
		if isElement(source) then
			if isElement(targetPlayer) then
				local sourcePosX, sourcePosY, sourcePosZ = getElementPosition(source)
				local targetPosX, targetPosY, targetPosZ = getElementPosition(targetPlayer)

				local sourceInterior = getElementInterior(source)
				local targetInterior = getElementInterior(targetPlayer)

				local sourceDimension = getElementDimension(source)
				local targetDimension = getElementDimension(targetPlayer)

				local distance = getDistanceBetweenPoints3D(sourcePosX, sourcePosY, sourcePosZ, targetPosX, targetPosY, targetPosZ)

				if distance <= 5 then
					if sourceInterior == targetInterior and sourceDimension == targetDimension then
						local cuffed = not getElementData(targetPlayer, "player.Cuffed")
						if cuffed then
							dbExec(exports.vrp_sql:getConnection(),"UPDATE characters SET kelepce='1' WHERE id='"..getElementData(targetPlayer, "dbid").."'")
							outputChatBox("[!]#ffffff You were handcuffed by a cop.",targetPlayer,0,0,255,true)
							outputChatBox("[!]#ffffff "..getPlayerName(targetPlayer).." You handcuffed the person named.",source,0,0,255,true)
							exports.global:sendLocalMeAction(source, ""..getPlayerName(targetPlayer).."   cuff.")
						else
							dbExec(exports.vrp_sql:getConnection(),"UPDATE characters SET kelepce='0' WHERE id='" .. tonumber(getElementData(targetPlayer, "dbid")) .. "'")
							outputChatBox("[!]#ffffff You were handcuffed by a police officer.",targetPlayer,0,0,255,true)
							outputChatBox("[!]#ffffff "..getPlayerName(targetPlayer).." The handcuffs of the person were untied .",source,0,0,255,true)
							exports.global:sendLocalMeAction(source, ""..getPlayerName(targetPlayer).."   uncuff.")
						end
						setElementData(targetPlayer, "player.Cuffed", cuffed)
						
					
						if cuffed then
							exports.vrp_controls:toggleControl(targetPlayer, {"jump", "crouch", "walk", "aim_weapon", "fire", "enter_passenger"}, false)
						else
							exports.vrp_controls:toggleControl(targetPlayer, {"jump", "crouch", "walk", "aim_weapon", "fire", "enter_passenger"}, true)
						end
					end
				else
					outputChatBox(  "[!]#ffffff The person you want to handcuff is away from you.", source, 255, 0, 0, true)
				end
			end
		end
	end
)

-- // Yasaklanacak komutları gir
komut_tablo = {
	["stopanim"] = true,
	["superman"] = true,
	["u"] = true,
	["pm"] = true,
	["goto"] = true,
	["gethere"] = true,
	["ooc"] = true,
	["F10"] = true,
	["reconnect"] = true,
}
addEventHandler("onPlayerCommand", root,
    function(c)
		if komut_tablo[c] then
		if getElementData(source, "player.Cuffed") then
			outputChatBox("[!]#ffffff While handcuffed "..c.." You cannot use the command!",source,255,0,0,true)
			cancelEvent ()
		return false end	
		end
    end
)
