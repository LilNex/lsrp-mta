wReportMain, bClose, lStatus, lVehTheft, lPropBreak, lPapForgery, lVehTheftStatus, lPropBreakStatus, lPapForgeryStatus, bVehTheft, bPropBreak, bPapForgery, bHelp, lPlayerName, tPlayerName, lNameCheck, lReport, tReport, lLengthCheck, bSubmitReport = nil

GUIEditor = {
    label = {},
    edit = {},
    combobox = {},
    memo = {}
}
local reportpanelShowing = false
local screenW, screenH = guiGetScreenSize()


local screenW, screenH = guiGetScreenSize()



local screenW, screenH = guiGetScreenSize()

local closebtnreportclr = tocolor(10, 10, 10, 255)
local sendbtnreport = tocolor(10, 10, 10, 255)

local dxfont0_font = dxCreateFont(":lsimage/img/font.ttf", 16)
local screenW, screenH = guiGetScreenSize()

function mainRender()
    if (reportpanelShowing) then
	    showChat(true)
		showCursor(true)
        dxDrawImage(screenW * 0.2818, screenH * 0.2344, screenW * 0.4619, screenH * 0.5703, ":lsimage/img/background.png", 0, 0, 0, tocolor(14, 14, 14, 239), false)
		 dxDrawRectangle(screenW * 0.2826, screenH * 0.3385, screenW * 0.4575, screenH * 0.0013, tocolor(90, 90, 90, 239), false)

      --  dxDrawLine(screenW * 0.2833, screenH * 0.3424, screenW * 0.7445, screenH * 0.3411, tocolor(90, 90, 90, 239), 2, false)
        dxDrawImage(screenW * 0.6376, screenH * 0.2214, screenW * 0.1142, screenH * 0.1380, ":lsimage/img/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawRectangle(screenW * 0.2958, screenH * 0.2526, screenW * 0.0044, screenH * 0.0729, tocolor(3, 163, 254, 255), false)
        dxDrawText("Report Center", screenW * 0.3038, screenH * 0.2852, screenW * 0.4283, screenH * 0.3229, tocolor(255, 255, 255, 255), 1.00, dxfont0_font, "left", "center", false, false, false, false, false)
        dxDrawText("Los Santos Roleplay", screenW * 0.3038, screenH * 0.2604, screenW * 0.4283, screenH * 0.2982, tocolor(255, 255, 255, 255), 1.00,dxfont0_font, "left", "center", false, false, false, false, false)
        dxDrawImage(screenW * 0.6201, screenH * 0.6927, screenW * 0.1142, screenH * 0.0339, ":lsimage/img/button.png", 0, 0, 0, closebtnreportclr, false)
        dxDrawImage(screenW * 0.6193, screenH * 0.7396, screenW * 0.1142, screenH * 0.0339, ":lsimage/img/button.png", 0, 0, 0, sendbtnreport, false)
        dxDrawText("Send", screenW * 0.6303, screenH * 0.6940, screenW * 0.7211, screenH * 0.7266, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Close", screenW * 0.6303, screenH * 0.7409, screenW * 0.7211, screenH * 0.7734, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        -- dxDrawRectangle(screenW * 0.6947, screenH * 0.2161, screenW * 0.0183, screenH * 0.0326, tocolor(255, 255, 255, 255), false)	
	    if isInSlot(screenW * 0.6201, screenH * 0.6927, screenW * 0.1142, screenH * 0.0339) then
		    closebtnreportclr = tocolor(3, 163, 254, 255)
		else
		    closebtnreportclr = tocolor(10, 10, 10, 255)
		end
		if isInSlot(screenW * 0.6193, screenH * 0.7396, screenW * 0.1142, screenH * 0.0339) then
		    sendbtnreport = tocolor(3, 163, 254, 255)
		else
		    sendbtnreport = tocolor(10, 10, 10, 255)
		end
	
	end
end
addEventHandler("onClientRender", root, mainRender)

function teszt(b,s)
    if (b == "mouse1") then
        if (s) then
            if (reportpanelShowing) then   
                if isInSlot(screenW * 0.6201, screenH * 0.6927, screenW * 0.1142, screenH * 0.0339) then
				    triggerServerEvent("clientSendReport", getLocalPlayer(), reportedPlayer or getLocalPlayer(), tostring(guiGetText(tReport)), (guiComboBoxGetSelected(cReportType)+1))		
				    hidereportpanel()  
					outputChatBox("Your report was sent to staff, a staff will contact you in a few minutes. ",0,150,0)
					toggleAllControls(true)
                    
					showCursor(false)				
				elseif isInSlot(screenW * 0.6193, screenH * 0.7396, screenW * 0.1142, screenH * 0.0339) then
				    hidereportpanel()  
                    showCursor(false)		
					toggleAllControls(true)

				end					
            end
        end
    end
end
addEventHandler("onClientKey", root, teszt)

function isInSlot(xS,yS,wS,hS)
	if(isCursorShowing()) then
		XY = {guiGetScreenSize()}
		local cursorX, cursorY = getCursorPosition()
		cursorX, cursorY = cursorX*XY[1], cursorY*XY[2]
		if (isInBox(xS,yS,wS,hS, cursorX, cursorY)) then
			return true
		else
			return false
		end
	end	
end
function isInBox(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end

--------------------------------------------------------------------------------------------------------

function resourceStop()
	guiSetInputEnabled(false)
end
addEventHandler("onClientResourceStop", getResourceRootElement(), resourceStop)

function resourceStart()
	bindKey("F2", "down", toggleReport)
end
addEventHandler("onClientResourceStart", getResourceRootElement(), resourceStart)

function toggleReport()
	toggleAllControls(false)
	executeCommandHandler("report")
	if wHelp then
		guiSetInputEnabled(false)
		destroyElement(wHelp)
		wHelp = nil
		toggleAllControls(true)
		-- showCursor(false)
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
	local minwidth = math.min(350, screenx)
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
		if (reportpanelShowing==false)  then
		    reportpanelShowing = true
			reportedPlayer = nil


			tPlayerName = guiCreateEdit(0.62, 0.56, 0.12, 0.04, "Put Here Your ID", true)
			addEventHandler("onClientGUIClick", tPlayerName, function()
			guiSetText(tPlayerName,"")					
			end, false)

			lNameCheck = guiCreateLabel(0.62, 0.62, 0.11, 0.03, "You're reporting yourself.", true)
			guiSetFont(lNameCheck, "default-bold-small")
			guiLabelSetColor(lNameCheck, 6, 148, 248)
			addEventHandler("onClientGUIChanged", tPlayerName, checkNameExists)


			cReportType = guiCreateComboBox(0.62, 0.41, 0.11, 0.15, "Report Type", true)
			for key, value in ipairs(reportTypes) do
				guiComboBoxAddItem(cReportType, value[1])
			end
			addEventHandler("onClientGUIComboBoxAccepted", cReportType, canISubmit)
			addEventHandler("onClientGUIComboBoxAccepted", cReportType, function()
				local selected = guiComboBoxGetSelected(cReportType)+1
				guiLabelSetHorizontalAlign( lReportType, "center", true)
				guiSetText(lReportType, reportTypes[selected][7])
				end)

			guiSetFont(lPlayerName, "default-bold-small")

			tReport = guiCreateMemo(0.29, 0.35, 0.32, 0.43, "", true)
			addEventHandler("onClientGUIChanged", tReport, canISubmit)



			
			-- bClose = guiCreateButton(0.03, 0.90, 0.95, 0.1, "Close", true)
			-- addEventHandler("onClientGUIClick", bClose, clickCloseButton)
			-- guiSetProperty(bClose, "NormalTextColour", "FF0CF10C")

			-- bSubmitReport = guiCreateButton(0.03, 0.78, 0.95, 0.1, "Submit Report", true)
			-- addEventHandler("onClientGUIClick", bSubmitReport, submitReport)
			-- guiSetEnabled(bSubmitReport, false)
			-- guiSetProperty(bSubmitReport, "NormalTextColour", "FFFF0000")

		elseif (reportpanelShowing~=false) then
		    reportpanelShowing = false
			destroyElement(tPlayerName)			
			destroyElement(lNameCheck)			
			destroyElement(cReportType)			
			destroyElement(tReport)						

			wReportMain, bClose, lStatus, lVehTheft, lPropBreak, lPapForgery, lVehTheftStatus, lPropBreakStatus, lPapForgeryStatus, bVehTheft, bPropBreak, bPapForgery, bHelp, lPlayerName, tPlayerName, lNameCheck, lReport, tReport, lLengthCheck, bSubmitReport = nil
			showCursor(false)
			toggleAllControls(true)
		end
	end
end
addCommandHandler("report", showReportMainUI)

function submitReport()
		triggerServerEvent("clientSendReport", getLocalPlayer(), reportedPlayer or getLocalPlayer(), tostring(guiGetText(tReport)), (guiComboBoxGetSelected(cReportType)+1))
		wReportMain, bClose, lStatus, lVehTheft, lPropBreak, lPapForgery, lVehTheftStatus, lPropBreakStatus, lPapForgeryStatus, bVehTheft, bPropBreak, bPapForgery, bHelp, lPlayerName, tPlayerName, lNameCheck, lReport, tReport, lLengthCheck, bSubmitReport = nil
		guiSetInputEnabled(false)		
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
		guiSetText(lNameCheck, "Player not found")
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
	elseif (source==bHelp) and (button=="left") and (state=="up") then
		if (wReportMain~=nil) then
			destroyElement(wReportMain)
		end

		wReportMain, bClose, lStatus, lVehTheft, lPropBreak, lPapForgery, lVehTheftStatus, lPropBreakStatus, lPapForgeryStatus, bVehTheft, bPropBreak, bPapForgery, bHelp, lPlayerName, tPlayerName, lNameCheck, lReport, tReport, lLengthCheck, bSubmitReport = nil
		guiSetInputEnabled(false)

		triggerEvent("viewF1Help", getLocalPlayer())
	end
end

function onOpenCheck(playerID)
	executeCommandHandler ( "check", tostring(playerID) )
end
addEvent("report:onOpenCheck", true)
addEventHandler("report:onOpenCheck", getRootElement(), onOpenCheck)




function hidereportpanel()
	reportpanelShowing = false
	showChat(true)
	destroyElement(tPlayerName)			
	destroyElement(lNameCheck)			
	destroyElement(cReportType)			
	destroyElement(tReport)
	
end
addEvent("hidereportpanel", true)
addEventHandler("hidereportpanel", getRootElement(), hidereportpanel)

function clearChat()
	local lines = getChatboxLayout()["chat_lines"]
	for i=1,lines do
		outputChatBox("")
	end
end