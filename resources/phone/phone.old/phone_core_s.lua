--MAXIME

mysql = exports.mysql
local phoneO = { }

MTAoutputChatBox = outputChatBox
function outputChatBox( text, visibleTo, r, g, b, colorCoded )
	if string.len(text) > 128 then -- MTA Chatbox size limit
		MTAoutputChatBox( string.sub(text, 1, 127), visibleTo, r, g, b, colorCoded  )
		outputChatBox( string.sub(text, 128), visibleTo, r, g, b, colorCoded  )
	else
		MTAoutputChatBox( text, visibleTo, r, g, b, colorCoded  )
	end
end

function getPhoneSettings(phone, doNotCreateNew) --powerOn, ringtone, isSecret, isInPhonebook, boughtById, boughtByName, boughtDate, sms_tone, tone_volume
	
	local callerphoneIsSecretNumber = 0
	local callerphoneIsTurnedOn = 1
	local callerphoneRingTone = 1
	local callerphonePhoneBook = 1
	local callerphoneBoughtBy = -1
	local callerphoneBoughtByName = "N/A"
	local callerphoneBoughtDate = "N/A"
	local sms_tone = 1
	local keypress_tone = 1
	local tone_volume = 10
	local phoneSettings = mysql:query_fetch_assoc("SELECT *, `charactername`, DATE_FORMAT(`bought_date`,'%b %d %Y %h:%i %p') AS `bought_date` FROM `phones` LEFT JOIN `characters` ON `phones`.`boughtby` = `characters`.`id` WHERE `phonenumber`='"..mysql:escape_string(tostring(phone)).."' LIMIT 1")
	if not phoneSettings then
		if doNotCreateNew then
			return false
		else
			mysql:query_free("INSERT INTO `phones` SET `phonenumber`='"..exports.global:toSQL(phone).."'   ")
		end
	else
		callerphoneIsSecretNumber = tonumber(phoneSettings["secretnumber"]) or 0
		callerphoneIsTurnedOn = tonumber(phoneSettings["turnedon"]) or 1
		callerphoneRingTone =  tonumber(phoneSettings["ringtone"]) or 1
		callerphonePhoneBook =  tonumber(phoneSettings["phonebook"]) or 1
		callerphoneBoughtBy =  tonumber(phoneSettings["boughtby"]) or -1
		callerphoneBoughtByName = phoneSettings["charactername"] or "Unknown"
		callerphoneBoughtDate = phoneSettings["bought_date"] or "Unknown"
		sms_tone = tonumber(phoneSettings["sms_tone"]) or 1
		keypress_tone = tonumber(phoneSettings["keypress_tone"]) or 1
		tone_volume = tonumber(phoneSettings['tone_volume']) or 10
	end
	return callerphoneIsTurnedOn, callerphoneRingTone, callerphoneIsSecretNumber, callerphonePhoneBook, callerphoneBoughtById, callerphoneBoughtByName, callerphoneBoughtDate, sms_tone, keypress_tone, tone_volume
end

function initiatePhoneGUI(phone, popOutOnPhoneCall)
	if not phone or not tonumber(phone) or string.len(phone) < 5 then
		triggerClientEvent(source, "phone:slidePhoneOut", source)
		return false
	end
	if popOutOnPhoneCall then
		if tonumber(popOutOnPhoneCall) then
			popOutOnPhoneCall = tonumber(popOutOnPhoneCall)
		else
			popOutOnPhoneCall = "popOutOnPhoneCall"
		end
	end
	triggerClientEvent(source, "phone:updatePhoneGUI", source, popOutOnPhoneCall or "initiate", {phone, getPhoneSettings(phone)})
	triggerEvent("phone:applyPhone", source, "phone_in")
	return true
end
addEvent("phone:initiatePhoneGUI", true)
addEventHandler("phone:initiatePhoneGUI", root, initiatePhoneGUI)

function powerOn(phone, state)
	if not phone or not tonumber(phone) or string.len(phone) < 5 then
		triggerClientEvent(source, "phone:powerOn:response", source, false, state)
		return false
	end
	return triggerClientEvent(source, "phone:powerOn:response", source, mysql:query_free("UPDATE `phones` SET `turnedon`='"..state.."' WHERE `phonenumber`='"..mysql:escape_string(tostring(phone)).."'"), state)
end
addEvent("phone:powerOn", true)
addEventHandler("phone:powerOn", root, powerOn)

