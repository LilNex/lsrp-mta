wReportMain, bClose, lStatus, lVehTheft, lPropBreak, lPapForgery, lVehTheftStatus, lPropBreakStatus, lPapForgeryStatus, bVehTheft, bPropBreak, bPapForgery, bHelp, lPlayerName, tPlayerName, lNameCheck, lReport, tReport, lLengthCheck, bSubmitReport = nil

function resourceStop()
	guiSetInputEnabled(false)
	showCursor(false)
end
addEventHandler("onClientResourceStop", getResourceRootElement(), resourceStop)

function resourceStart()
	bindKey("F2", "down", toggleReport)
end
addEventHandler("onClientResourceStart", getResourceRootElement(), resourceStart)

function toggleReport()
	executeCommandHandler("report")
	if wHelp then
		guiSetInputEnabled(false)
		showCursor(false)
		destroyElement(wHelp)
		wHelp = nil
	end
end

function checkBinds()
	if ( exports.integration:isPlayerTrialAdmin(getLocalPlayer()) or getElementData( getLocalPlayer(), "account:gmlevel" )  ) then
		if getBoundKeys("ar") or getBoundKeys("acceptreport") then
			--outputChatBox("You had keys bound to accept reports. Please delete these binds.", 255, 0, 0)
			triggerServerEvent("arBind", getLocalPlayer())
		end
	end
end
setTimer(checkBinds, 60000, 0)

local function scale(w)
	local width, height = guiGetSize(w, false)
	local screenx, screeny = guiGetScreenSize()
	local minwidth = math.min(700, screenx)
	if width < minwidth then
		guiSetSize(w, minwidth, height / width * minwidth, false)
		local width, height = guiGetSize(w, false)
		guiSetPosition(w, (screenx - width) / 2, (screeny - height) / 2, false)
	end
end

function toggleVehTheft()
	if exports.integration:isPlayerTrialAdmin(getLocalPlayer()) then
		local status = getElementData(resourceRoot, "vehtheft")
		local numPdMembers = #getPlayersInTeam(exports.factions:getTeamFromFactionID(1)) + #getPlayersInTeam(exports.factions:getTeamFromFactionID(59)) --PD and HP
		if numPdMembers < 3 then return outputChatBox("You can not not toggle this when there's less than 3 PD or HP members online.") end -- Automaticly to 'on hold' is less than 3 pd members
		if status == "Opened" then
			guiSetText(lVehTheftStatus, "On hold")
			guiLabelSetColor(lVehTheftStatus, 255, 0, 0)
			setElementData(resourceRoot, "vehtheft", "On hold")
			triggerServerEvent("toggleStatus", localPlayer, localPlayer, "Vehicle Theft", tostring(status))
		elseif status == "On hold" then
			guiSetText(lVehTheftStatus, "Opened")
			guiLabelSetColor(lVehTheftStatus, 0, 255, 0)
			setElementData(resourceRoot, "vehtheft", "Opened")
			triggerServerEvent("toggleStatus", localPlayer, localPlayer, "Vehicle Theft", tostring(status))
		end
	end
end

function togglePropBreak()
	if exports.integration:isPlayerTrialAdmin(getLocalPlayer()) then
		local status = getElementData(resourceRoot, "propbreak")
		local numPdMembers = #getPlayersInTeam(exports.factions:getTeamFromFactionID(1)) + #getPlayersInTeam(exports.factions:getTeamFromFactionID(59)) --PD and HP
		if numPdMembers < 3 then return outputChatBox("You can not not toggle this when there's less than 3 PD or HP members online.") end -- Automaticly to 'on hold' is less than 3 pd members
		if status == "Opened" then
			guiSetText(lPropBreakStatus, "On hold")
			guiLabelSetColor(lPropBreakStatus, 255, 0, 0)
			setElementData(resourceRoot, "propbreak", "On hold")
			triggerServerEvent("toggleStatus", localPlayer, localPlayer, "Property Break-in", tostring(status))
		elseif status == "On hold" then
			guiSetText(lPropBreakStatus, "Opened")
			guiLabelSetColor(lPropBreakStatus, 0, 255, 0)
			setElementData(resourceRoot, "propbreak", "Opened")
			triggerServerEvent("toggleStatus", localPlayer, localPlayer, "Property Break-in", tostring(status))
		end
	end
