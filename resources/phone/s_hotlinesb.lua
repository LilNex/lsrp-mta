function routeHotlineCall(callingElement, callingPhoneNumber, outboundPhoneNumber, startingCall, message)
local callprogress = getElementData(callingElement, "callprogress")
	if callingPhoneNumber == 911 then
		-- 911: Emergency Services and Police.
		-- Emergency calls that they need to respond to.
		if startingCall then
			local answer = "911 Operator [Cellphone]: 911 emergency. Which emergency service do you require?"
			outputChatBox("911 Operator [Cellphone]: 911 emergency. Which emergency service do you require?", callingElement)
			--writeCellphoneLog(caller, callingPhoneNumber, "Calls", outboundPhoneNumber, "<- "..answer )
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
			exports.hud:sendBottomNotification(callingElement, "911 Services", "Police - Medic - Both")
		else
			if (callprogress==1) then -- Requesting the service
				exports.anticheat:changeProtectedElementDataEx(callingElement, "call.service", message, false)
				if checkService(callingElement) == 4 then
					outputChatBox("911 Operator [Cellphone]: Sorry, I don't understand what service you are talking about please try again.", callingElement) -- Ask again if the player didn't say a response in the table.
					--triggerEvent("phone:cancelPhoneCall", callingElement)
				return end
				exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 2, false)
				outputChatBox("911 Operator [Cellphone]: Can you tell me your name please?", callingElement)
			elseif (callprogress==2) then -- Requesting the name
				exports.anticheat:changeProtectedElementDataEx(callingElement, "call.name", message, false)
				exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 3, false)
				outputChatBox("911 Operator [Cellphone]: Please state your emergency.", callingElement)
			elseif (callprogress==3) then
				exports.anticheat:changeProtectedElementDataEx(callingElement, "call.emergency", message, false)
				exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 4, false)
				outputChatBox("911 Operator [Cellphone]: Do you have any additional information to add? If not say no.", callingElement)
			elseif (callprogress==4) then
				outputChatBox("911 Operator [Cellphone]: Thanks for your call, we've dispatched a unit to your location.", callingElement)

				local zonelocation = exports.global:getElementZoneName(callingElement)
				local streetlocation = getElementData(callingElement, "speedo:street")
				local service = checkService(callingElement)
				local name = getElementData(callingElement, "call.name")
				local emergency = getElementData(callingElement, "call.emergency")

				local playerStack = { }
				if service == 1 or service == 2 then -- Checks if it was PD or Both
					for key, value in ipairs( getPlayersInTeam( getTeamFromName( "San Fierro Police Department" ) ) ) do
						table.insert(playerStack, value)
					end
					for key, value in ipairs( getPlayersInTeam( getTeamFromName( "San Andreas Highway Patrol" ) ) ) do
						table.insert(playerStack, value)
					end
				end
				if service == 1 or service == 3 then -- Checks if it was Medic or Both
					for key, value in ipairs( getPlayersInTeam( getTeamFromName( "San Fierro Fire Department" ) ) ) do
						table.insert(playerStack, value)
					end
				end


				local affectedElements = { }

				for key, value in ipairs( playerStack ) do
					for _, itemRow in ipairs(exports['item-system']:getItems(value)) do
						local setIn = false
						if (not setIn) and (itemRow[1] == 6 and itemRow[2] > 0) then
							table.insert(affectedElements, value)
							setIn = true
							break
						end
					end
				end
				local query = exports.mysql:query_insert_free("INSERT INTO `mdc_calls` (`caller`,`number`,`description`) VALUES ('"..getElementData(callingElement, "dbid").."','"..outboundPhoneNumber.."','"..exports.mysql:escape_string(tostring(location) .. " - " .. message ).."')")
				if query then
					triggerEvent("phone:cancelPhoneCall", callingElement)
				else
					outputChatBox ( "An error occured while processing your call.", callingElement, 255, 100, 100 )
					triggerEvent("phone:cancelPhoneCall", callingElement)
				end
				log911("[911 Call] Player: "..getPlayerName(callingElement).." || Situation: "..emergency..".")
				for key, value in ipairs( affectedElements ) do
					triggerClientEvent(value, "phones:radioDispatchBeep", value)
					outputChatBox("[RADIO] This is dispatch, We've got an incident call from " ..name.." #" .. outboundPhoneNumber .. ", over.", value, 0, 183, 239)
					outputChatBox("[RADIO] Situation: '" .. emergency .. "', over.", value, 0, 183, 239)
					if string.lower(message) ~= "no" then
						outputChatBox("[RADIO] Additional Information: '" .. message .. "', over.", value, 0, 183, 239)
					end
					if streetlocation then
						outputChatBox("[RADIO] Location: '" .. streetlocation .. " in ".. zonelocation .. "', out.", value, 0, 183, 239)
					else
						outputChatBox("[RADIO] Location: '".. zonelocation .. "', out.", value, 0, 183, 239)
					end
				end
			end
		end
	elseif callingPhoneNumber == 311 then
		if startingCall then
			outputChatBox("SFPD Operator [Cellphone]: SFPD Hotline. Please state your location.", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
		else
			if (callprogress==1) then -- Requesting the location
				exports.anticheat:changeProtectedElementDataEx(callingElement, "call.location", message, false)
				exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 2, false)
				outputChatBox("SFPD Operator [Cellphone]: Can you please describe the reason for your call?", callingElement)
			elseif (callprogress==2) then -- Requesting the situation
				outputChatBox("SFPD Operator [Cellphone]: Thanks for your call, we've dispatched a unit to your location.", callingElement)
				local location = getElementData(callingElement, "call.location")

				local affectedElements = { }

				for key, value in ipairs( getPlayersInTeam( getTeamFromName( "San Fierro Police Department" ) ) ) do
					for _, itemRow in ipairs(exports['item-system']:getItems(value)) do
						local setIn = false
						if (not setIn) and (itemRow[1] == 6 and itemRow[2] > 0) then
							table.insert(affectedElements, value)
							setIn = true
							break
						end
					end
				end

				for key, value in ipairs( affectedElements ) do
					outputChatBox("[RADIO] This is dispatch, we've got a report from #" .. outboundPhoneNumber .. " via the non-emergency line.", value, 245, 40, 135)
					outputChatBox("[RADIO] Reason: '" .. message .. "'.", value, 245, 40, 135)
					outputChatBox("[RADIO] Location: '" .. tostring(location) .. "'.", value, 245, 40, 135)
				end
				triggerEvent("phone:cancelPhoneCall", callingElement)
				--triggerEvent("phone:cancelPhoneCall", callingElement)
			end
		end
	elseif callingPhoneNumber == 611 then
		if startingCall then
			outputChatBox("SAHP Operator [Cellphone]: Hello there, you've called the San Andreas Highway Patrol hotline. Can I have your name?", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
		else
			if (callprogress==1) then -- Requesting the location
				exports.anticheat:changeProtectedElementDataEx(callingElement, "call.location", message, false)
				exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 2, false)
				outputChatBox("SAHP Operator [Cellphone]: What is the message you wish to send through?", callingElement)
			elseif (callprogress==2) then -- Requesting the situation
				outputChatBox("SAHP Operator [Cellphone]: Thank you for calling. Our employees will receive your message.", callingElement)
				local location = getElementData(callingElement, "call.location")

				local affectedElements = { }

				for key, value in ipairs( getPlayersInTeam( getTeamFromName( "San Andreas Highway Patrol" ) ) ) do
					for _, itemRow in ipairs(exports['item-system']:getItems(value)) do
						local setIn = false
						if (not setIn) and (itemRow[1] == 6 and itemRow[2] > 0) then
							table.insert(affectedElements, value)
							setIn = true
							break
						end
					end
				end

				for key, value in ipairs( affectedElements ) do
					outputChatBox("[RADIO] This is dispatch, we've got a call from '".. tostring(location) .."' [#" .. outboundPhoneNumber .. "] via the non-emergency hotline.", value, 245, 40, 135)
					outputChatBox("[RADIO] Message: '" .. message .. "'.", value, 245, 40, 135)
				end
				triggerEvent("phone:cancelPhoneCall", callingElement)
				triggerEvent("phone:cancelPhoneCall", callingElement)
			end
		end
	elseif callingPhoneNumber == 411 then
		if startingCall then
			outputChatBox("Operator [Cellphone]: SFFD Hotline. Please state your location.", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
		else
			if (callprogress==1) then -- Requesting the location
				exports.anticheat:changeProtectedElementDataEx(callingElement, "call.location", message, false)
				exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 2, false)
				outputChatBox("Operator [Cellphone]: Can you please tell us the reason for your call?", callingElement)
			elseif (callprogress==2) then -- Requesting the situation
				outputChatBox("Operator [Cellphone]: Thanks for your call, we'll get to you soon.", callingElement)
				local location = getElementData(callingElement, "call.location")

				local affectedElements = { }

				for key, value in ipairs( getPlayersInTeam( getTeamFromName("San Fierro Fire Department") ) ) do
					for _, itemRow in ipairs(exports['item-system']:getItems(value)) do
						local setIn = false
						if (not setIn) and (itemRow[1] == 6 and itemRow[2] > 0) then
							table.insert(affectedElements, value)
							setIn = true
							break
						end
					end
				end
				for key, value in ipairs( affectedElements ) do
					outputChatBox("[RADIO] This is dispatch, We've got a report from #" .. outboundPhoneNumber .. " via the non-emergency line, over.", value, 245, 40, 135)
					outputChatBox("[RADIO] Reason: '" .. message .. "', over.", value, 245, 40, 135)
					outputChatBox("[RADIO] Location: '" .. tostring(location) .. "', out.", value, 245, 40, 135)
				end
				--triggerEvent("phone:cancelPhoneCall", callingElement)
				triggerEvent("phone:cancelPhoneCall", callingElement)
			end
		end
	elseif callingPhoneNumber == 511 then
		if startingCall then
			outputChatBox("Gov Employee [Cellphone]: Government of San Fierro. How can we help you?", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
		else
			outputChatBox("Gov Employee [Cellphone]: Thanks for your call.", callingElement)

			local affectedElements = { }

			for key, value in ipairs( getPlayersInTeam( getTeamFromName("San Fierro Government") ) ) do
				for _, itemRow in ipairs(exports['item-system']:getItems(value)) do
					local setIn = false
					if (not setIn) and (itemRow[1] == 6 and itemRow[2] > 0) then
						table.insert(affectedElements, value)
						setIn = true
						break
					end
				end
			end
			for key, value in ipairs( affectedElements ) do
				outputChatBox("[RADIO] We got a message from #" .. outboundPhoneNumber .. ".", value, 245, 40, 135)
				outputChatBox("[RADIO] Reason: '" .. message .. "', over.", value, 245, 40, 135)
			end
			--triggerEvent("phone:cancelPhoneCall", callingElement)
			triggerEvent("phone:cancelPhoneCall", callingElement)
		end
	elseif callingPhoneNumber == 711 then -- report stolen vehicle
		if startingCall then
			outputChatBox("Police Employee [Cellphone]: What is the VIN of the vehicle you would like to report stolen?", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
		else
			if not tonumber( message ) then
				outputChatBox( 'Police Employee [Cellphone]: The VIN number must be numeric.', callingElement)
				triggerEvent("phone:cancelPhoneCall", callingElement)
				return
			end

			local query = exports.mysql:query( "SELECT `stolen`, `owner` FROM `vehicles` WHERE `id` = " .. exports.mysql:escape_string( message ) )
			local row = exports.mysql:fetch_assoc( query )
			if row then -- check if the vehicle exists
				if tonumber( row.owner ) == getElementData( callingElement, "dbid") then
					if tonumber( row.stolen ) == 0 then
						outputChatBox("Police Employee [Cellphone]: Thank you, we have marked that vehicle stolen.", callingElement)

						local affectedElements = { }

						for key, value in ipairs( getPlayersInTeam( getTeamFromName("San Fierro Police Department") ) ) do
							for _, itemRow in ipairs(exports['item-system']:getItems(value)) do
								if itemRow[1] == 6 and itemRow[2] > 0 then
									table.insert(affectedElements, value)
									break
								end
							end
						end
						for key, value in ipairs( getPlayersInTeam( getTeamFromName("San Andreas Highway Patrol") ) ) do
							for _, itemRow in ipairs(exports['item-system']:getItems(value)) do
								if itemRow[1] == 6 and itemRow[2] > 0 then
									table.insert(affectedElements, value)
									break
								end
							end
						end
						for key, value in ipairs( affectedElements ) do
							outputChatBox("[RADIO] We got a vehicle reported stolen from #" .. outboundPhoneNumber .. ".", value, 245, 40, 135)
							outputChatBox("[RADIO] Vehicle VIN: '" .. message .. "', over.", value, 245, 40, 135)
						end
						exports.mysql:update( 'vehicles', { stolen = 1 }, { id = message })
					else
						outputChatBox("Police Employee [Cellphone]: That vehicle has already been reported stolen, please contact 311 if the vehicle was found.", callingElement)
					end
				else
					outputChatBox("Police Employee [Cellphone]: You do not own the vehicle matching that VIN.", callingElement)
				end
			else
				outputChatBox("Police Employee [Cellphone]: We could not find any vehicle matching that VIN.", callingElement)
			end
			triggerEvent("phone:cancelPhoneCall", callingElement)
		end
	elseif callingPhoneNumber == 118 then
		if startingCall then
			local foundtow = false
			for key, value in ipairs(exports.pool:getPoolElementsByType("player")) do
				local faction = getElementData(value, "faction")
				if (faction == 4) then
					foundtow = true
				end
			end

			if foundtow == true then
			outputChatBox("Operator [Cellphone]: Swift Towing here, could you give us your name?", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
			else
			outputChatBox("Operator [Cellphone]: Sorry, there are no units available. Call back later.", callingElement)
			outputChatBox("They hung up.", callingElement )
			--triggerEvent("phone:cancelPhoneCall", callingElement)
			triggerEvent("phone:cancelPhoneCall", callingElement)
			end
		else
			if (callprogress==1) then -- Requesting the location
				exports.anticheat:changeProtectedElementDataEx(callingElement, "call.name", message)
				exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 2)
				outputChatBox("Operator [Cellphone]: Can you describe the situation, please?", callingElement)
			elseif (callprogress==2) then -- Requesting the situation
				outputChatBox("Operator [Cellphone]: Thanks for your call, we've dispatched an unit to your location.", callingElement)
				local zonelocation = exports.global:getElementZoneName(callingElement)
				local streetlocation = getElementData(callingElement, "speedo:street")
				local name = getElementData(callingElement, "call.name")

				local affectedElements = { }

				for key, value in ipairs( getElementsByType("player") ) do
					if getElementData(value, "faction") == 4 then -- Tay Tow
						for _, itemRow in ipairs(exports['item-system']:getItems(value)) do
							local setIn = false
							if (not setIn) and (itemRow[1] == 6 and itemRow[2] > 0) then
								table.insert(affectedElements, value)
								setIn = true
								break
							end
						end
					end
				end

				for key, value in ipairs( affectedElements ) do
					outputChatBox("[RADIO] This is dispatch, we've got an incident report from ".. name .." #" .. outboundPhoneNumber .. ", Over.", value, 0, 183, 239)
					outputChatBox("[RADIO] Situation: '" .. message .. "', Over.", value, 0, 183, 239)
					if streetlocation then
						outputChatBox("[RADIO] Location: '" .. streetlocation .. " in ".. zonelocation .. "', out.", value, 0, 183, 239)
					else
						outputChatBox("[RADIO] Location: '".. zonelocation .. "', out.", value, 0, 183, 239)
					end
				end
				--triggerEvent("phone:cancelPhoneCall", callingElement)
				triggerEvent("phone:cancelPhoneCall", callingElement)
			end
		end
	elseif callingPhoneNumber == 444 then
		if startingCall then
			outputChatBox("Operator [Cellphone]: San Fierro Yellow Cab Co. Where do you need to be picked up?", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
		else
			local founddriver = false
			for key, value in ipairs(exports.pool:getPoolElementsByType("player")) do
				local job = getElementData(value, "job")
				if (job == 2) then
					local car = getPedOccupiedVehicle(value)
					if car and (getElementModel(car)==438 or getElementModel(car)==420) then
						outputChatBox("[RADIO] Operator says: We've got a fare from " .. outboundPhoneNumber .. ". They need to be picked up at " .. message .."." , value, 0, 183, 239)
						founddriver = true
					end
				end
			end

			if founddriver == true then
				outputChatBox("Operator [Cellphone]: Alright then. We'll send a Taxi now.", callingElement)
			else
				outputChatBox("Operator [Cellphone]: Uhm... there are no taxis available in that area. Please call back later, thanks.", callingElement)
			end
			--triggerEvent("phone:cancelPhoneCall", callingElement)
			triggerEvent("phone:cancelPhoneCall", callingElement)
		end
	elseif callingPhoneNumber == 255 then
		if startingCall then
			outputChatBox("RS Haul Operator [Cellphone]: Can I have your location, please?", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
		else
			local founddriver = false
			for key, value in ipairs(exports.pool:getPoolElementsByType("player")) do
				local job = getElementData(value, "job")
				local hasPhone = exports.global:hasItem(value, 2)
				if (job == 1) and hasPhone then
					--local car = getPedOccupiedVehicle(value)
					outputChatBox("SMS from RS Haul: A customer has ordered a delivery at '" .. message .."'. Please contact #".. outboundPhoneNumber .." for details.", value, 120, 255, 80)
					founddriver = true
				end
			end

			if founddriver == true then
				outputChatBox("RS Haul Operator [Cellphone]: Thanks for your call, a truck of goods will be coming shortly.", callingElement)
			else
				outputChatBox("RS Haul Operator [Cellphone]: There is noone available to process your order right now, please try again later.", callingElement)
			end
			--triggerEvent("phone:cancelPhoneCall", callingElement)
			triggerEvent("phone:cancelPhoneCall", callingElement)
		end
	elseif callingPhoneNumber == 7331 then -- Old ads
		if startingCall then
			outputChatBox( "LSN Operator [Cellphone]: Posting ads is now done online! Visit our website for more information.", callingElement )
			outputChatBox( "(( Please use /advertisements ))", callingElement, 255, 255, 255 )
			--[[
			outputChatBox("SF News Worker [Cellphone]: Thanks for calling the ad broadcasting service. What can we air for you?", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
		else
			if getElementData(callingElement, "adminjailed") then
				outputChatBox("SF News Worker [Cellphone]: Err.. Sorry. We're broadcasting too many ads during this timeslot. Try again later.", callingElement)
				triggerEvent("phone:cancelPhoneCall", callingElement)
				return
			end
			if (getElementData(callingElement, "ads") or 0) >= 2 then
				outputChatBox("SF News Worker [Cellphone]: Again you?! You can only place 2 ads every 5 minutes.", callingElement)
				triggerEvent("phone:cancelPhoneCall", callingElement)
				return
			end

			if message:sub(-1) ~= "." and message:sub(-1) ~= "?" and message:sub(-1) ~= "!" then
				message = message .. "."
			end

			if SAN_doesAdExist(message) then
				outputChatBox("SF News Worker [Cellphone]: Not this again...", callingElement)
				triggerEvent("phone:cancelPhoneCall", callingElement)
				return
			end

			local cost = math.ceil(string.len(message)/5) + 10
			if not exports.bank:updateBankMoney(callingElement, getElementData(callingElement, 'dbid'), cost, 'minus') then
				outputChatBox("SF News Worker [Cellphone]: We were unable to withdraw the money from your bank account.", callingElement)
				triggerEvent("phone:cancelPhoneCall", callingElement)

				return
			end

			local name = getPlayerName(callingElement):gsub("_", " ")
			outputChatBox("SF News Worker [Cellphone]: Thanks, " .. cost .. " dollar will be withdrawn from your account. We'll air it as soon as possible!", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "ads", ( getElementData(callingElement, "ads") or 0 ) + 1, false)
			exports.global:giveMoney(getTeamFromName"San Fierro Network", cost)
			setTimer(
				function(p)
					if isElement(p) then
						local c =  getElementData(p, "ads") or 0
						if c > 1 then
							exports.anticheat:changeProtectedElementDataEx(p, "ads", c-1, false)
						else
							exports.anticheat:changeProtectedElementDataEx(p, "ads", false, false)
						end
					end
				end, 300000, 1, callingElement
			)

			SAN_newAdvert(message, name, callingElement, cost, outboundPhoneNumber)
			]]
			triggerEvent("phone:cancelPhoneCall", callingElement)

		end
	elseif callingPhoneNumber == 733 then -- SF News Hotline
		if startingCall then
			outputChatBox("LSN Operator [Cellphone]: Thanks for calling SF News. What message can I deliver the employees for you?", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
		else
			local languageslot = getElementData(callingElement, "languages.current")
			local language = getElementData(callingElement, "languages.lang" .. languageslot)
			local languagename = call(getResourceFromName("language-system"), "getLanguageName", language)
			if getElementData(callingElement, "adminjailed") then
				outputChatBox("LSN Operator [Cellphone]: Got it, we'll contact you back if needed.", callingElement)
			else
				outputChatBox("LSN Operator [Cellphone]: Got it, we'll contact you back if needed.", callingElement)

				for key, value in ipairs( getPlayersInTeam(getTeamFromName("San Fierro News")) ) do
					local hasItem, index, number, dbid = exports.global:hasItem(value,2)
					if hasItem then
						local reconning2 = getElementData(value, "reconx")
						if not reconning2 then
							exports.global:sendLocalMeAction(value,"receives a text message.")
						end

						outputChatBox("SMS from #733 [#"..number.."]: Ph:".. outboundPhoneNumber .." " .. message, value, 120, 255, 80)
					end
				end
				triggerEvent("phone:cancelPhoneCall", callingElement)
			end
		end
	elseif callingPhoneNumber == 881 then -- E.B.I.A.
		if startingCall then
			outputChatBox("Operator [Cellphone]: You've reached the San Fierro International Airport hotline. How may we help you?", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
		else
			local languageslot = getElementData(callingElement, "languages.current")
			local language = getElementData(callingElement, "languages.lang" .. languageslot)
			local languagename = call(getResourceFromName("language-system"), "getLanguageName", language)
			if getElementData(callingElement, "adminjailed") then
				outputChatBox("Operator [Cellphone]: Thanks for the message, we'll contact you back if needed.", callingElement)
			else
				outputChatBox("Operator [Cellphone]: Thanks for the message, we'll contact you back if needed.", callingElement)

				for key, value in ipairs( getPlayersInTeam(getTeamFromName("San Fierro International Airport")) ) do
					local hasItem, index, number, dbid = exports.global:hasItem(value,2)
					if hasItem then
						local reconning2 = getElementData(value, "reconx")
						if not reconning2 then
							exports.global:sendLocalMeAction(value,"receives a text message.")
						end

						outputChatBox("SMS from #881 [#"..number.."]: Ph:".. outboundPhoneNumber .." " .. message, value, 120, 255, 80)
					end
				end
				triggerEvent("phone:cancelPhoneCall", callingElement)
			end
		end
	elseif callingPhoneNumber == 211 then -- SCoSA
		if startingCall then
			outputChatBox("Operator [Cellphone]: Superior Court of San Andreas. Can I have your name?", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
		else
			if (callprogress==1) then -- Requesting the name
				exports.anticheat:changeProtectedElementDataEx(callingElement, "call.name", message, false)
				exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 2, false)
				outputChatBox("Operator [Cellphone]: What do you require?", callingElement)
			elseif (callprogress==2) then -- Requesting the situation
				outputChatBox("Operator [Cellphone]: Thanks for calling us, we'll get back to you as soon as possible.", callingElement)
				local name = getElementData(callingElement, "call.name")
				local affectedElements = { }

				for key, value in ipairs( getPlayersInTeam( getTeamFromName( "Superior Court of San Andreas" ) ) ) do
					for _, itemRow in ipairs(exports['item-system']:getItems(value)) do
						local setIn = false
						if (not setIn) and (itemRow[1] == 6 and itemRow[2] > 0) then
							table.insert(affectedElements, value)
							setIn = true
							break
						end
					end
				end

				for key, value in ipairs( affectedElements ) do
					outputChatBox("[RADIO] This is dispatch, We've got a report from #" .. outboundPhoneNumber .. " via the hotline, over.", value, 245, 40, 135)
					outputChatBox("[RADIO] Request: '" .. message .. "', over.", value, 245, 40, 135)
					outputChatBox("[RADIO] From: '" .. tostring(name) .. "', out.", value, 245, 40, 135)
				end
				triggerEvent("phone:cancelPhoneCall", callingElement)
			end
		end
	elseif callingPhoneNumber == 723 then -- Cargo Group
		if startingCall then
			outputChatBox("Receptionist [Cellphone]: You've reached Cargo Group. Please state your name and message.", callingElement)
			exports.anticheat:changeProtectedElementDataEx(callingElement, "callprogress", 1, false)
		else
			local languageslot = getElementData(callingElement, "languages.current")
			local language = getElementData(callingElement, "languages.lang" .. languageslot)
			local languagename = call(getResourceFromName("language-system"), "getLanguageName", language)
			if getElementData(callingElement, "adminjailed") then
				outputChatBox("Receptionist [Cellphone]: Uh, right.", callingElement)
			else
				outputChatBox("Receptionist [Cellphone]: One of our employees will contact you shortly.", callingElement)
				local affectedElements = { }
				for key, value in ipairs( getPlayersInTeam( getTeamFromName( "Cargo Group" ) ) ) do
					local hasItem, index, number, dbid = exports.global:hasItem(value, 2)
					if hasItem then
						local reconning2 = getElementData(value, "reconx")
						if not reconning2 then
							exports.global:sendLocalMeAction(value,"receives a text message.")
						end
						outputChatBox("SMS from #723 [#"..number.."]: INQUIRY | Ph: ".. outboundPhoneNumber .." | Message: " .. message, value, 0, 200, 255)
					end
				end
				triggerEvent("phone:cancelPhoneCall", callingElement)
			end
		end
	else
	end
end

function log911( message )
	local logMeBuffer = getElementData(getRootElement(), "911log") or { }
	local r = getRealTime()
	table.insert(logMeBuffer,"["..("%02d:%02d"):format(r.hour,r.minute).. "] " ..  message)

	if #logMeBuffer > 30 then
		table.remove(logMeBuffer, 1)
	end
	setElementData(getRootElement(), "911log", logMeBuffer)
end

function read911Log(thePlayer)
	local theTeam = getPlayerTeam(thePlayer)
	local factiontype = getElementData(theTeam, "type")
	if exports.integration:isPlayerTrialAdmin(thePlayer) or exports.integration:isPlayerSupporter(thePlayer) then
		local logMeBuffer = getElementData(getRootElement(), "911log") or { }
		outputChatBox("Recent 911 calls:", thePlayer)
		for a, b in ipairs(logMeBuffer) do
			outputChatBox("- "..b, thePlayer)
		end
		outputChatBox(" END", thePlayer)
	end
end
addCommandHandler("show911", read911Log)

function checkService(callingElement)
	t = { "both",
		  "pd",
		  "police",
		  "SFPD",
		  "sd",
		  "SFSD",
			"SAHP",
		  "es",
		  "medic",
		  "ems",
		  "SFFD",
	}
	local found = false
	for row, names in ipairs(t) do
		if names == string.lower(getElementData(callingElement, "call.service")) then
			if row == 1 then
				local found = true
				return 1 -- Both!
			elseif row >= 2 and row <= 6 then
				local found = true
				return 2 -- Just the PD please
			elseif row >= 7 and row <= 10 then
				local found = true
				return 3 -- ES
			end
		end
	end
	if not found then
		return 4 -- Not found!
	end
end