function applyPhone(string, popOutOnPhoneCall)
	if not canPlayerCall(source) and string ~= "phone_out" then
		--return false
	end

	local phonestate = getElementData(source, "phonestate") or 0
	outputDebugString("[Phone] applyPhone / phonestate = "..phonestate.. " / action = "..string)
	if string == "phone_in" then
		--outputDebugString("[Phone] "..getPlayerName(source).." / phone_in")
		triggerEvent('sendAme', source, "takes out a cellphone.")
		if getElementData(source, "phone_anim") ~= "0" then
			if not isElement(phoneO[source]) then
				phoneO[source] = createObject(330, 0, 0, 0)
			end
			setElementDimension(phoneO[source], getElementDimension(source))
			setElementInterior(phoneO[source], getElementInterior(source))
			exports.bone_attach:attachElementToBone(phoneO[source], source, 12, -0.05, 0.02, 0.02, 20, -90, -10)
			setPedAnimation(source, "ped", string, 1, false)
		else
			if isElement(phoneO[source]) then
				destroyPhone(source)
			end
		end
		if getElementData(source, "cellphoneGUIStateSynced") ~= 1 then
			exports.anticheat:changeProtectedElementDataEx(source, "cellphoneGUIStateSynced", 1 , true)
		end
		exports.anticheat:changeProtectedElementDataEx(source, "cellphoneGUIStateSynced", 1 , true)
	elseif string == "phone_talk" then
		--outputDebugString("[Phone] "..getPlayerName(source).." / phone_talk")
		if getElementData(source, "phone_anim") ~= "0" then
			if not isElement(phoneO[source]) then
				phoneO[source] = createObject(330, 0, 0, 0)
			end
			setElementDimension(phoneO[source], getElementDimension(source))
			setElementInterior(phoneO[source], getElementInterior(source))
			exports.bone_attach:attachElementToBone(phoneO[element], source, 12, -0.05, 0.02, 0.02, 20, -90, -10)
			setPedAnimation(source, "ped", string, 1, false)
		else
			if isElement(phoneO[source]) then
				destroyPhone(source)
			end
		end
		if getElementData(source, "cellphoneGUIStateSynced") ~= 1 then
			exports.anticheat:changeProtectedElementDataEx(source, "cellphoneGUIStateSynced", 1 , true)
		end
	elseif string == "phone_out" then
		--outputDebugString("[Phone] "..getPlayerName(source).." / phone_out")
		if phonestate > 0 and not popOutOnPhoneCall then
			triggerEvent("phone:cancelPhoneCall", source)
		end
		--resetPhoneState(source)
		if getElementData(source, "cellphoneGUIStateSynced") then
			if not popOutOnPhoneCall then
				triggerEvent('sendAme', source, "puts down "..(getElementData(source, "gender") == 0 and "his" or "her").." cellphone.")
			end
			if getElementData(source, "phone_anim") ~= "0" then
				setPedAnimation(source, "ped", string, 1, false)
			end
		end
		exports.anticheat:changeProtectedElementDataEx(source, "cellphoneGUIStateSynced", nil , true)
		if isElement(phoneO[source]) then
			setTimer(destroyPhone, 2000, 1, source)
		end

	end
end
addEvent("phone:applyPhone", true)
addEventHandler("phone:applyPhone", root, applyPhone)

function destroyPhone(element)
	if canPlayerCall(element) then
		exports.global:removeAnimation(element) 
	end
	if isElement(phoneO[element]) then
		exports.bone_attach:detachElementFromBone(phoneO[element])
		destroyElement(phoneO[element]) 
		phoneO[element] = nil
	end
end