end

function togglePaperForg()
	if exports.integration:isPlayerTrialAdmin(getLocalPlayer()) then
		local status = getElementData(resourceRoot, "papforg")
		local numPdMembers = #getPlayersInTeam(exports.factions:getTeamFromFactionID(1)) + #getPlayersInTeam(exports.factions:getTeamFromFactionID(59)) --PD and HP
		if numPdMembers < 3 then return outputChatBox("You can not not toggle this when there's less than 3 PD or HP members online.") end -- Automaticly to 'on hold' is less than 3 pd members
		if status == "Opened" then
			guiSetText(lPapForgeryStatus, "On hold")
			guiLabelSetColor(lPapForgeryStatus, 255, 0, 0)
			setElementData(resourceRoot, "papforg", "On hold")
			triggerServerEvent("toggleStatus", localPlayer, localPlayer, "Paper Forgery", tostring(status))
		elseif status == "On hold" then
			guiSetText(lPapForgeryStatus, "Opened")
			guiLabelSetColor(lPapForgeryStatus, 0, 255, 0)
			setElementData(resourceRoot, "papforg", "Opened")
			triggerServerEvent("toggleStatus", localPlayer, localPlayer, "Paper Forgery", tostring(status))
		end
	end
end

-- //Chaos
function showReportMainUI()
	local logged = getElementData(getLocalPlayer(), "loggedin")
	--outputDebugString(logged)
	if (logged==1) then
		if (wReportMain==nil)  then
			reportedPlayer = nil
			wReportMain = guiCreateWindow(0.20, 0.18, 0.60, 0.64, "Report System", true)
			scale(wReportMain)
			copyright = guiCreateLabel(0.54, 0.95, 0.44, 0.03, "Copyright ©2018 SwiTzeX", true, wReportMain)
			-- Controls within the window
			bClose = guiCreateButton(0.28, 0.91, 0.23, 0.07, "Close", true, wReportMain)
			addEventHandler("onClientGUIClick", bClose, clickCloseButton)

			adminlabel = guiCreateLabel(0.54, 0.04, 0.14, 0.03, "Admins Online:", true, wReportMain)
			guiSetFont(adminlabel, "default-bold-small")
			adminlist = guiCreateGridList(0.54, 0.08, 0.44, 0.27, true, wReportMain) 
			local NameCol = guiGridListAddColumn( adminlist, "Name", 0.50)
			local AccCol = guiGridListAddColumn( adminlist, "Account", 0.50)
			for i,player in pairs(getElementsByType("player")) do
				if getElementData(player, "duty_admin") == 1 and getElementData(player,"hiddenadmin") == 0 then
				local row = guiGridListAddRow ( adminlist )
                   local AdminName = tostring ( getPlayerName ( player ) ):gsub( "_", " " )
				   local AdminAccount = getElementData(player, "account:username") or "N/A"
					guiGridListSetItemText ( adminlist, row, NameCol, AdminName , false, false )
					guiGridListSetItemText ( adminlist, row, AccCol, AdminAccount , false, false )
				end
			end

			supporterlabel = guiCreateLabel(0.54, 0.35, 0.20, 0.03, "Supporters Online:", true, wReportMain)
			guiSetFont(supporterlabel, "default-bold-small")
			supportlist = guiCreateGridList(0.54, 0.39, 0.44, 0.27, true, wReportMain)
			
			local SnameCol = guiGridListAddColumn( supportlist, "Name", 0.50)
			local SaccCol = guiGridListAddColumn( supportlist, "Account", 0.50)
			for i,player in pairs(getElementsByType("player")) do
				if getElementData(player, "duty_supporter") == 1 then
					local row = guiGridListAddRow ( supportlist )
					local SupName = tostring ( getPlayerName ( player ) ):gsub( "_", " " )
					local SupAccount = getElementData(player, "account:username") or "N/A"
					guiGridListSetItemText ( supportlist, row, SnameCol, SupName, false, false )
					guiGridListSetItemText ( supportlist, row, SaccCol, SupAccount , false, false )
				end
			end
			-- Status
			lVehTheft = guiCreateLabel(0.54, 0.68, 0.16, 0.04, "Vehicle Theft", true, wReportMain)
			guiSetFont(lVehTheft, "default-bold-small")
			lPropBreak = guiCreateLabel(0.54, 0.75, 0.16, 0.04, "Property Break-in", true, wReportMain)
			guiSetFont(lPropBreak, "default-bold-small")
			lPapForgery = guiCreateLabel(0.54, 0.81, 0.16, 0.04, "Paper Forgery", true, wReportMain)
			guiSetFont(lPapForgery, "default-bold-small")

			local vehTheftStatus = getElementData(resourceRoot, "vehtheft")
			local propBreakStatus = getElementData(resourceRoot, "propbreak")
			local papForgeStatus = getElementData(resourceRoot, "papforg")

			lVehTheftStatus = guiCreateLabel(0.72, 0.68, 0.09, 0.04, vehTheftStatus, true, wReportMain)
			guiSetFont(lVehTheftStatus, "default-bold-small")
			lPropBreakStatus = guiCreateLabel(0.72, 0.75, 0.09, 0.04, propBreakStatus, true, wReportMain)
			guiSetFont(lPropBreakStatus, "default-bold-small")
			lPapForgeryStatus = guiCreateLabel(0.72, 0.81, 0.09, 0.04, papForgeStatus, true, wReportMain)
			guiSetFont(lPapForgeryStatus, "default-bold-small")

			if vehTheftStatus == "Opened" then guiLabelSetColor(lVehTheftStatus, 0, 255, 0) end
			if vehTheftStatus == "On hold" then guiLabelSetColor(lVehTheftStatus, 255, 0, 0) end

			if propBreakStatus == "Opened" then guiLabelSetColor(lPropBreakStatus, 0, 255, 0) end
			if propBreakStatus == "On hold" then guiLabelSetColor(lPropBreakStatus, 255, 0, 0) end

			if papForgeStatus == "Opened" then guiLabelSetColor(lPapForgeryStatus, 0, 255, 0) end
			if papForgeStatus == "On hold" then guiLabelSetColor(lPapForgeryStatus, 255, 0, 0) end

			local canEditStatus = exports.integration:isPlayerTrialAdmin(getLocalPlayer())

			if canEditStatus then
				bVehTheft = guiCreateButton(0.83, 0.68, 0.16, 0.05, "Toggle", true, wReportMain)
				bPropBreak = guiCreateButton(0.83, 0.81, 0.16, 0.05, "Toggle", true, wReportMain)
				bPapForgery = guiCreateButton(0.83, 0.75, 0.16, 0.04, "Toggle", true, wReportMain)

				addEventHandler("onClientGUIClick", bVehTheft, toggleVehTheft, false)
				addEventHandler("onClientGUIClick", bPropBreak, togglePropBreak, false)
				addEventHandler("onClientGUIClick", bPapForgery, togglePaperForg, false)
			end

			guiSetInputEnabled(true)

			bHelp = guiCreateButton(0.54, 0.87, 0.44, 0.07, "View Help/Commands", true, wReportMain)
			guiSetEnabled(bHelp, true)
			addEventHandler("onClientGUIClick", bHelp, clickCloseButton)

			lPlayerName = guiCreateLabel(0.02, 0.77, 0.39, 0.04, "Player Partial Name / ID:", true, wReportMain)
			guiSetFont(lPlayerName, "default-bold-small")

			tPlayerName = guiCreateEdit(0.02, 0.81, 0.49, 0.06, "Player Name / ID", true, wReportMain)
			addEventHandler("onClientGUIClick", tPlayerName, function()
				guiSetText(tPlayerName,"")
			end, false)
            reporttype = guiCreateLabel(0.02, 0.04, 0.12, 0.03, "Report Type:", true, wReportMain)
			cReportType = guiCreateComboBox(0.02, 0.08, 0.49, 0.54, "Type", true, wReportMain)
			for key, value in ipairs(reportTypes) do
				guiComboBoxAddItem(cReportType, value[1])
			end
			addEventHandler("onClientGUIComboBoxAccepted", cReportType, canISubmit)
			addEventHandler("onClientGUIComboBoxAccepted", cReportType, function()
				local selected = guiComboBoxGetSelected(cReportType)+1
				guiLabelSetHorizontalAlign( lReportType, "center", true)
				guiSetText(lReportType, reportTypes[selected][7])
				end)

			lReport = guiCreateLabel(-0.065, 0.14, 0.33, 0.03, "Report Information:", true, wReportMain)
			guiLabelSetHorizontalAlign(lReport, "center")
			guiSetFont(lReport, "default-bold-small")
			guiSetFont(lPlayerName, "default-bold-small")
			guiSetFont(reporttype, "default-bold-small")
			guiSetFont(copyright, "default-bold-small")

			tReport = guiCreateMemo(0.02, 0.18, 0.49, 0.58, "", true, wReportMain)
			addEventHandler("onClientGUIChanged", tReport, canISubmit)


			bSubmitReport = guiCreateButton(0.02, 0.91, 0.23, 0.07, "Sumbit", true, wReportMain)
			addEventHandler("onClientGUIClick", bSubmitReport, submitReport)
			guiSetEnabled(bSubmitReport, false)

			guiWindowSetSizable(wReportMain, false)
			showCursor(true)
		elseif (wReportMain~=nil) then
			guiSetVisible(wReportMain, false)
			destroyElement(wReportMain)

			wReportMain, bClose, lStatus, lVehTheft, lPropBreak, lPapForgery, lVehTheftStatus, lPropBreakStatus, lPapForgeryStatus, bVehTheft, bPropBreak, bPapForgery, bHelp, lPlayerName, tPlayerName, lNameCheck, lReport, tReport, lLengthCheck, bSubmitReport = nil
			guiSetInputEnabled(false)
			showCursor(false)
		end
	end
