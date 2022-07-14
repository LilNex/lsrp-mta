local screenW, screenH = guiGetScreenSize()
screenWidth, screenHeight = guiGetScreenSize()
local localPlayer = getLocalPlayer()
local iconW, iconH = 32, 32 
local actualIconSizeW, actualIconSizeW = 64 , 64
local fontToolTip = "default-bold" --dxCreateFont ( ":resources/panel_tooltip.ttf" , 12)
local tooltip_background_color = tocolor( 0, 0, 0, 180 )
local tooltip_text_color = tocolor( 255, 255, 255, 255 )
local hkSpace = 4
local nex = 260
--MAXIME / CHECK IF MOUSE IS WITHIN A DX BOX
function isInBox( x, y, xmin, xmax, ymin, ymax )
	--outputDebugString(tostring(x)..", "..tostring(y)..", "..tostring(xmin)..", "..tostring(xmax)..", "..tostring(ymin)..", "..tostring(ymax))
	return x >= xmin and x <= xmax and y >= ymin and y <= ymax --and not getElementData(localPlayer, "phoneRingingShowing")
end
--MAXIME / SHOW TOOLTIP AT CURSOR POSITION
function tooltip( x, y, text, text2 )
	text = tostring( text )
	if text2 then
		text2 = tostring( text2 )
	end
	
	if text == text2 then
		text2 = nil
	end
	
	local width = dxGetTextWidth( text, 1, fontToolTip ) + 20
	if text2 then
		width = math.max( width, dxGetTextWidth( text2, 1, fontToolTip ) + 20 )
		text = text .. "\n" .. text2
	end
	local height = 10 * ( text2 and 5 or 3 )
	x = math.max( 10, math.min( x, screenWidth - width - 10 ) )
	y = math.max( 10, math.min( y, screenHeight - height - 10 ) ) + iconH/3
	
	dxDrawRectangle( x, y, width, height, tooltip_background_color, true )
	dxDrawRectangle( x, y, width, 2, tocolor(75, 255, 0, 255), true )
	dxDrawText( text, x, y, x + width, y + height, tooltip_text_color, 1, fontToolTip, "center", "center", false, false, true )
end




-- addEventHandler("onClientRender", root,
    -- function()
        -- dxDrawRectangle(screenW * 0.9707, screenH * 0.0130, screenW * 0.0220, screenH * 0.0391, tocolor(255, 255, 255, 255), false)
        -- dxDrawRectangle(screenW * 0.9707, screenH * 0.0651, screenW * 0.0220, screenH * 0.0052, tocolor(255, 255, 255, 255), false)
    -- end
-- )