function callSomeone(thePlayer, commandName, phoneNumber, withNumber)
	local logged = getElementData(thePlayer, "loggedin")
	withNumber = tonumber(withNumber)
	local outboundPhoneNumber = -1
	if (logged==1) then
		local publicphone = nil
		for k, v in pairs( getElementsByType( "colshape", getResourceRootElement( ) ) ) do
			if isElementWithinColShape( thePlayer, v ) then
				for kx, vx in pairs( getElementsByType( "player" ) ) do
					if getElementData( vx, "call.col" ) == v then
						outputChatBox( "Someone else is already using this phone.", thePlayer, 255, 0, 0 )
						return
					end
				end
				publicphone = v
				break
			end
		end
		
		
		
		if publicphone or exports.global:hasItem(thePlayer, 2) then
			-- Determine the outbound number, -1 is secret
			if publicphone then
				outboundPhoneNumber = math.random(51111510, 58111510)
			elseif withNumber and withNumber > 10 then
				if exports.global:hasItem(thePlayer, 2, tonumber(withNumber))  then
					outboundPhoneNumber = tonumber(withNumber)
				else
					local fPhone = getElementData(thePlayer, "factionphone")
					local factionPhone = getElementData(getPlayerTeam(thePlayer), "phone")
					local ignore = false
					if fPhone and factionPhone then
						num = string.format("%02d%02d", factionPhone, fPhone)

						if tostring(withNumber) == num then
							ignore = true
							outboundPhoneNumber = tonumber(withNumber)
						end
					end

					if not ignore then
						outputDebugString(getPlayerName(thePlayer).." tried to call with a phone he doesn't have?")
						return
					end
				end
			end
			
			if not outboundPhoneNumber or outboundPhoneNumber == -1 then
				outputChatBox("Error: please report on F2.", thePlayer, 255, 0, 0)
				return
			end
			
			if not (phoneNumber) then
				outputChatBox("Press 'i' and click the phone you want to use, please.", thePlayer)
				return
				--requestPhoneGUI(1, thePlayer)
			end

			if not tonumber(phoneNumber) then
				local result = mysql:query_fetch_assoc("SELECT entryNumber FROM phone_contacts WHERE entryName='" .. exports.mysql:escape_string(tostring(phoneNumber)) .. "' AND phone='" .. exports.mysql:escape_string(tostring(outboundPhoneNumber)) .."' LIMIT 1")
				if result then
					numberName = phoneNumber
					phoneNumber = tonumber(result["entryNumber"])
				else
					outputChatBox("Couldn't find a number/number for the contact name specified.", thePlayer, 255, 0, 0)
					return
				end
			end

			if not tonumber(phoneNumber) then
				outputChatBox("Invalid phonenumber.", thePlayer)
				return
			end
			local realOutboundPhoneNumber = tonumber(outboundPhoneNumber)
			
			local callerphoneIsSecretNumber = 1
			local callerphoneIsTurnedOn = 1
			local callerphoneRingTone = 1
			local callerphonePhoneBook = 1
			local callerphoneBoughtBy = -1
					
			if not publicphone then
				local testNumber = tostring(realOutboundPhoneNumber)
				if #testNumber == 4 then
					testNumber = fetchFirstPhoneNumber(thePlayer)
				end

				local phoneSettings = mysql:query_fetch_assoc("SELECT * FROM `phones` WHERE `phonenumber`='"..mysql:escape_string(tostring(testNumber)).."'")
				if not phoneSettings then
					mysql:query_free("INSERT INTO `phones` (`phonenumber`) VALUES ('".. mysql:escape_string(tostring(testNumber)) .."')")
					callerphoneIsSecretNumber = 0
					callerphoneIsTurnedOn = 1
					callerphoneRingTone = 1
					callerphonePhoneBook = 1
					callerphoneBoughtBy = -1
				else
					callerphoneIsSecretNumber = tonumber(phoneSettings["secretnumber"]) or 0
					callerphoneIsTurnedOn = tonumber(phoneSettings["turnedon"]) or 1
					callerphoneRingTone =  tonumber(phoneSettings["ringtone"]) or 1
					callerphonePhoneBook =  tonumber(phoneSettings["phonebook"]) or 1
					callerphoneBoughtBy =  tonumber(phoneSettings["boughtby"]) or -1
				end
			end
			
			
			
			if callerphoneIsTurnedOn == 0 then
				outputChatBox("Your phone is off.", thePlayer, 255, 0, 0)
			else
				local calling = getElementData(thePlayer, "calling")
				
				if (calling) then -- Using phone already
					outputChatBox("You are already using a phone.", thePlayer, 255, 0, 0)
				elseif getElementData(thePlayer, "injuriedanimation") then
					outputChatBox("You can't use your phone while knocked out.", thePlayer, 255, 0, 0)
				else
					-- /me it
					if publicphone then
						triggerEvent('sendAme', thePlayer, "reaches for the public phone.")
					else
						--triggerEvent('sendAme', thePlayer, "takes out a cell phone.")
					end
					
					-- If the number is a hotline aka automated machine, then..
					if isNumberAHotline(phoneNumber) then
						exports.anticheat:changeProtectedElementDataEx(thePlayer, "phonestate", 1, false)
						exports.anticheat:changeProtectedElementDataEx(thePlayer, "calling", phoneNumber, false)
						exports.anticheat:changeProtectedElementDataEx(thePlayer, "callingwith", outboundPhoneNumber, false)	
						routeHotlineCall(thePlayer, tonumber(phoneNumber), tonumber(outboundPhoneNumber), true, "")		
								
						--applyPhone(thePlayer, 1, "phone_talk")
					
					-- Otherwise find a fool to answer it
					else
						-- Search for the phone
						local found, foundElement = searchForPhone(phoneNumber)
						
						-- Some basic checks.
						-- Can we afford it?
						local bankMoney = getElementData(thePlayer, "bankmoney") -- done by Anthony to take money from bank instead
						if bankMoney >= 1 then
							if not exports.donators:hasPlayerPerk(thePlayer, 6) and not exports.anticheat:changeProtectedElementDataEx(thePlayer, "bankmoney", tonumber(bankMoney) - 1, false) then
								outputChatBox("You cannot afford a call.", thePlayer, 255, 0, 0)
								return
							end
						else
							outputChatBox("You cannot afford a call.", thePlayer, 255, 0, 0)
							return
						end
						
						-- Yes, Is the target phone online or found at all?
						if not found then
							outputChatBox("You get a dead tone...", thePlayer, 255, 194, 14)
							return
						end
						
						-- Fetch some details
						local calledphoneIsSecretNumber = 1
						local calledphoneIsTurnedOn = 1
						local calledphoneRingTone = 1
						local calledphonePhoneBook = 1
						local calledphoneBoughtBy = -1

						local testNumber = phoneNumber
						if #testNumber == 4 then
							testNumber = fetchFirstPhoneNumber(foundElement)
						end

						local phoneSettings = mysql:query_fetch_assoc("SELECT * FROM `phones` WHERE `phonenumber`='"..mysql:escape_string(tostring(testNumber)).."'")
						if not phoneSettings then
							mysql:query_free("INSERT INTO `phones` (`phonenumber`) VALUES ('".. mysql:escape_string(tostring(testNumber)) .."')")
							calledphoneIsSecretNumber = 0
							calledphoneIsTurnedOn = 1
							calledphoneRingTone = 1
							calledphonePhoneBook = 1
							calledphoneBoughtBy = -1
						else
							calledphoneIsSecretNumber = tonumber(phoneSettings["secretnumber"]) or 0
							calledphoneIsTurnedOn = tonumber(phoneSettings["turnedon"]) or 1
							calledphoneRingTone =  tonumber(phoneSettings["ringtone"]) or 1
							calledphonePhoneBook =  tonumber(phoneSettings["phonebook"]) or 1
							calledphoneBoughtBy =  tonumber(phoneSettings["boughtby"]) or -1
						end
						
						-- Yes, It is perchance off?
						if calledphoneIsTurnedOn == 0 then
							outputChatBox("The phone you are trying to call is switched off.", thePlayer, 255, 194, 14)
							return
						end
						
						-- No, Is the player already calling?
						if getElementData(foundElement, "calling") or foundElement == thePlayer then
							outputChatBox("You get a busy tone.", thePlayer)
							return
						end
						
						-- Note down some needed details.
						exports.anticheat:changeProtectedElementDataEx(thePlayer, "call.col", publicphone, false)
						exports.anticheat:changeProtectedElementDataEx(thePlayer, "calling", tonumber(phoneNumber), false)
						exports.anticheat:changeProtectedElementDataEx(thePlayer, "called", true, false)
						exports.anticheat:changeProtectedElementDataEx(thePlayer, "callingwith", outboundPhoneNumber, false)
						exports.anticheat:changeProtectedElementDataEx(foundElement, "calling", tonumber(outboundPhoneNumber), false)
						exports.anticheat:changeProtectedElementDataEx(foundElement, "called", nil, false)
						
						--applyPhone(thePlayer, 1, "phone_in")
						
															
						local reconning = getElementData(foundElement, "reconx")
						if not reconning then 
							if calledphoneRingTone ~= 0 then
								for _,nearbyPlayer in ipairs(exports.global:getNearbyElements(foundElement, "player"), 10) do
									triggerClientEvent(nearbyPlayer, "startRinging", foundElement, 1, calledphoneRingTone)
								end
							end
							triggerEvent('sendAme', foundElement, "'s cellphone starts to ring.")
						end
						
						local display = "Unknown Number"
						if (callerphoneIsSecretNumber == 1) then
							display = "Unknown Number"
						else
							local callerIDQuery = mysql:query("SELECT `entryName` FROM `phone_contacts` WHERE `phone`='".. mysql:escape_string(phoneNumber) .."' AND `entryNumber`='".. mysql:escape_string(outboundPhoneNumber ).."' LIMIT 1")
							if (mysql:num_rows(callerIDQuery) > 0) then
								local row = mysql:fetch_assoc(callerIDQuery)
								display =  row["entryName"] .." (#".. outboundPhoneNumber .. ")"
							else
								display = "#".. outboundPhoneNumber
							end
							mysql:free_result(callerIDQuery)
						end
						outputChatBox("Your phone #"..tostring(phoneNumber).." is ringing. The display shows '".. display .."' (( /pickup to answer ))", foundElement, 255, 194, 14)
						-- Give the target 30 seconds to answer the call
						setTimer(cancelCall, 30000, 1, { tonumber(phoneNumber), tonumber(outboundPhoneNumber) } )
						exports['logs']:dbLog(thePlayer, 29, { thePlayer, "ph"..tostring(realOutboundPhoneNumber), foundElement, "ph"..tostring(phoneNumber) }, "**Starting call - " .. display .. "**") 
					end
				end
			end
		else
			outputChatBox("Believe it or not, it's hard to dial on a cellphone you do not have.", thePlayer, 255, 0, 0)
		end
	end