end
addCommandHandler("report", showReportMainUI)

function submitReport(button, state)
	if (source==bSubmitReport) and (button=="left") and (state=="up") then
		triggerServerEvent("clientSendReport", getLocalPlayer(), reportedPlayer or getLocalPlayer(), tostring(guiGetText(tReport)), (guiComboBoxGetSelected(cReportType)+1))

		if (wReportMain~=nil) then
			destroyElement(wReportMain)
		end

		if (wHelp) then
			destroyElement(wHelp)
		end

		wReportMain, bClose, lStatus, lVehTheft, lPropBreak, lPapForgery, lVehTheftStatus, lPropBreakStatus, lPapForgeryStatus, bVehTheft, bPropBreak, bPapForgery, bHelp, lPlayerName, tPlayerName, lNameCheck, lReport, tReport, lLengthCheck, bSubmitReport = nil
		guiSetInputEnabled(false)
		showCursor(false)
	end
end

function checkReportLength(theEditBox)
	guiSetText(lLengthCheck, "Length: " .. string.len(tostring(guiGetText(tReport)))-1 .. "/150 Characters.")

	if (tonumber(string.len(tostring(guiGetText(tReport))))-1>150) then
		guiLabelSetColor(lLengthCheck, 255, 0, 0)
		return false
	elseif (tonumber(string.len(tostring(guiGetText(tReport))))-1<3) then
		guiLabelSetColor(lLengthCheck, 255, 0, 0)
		return false
	elseif (tonumber(string.len(tostring(guiGetText(tReport))))-1>130) then
		guiLabelSetColor(lLengthCheck, 255, 255, 0)
		return true
	else
		guiLabelSetColor(lLengthCheck,0, 255, 0)
		return true
	end
