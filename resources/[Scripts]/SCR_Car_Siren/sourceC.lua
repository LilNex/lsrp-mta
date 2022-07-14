local createdLightbars = {}

addEventHandler("onClientResourceStart", resourceRoot, function()
	triggerServerEvent("requestAttachedLightbarsS", localPlayer)
end) 

local screenX, screenY = guiGetScreenSize()
local screenW, screenH = guiGetScreenSize()
local dxfont0_font = dxCreateFont(":lsimage/img/font.ttf", 14)

local panelState = false

local buttons = {}
local activeButton = false

local Roboto = dxCreateFont("files/Roboto.ttf", 13, false, "proof") or "default"

local panelW, panelH = 500, 395
local panelX, panelY = (screenX - panelW) * 0.5, (screenY - panelH) * 0.5

local listW, listH = 220, 240
local listX, listY = panelX + 10, panelY + 40 + 10

local rowW, rowH = listW, 40
local rowX = panelX + 10

local maxRows = math.floor(listH / rowH)
local listOffset = 0
local activeItem = 1

local imageS = 200
local imageX, imageY = panelX + panelW - imageS - 20, listY

local availableLightbars = {}

for k, v in pairs(availableMods) do
	table.insert(availableLightbars, k)
end

local activeSound = 1
local soundState = true

local previewSound = nil
local sirenSounds = {}

function togglePanel(state)
	if state then
		addEventHandler("onClientRender", root, renderPanel)
		addEventHandler("onClientClick", root, panelClickHandler)
		addEventHandler("onClientKey", root, panelKeyHandler)
	else
		removeEventHandler("onClientRender", root, renderPanel)
		removeEventHandler("onClientClick", root, panelClickHandler)
		removeEventHandler("onClientKey", root, panelKeyHandler)

		if isElement(previewSound) then
			destroyElement(previewSound)
		end

		local vehicle = getPedOccupiedVehicle(localPlayer)
		if vehicle then
			setElementData(vehicle, "siren.sound", activeSound)
			setElementData(vehicle, "siren.silent", soundState)
		end
	end

	panelState = state
end

addCommandHandler("khalidpolicesiren", function() --KSAKSAKSAKSAKSA2222222000000891821921889212812
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle then
		if isVehicleSupported(vehicle) then 
			togglePanel(not panelState)
		else
			outputChatBox("** Vehicle model is not supported!", 215, 89, 89)
		end
	else
		outputChatBox("** You are not in a vehicle!", 215, 89, 89)
	end
end)