end
addEvent("remoteCall", true)
addEventHandler("remoteCall", getRootElement(), callSomeone)

--[[
function makeCall(thePlayer, commandName, phoneNumber)
	if not (phoneNumber) then
		outputChatBox("SYNTAX /" .. commandName .. " [Phone Number / Contact name]", thePlayer, 255, 194, 14)
	else
		if not canPlayerCall(thePlayer) then
			outputChatBox("You're unable to make phone call at the moment.", thePlayer, 255,0,0)
			return false
		end

		local hasCellphone, itemKey, itemValue, itemID = exports.global:hasItem(thePlayer, 2)
		if itemValue then
			callSomeone(thePlayer, commandName, phoneNumber, itemValue)
		else
			for k, v in ipairs( getElementsByType( "colshape", resourceRoot ) ) do
				if isElementWithinColShape( thePlayer, v ) then
					callSomeone(thePlayer, commandName, phoneNumber, -1)
					return
				end
			end
			outputChatBox("You don't have a phone.", thePlayer, 255, 0, 0)
		end
	end
end
addCommandHandler("call", makeCall)
]]

function makeFCall(thePlayer, commandName, phoneNumber)
	local fPhone = getElementData(thePlayer, "factionphone")
	local factionPhone = getElementData(getPlayerTeam(thePlayer), "phone")
	if fPhone and factionPhone then
		num = string.format("%02d%02d", factionPhone, fPhone)
		if not (phoneNumber) then
			outputChatBox("SYNTAX /" .. commandName .. " [Phone Number]", thePlayer, 255, 194, 14)
		else
			local hasCellphone, itemKey, itemValue, itemID = exports.global:hasItem(thePlayer, 2)
			if itemValue then
				callSomeone(thePlayer, commandName, phoneNumber, num)
			end
		end
	end
end
addCommandHandler("fcall", makeFCall)

function cancelCall(phoneNumbers)
	for _, phoneNumber in ipairs(phoneNumbers) do
		local found, foundElement = searchForPhone(phoneNumber)
		if found and foundElement and isElement(foundElement) then
			local phoneState = getElementData(foundElement, "phonestate")
			
			if (phoneState==0) then
				exports.anticheat:changeProtectedElementDataEx(foundElement, "calling", nil, false)
				exports.anticheat:changeProtectedElementDataEx(foundElement, "called", nil, false)
				exports.anticheat:changeProtectedElementDataEx(foundElement, "call.col", nil, false)
			end
		end
	end
end
--[[
function answerPhone(thePlayer, commandName)
	local logged = getElementData(thePlayer, "loggedin")
	
	if (logged==1) then
		if (exports.global:hasItem(thePlayer, 2)) then
			local phoneState = getElementData(thePlayer, "phonestate")
			local calling = getElementData(thePlayer, "calling")
			
			if getElementData(thePlayer, "called") then
				outputChatBox("You're the one calling someone else, smart-ass.", thePlayer, 255, 0, 0)
			elseif (calling) then
				if isPedDead(thePlayer) then
					outputChatBox("You're unable to make phone call at the moment.", thePlayer, 255,0,0)
					return false
				end
				
				if (phoneState==0) then
					local found, foundElement = searchForPhone(calling)
					--local target = calling
					outputChatBox("You picked up the phone. (( /p to talk ))", thePlayer)
					if not found then
						outputChatBox("You can't hear anything on the other side of the line", thePlayer)
						executeCommandHandler( "hangup", thePlayer )
					else
						outputChatBox("They picked up the phone.", foundElement)
						triggerEvent('sendAme', thePlayer, "takes out a cell phone.")
						exports.anticheat:changeProtectedElementDataEx(thePlayer, "phonestate", 1, false)
						exports.anticheat:changeProtectedElementDataEx(foundElement, "phonestate", 1, false)
						exports.anticheat:changeProtectedElementDataEx(foundElement, "called", nil, false)
						triggerEvent('sendAme', thePlayer, "answers their cellphone.")

						
						--applyPhone(thePlayer, 2, "phone_talk")
						
						if getElementData(foundElement, "forcedanimation")~=1 and tonumber(getElementData(foundElement, "phone_anim"))==1 then
							setPedAnimation(foundElement, "ped", "phone_talk", 1, false)
						end

						local ownPhoneNo = getElementData(foundElement, "calling")
						exports['logs']:dbLog(thePlayer, 29, { thePlayer, "ph"..tostring(ownPhoneNo), foundElement, "ph"..tostring(calling) }, "**Picked up phone**") 
					end

					triggerClientEvent("stopRinging", thePlayer)
				end
			elseif not (calling) then
				outputChatBox("Your phone is not ringing.", thePlayer, 255, 0, 0)
			elseif (phoneState==1) or (phoneState==2) then
				outputChatBox("Your phone is already in use.", thePlayer, 255, 0, 0)
			end
		else
			outputChatBox("Believe it or not, it's hard to use a cellphone you do not have.", thePlayer, 255, 0, 0)
		end
	end
end
addCommandHandler("pickup", answerPhone)
]]