end

function checkType(theGUI)
	local selected = guiComboBoxGetSelected(cReportType)+1 -- +1 to relate to the table for later

	if not selected or selected == 0 then
		return false
	else
		return true
	end
end

function canISubmit()
	local rType = checkType()
	local rReportLength = checkReportLength()
	--[[local adminreport = getElementData(getLocalPlayer(), "adminreport")
	local gmreport = getElementData(getLocalPlayer(), "gmreport")]]
	local reportnum = getElementData(getLocalPlayer(), "reportNum")
	if rType and rReportLength then
		if reportnum then
			guiSetText(wReportMain, "Your report ID #" .. (reportnum).. " is still pending. Please wait or /er before submitting another.")
		else
			guiSetEnabled(bSubmitReport, true)
		end
	else
		guiSetEnabled(bSubmitReport, false)
	end
end

function checkNameExists(theEditBox)
	local found = nil
	local count = 0


	local text = guiGetText(theEditBox)
	if text and #text > 0 then
		local players = getElementsByType("player")
		if tonumber(text) then
			local id = tonumber(text)
			for key, value in ipairs(players) do
				if getElementData(value, "playerid") == id then
					found = value
					count = 1
					break
				end
			end
		else
			for key, value in ipairs(players) do
				local username = string.lower(tostring(getPlayerName(value)))
				if string.find(username, string.lower(text)) then
					count = count + 1
					found = value
					break
				end
			end
		end
	end

	if (count>1) then
		guiSetText(lNameCheck, "Multiple Found - Will take yourself to submit.")
		guiLabelSetColor(lNameCheck, 255, 255, 0)
	elseif (count==1) then
		guiSetText(lNameCheck, "Player Found: " .. getPlayerName(found) .. " (ID #" .. getElementData(found, "playerid") .. ")")
		guiLabelSetColor(lNameCheck, 0, 255, 0)
		reportedPlayer = found
	elseif (count==0) then
		guiSetText(lNameCheck, "Player not found - Will take yourself to submit.")
		guiLabelSetColor(lNameCheck, 255, 0, 0)
	end
