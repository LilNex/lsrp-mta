local repairGarages = {
	createMarker(-385.810546875, -1429.228515625, 25.7265625, "cylinder", 70, 255, 255, 255, 0)
}
local font = dxCreateFont( "files/calibri.ttf", 10, false )
local font2 = dxCreateFont( "files/calibri.ttf", 16, false )

local function isElementWithinFixerColshape(element)
	local inside = false
	for k, v in pairs(repairGarages) do
		if isElementWithinMarker(element, v) then
			inside = true
			break
		end
	end
	return inside
end
local sx, sy = guiGetScreenSize()
scmp = (1/1920)*sx
local function isInBoxEdited(x, y, xmin, ymin, xsize, ysize)
	 return x >= xmin and x <= xmin+xsize and y >= ymin and y <= ymin+ysize
end
local engineBackVeh = {[451] = true}
local partTable = {{"windscreen_dummy", "Szélvédő"},
{"bump_front_dummy", "Első lökhárító"},
{"bump_rear_dummy", "Hátsó lökhárító"},
{"bonnet_dummy", "Motorháztető"},
{"boot_dummy", "Csomagtartó"},
{"door_lf_dummy", "Bal első ajtó"},
{"door_rf_dummy", "Jobb első ajtó"},
{"door_lr_dummy", "Bal hátsó ajtó"},
{"door_rr_dummy", "Jobb hátsó ajtó"},
{"wheel_rf_dummy", "Jobb első kerék"},
{"wheel_lf_dummy", "Bal első kerék"},
{"wheel_rb_dummy", "Jobb hátsó kerék"},
{"wheel_lb_dummy", "Bal hátsó kerék"},
{"wheel_rear", "Hátsó kerék"},
{"wheel_front", "Első kerék"}}

local function getNameFromPart(part)
	local returnVal = false
	for k, v in pairs(partTable) do
		if v[1] == part then
			returnVal = v[2]
			break
		end
	end
	return returnVal
end
local function hasPartGotProblem(v, part)
	local returnVal = false
	local lf, lb, rf, rb = getVehicleWheelStates(v)
	
	local lfd, rfd, lrd, rrd,bonnet,boot = getVehicleDoorState(v, 2), getVehicleDoorState(v, 3), getVehicleDoorState(v, 4), getVehicleDoorState(v, 5), getVehicleDoorState(v, 0), getVehicleDoorState(v, 1)
	if part == "wheel_rf_dummy" and rf ~= 0 then
		returnVal = true
	elseif part == "wheel_lf_dummy" and lf ~= 0 then
		returnVal = true
	elseif part == "wheel_rb_dummy" and rb ~= 0 then
		returnVal = true
	elseif part == "wheel_lb_dummy" and lb ~= 0 then
		returnVal = true
	elseif part == "door_lf_dummy" and lfd ~= 0 and lfd ~= 1 then
		returnVal = true
	elseif part == "door_rf_dummy" and rfd ~= 0 and rfd ~= 1 then
		returnVal = true
	elseif part == "door_lr_dummy" and lrd ~= 0 and lrd ~= 1 then
		returnVal = true
	elseif part == "door_rr_dummy" and rrd ~= 0 and rrd ~= 1 then
		returnVal = true
	elseif part == "bonnet_dummy" and bonnet ~= 0 and bonnet ~= 1 then
		returnVal = true
	elseif part == "boot_dummy" and boot ~= 0 and boot ~= 1 then
		returnVal = true
	elseif part == "bump_front_dummy" and getVehiclePanelState(v, 5) ~= 0 then
		returnVal = true
	elseif part == "bump_rear_dummy" and getVehiclePanelState(v, 6) ~= 0 then
		returnVal = true
	elseif part == "windscreen_dummy" and getVehiclePanelState(v, 4) ~= 0 then
		returnVal = true
	elseif getNameFromPart(part) == "Első kerék" and ((lf ~= 0) or (rf ~= 0)) then
		returnVal = true
	elseif getNameFromPart(part) == "Hátsó kerék" and ((lb ~= 0) or (rb ~= 0)) then
		returnVal = true
	end
	return returnVal
end

local function getPartPosition(element, part)
	local x, y, z = false, nil, nil
	if getElementType(element) == "vehicle" then
		x, y, z = getVehicleComponentPosition(element, part, "world")
	end
	return x,y,z
end