addEventHandler("savePlayer", root,
	function(reason)
		if reason == "Change Character" then
			triggerEvent("phone:cancelPhoneCall", source)
		end
	end)


addEventHandler( "onColShapeLeave", getResourceRootElement(),
	function( thePlayer )
		if getElementData( thePlayer, "call.col" ) == source then
			executeCommandHandler( "hangup", thePlayer )
		end
	end
)
addEventHandler( "onPlayerQuit", getRootElement(),
	function( )
		local calling = getElementData( source, "calling" )
		if isElement( calling ) then
			executeCommandHandler( "hangup", source )
		end
	end
)


function phoneBook(thePlayer, commandName, partialNick)
	local logged = getElementData(thePlayer, "loggedin")
	
	if (logged==1) then
		if (exports.global:hasItem(thePlayer, 7)) then
			if not (partialNick) then
				outputChatBox("SYNTAX: /phonebook [Partial Subscriber Name / Number]", thePlayer, 255, 194, 14)
			else
				triggerEvent('sendAme', thePlayer, "looks into their phonebook.")
				local result = mysql:query("SELECT `charactername`, `phonenumber` FROM `phones` LEFT JOIN `characters` ON `phones`.`boughtby`=`characters`.`id` WHERE `phonebook`=1 AND (`charactername` LIKE '%" .. mysql:escape_string(partialNick) .. "%' OR `phonenumber` LIKE '%" .. mysql:escape_string(partialNick) .. "%') AND `secretnumber` = 0 LIMIT 20")
				if (mysql:num_rows(result)>10) then
					outputChatBox("Too many results.", thePlayer, 255, 194, 14)
				elseif (mysql:num_rows(result)>0) then
					local continue = true
					while true do
						local row = mysql:fetch_assoc(result)
						if not row then break end
						local phoneNumber = tonumber(row["phonenumber"])
						local username = tostring(row["charactername"]):gsub("_", " ")
						
						outputChatBox(username .. " - #" .. phoneNumber .. ".", thePlayer)
					end
				else
					outputChatBox("You find no one with that name.", thePlayer, 255, 194, 14)
				end
				mysql:free_result(result)
			end
		else
			outputChatBox("Believe it or not, it's hard to use a phonebook you do not have.", thePlayer, 255, 0, 0)
		end
	end
end
addCommandHandler("phonebook", phoneBook)

function initiateSendSMS(thePlayer, commandName, number, ...)
	outputChatBox("This command is temporarily disabled until new SMS system is completed. For now you can send SMS by clicking your cellphone in your inventory.", thePlayer, 255, 0, 0)
	--sendSMS(thePlayer, commandName, 1, number, ...)
end
addCommandHandler("sms", initiateSendSMS)