function drawHUD()
	if not isPlayerMapVisible() and getElementData(localPlayer, "loggedin") == 1 then
		local ax, ay = screenWidth - iconW - 20, (getElementData(localPlayer, "annHeight") or 0) + 20
		local bx, by = screenWidth - iconW - 20, screenHeight - iconH - 20
		local cursorX, cursorY, cwX, cwY, cwZ = getCursorPosition()
		local tooltips = {}
		local tooltips_bottom = {}
		local isBike = false
		
		--THIS IS TO LET THE FORUMS PM CHECKER KNOW WHERE TO DISPLAY
		setElementData(localPlayer, "hud:whereToDisplayY", ay)
		
		if getElementData( localPlayer,"hide_hud" ) ~= "0" then
			dxDrawImage(ax,ay,iconH,iconH,"images/hud/tagmode.png")
			table.insert(tooltips, "settings:hud:tagmode:newstyle:on")
			ay = ay + iconW + hkSpace
		else
			dxDrawImage(ax,ay,iconH,iconH,"images/hud/tagmode.png", 0, 0, 0, disabled_item(100))
			table.insert(tooltips, "settings:hud:tagmode:newstyle:off")
			ay = ay + iconW + hkSpace
		end
		
		if isActive() then
			--GOLDEN NAMETAG / MAXIME
			if getElementData(localPlayer, "donation:nametag") then -- Golden nametag
				if getElementData(localPlayer, "nametag_on") then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/premium.png")
					table.insert(tooltips, "nametag_on")
					ay = ay + iconW + hkSpace
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/premium.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "nametag_off")
					ay = ay + iconW + hkSpace
				end
			else
				if getElementData(localPlayer, "donation:lifeTimeNameTag") then
					if getElementData(localPlayer, "lifeTimeNameTag_on") then
						dxDrawImage(ax,ay,iconH,iconH,"images/hud/donor.png")
						table.insert(tooltips, "lifeTimeNameTag_on")
						ay = ay + iconW + hkSpace
					else
						dxDrawImage(ax,ay,iconH,iconH,"images/hud/premium.png", 0, 0, 0, disabled_item(100))
						table.insert(tooltips, "lifeTimeNameTag_off")
						ay = ay + iconW + hkSpace
					end
				end
			end
			
						-- WALKING STYLE / MAXIME
			dxDrawImage(ax,ay,iconH,iconH,"images/hud/walkingstyle.png")
			table.insert(tooltips, "settings:hud:walkingstyle")
			ay = ay + iconW + hkSpace
			
			-- HEAD TURNING STYLE / MAXIME
			if getElementData( localPlayer,"head_turning" ) == "1" then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/head_turning.png")
				table.insert(tooltips, "settings:hud:head_turning:1")
				ay = ay + iconW + hkSpace
			elseif getElementData( localPlayer,"head_turning" ) == "2" then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/head_turning.png")
				table.insert(tooltips, "settings:hud:head_turning:2")
				ay = ay + iconW + hkSpace
			else
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/head_turning.png", 0, 0, 0, disabled_item(100))
				table.insert(tooltips, "settings:hud:head_turning:0")
				ay = ay + iconW + hkSpace
			end
			
			-- ADMIN TAG / MAXIME
			-- local isAdmin = exports.integration:isPlayerAdmin(localPlayer)
			-- 			local isTa = exports.integration:isPlayerTrialAdmin(localPlayer)
			-- 						local isSa = exports.integration:isPlayerSeniorAdmin(localPlayer)
			-- 									local isla = exports.integration:isPlayerLeadAdmin(localPlayer)
			-- 												local isHa = exports.integration:isPlayerHeadAdmin(localPlayer)
			-- 															local isPr = getElementData(localPlayer,"admin_level") >= 6
			-- 																		local isCeo = getElementData(localPlayer,"admin_level") >= 7
			-- 																					local isVF = exports.integration:isPlayerViceFounder(localPlayer)
			-- 																								local isFounder = exports.integration:isPlayerFounder(localPlayer)
			-- local isScripter = exports.integration:isPlayerScripter(localPlayer)







			
			-- if isScripter then
			-- 	if getElementData( localPlayer,"duty_dev" )  == 1  then
			-- 		dxDrawImage(ax,ay,iconH,iconH,"images/hud/scripter.png")
			-- 		table.insert(tooltips, "devonduty")
			-- 	else
			-- 		dxDrawImage(ax,ay,iconH,iconH,"images/hud/scripter.png", 0, 0, 0, disabled_item(100))
			-- 		table.insert(tooltips, "devoffduty")
			-- 	end
			-- 	ay = ay + iconW + hkSpace
			-- end

			if exports.donators:hasPlayerPerk(localPlayer, 40 ) then
				if getElementData( localPlayer,"duty_youtuber" ) == 1 then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/youtube.png")
					table.insert(tooltips, "youtuberonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/youtube.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "youtuberoffduty")
				end
				ay = ay + iconW + hkSpace
			end
			if exports.donators:hasPlayerPerk(localPlayer, 41 ) then
				if getElementData( localPlayer,"duty_donator" ) == 1 then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/donor.png")
					table.insert(tooltips, "donatoronduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/donor.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "donatoroffduty")
				end
				ay = ay + iconW + hkSpace
			end
if exports.donators:hasPlayerPerk(localPlayer, 39 ) then
				if getElementData( localPlayer,"duty_booster" ) == 1 then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/Booster.png")
					table.insert(tooltips, "boosteronduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/Booster.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "boosteroffduty")
				end
				ay = ay + iconW + hkSpace
			end
							if isFounder then
				if getElementData( localPlayer,"duty_admin" )  == 1  then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/founder.png")
					table.insert(tooltips, "adminonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/founder.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "adminoffduty")
				end
				ay = ay + iconW + hkSpace
							elseif isVF then
				if getElementData( localPlayer,"duty_admin" )  == 1  then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/vf.png")
					table.insert(tooltips, "adminonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/vf.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "adminoffduty")
				end
				ay = ay + iconW + hkSpace
							elseif isCeo then
				if getElementData( localPlayer,"duty_admin" )  == 1  then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/co.png")
					table.insert(tooltips, "adminonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/co.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "adminoffduty")
				end
				ay = ay + iconW + hkSpace
							elseif isPr then
				if getElementData( localPlayer,"duty_admin" )  == 1  then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/pr.png")
					table.insert(tooltips, "adminonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/pr.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "adminoffduty")
				end
				ay = ay + iconW + hkSpace
			elseif isHa then
				if getElementData( localPlayer,"duty_admin" )  == 1  then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/ha.png")
					table.insert(tooltips, "adminonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/ha.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "adminoffduty")
				end
				ay = ay + iconW + hkSpace
										elseif isla then
				if getElementData( localPlayer,"duty_admin" )  == 1  then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/la.png")
					table.insert(tooltips, "adminonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/la.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "adminoffduty")
				end
				ay = ay + iconW + hkSpace
							elseif isSa then
				if getElementData( localPlayer,"duty_admin" )  == 1  then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/sa.png")
					table.insert(tooltips, "adminonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/sa.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "adminoffduty")
				end
				ay = ay + iconW + hkSpace
											elseif isAdmin then
				if getElementData( localPlayer,"duty_admin" )  == 1  then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/sm.png")
					table.insert(tooltips, "adminonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/sm.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "adminoffduty")
				end
				ay = ay + iconW + hkSpace
			elseif isTa then
				if getElementData( localPlayer,"duty_admin" )  == 1  then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/admin.png")
					table.insert(tooltips, "adminonduty")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/staff/admin.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "adminoffduty")
				end
				ay = ay + iconW + hkSpace
				end
			
			-- GM TAG / MAXIME
			local isGM = exports.integration:isPlayerSupporter(localPlayer)
			if isGM then
				if getElementData( localPlayer,"duty_supporter" ) == 1 then
					dxDrawImage(ax,ay,iconH*2,iconH*2,"images/hud/gm.png")
					table.insert(tooltips, "gmonduty")
				else
					dxDrawImage(ax,ay,iconH*2,iconH*2,"images/hud/gm.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "gmoffduty")
				end
				ay = ay + iconW + hkSpace
			end
			
			if (isGM or isAdmin) then
				if getElementData( localPlayer,"report_panel_mod" ) == "1" then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/reportpanel_on.png")
					table.insert(tooltips, "report_panel_mod:1")
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/reportpanel_off.png", 0, 0, 0, disabled_item(155))
					table.insert(tooltips, "report_panel_mod:0")
				end
				ay = ay + iconW + hkSpace
			end
			
			-- TOGGLE PMS / MAXIME
			local hasTogPM, togPMState = exports.donators:hasPlayerPerk(localPlayer, 1)
			if hasTogPM then
				if tonumber(togPMState) == 1 then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/togpm.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "settings:hud:togpm:off")
					ay = ay + iconW + hkSpace
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/togpm.png")
					table.insert(tooltips, "settings:hud:togpm:on")
					ay = ay + iconW + hkSpace
				end
			end
			
			-- TOGGLE DON CHAT / MAXIME
			local hasTogDon, togDonState = exports.donators:hasPlayerPerk(localPlayer, 10)
			if hasTogDon then
				if tonumber(togDonState) ~= 0 then
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/togdon.png")
					table.insert(tooltips, "settings:hud:togdon:on")
					ay = ay + iconW + hkSpace
				else
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/togdon.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips, "settings:hud:togdon:off")
					ay = ay + iconW + hkSpace
				end
			end
			
			if getElementData(localPlayer, "restrain") == 1 then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/handcuffs.png")
				ay = ay + iconW + hkSpace
				table.insert(tooltips, "handcuffs")
			end
				
			if getElementModel(localPlayer) == 75 then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/k9.png")
				ay = ay + iconW + hkSpace
				table.insert(tooltips, "k9")
			end
				
			if exports['realism-system']:isLocalPlayerSmoking() then
				dxDrawImage(ax,ay,iconH,iconH,"images/hud/cigarette.png")
				ay = ay + iconW + hkSpace
				table.insert(tooltips, "cigarette")
			end
			
			--DEAGLE MODE / MAXIME
			if (getPedWeapon(localPlayer) == 24) and (getPedTotalAmmo(localPlayer) > 0) then
				local deagleMode = getElementData(localPlayer, "deaglemode")
				if (deagleMode == 0) then -- tazer
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/dtazer.png")
				elseif (deagleMode == 1) then-- lethal
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/dglock.png")
				elseif (deagleMode == 2) then-- radar
					dxDrawImage(ax,ay,iconH,iconH,"images/hud/dradar.png")
				end
				ay = ay + iconW + hkSpace
				table.insert(tooltips, {"deaglemode", deagleMode})
			end
			
			--FIREMODE / MAXIME
			if (getPedWeapon(localPlayer)==31) or (getPedWeapon(localPlayer)==30) or (getPedWeapon(localPlayer)==29) or (getPedWeapon(localPlayer)==28) or (getPedWeapon(localPlayer)==32) and (getPedTotalAmmo(localPlayer) > 0) then
	            local fireMode = getElementData(localPlayer, "firemode")
	            if (fireMode == 0) then -- auto
	                dxDrawImage(ax,ay,iconH,iconH,"images/hud/auto.png")
	            elseif (fireMode == 1) then-- semi-auto
	                dxDrawImage(ax,ay,iconH,iconH,"images/hud/semiauto.png")
	            end
	            ay = ay + iconW + hkSpace
				table.insert(tooltips, "firemode")
	        end
			
			--SHOTGUN MODE / MAXIME
			--[[if (getPedWeapon(localPlayer) == 25) and (getPedTotalAmmo(localPlayer) > 0) then
				local shotgunMode = getElementData(localPlayer, "shotgunmode")
				if shotgunMode == 0 then -- bean bag
					dxDrawImage(ax,ay,iconW,iconW,"images/hud/shotbean2.png")
				elseif shotgunMode == 1 then -- lethal
					dxDrawImage(ax,ay,iconW,iconW,"images/hud/shotlethal2.png")
				end
				ay = ay + iconW + hkSpace
				table.insert(tooltips, {"shotgunmode", shotgunMode } )
			end]]
			
		
			
			--HEATH / MAXIME
			-- local health = getElementHealth( localPlayer )
			-- dxDrawImage(ax,ay,iconH,iconH,"images/hud/health.png", 0, 0, 0, disabled_item(255/100*health))
			-- ay = ay + iconW + hkSpace
			-- table.insert(tooltips, "health")
			-- ay = ay + iconW + hkSpace
			
			if #tooltips > 0 then
				setElementData(localPlayer, "hud:showingSomeIconsOnTopLeft", 40)
			else
				setElementData(localPlayer, "hud:showingSomeIconsOnTopLeft", 0)
			end
			
			--THIS IS TO LET THE FORUMS PM CHECKER KNOW WHERE TO DISPLAY
			setElementData(localPlayer, "hud:whereToDisplay", ax)
			

			local theVehicle = getPedOccupiedVehicle(localPlayer)
			if theVehicle then
				local vehType = getVehicleType(theVehicle)
				-- TOGGLE MODE / BOTTOM / MAXIME
				-- if exports['vehicle-system']:hasVehicleEngine(theVehicle) then
				-- 	if getVehicleEngineState(theVehicle) then
				-- 		dxDrawImage(bx,by,iconH,iconH,"images/hud/engine.png")
				-- 		table.insert(tooltips_bottom, "settings:hud:engine:on")
				-- 		bx = bx - iconW - hkSpace
				-- 	else
				-- 		dxDrawImage(bx,by,iconH,iconH,"images/hud/engine.png", 0, 0, 0, disabled_item(100))
				-- 		table.insert(tooltips_bottom, "settings:hud:engine:off")
				-- 		bx = bx - iconW - hkSpace
				-- 	end
				-- end

				if getElementData(theVehicle, "handbrake") == 0 then
					if vehType == "Boat" then
						dxDrawImage(bx,by,64,64,"images/hud/boathandbrake.png", 0, 0, 0, disabled_item(100))
					else
						dxDrawImage(bx,by-nex,64,64,"images/hud/handbrake.png", 0, 0, 0, disabled_item(100))
					end
					table.insert(tooltips_bottom, "settings:hud:handbrake:off")
					bx = bx - iconW - hkSpace
				else
					if vehType == "Boat" then
						dxDrawImage(bx,by,64,64,"images/hud/boathandbrake.png", 0, 0, 0)
					else
						dxDrawImage(bx,by-nex,64,64,"images/hud/handbrake.png", 0, 0, 0)
					end
					table.insert(tooltips_bottom, "settings:hud:handbrake:on")
					bx = bx - iconW - hkSpace
				end

				-- if exports['vehicle-system']:hasVehicleLights(theVehicle) then
					if getElementData(theVehicle, "lights") == 0 then
						dxDrawImage(bx,by-nex,64,64,"images/hud/headlights.png", 0, 0, 0, disabled_item(100))
						table.insert(tooltips_bottom, "settings:hud:headlights:off")
						bx = bx - iconW - hkSpace
					else
						dxDrawImage(bx,by-nex,64,64,"images/hud/headlights.png")
						table.insert(tooltips_bottom, "settings:hud:headlights:on")
						bx = bx - iconW - hkSpace
					end
				-- end

			-- 	--BELT / MAXIME
				if (getVehicleType(theVehicle) ~= "BMX" and getVehicleType(theVehicle) ~= "Bike") then
					if getElementData(localPlayer, "seatbelt") and getPedOccupiedVehicle(localPlayer) then
						dxDrawImage(bx,by-nex,64,64,"images/hud/seatbelt.png")
						table.insert(tooltips_bottom, "belt:on")
					else
						dxDrawImage(bx,by-nex,64,64,"images/hud/seatbelt.png", 0, 0, 0, disabled_item(100))
						table.insert(tooltips_bottom, "belt:off")
					end
					bx = bx - iconW - hkSpace

					--WINDOWS
					if (getElementData(theVehicle, "vehicle:windowstat") == 1) then
						dxDrawImage(bx,by-nex,64,64,"images/hud/window.png")
						table.insert(tooltips_bottom, "windowstat:down")
					else
						dxDrawImage(bx,by-nex,64,64,"images/hud/window.png", 0, 0, 0, disabled_item(100))
						table.insert(tooltips_bottom, "windowstat:up")
					end
					bx = bx - iconW - hkSpace

					--Lock 
					if isVehicleLocked(theVehicle) then
						dxDrawImage(bx,by-nex,64,64,"images/hud/carlock.png")
						table.insert(tooltips_bottom, "hud:carlock:on")
					else
						dxDrawImage(bx,by-nex,64,64,"images/hud/carlock.png", 0, 0, 0, disabled_item(100))
						table.insert(tooltips_bottom, "hud:carlock:off")
					end
					bx = bx - iconW - hkSpace
					isBike = false
				else
					isBike = true
				end

				
------------- 	--CC / MAXIME --- TO FIXXXX
				if true then
					dxDrawImage(bx,by-nex,64,64,"images/hud/cc.png")
					table.insert(tooltips_bottom, "cc:on")
				else
					dxDrawImage(bx,by-nex,64,64,"images/hud/cc.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips_bottom, "cc:off")
				end
				bx = bx - iconW - hkSpace
				
				-- if getElementData( localPlayer,"speedo" ) == "1" then
					-- dxDrawImage(bx,by,64,64,"images/hud/speedo.png")
					-- table.insert(tooltips_bottom, "settings:hud:speedo:kmh")
					-- bx = bx - iconW - hkSpace
				-- else 
					-- dxDrawImage(bx,by,64,64,"images/hud/speedo.png", 0, 0, 0, disabled_item(100))
					-- table.insert(tooltips_bottom, "settings:hud:speedo:off")
					-- bx = bx - iconW - hkSpace
				-- end

				-- TOGGLE AUTOPARK / BOTTOM/ MAXIME 
				if getElementData( localPlayer,"autopark" ) == "1" then
					dxDrawImage(bx,by-nex,64,64,"images/hud/autopark.png")
					table.insert(tooltips_bottom, "settings:hud:autopark:on")
					bx = bx - iconW - hkSpace
				else
					dxDrawImage(bx,by-nex,64,64,"images/hud/autopark.png", 0, 0, 0, disabled_item(100))
					table.insert(tooltips_bottom, "settings:hud:autopark:off")
					bx = bx - iconW - hkSpace
				end

			-- 	-- MDC for LEO/ BOTTOM/ MAXIME 
				
			end
		end

		--SHOWING TOOLTIP + ACTIONS ON CLIENT CLICK / MAXIME
		if isCursorShowing() then
			ax, ay = screenWidth - 20, (getElementData(localPlayer, "annHeight") or 0) + 20 - iconW
			bx, by = screenWidth - 20, screenHeight - iconH - 20
			cursorX, cursorY = cursorX * screenWidth, cursorY * screenHeight
			ax = ax - iconW
			for i = 1, #tooltips do
				
				ay = ay + iconW + hkSpace
				if isInBox( cursorX, cursorY, ax, ax + iconW, ay, ay + iconH ) then
					--ADMIN DUTY / MAXIME
					if tooltips[i] == "adminonduty" then
						tooltip( cursorX, cursorY, "Admin Duty is ON", "Click to go OFF duty")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_admin", 0)
							--triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end

					elseif tooltips[i] == "adminoffduty" then
						tooltip( cursorX, cursorY, "Admin Duty is OFF", "Click to go ON duty")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_admin", 1)
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_dev", 0)
							--triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "devonduty" then
						tooltip( cursorX, cursorY, "Dev Duty is ON", "Click to go OFF duty")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_dev", 0)
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_admin", 0)
							--triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "devoffduty" then
						tooltip( cursorX, cursorY, "Dev Duty is OFF", "Click to go ON duty")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_dev", 1)
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_admin", 1)
							--triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "boosteronduty" then
						tooltip( cursorX, cursorY, "Booster Badge is ON", "Click to go OFF duty")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_booster", 0)
							triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "boosteroffduty" then
						tooltip( cursorX, cursorY, "Booster Badge is OFF", "Click to go ON duty")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_booster", 1)
							triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "donatoronduty" then
						tooltip( cursorX, cursorY, "Donator Badge is ON", "Click to go OFF duty")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_donator", 0)
							triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "donatoroffduty" then
						tooltip( cursorX, cursorY, "Donator Badge is OFF", "Click to go ON duty")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_donator", 1)
							triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					--GM DUTY / MAXIME
					elseif tooltips[i] == "gmonduty" then
						tooltip( cursorX, cursorY, "GM Duty is ON", "Click to go OFF duty")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_supporter", 0)
							--triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "gmoffduty" then
						tooltip( cursorX, cursorY, "GM Duty is OFF", "Click to go ON duty")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_supporter", 1)
							--triggerServerEvent("updateNametagColor", localPlayer)
							playToggleSound()
						end
					--GOLDEN NAMETAGE / MAXIME
					elseif tooltips[i] == "nametag_on" then
						tooltip( cursorX, cursorY, "Golden Nametag is ON", "Expiration date: "..(getElementData(localPlayer, "donation:nametag:expiredate") or "Updating.."))
						if justClicked then
							triggerServerEvent("global:toggleGoldenNametag", localPlayer, localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "nametag_off" then
						tooltip( cursorX, cursorY, "Golden Nametag is OFF", "Expiration date: "..(getElementData(localPlayer, "donation:nametag:expiredate") or "Updating.."))
						if justClicked then
							triggerServerEvent("global:toggleGoldenNametag", localPlayer, localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "youtuberonduty" then
						tooltip( cursorX, cursorY, "Yt Duty is ON", "Click to go OFF duty")
						if justClicked then
triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_youtuber", 0)
triggerServerEvent("updateNametagColor", localPlayer)
							--triggerServerEvent("global:toggleGoldenNametag", localPlayer, localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "youtuberoffduty" then
						tooltip( cursorX, cursorY, "Yt Duty is OFF", "Click to go ON duty")
						if justClicked then
triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "duty_youtuber", 1)
triggerServerEvent("updateNametagColor", localPlayer)
							--triggerServerEvent("global:toggleGoldenNametag", localPlayer, localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "lifeTimeNameTag_on" then
						tooltip( cursorX, cursorY, "Golden Nametag is ON", "Expiration date: Never")
						if justClicked then
							triggerServerEvent("global:toggleGoldenNametag", localPlayer, localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "lifeTimeNameTag_off" then
						tooltip( cursorX, cursorY, "Golden Nametag is OFF", "Expiration date: Never")
						if justClicked then
							triggerServerEvent("global:toggleGoldenNametag", localPlayer, localPlayer)
							playToggleSound()
						end
					--REPORT PANEL / MAXIME
					elseif tooltips[i] == "report_panel_mod:0" then
						tooltip( cursorX, cursorY, "Report Panel Disabled.", "Click to turn on.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "report_panel_mod", "1")
							playToggleSound()
						end
					elseif tooltips[i] == "report_panel_mod:1" then
						tooltip( cursorX, cursorY, "Report Panel Enabled.", "Click to turn off.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "report_panel_mod", "0")
							playToggleSound()
						end
					--HP / MAXIME
					elseif tooltips[i] == "health" then
						tooltip( cursorX, cursorY, "This icon indicates how healthy you are.")
						if justClicked then
							--setElementData( localPlayer,"report_panel_mod", true )
							--playToggleSound()
						end
					elseif tooltips[i] == "k9" then
						tooltip( cursorX, cursorY, "You are a dog.")
					--STYLE / MAXIME
					elseif tooltips[i] == "settings:hud:tagmode:newstyle:on" then
						tooltip( cursorX, cursorY, "HUD is Enabled", "Click to hide.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "hide_hud", "0")
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:tagmode:newstyle:off" then
						tooltip( cursorX, cursorY, "HUD is Disabled", "Click to show.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "hide_hud", "1")
							playToggleSound()
						end
					--WALKING STYLE / MAXIME
					elseif tooltips[i] == "settings:hud:walkingstyle" then
						tooltip( cursorX, cursorY, "Walking style: "..tostring(getElementData(localPlayer,"walkingstyle")), "Click to change style.")
						if justClicked then
							triggerServerEvent("realism:switchWalkingStyle", localPlayer)
							playToggleSound()
						end
					--AUTOPARK / MAXIME
					elseif tooltips[i] == "settings:hud:autopark:on" then
						tooltip( cursorX, cursorY, "Auto-save vehicle's spawnpoint is Enabled", "Click to toggle OFF.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "autopark", "0")
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:autopark:off" then
						tooltip( cursorX, cursorY, "Auto-save vehicle's spawnpoint is Disabled", "Click to toggle ON.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "autopark", "1")
							playToggleSound()
						end
				
					-- ARMOR / MAXIME
					elseif tooltips[i] == "armour" then
						tooltip( cursorX, cursorY, "You are wearing body armor.")
					-- DEAGLEMODE / MAXIME
					elseif tooltips[i][1] == "deaglemode" then
						local mode = tooltips[i][2]
						if mode == 0 then
							tooltip( cursorX, cursorY, "Taze mode", "Click to switch to Lethal mode")
						elseif mode == 1 then
							tooltip( cursorX, cursorY, "Lethal mode", "Click to switch to Radar mode")
						elseif mode == 2 or mode == 1 then
							tooltip( cursorX, cursorY, "Radar mode", "Click to switch to Tazer mode")
						end
						if justClicked then
							exports["pd-system"]:switchMode()
							playToggleSound()
						end
					-- SHOTGUN / MAXIME
					elseif tooltips[i][1] == "shotgunmode" then
						local mode = tooltips[i][2]
						--local team = getPlayerTeam(localPlayer)
						if mode == 0 then
							tooltip( cursorX, cursorY, "Beanbag mode", "Click to switch to Lethal mode")
						elseif mode == 1 then
							tooltip( cursorX, cursorY, "Lethal mode", "Click to switch to Beanbag mode")
						end
						if justClicked then
							exports["pd-system"]:switchMode()
							playToggleSound()
						end
					-- HEAD TURNING / MAXIME
					elseif tooltips[i] == "settings:hud:head_turning:0" then
						tooltip( cursorX, cursorY, "Head turning is Disable", "Click to toggle ON.")
						if justClicked then
							triggerEvent("accounts:settings:updateCharacterSettings", localPlayer, "head_turning", "1")
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:head_turning:1" then
						tooltip( cursorX, cursorY, "Looking at nearby elements.", "Click to switch mode.")
						if justClicked then
							triggerEvent("accounts:settings:updateCharacterSettings", localPlayer, "head_turning", "2")
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:head_turning:2" then
						tooltip( cursorX, cursorY, "Looking at where the camera points at.", "Click to switch mode.")
						if justClicked then
							triggerEvent("accounts:settings:updateCharacterSettings", localPlayer, "head_turning", "0")
							playToggleSound()
						end
					--TOGAD / MAXIME
					elseif tooltips[i] == "settings:hud:togad:on" then
						tooltip( cursorX, cursorY, "Advert is Enabled", "Click to toggle OFF.")
						if justClicked then
							triggerServerEvent("chat:togad", localPlayer,localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:togad:off" then
						tooltip( cursorX, cursorY, "Advert is Disabled", "Click to toggle ON.")
						if justClicked then
							triggerServerEvent("chat:togad", localPlayer,localPlayer)
							playToggleSound()
						end
					--TOGPM / MAXIME
					elseif tooltips[i] == "settings:hud:togpm:on" then
						tooltip( cursorX, cursorY, "Private Message is Enabled", "Click to ignore incoming messages.")
						if justClicked then
							triggerServerEvent("chat:togpm", localPlayer,localPlayer)
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:togpm:off" then
						tooltip( cursorX, cursorY, "Private Message is Disabled", "Click to receive incoming messages.")
						if justClicked then
							triggerServerEvent("chat:togpm", localPlayer,localPlayer)
							playToggleSound()
						end
					--TOGDON / MAXIME
					elseif tooltips[i] == "settings:hud:togdon:on" then
						tooltip( cursorX, cursorY, "Donator chat is Enabled", "Click to ignore incoming messages.")
						if justClicked then
							exports.donators:updatePerkValue(localPlayer, 10, 0)
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:togdon:off" then
						tooltip( cursorX, cursorY, "Donator chat is Disabled", "Click to receive incoming messages.")
						if justClicked then
							exports.donators:updatePerkValue(localPlayer, 10, 1)
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:opm" then
						tooltip( cursorX, cursorY, "Send offline private message.", "Click to send. Or you can also type /opm [Username] [Message]")
						if justClicked then
							executeCommandHandler("opm")
							playToggleSound()
						end
					elseif tooltips[i] == "settings:hud:ads" then
						tooltip( cursorX, cursorY, "Create an advertisement.", "Click to create. Or you can also type /ads")
						if justClicked then
							triggerServerEvent("advertisements:open_ads", localPlayer)
							playToggleSound()
						end
					elseif justClicked then
						outputDebugString('You clicked ' .. tooltips[i])
					end
				end
			end

			for i = 1, #tooltips_bottom do
				bx = bx - iconW - hkSpace
				if isInBox( cursorX, cursorY, bx, bx + iconW, by, by + iconH ) then
					--AUTOPARK / BOTTOM / MAXIME
					
					if tooltips_bottom[i] == "settings:hud:engine:on" then
						tooltip( cursorX, cursorY, "Engine - ON", "'J' or /engine")
						if justClicked then
							triggerServerEvent("toggleEngine", localPlayer, localPlayer)
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:engine:off" then
						tooltip( cursorX, cursorY, "Engine - OFF", "'J' or /engine")
						if justClicked then
							triggerServerEvent("toggleEngine", localPlayer, localPlayer)
							playToggleSound()
						end

					elseif tooltips_bottom[i] == "settings:hud:handbrake:on" then
						if isBike then
							tooltip( cursorX, cursorY, "Kickstand - ON", "'G' or /kickstand")
						else
							tooltip( cursorX, cursorY, "Handbrake - ON", "'G' or /handbrake")
						end
						if justClicked then
							exports['realism-system']:doHandbrake()
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:handbrake:off" then
						if isBike then
							tooltip( cursorX, cursorY, "Kickstand - OFF", "'G' or /kickstand")
						else
							tooltip( cursorX, cursorY, "Handbrake - OFF", "'G' or /handbrake")
						end
						if justClicked then
							exports['realism-system']:doHandbrake()
							playToggleSound()
						end

					elseif tooltips_bottom[i] == "settings:hud:headlights:off" then
						tooltip( cursorX, cursorY, "Headlights - OFF", "'L' or /lights")
						if justClicked then
							triggerServerEvent('togLightsVehicle', localPlayer)
							playToggleSound()
						end

					elseif tooltips_bottom[i] == "settings:hud:headlights:on" then
						tooltip( cursorX, cursorY, "Headlights - ON", "'L' or /lights")
						if justClicked then
							triggerServerEvent('togLightsVehicle', localPlayer)
							playToggleSound()
						end

					elseif tooltips_bottom[i] == "hud:carlock:on" then
						tooltip( cursorX, cursorY, "Doors are LOCKED", "'K' or /lock")
						if justClicked then
							triggerServerEvent('togLockVehicle', localPlayer, localPlayer)
							playToggleSound()
						end

					elseif tooltips_bottom[i] == "hud:carlock:off" then
						tooltip( cursorX, cursorY, "Doors are UNLOCKED", "'K' or /lock")
						if justClicked then
							triggerServerEvent('togLockVehicle', localPlayer, localPlayer)
							playToggleSound()
						end

					elseif tooltips_bottom[i] == "settings:hud:speedo:off" then
						tooltip( cursorX, cursorY, "Speedo mode - OFF", " ")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "speedo", "1")
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:speedo:kmh" then
						tooltip( cursorX, cursorY, "Speedo mode - KM/H", " ")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "speedo", "0")
							playToggleSound()
						end
					-- seatbelt
					elseif tooltips_bottom[i] == 'belt:on' then
						tooltip( cursorX, cursorY, 'You are wearing a seatbelt.', "'Z' or /belt")
						if justClicked then
							triggerServerEvent('realism:seatbelt:toggle', localPlayer, localPlayer)
							playToggleSound()
						end
					elseif tooltips_bottom[i] == 'belt:off' then
						tooltip( cursorX, cursorY, 'You are not wearing a seatbelt.', "'Z' or /belt")
						if justClicked then
							triggerServerEvent('realism:seatbelt:toggle', localPlayer, localPlayer)
							playToggleSound()
						end
					--Window state
					elseif tooltips_bottom[i] == 'windowstat:up' then
						tooltip( cursorX, cursorY, 'Your windows are up.', "'X' or /togwindow")
						if justClicked then
							triggerServerEvent('vehicle:togWindow', localPlayer)
							playToggleSound()
						end
					elseif tooltips_bottom[i] == 'windowstat:down' then
						tooltip( cursorX, cursorY, 'Your windows are down.', "'X' or /togwindow")
						if justClicked then
							triggerServerEvent('vehicle:togWindow', localPlayer)
							playToggleSound()
						end
					--CC state
					elseif tooltips_bottom[i] == 'cc:on' then
						tooltip( cursorX, cursorY, 'Cruise Control is Enabled.', "'C' or /cc")
						if justClicked then
							triggerEvent('realism:togCc', localPlayer)
							playToggleSound()
						end
					elseif tooltips_bottom[i] == 'cc:off' then
						tooltip( cursorX, cursorY, 'Cruise Control is Disabled.', "'C' or /cc")
						if justClicked then
							triggerEvent('realism:togCc', localPlayer)
							playToggleSound()
						end
					-- auto park
					elseif tooltips_bottom[i] == "settings:hud:autopark:on" then
						tooltip( cursorX, cursorY, "Auto-save vehicle's spawnpoint is Enabled", "Click to toggle OFF.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "autopark", "0")
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:autopark:off" then
						tooltip( cursorX, cursorY, "Auto-save vehicle's spawnpoint is Disabled", "Click to toggle ON.")
						if justClicked then
							triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "autopark", "1")
							playToggleSound()
						end
					elseif tooltips_bottom[i] == "settings:hud:mdc" then
						tooltip( cursorX, cursorY, "Mobile Digital Computer", "Click to open.")
						if justClicked then
							executeCommandHandler("mdc")
							playToggleSound()
						end
					end
				end
			end
		end
	end
	justClicked = false
end
addEventHandler("onClientRender", getRootElement(), drawHUD)

function playToggleSound()
	playSFX("genrl", 52, 10, false)
end

--[[
addCommandHandler( "togglehud",
	function( )
		active = not active
		if active then
			outputChatBox( "HUD is now on.", 0, 255, 0 )
			triggerEvent( "item:updateclient", localPlayer )
		else
			outputChatBox( "HUD is now off.", 255, 0, 0 )
			setPlayerHudComponentVisible( 'radar', false )
		end
	end
)
]]

function isActive()
	return getElementData(localPlayer, "hide_hud") ~= "0"
end

--TO DETECT CLICK ON DX BOX / MAXIME
addEventHandler( "onClientClick", root,
	function( button, state )
		if button == "left" and state == "up" then
			justClicked = true
		end
	end
)

function disabled_item(value)
	return tocolor(value,value,value)
end

local function explode(div,str)
  if (div=='') then return false end
  local pos,arr = 0,{}
  for st,sp in function() return string.find(str,div,pos,true) end do
	table.insert(arr,string.sub(str,pos,st-1))
	pos = sp + 1
  end
  table.insert(arr,string.sub(str,pos))
  return arr
end

function bindSomeHotKey()
	bindKey("p", "down", function()
		if getElementData(localPlayer, "vehicle_hotkey") == "0" then 
			return false
		end
		triggerServerEvent('realism:seatbelt:toggle', localPlayer, localPlayer)
	end) 

	bindKey("x", "down", function() 
		if getElementData(localPlayer, "vehicle_hotkey") == "0" then 
			return false
		end
		triggerServerEvent('vehicle:togWindow', localPlayer)
	end)
end
addEventHandler("onClientResourceStart", resourceRoot, bindSomeHotKey)

--[[
--lalt+Mouse2 to toggle cursor / MAXIME
local holdingShift = nil
function togMouse(button, press)
	if button == "lalt" then
		if press then
			holdingShift = true
		else
			holdingShift = nil
		end
	end
end
addEventHandler("onClientKey", root, togMouse)
function togMouse2 ( button, press)
    if button == "mouse2" and press and holdingShift then
        showCursor ( not isCursorShowing() )        
        cancelEvent()          
    end
end
addEventHandler("onClientKey", root, togMouse2)
]]
addCommandHandler("reportpanel",function()
	if tonumber(getElementData(localPlayer,"report_panel_mod")) == 0 then 
		triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "report_panel_mod", "1")
	else 
		triggerEvent("accounts:settings:updateAccountSettings", localPlayer, "report_panel_mod", "0")

	end

end)