function renderPanel()
	local absX, absY = getCursorPosition()

	buttons = {}

	if isCursorShowing() then
		absX = absX * screenX
		absY = absY * screenY
	else
		absX, absY = -1, -1
	end
    
	dxDrawRectangle(screenW * 0.0000, screenH * 0.0000, screenW * 1.0000, screenH * 1.0000, tocolor(20, 20, 20, 244), false)
    dxDrawImage(screenW * 0.0176, screenH * 0.0169, screenW * 0.1618, screenH * 0.2031, ":lsimage/img/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
     dxDrawText("INVENTIVE KINGDOM", screenW * 0.0315, screenH * 0.1641, screenW * 0.1640, screenH * 0.1953, tocolor(255, 255, 255, 255), 1.00, dxfont0_font, "center", "top", false, false, false, false, false)
	dxDrawRectangle(panelX, panelY, panelW, panelH, tocolor(9, 9, 9, 235)) --80 80 80 230
	dxDrawRectangle(panelX, panelY + 30, panelW, 3, tocolor(7, 77, 237, 254))
	dxDrawText("Siren System - LSRP", panelX, panelY, panelX + panelW, panelY + 30, tocolor(240, 240, 240), 1, Roboto, "center", "center")

	local i = 0
	for i = 1, maxRows do
		if availableLightbars[i + listOffset] then
			local rowY = listY + rowH * (i - 1)

			if activeItem == i + listOffset then
				dxDrawRectangle(rowX, rowY, rowW, rowH, tocolor(9, 9, 9, 235)) -- 80 200 120 140
			elseif i % 2 == 0 then
				dxDrawRectangle(rowX, rowY, rowW, rowH, tocolor(17, 16, 16, 254)) -- 50 50 50 150 / 17 16 16 254
			else
				dxDrawRectangle(rowX, rowY, rowW, rowH, tocolor(17, 16, 16, 254)) --230
			end
			dxDrawText("Lightbar " .. i + listOffset, rowX + 5, rowY, rowW, rowH + rowY, tocolor(255, 255, 255), 0.8, Roboto, "left", "center")
			
			buttons["item:" .. i + listOffset] = {rowX, rowY, rowW, rowH}
		end
	end

	local lightbarNum = #availableLightbars

	if lightbarNum > maxRows then
		local trackSize = listH
		dxDrawRectangle(listX + listW - 5, listY, 5, trackSize, tocolor(40, 40, 40, 125))
		dxDrawRectangle(listX + listW - 5, listY + listOffset * (trackSize / lightbarNum), 5, trackSize / lightbarNum * maxRows, tocolor(7, 77, 237, 254))
	end

	if activeItem then
		dxDrawImage(imageX, imageY, imageS, imageS, "files/" .. availableLightbars[activeItem] .. ".png")

		dxDrawButton("button:soundType", imageX, imageY + imageS , imageS, 30, "Sound type: " .. activeSound)
		dxDrawButton("button:soundState", imageX, imageY + imageS + 10 + 30, imageS, 30, "Sound: " .. tostring(soundState and "Yes" or "No"))
	end

	dxDrawButton("button:exit", panelX + panelW - 120 - 10, panelY + panelH - 30 - 10, 120, 30, "Exit")
	dxDrawButton("button:select", panelX + 10, panelY + panelH - 30 - 10, 120, 30, "Select")

	if createdLightbars[getPedOccupiedVehicle(localPlayer)] then
		dxDrawButton("button:removeall", panelX + 10 + 120 + 10, panelY + panelH - 30 - 10, 120, 30, "Remove all")
	end

	--dxDrawText("KSA Server", listX, listY + listH + 20, listX + listW, listY + listH + 20, tocolor(240, 240, 240), 0.6, Roboto, "center")

	activeButton = false

	if isCursorShowing() then
		for k, v in pairs(buttons) do
			if absX >= v[1] and absX <= v[1] + v[3] and absY >= v[2] and absY <= v[2] + v[4] then
				activeButton = k
				break
			end
		end
	end
end

function panelClickHandler(button, state)
	if activeButton then
		if state == "down" then
			if button == "left" then
				local data = split(activeButton, ":")

				if data[2] then
					if data[1] == "button" then
						if data[2] == "exit" then
							togglePanel(false)
						elseif data[2] == "select" then
							togglePanel(false)
							toggleEditor(true, availableLightbars[activeItem])
						elseif data[2] == "removeall" then
							triggerServerEvent("detachLightbarS", getPedOccupiedVehicle(localPlayer))
						elseif data[2] == "soundType" then
							if isElement(previewSound) then
								destroyElement(previewSound)
							end
							activeSound = activeSound + 1
							
							if activeSound > #availableSounds then
								activeSound = 1
							end

							previewSound = playSound("sounds/" .. availableSounds[activeSound], true)
							setSoundVolume(previewSound, 0.3)
						elseif data[2] == "soundState" then
							soundState = not soundState
						end
					elseif data[1] == "item" then
						activeItem = tonumber(data[2])
					end
				end
			end
		end
	end
end

function panelKeyHandler(button, press)
	if button == "mouse_wheel_up" and press then
		if listOffset > 0 then
			listOffset = listOffset - 1
		end
	elseif button == "mouse_wheel_down" and press then
		if listOffset < #availableLightbars - maxRows then
			listOffset = listOffset + 1
		end
	end
end

function dxDrawButton(id, x, y, w, h, text)
	dxDrawRectangle(x, y, w, h, tocolor(0, 0, 0, 255)) --60 60 60 230

	local color = activeButton == id and tocolor(7, 77, 237, 254) or tocolor(52, 52, 52, 203)

	dxDrawRectangle(x, y, w, 1, color) -- top
	dxDrawRectangle(x, y + h - 1, w, 1, color) -- bottom
	dxDrawRectangle(x, y, 1, h, color) -- left
	dxDrawRectangle(x + w, y, 1, h, color) -- right

	dxDrawText(text, x, y, x + w, y + h, tocolor(230, 230, 230), 0.75, Roboto, "center", "center")

	buttons[id] = {x, y, w, h}
end

addEvent("receiveAttachedLightbarsC", true)
addEventHandler("receiveAttachedLightbarsC", root, function(data)
	for vehicle, table1 in pairs(data) do
		if not createdLightbars[vehicle] then
			createdLightbars[vehicle] = {}
		end

		for k, v in pairs(table1) do
			local model, x, y, z, rx, ry, rz = unpack(v)
		
			local object = createObject(model, 0, 0, 0)
			setElementCollisionsEnabled(object, false)
			attachElements(object, vehicle, x, y, z, rx, ry, rz)
			
			table.insert(createdLightbars[vehicle], object)
		end
	end
end)

addEvent("attachLightbarC", true)
addEventHandler("attachLightbarC", root, function(lightbarData)
	local model, x, y, z, rx, ry, rz = unpack(lightbarData)

	if not createdLightbars[source] then
		createdLightbars[source] = {}
	end

	local object = createObject(model, 0, 0, 0)
	setElementCollisionsEnabled(object, false)
	attachElements(object, source, x, y, z, rx, ry, rz)

	table.insert(createdLightbars[source], object)
end)

addEvent("detachLightbarC", true)
addEventHandler("detachLightbarC", root, function()
	if createdLightbars[source] then
		for i = 1, #createdLightbars[source] do
			destroyElement(createdLightbars[source][i])
		end
	end

	createdLightbars[source] = nil
end)

addEventHandler("onClientElementDestroy", root, function()
	if getElementType(source) == "vehicle" then
		if createdLightbars[source] then
			for i = 1, #createdLightbars[source] do
				destroyElement(createdLightbars[source][i])
			end

			createdLightbars[source] = nil
		end
	end
end)

function playSiren(source, soundId)
	if isElement(sirenSounds[source]) then
		destroyElement(sirenSounds[source])
	end

	if soundId then
		sirenSounds[source] = playSound3D("sounds/" .. availableSounds[soundId], 0, 0, 0, true)
		setSoundMaxDistance(sirenSounds[source], 200)

		attachElements(sirenSounds[source], source)
	end
end

addEventHandler("onClientRender", root, function()
	for k, v in pairs(getElementsByType("vehicle")) do
		if not getElementData(v, "siren.silent") then
			if getVehicleSirensOn(v) and getVehicleOccupant(v, 0) then
				if not isElement(sirenSounds[v]) then
					playSiren(v, getElementData(v, "siren.sound") or 1)
				end
			elseif not getVehicleSirensOn(v) or not getVehicleOccupant(v, 0) then
				playSiren(v) 
			end
		end
	end
end)