function sendSMS(thePlayer, commandName, sourcePhone, number, ...)
	local logged = getElementData(thePlayer, "loggedin")
	
	if (logged==1) then
		if (exports.global:hasItem(thePlayer, 2)) then
		
			local phoneNumber = -1
			
			local count = 0
			local items = exports['item-system']:getItems(thePlayer)
			for k, v in ipairs(items) do
				if v[1] == 2 then
					count = count + 1
					if count == sourcePhone then
						foundPhoneNumber = v[2]
						break
					end
				end
			end
			
			if foundPhoneNumber then
				phoneNumber = foundPhoneNumber
			end
			
			
			if not number then
				outputChatBox("No phone number/contact name entered.", thePlayer)
				return
			end
			
			if not tonumber(number) then
				local result = mysql:query_fetch_assoc("SELECT entryNumber FROM phone_contacts WHERE entryName='" .. exports.mysql:escape_string(tostring(number)) .. "' AND phone='" .. exports.mysql:escape_string(tostring(phoneNumber)) .."' LIMIT 1")
				if result then
					numberName = number
					number = tonumber(result["entryNumber"])
				else
					outputChatBox("Couldn't find a number/number for the contact name specified.", thePlayer, 255, 0, 0)
					return
				end
			end
			
			-- Fetch some details
			local callerphoneIsSecretNumber = 1
			local callerphoneIsTurnedOn = 1
			local callerphoneRingTone = 1
			local callerphonePhoneBook = 1
			local callerphoneBoughtBy = -1
							
			if not publicphone then
				local phoneSettings = mysql:query_fetch_assoc("SELECT * FROM `phones` WHERE `phonenumber`='"..mysql:escape_string(tostring(phoneNumber)).."'")
				if not phoneSettings then
					mysql:query_free("INSERT INTO `phones` (`phonenumber`) VALUES ('".. mysql:escape_string(tostring(phoneNumber)) .."')")
					callerphoneIsSecretNumber = 0
					callerphoneIsTurnedOn = 1
					callerphoneRingTone = 1
					callerphonePhoneBook = 1
					callerphoneBoughtBy = -1
				else
					callerphoneIsSecretNumber = tonumber(phoneSettings["secretnumber"]) or 0
					callerphoneIsTurnedOn = tonumber(phoneSettings["turnedon"]) or 1
					callerphoneRingTone =  tonumber(phoneSettings["ringtone"]) or 1
					callerphonePhoneBook =  tonumber(phoneSettings["phonebook"]) or 1
					callerphoneBoughtBy =  tonumber(phoneSettings["boughtby"]) or -1
				end
			end
			
			
						
			if not number or not (...) then
				outputChatBox("SYNTAX: /" .. commandName .. " [number] [message]", thePlayer, 255, 194, 14)
			elseif callerphoneIsTurnedOn == 0 then
				outputChatBox("Your phone is off.", thePlayer, 255, 0, 0)
			elseif getElementData(thePlayer, "injuriedanimation") then
				outputChatBox("You can't use your phone while knocked out.", thePlayer, 255, 0, 0)
			end
			--elseif exports.global:hasMoney(thePlayer, 1) or exports.donators:hasPlayerPerk(thePlayer, 6) then
			
				local languageslot = getElementData(thePlayer, "languages.current")
				local language = getElementData(thePlayer, "languages.lang" .. languageslot)
				local languagename = call(getResourceFromName("language-system"), "getLanguageName", language)
				local message = table.concat({...}, " ")
			
				if tonumber(number) == 5555 then
					--[[if not exports.donators:hasPlayerPerk(thePlayer, 6) then
						exports.global:takeMoney(thePlayer, 1)
					end]]
					
					local reconning = getElementData(thePlayer, "reconx")
					if not reconning then
						triggerEvent('sendAme', thePlayer, "sends a text message.")
					end
					outputChatBox("["..languagename.."] SMS to #5555 [#"..tostring(phoneNumber).."]: "..message, thePlayer, 120, 255, 80)
					setTimer( 
						function( thePlayer )
							if isElement( thePlayer ) then
								local id = getElementData( thePlayer, "dbid" )
								if id then
									local impounded = mysql:query_fetch_assoc("SELECT COUNT(*) as no FROM vehicles WHERE owner = " .. mysql:escape_string(id) .. " and Impounded > 0")
									if impounded then
										local amount = tonumber(impounded["no"])
										local reconning2 = getElementData(thePlayer, "reconx")
										if not reconning2 then
											triggerEvent('sendAme', thePlayer,"receives a text message.")
										end
										if amount > 0 then
											outputChatBox("[English] SMS from #5555 [#"..phoneNumber.."]: " .. amount .. " of your vehicles are impounded. Head over to the Impound to release them.", thePlayer, 120, 255, 80)
										else
											outputChatBox("[English] SMS from #5555 [#"..phoneNumber.."]: None of your vehicles are impounded.", thePlayer, 120, 255, 80)
										end
									end
								end
							end
						end, 3000, 1, thePlayer
					)
				elseif tonumber(number) == 7332 then
					--[[if not exports.donators:hasPlayerPerk(thePlayer, 6) then
						exports.global:takeMoney(thePlayer, 1)
					end]]			
					
					if getElementData(thePlayer, "adminjailed") then
						return
					else
						local reconning2 = getElementData(thePlayer, "reconx")
						if not reconning2 then
							triggerEvent('sendAme', thePlayer, "sends a text message.")
						end
						local message = table.concat({...}, " ")
						outputChatBox("["..languagename.."] SMS to #7332 [#"..tostring(phoneNumber).."]: "..message, thePlayer, 120, 255, 80)
						setTimer(
							function( thePlayer )
								if isElement( thePlayer ) then
									--exports.global:takeMoney(thePlayer, 3)
									
									local reconning2 = getElementData(thePlayer, "reconx")
									if not reconning2 then
										triggerEvent('sendAme', thePlayer, "receives a text message.")
									end
									outputChatBox("[English] SMS from #7332 [#"..phoneNumber.."]: Thanks for your message. - Los Santos Network", thePlayer, 120, 255, 80)
								end
							end, 3000, 1, thePlayer
						)
						local theTeam = getTeamFromName("Los Santos Network")
						local teamMembers = getPlayersInTeam(theTeam)
						
						exports.global:giveMoney(theTeam, 3)
					
						for key, value in ipairs(teamMembers) do
							local hasItem, index, number, dbid = exports.global:hasItem(value,2)
							if(hasItem)then
								local reconning2 = getElementData(value, "reconx")
								if not reconning2 then
									triggerEvent('sendAme', value,"receives a text message.")
								end
								
								message = call( getResourceFromName( "chat-system" ), "trunklateText", thePlayer, message )
								local message2 = call(getResourceFromName("language-system"), "applyLanguage", thePlayer, value, call( getResourceFromName( "chat-system" ), "trunklateText", value, message ), language)
								outputChatBox("[" .. languagename .. "] SMS from #7332 [#"..number.."]: Ph:".. phoneNumber .." " .. message2, value, 120, 255, 80)
							end
						end
					end
				else
					local found, target = searchForPhone(number)
										
					if target then
						-- Fetch some details
						local calledphoneIsTurnedOn = 1

						local testNumber = number
						if type(testNumber) ~= "number" then
							if #testNumber == 4 then
								testNumber = fetchFirstPhoneNumber(target)
							end
						end
						
						local phoneSettings = mysql:query_fetch_assoc("SELECT * FROM `phones` WHERE `phonenumber`='"..mysql:escape_string(tostring(testNumber)).."'")
						if not phoneSettings then
							mysql:query_free("INSERT INTO `phones` (`phonenumber`) VALUES ('".. mysql:escape_string(tostring(testNumber)) .."')")
							calledphoneIsTurnedOn = 1
						else
							calledphoneIsTurnedOn = tonumber(phoneSettings["turnedon"]) or 1
						end
						
						
						if calledphoneIsTurnedOn == 0 then
							local reconning = getElementData(thePlayer, "reconx")
							if not reconning then
								triggerEvent('sendAme', thePlayer, "sends a text message.")
							end
							outputChatBox("[" .. languagename .. "] SMS to  #" .. number .. " [#"..tostring(phoneNumber).."]: " .. message, thePlayer, 120, 255, 80)
							
							setTimer( outputChatBox, 3000, 1, "((Automated Message)) The phone with that number is currently off.", thePlayer, 120, 255, 80 )
							return
						end
						
						local username = getPlayerName(thePlayer):gsub("_", " ")
								
						local message2 = call(getResourceFromName("language-system"), "applyLanguage", thePlayer, target, message, language)
							
						local reconning = getElementData(thePlayer, "reconx")
						if not reconning then
							triggerEvent('sendAme', thePlayer, "sends a text message.")
						end
						
						--if numberName and tostring(numberName) then
							--outputChatBox("[" .. languagename .. "] SMS to #" .. number .. " - " .. numberName:gsub("_", " ") .. " [#"..tostring(phoneNumber).."]: " .. message, thePlayer, 120, 255, 80)
						--else
							local result = mysql:query_fetch_assoc("SELECT entryName FROM phone_contacts WHERE entryNumber='" .. tostring(number) .. "' AND phone='"..tostring(phoneNumber).."' LIMIT 1")
							if result then
								numberToName = tostring(result["entryName"])
								outputChatBox("[" .. languagename .. "] SMS to #" .. number .. " - " .. numberToName:gsub("_", " ") .. " [#"..tostring(phoneNumber).."]: " .. message, thePlayer, 120, 255, 80)
							else
								outputChatBox("[" .. languagename .. "] SMS to #" .. number .. " [#"..tostring(phoneNumber).."]: " .. message, thePlayer, 120, 255, 80)
							end
						--end
						
						-- Send the message to the person on the other end of the line
						setTimer(
							function( target, sender, phoneNumber, number, message2 )
								if isElement( target ) then
									local reconning2 = getElementData(target, "reconx")
									if not reconning2 then
										triggerEvent('sendAme', target, "receives a text message.")
									end
									

									local result = mysql:query_fetch_assoc("SELECT entryName FROM phone_contacts WHERE entryNumber='" .. tostring(phoneNumber) .. "' AND phone='"..tostring(number).."' LIMIT 1")
									if result then
										numberFromName = tostring(result["entryName"])
										outputChatBox("[" .. languagename .. "] SMS from #" .. phoneNumber .. " - " .. numberFromName:gsub("_", " ") .. " [#"..number.."]: " .. message2, target, 120, 255, 80)
									else
										outputChatBox("[" .. languagename .. "] SMS from #" .. phoneNumber .. " [#"..number.."]: " .. message2, target, 120, 255, 80)
									end
									
								else
									if isElement(sender) then
										local reconning2 = getElementData(sender, "reconx")
										if not reconning2 then
											triggerEvent('sendAme', sender, "receives a text message.")
										end
										outputChatBox("((Automated Message)) The recipient of the message could not be found.", thePlayer, 120, 255, 80)
									end
								end
							end, 1500, 1, target, thePlayer, phoneNumber, number, message2
						)
						
						--[[if not exports.donators:hasPlayerPerk(thePlayer, 6) then
							exports.global:takeMoney(thePlayer, 1)
						end]]
						
						exports['logs']:dbLog(thePlayer, 30, {thePlayer, "ph"..tostring(phoneNumber), target, "ph"..tostring(number)}, "[" .. languagename .. "] " ..message)
					else
						local reconning = getElementData(thePlayer, "reconx")
						if not reconning then
							triggerEvent('sendAme', thePlayer, "sends a text message.")
						end
						outputChatBox("[" .. languagename .. "] SMS to #" .. number .. " [#"..tostring(phoneNumber).."]: " .. message, thePlayer, 120, 255, 80)
						
						local reconning2 = getElementData(thePlayer, "reconx")
						if not reconning2 then
							triggerEvent('sendAme', thePlayer, "receives a text message.")
						end
						setTimer( outputChatBox, 3000, 1, "((Automated Message)) The recipient of the message could not be found.", thePlayer, 120, 255, 80)
					end
				end
			--[[else
				outputChatBox("You cannot afford a SMS.", thePlayer, 255, 0, 0)
			end]]
		else
			outputChatBox("You don't have a cellphone.", thePlayer, 255, 0, 0)
		end
	end