local function getPartImage(part)
	local returnVal = false
	part = getNameFromPart(part)
	if part then
		if string.find(part, "Szélvédő") then
		--	returnVal = "icons/windscreen.png"
		elseif string.find(part, "ajtó") then
		--	returnVal = "icons/door.png"
		elseif string.find(part, "Csomagtartó") then
		--	returnVal = "icons/trunk.png"
		elseif string.find(part, "Motorháztető") then
		--	returnVal = "icons/hood.png"
		elseif string.find(part, "Első lökhárító") then
		--	returnVal = "icons/frontb.png"
		elseif string.find(part, "Hátsó lökhárító") then
		--	returnVal = "icons/backb.png"
		elseif string.find(part, "kerék") then
		--	returnVal = "icons/wheel.png"
		end
	end
	return returnVal
end

local overPart = nil
local vehicleRepair = nil
addEventHandler("onClientRender", getRootElement(), function()
	if not isElementWithinFixerColshape(localPlayer) then return end
	local vehicleTable = getElementsByType("vehicle", getRootElement(), true)
	
	local cx, cy = getCursorPosition()
	if cx then
		cx, cy = cx*sx, cy*sy
	end
	overPart = nil
	local xov, yov, zov = nil, nil, nil
	
	if isPedInVehicle(localPlayer) then return end
	   if (getElementData(getPlayerTeam(source), "type")) == 4 or tonumber(getElementData(source,"job")) == 5 then 
			local px, py, pz = getElementPosition(localPlayer)
			for kveh, v in pairs(vehicleTable) do
				local engx, engy = 0, 0
				local engrx, engry, engrz = 0, 0
				if getElementData(localPlayer, "repairingAlready") ~= true and not isVehicleBlown(v) and isElementWithinFixerColshape(v) then
					local components = getVehicleComponents(v)
					for k in pairs(components) do
						if getNameFromPart(k) then
							local x, y, z = getPartPosition(v, k)--getVehicleComponentPosition(v, k, "world")
							if x then
								local scx, scy = getScreenFromWorldPosition(x,y,z,0,false)
								if getNameFromPart(k) == "Motorháztető" and scx and not engineBackVeh[getElementModel(v)] then
									engx, engy = scx, scy+(80*scmp)
									engrx, engry, engrz = x,y,z+0.5
								end
								if getDistanceBetweenPoints3D(px, py, pz, x,y,z) < 5 then
									local scx, scy = getScreenFromWorldPosition(x,y,z,0,false)
									if scx then
										if hasPartGotProblem(v, k) then
											if cx then
												if isInBoxEdited(cx, cy, scx-(30*scmp), scy-(10*scmp), (120*scmp), (dxGetFontHeight(scmp, font)+(40*scmp))) then
													if overPart then
														--if getDistanceBetweenPoints3D(xov, yov, zov, getElementPosition(localPlayer)) > getDistanceBetweenPoints3D(x, y, z, getElementPosition(localPlayer)) then
														--	overPart = k
														--	xov, yov, zov = x,y,z
														--end
													else
														overPart = k
														vehicleRepair = v
														xov, yov, zov = x,y,z
													end
												end
											end
											if cx then
												if isInBoxEdited(cx, cy, scx-(30*scmp), scy-(10*scmp), (120*scmp), (dxGetFontHeight(scmp, font)+(40*scmp))) and overPart == k then
													dxDrawRectangle(scx-5-(30*scmp), scy-5-(10*scmp), dxGetTextWidth(getNameFromPart(k), scmp+0.5, font)+10+(40*scmp), (dxGetFontHeight(scmp, font)+10+(20*scmp)), tocolor(0,0,0, 150))
													dxDrawRectangle(scx-(30*scmp), scy-(10*scmp), dxGetTextWidth(getNameFromPart(k), scmp+0.5, font)+(40*scmp), (dxGetFontHeight(scmp, font)+(20*scmp)), tocolor(124, 197, 119, 200))
													dxDrawText(getNameFromPart(k), scx-20, scy, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(255,255,255), scmp, font, "center")
													dxDrawText("Kwik Fit", scx-34, scy-39, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(0,0,0), scmp, font2, "center")
													dxDrawText("Kwik Fit", scx-35, scy-40, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(65,131,215), scmp, font2, "center")
													dxDrawText(">", scx+61, scy-39, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(0,0,0), scmp, font2, "center")
													dxDrawText(">", scx+60, scy-40, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(255,167,0), scmp, font2, "center")
												else
													dxDrawRectangle(scx-5-(30*scmp), scy-5-(10*scmp), dxGetTextWidth(getNameFromPart(k), scmp+0.5, font)+10+(40*scmp), (dxGetFontHeight(scmp, font)+10+(20*scmp)), tocolor(0,0,0, 150))
													dxDrawRectangle(scx-(30*scmp), scy-(10*scmp), dxGetTextWidth(getNameFromPart(k), scmp+0.5, font)+(40*scmp), (dxGetFontHeight(scmp, font)+(20*scmp)), tocolor(0,0,0, 80))
													dxDrawText(getNameFromPart(k), scx-20, scy, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(255,255,255), scmp, font, "center")
													dxDrawText("Kwik Fit", scx-34, scy-39, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(0,0,0), scmp, font2, "center")
													dxDrawText("Kwik Fit", scx-35, scy-40, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(65,131,215), scmp, font2, "center")
													dxDrawText(">", scx+61, scy-39, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(0,0,0), scmp, font2, "center")
													dxDrawText(">", scx+60, scy-40, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(255,167,0), scmp, font2, "center")
												end
											else
												dxDrawRectangle(scx-5-(30*scmp), scy-5-(10*scmp), dxGetTextWidth(getNameFromPart(k), scmp+0.5, font)+10+(40*scmp), (dxGetFontHeight(scmp, font)+10+(20*scmp)), tocolor(0,0,0, 150))
												dxDrawRectangle(scx-(30*scmp), scy-(10*scmp), dxGetTextWidth(getNameFromPart(k), scmp+0.5, font)+(40*scmp), (dxGetFontHeight(scmp, font)+(20*scmp)), tocolor(0,0,0, 80))
												dxDrawText(getNameFromPart(k), scx-20, scy, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(255,255,255), scmp, font, "center")
												dxDrawText("Kwik Fit", scx-34, scy-39, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(0,0,0), scmp, font2, "center")
												dxDrawText("Kwik Fit", scx-35, scy-40, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(65,131,215), scmp, font2, "center")
												dxDrawText(">", scx+61, scy-39, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(0,0,0), scmp, font2, "center")
												dxDrawText(">", scx+60, scy-40, scx+dxGetTextWidth(getNameFromPart(k), scmp+0.5, font), scy+(40*scmp), tocolor(255,167,0), scmp, font2, "center")
											end
											local r,g,b = 255,255,255
											if getPartImage(k) == "" or getPartImage(k) == "" or getPartImage(k) == "" or getPartImage(k) == "" or getPartImage(k) == "" then
												r,g,b = getVehicleColor(v, true)
											end
											--dxDrawImage(scx-(25*scmp), scy, (20*scmp), (20*scmp), getPartImage(k),0,0,0,tocolor(r,g,b,255))
										end
									end
								end
							end
						end
					end
					local vx, vy, vz = getElementPosition(v)
					local m = getElementMatrix(v)
					local x, y, z = getPartPosition(v, "bonnet_dummy")
					if x and not engineBackVeh[getElementModel(v)] then
						engx, engy = getScreenFromWorldPosition(x,y,z,0,false)
						if engy then
							engy = engy  + (80*scmp)
						end
					end
					if (engx == 0 and engy == 0) then
						engx, engy = getScreenFromWorldPosition((-m[2][1])+vx,(-m[2][2])+vy,m[2][3]+vz,0,false)
						engrx, engry, engrz = ((-m[2][1])*2)+vx,((-m[2][2])*2)+vy,((m[2][3])*2)+vz
					end
					if getVehicleType(v) ~= "Automobile" then
						engx, engy = getScreenFromWorldPosition((m[4][1]),(m[4][2]),m[4][3],0,false)
						engrx, engry, engrz = (m[4][1]),(m[4][2]),(m[4][3])
					end
					if getElementData(v, "enginebroke") ~= 0 or getElementHealth(v) < 900 then
						if engx and engrx and px then
							if getDistanceBetweenPoints3D(px, py, pz, engrx, engry, engrz) < 5 then
								dxDrawRectangle(sx/2+sy/2-10, 290, 250, 100, tocolor(0,0,0,180))
								if cx then
									if isInBoxEdited(cx, cy, sx/2+sy/2-10, 320, 200, 40) then
										if not overPart then
											overPart = "Motor"
											vehicleRepair = v
										end
										if overPart == "Motor" then
											dxDrawText("Egyéb javítások",sx/2-14+sy/2+61, 261,0,0, tocolor(0,0,0), scmp, font2, "left","top")
											dxDrawText("Egyéb javítások",sx/2-15+sy/2+60, 260,0,0, tocolor(255,255,255), scmp, font2, "left","top")
											dxDrawRectangle(sx/2+20+sy/2-10, 315, 210, 50, tocolor(0,0,0,180))
											dxDrawRectangle(sx/2+25+sy/2-10, 320, 200, 40, tocolor(215,85,85,200))
											dxDrawText("Motor megszerelése",sx/2-40+sy/2+60, 325,0,0, tocolor(255,255,255), scmp, font2, "left","top")
										else
											dxDrawText("Egyéb javítások",sx/2-14+sy/2+61, 261,0,0, tocolor(0,0,0), scmp, font2, "left","top")
											dxDrawText("Egyéb javítások",sx/2-15+sy/2+60, 260,0,0, tocolor(255,255,255), scmp, font2, "left","top")
											dxDrawRectangle(sx/2+20+sy/2-10, 315, 210, 50, tocolor(0,0,0,180))
											dxDrawRectangle(sx/2+25+sy/2-10, 320, 200, 40, tocolor(0,0,0,80))
											dxDrawText("Motor megszerelése",sx/2-40+sy/2+60, 325,0,0, tocolor(255,255,255), scmp, font2, "left","top")
										end
									else
										dxDrawText("Egyéb javítások",sx/2-14+sy/2+61, 261,0,0, tocolor(0,0,0), scmp, font2, "left","top")
										dxDrawText("Egyéb javítások",sx/2-15+sy/2+60, 260,0,0, tocolor(255,255,255), scmp, font2, "left","top")
										dxDrawRectangle(sx/2+20+sy/2-10, 315, 210, 50, tocolor(0,0,0,180))
										dxDrawRectangle(sx/2+25+sy/2-10, 320, 200, 40, tocolor(0,0,0,80))
										dxDrawText("Motor megszerelése",sx/2-40+sy/2+60, 325,0,0, tocolor(255,255,255), scmp, font2, "left","top")
									end
								else
									dxDrawText("Egyéb javítások",sx/2-14+sy/2+61, 261,0,0, tocolor(0,0,0), scmp, font2, "left","top")
									dxDrawText("Egyéb javítások",sx/2-15+sy/2+60, 260,0,0, tocolor(255,255,255), scmp, font2, "left","top")
									dxDrawRectangle(sx/2+20+sy/2-10, 315, 210, 50, tocolor(0,0,0,180))
									dxDrawRectangle(sx/2+25+sy/2-10, 320, 200, 40, tocolor(0,0,0,80))
									dxDrawText("Motor megszerelése",sx/2-40+sy/2+60, 325,0,0, tocolor(255,255,255), scmp, font2, "left","top")
								end
							end
						end
					end
				end
			end
		end
	end
)
local repairPart = nil
local vehicleRepairSave = nil
addEventHandler("onClientClick", root, function(button, state)
	if state ~= "down" or repairPart or not overPart then return end
	if isPedInVehicle(localPlayer) then return end
    if (getElementData(getPlayerTeam(source), "type")) == 4 then
			if overPart then
				local cost = 50
				local partTableID = {["windscreen_dummy"] = 4, ["bump_front_dummy"] = 5, ["bump_rear_dummy"] = 6, ["bonnet_dummy"] = 0, ["boot_dummy"] = 1, ["door_lf_dummy"] = 2, ["door_rf_dummy"] = 3, ["door_lr_dummy"] = 4, ["door_rr_dummy"] = 5}
				if tonumber(getElementData(localPlayer, "money")) < 40000 then
					exports.wls_info:addNotification("Nincs elég pénzed a művelet elvégzéséhez!","info")
					return
				end
		
				repairPart = overPart
				vehicleRepairSave = vehicleRepair
				setElementData(localPlayer, "playerAnimation", true)
				setElementData(localPlayer, "repairingAlready", true)


				setTimer(function()
					triggerServerEvent("repairCar", localPlayer, repairPart, vehicleRepairSave, 50)
					repairPart = nil
					setTimer(function()
						setElementData(localPlayer, "repairingAlready", false)
					end, 3000, 1)
				end, repairTime, 1)
			end
	    end
	end
end)

addEventHandler("onClientElementDataChange", getRootElement(), function(dataName)
	if getElementType(source) == "player" and (dataName == "playerAnimation" and getElementData(source, dataName) == true) then
		if source == localPlayer then
			triggerServerEvent("fixAnimation",localPlayer,localPlayer,1)
			setElementFrozen(localPlayer, true)
		end
        
        if overPart == "Motor" then
			triggerServerEvent("fixme", localPlayer, "elkezdte a gépjármű motorját megszerelni.")
		else
			triggerServerEvent("fixme", localPlayer, "elkezdte a gépjárműn a/az " .. getNameFromPart(overPart) .. "-t megszerelni.")
		end

		setTimer(function(elementEdited)
			if elementEdited == localPlayer then
				triggerServerEvent("fixAnimation",elementEdited,elementEdited,2)
				setElementFrozen(localPlayer, false)
			end
			setElementData(elementEdited, "playerAnimation", false)
		end, repairTime, 1, source)
	end
end)