end

-- Close button
function clickCloseButton(button, state)
	if (source==bClose) and (button=="left") and (state=="up") then
		if (wReportMain~=nil) then
			destroyElement(wReportMain)
		end

		if (wHelp) then
			destroyElement(wHelp)
		end

		wReportMain, bClose, lStatus, lVehTheft, lPropBreak, lPapForgery, lVehTheftStatus, lPropBreakStatus, lPapForgeryStatus, bVehTheft, bPropBreak, bPapForgery, bHelp, lPlayerName, tPlayerName, lNameCheck, lReport, tReport, lLengthCheck, bSubmitReport = nil
		guiSetInputEnabled(false)
		showCursor(false)
	elseif (source==bHelp) and (button=="left") and (state=="up") then
		if (wReportMain~=nil) then
			destroyElement(wReportMain)
		end

		wReportMain, bClose, lStatus, lVehTheft, lPropBreak, lPapForgery, lVehTheftStatus, lPropBreakStatus, lPapForgeryStatus, bVehTheft, bPropBreak, bPapForgery, bHelp, lPlayerName, tPlayerName, lNameCheck, lReport, tReport, lLengthCheck, bSubmitReport = nil
		guiSetInputEnabled(false)
		showCursor(false)

		triggerEvent("viewF1Help", getLocalPlayer())
	end
end

function onOpenCheck(playerID)
	executeCommandHandler ( "check", tostring(playerID) )
end
addEvent("report:onOpenCheck", true)
addEventHandler("report:onOpenCheck", getRootElement(), onOpenCheck)