end




function togglePhone(thePlayer, commandName, phoneNumber)
	local logged = getElementData(thePlayer, "loggedin")
	
	if logged == 1 then
		if not phoneNumber then
			local foundPhone,_,foundPhoneNumber = exports.global:hasItem(thePlayer, 2)
			if foundPhone and foundPhoneNumber then
				phoneNumber = foundPhoneNumber
			end
		elseif tonumber(phoneNumber) < 10 then
			local count = 0
			local items = exports['item-system']:getItems(thePlayer)
			for k, v in ipairs(items) do
				if v[1] == 2 then
					count = count + 1
					if count == phoneNumber then
						phoneNumber = v[2]
						break
					end
				end
			end
		else
			if not (exports.global:hasItem(thePlayer, 2, tonumber(phoneNumber))) then
				outputChatBox("You don't own this phone number", thePlayer, 255, 0, 0)
				return
			end
		end
		local calledphoneIsTurnedOn = 0
		local phoneSettings = mysql:query_fetch_assoc("SELECT * FROM `phones` WHERE `phonenumber`='"..mysql:escape_string(tostring(phoneNumber)).."'")
		if not phoneSettings then
			mysql:query_free("INSERT INTO `phones` (`phonenumber`) VALUES ('".. mysql:escape_string(tostring(phoneNumber)) .."')")
		else
			calledphoneIsTurnedOn = tonumber(phoneSettings["turnedon"]) or 0
		end
		if getElementData( thePlayer, "calling" ) then
			outputChatBox("You are using your phone!", thePlayer, 255, 0, 0)
		else
			if calledphoneIsTurnedOn == 0 then
				outputChatBox("You switched your phone with number '"..tostring(phoneNumber).."' on.", thePlayer, 0, 255, 0)
			else
				outputChatBox("You switched your phone with number '"..tostring(phoneNumber).."' off.", thePlayer, 255, 0, 0)
			end
			mysql:query_free( "UPDATE `phones` SET `turnedon`='"..( 1 - calledphoneIsTurnedOn ) .."' WHERE `phonenumber`='".. mysql:escape_string(tostring(phoneNumber)) .."'")
		end
	end
end
addCommandHandler("togglephone", togglePhone)

--[[ I have no idea what you're trying to do here but this will not work anymore as I just updated the phone. Fix it yourself / Maxime
for i = 1, 20 do
	addCommandHandler( "sms" .. tostring( i ), 
		function( thePlayer, commandName, number, ... )
			if i <= exports['item-system']:countItems(thePlayer, 2) then
				sendSMS( thePlayer, commandName, i, number, ... )
			end
		end
	)
end
]]

function setPhoneBook(thePlayer, commandName, phoneNumber, ...)
	local logged = getElementData(thePlayer, "loggedin")
	
	if logged == 1 then
		if not phoneNumber then
			outputChatBox("Usage: /" .. commandName .. " [phone no.] [text to be found under via /phonebook]", thePlayer, 255, 194, 14)
			return
		end
		
		if tonumber(phoneNumber) < 10 then
			local count = 0
			local items = exports['item-system']:getItems(thePlayer)
			for k, v in ipairs(items) do
				if v[1] == 2 then
					count = count + 1
					if count == phoneNumber then
						phoneNumber = v[2]
						break
					end
				end
			end
		else
			if not (exports.global:hasItem(thePlayer, 2, tonumber(phoneNumber))) then
				outputChatBox("You don't own this phone number", thePlayer, 255, 0, 0)
				return
			end
		end

		local phoneSettings = mysql:query_fetch_assoc("SELECT * FROM `phones` WHERE `phonenumber`='"..mysql:escape_string(tostring(phoneNumber)).."'")
		if not phoneSettings then
			mysql:query_free("INSERT INTO `phones` (`phonenumber`) VALUES ('".. mysql:escape_string(tostring(phoneNumber)) .."')")
		end
		
		local name = (...) and table.concat({...}, " ") or nil
		local success = false
		if name then
			name = name:sub(1, 40)
			success = mysql:query_free( "UPDATE `phones` SET `phonebook`='"..mysql:escape_string(name) .."' WHERE `phonenumber`='".. mysql:escape_string(tostring(phoneNumber)) .."'")
			outputChatBox("You've set your phonebook entry to '" .. name .. "'.", thePlayer, 0, 255, 0)
		else
			success = mysql:query_free( "UPDATE `phones` SET `phonebook`=NULL WHERE `phonenumber`='".. mysql:escape_string(tostring(phoneNumber)) .."'")
			outputChatBox("You've removed your phonebook entry.", thePlayer, 0, 255, 0)
		end
	end
end
addCommandHandler("setphonebook", setPhoneBook)
addCommandHandler("setphonebookname", setPhoneBook)
addCommandHandler("setpbname", setPhoneBook)

function searchForPhone(phoneNumber)
	phoneNumber = tonumber(phoneNumber)
	if phoneNumber then
		for key, value in ipairs(exports.pool:getPoolElementsByType("player")) do
			local logged = getElementData(value, "loggedin")
			if (logged==1) then
				if phoneNumber >= 10000 then -- players can only purchase 5 digit numbers
					-- Check the new system way, phoneNumber in value
					local foundPhone,_,foundPhoneNumber = exports.global:hasItem(value, 2, tonumber(phoneNumber))
					if foundPhone then
						return true, value
					end
				elseif phoneNumber >= 1000 and exports.global:hasItem(value, 2) then -- 4 digit number for factions (2 digits for faction, 2 digits for specific player)
					local fPhone = getElementData(value, "factionphone")
					local factionPhone = getElementData(getPlayerTeam(value), "phone")
					if fPhone and factionPhone then
						num = string.format("%02d%02d", factionPhone, fPhone)
						if tostring(phoneNumber) == num then
							return true, value
						end
					end
				end
			end
		end
	end
	return false, nil
end

function fetchFirstPhoneNumber(target)
	local foundPhone,_,foundPhoneNumber = exports.global:hasItem(target, 2, tonumber(phoneNumber))
	return foundPhoneNumber
end

function setEDX(thePlayer, index, newvalue, sync, nosyncatall)
	return exports.anticheat:changeProtectedElementDataEx(thePlayer, index, newvalue, sync, nosyncatall)
end

function cleanUp()
	for i, player in pairs(getElementsByType("player")) do
		cleanUpOnePlayer(player)
	end
end
addEventHandler("onResourceStop", resourceRoot, cleanUp)

function cleanUpOnePlayer(player)
	--if source then player = source end
	resetPhoneState(player)
	exports.anticheat:changeProtectedElementDataEx(player, "cellphoneGUIStateSynced", nil, true)
end
--addEventHandler("accounts:characters:change", root, cleanUpOnePlayer)
