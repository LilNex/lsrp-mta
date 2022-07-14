armoredCars = { [427]=true, [528]=true, [432]=true, [601]=true, [428]=true } -- Enforcer, FBI Truck, Rhino, SWAT Tank, Securicar



local btrdiscountratio = 1.2

-- Full Service

function gpsVehicle(veh)

	if veh and stat then

		if stat == 1 then

			--local leader = tonumber(getElementData(source, "factionleader"))

			--if leader == 1 then

				local mechcost = 650

					if (getElementData(source,"faction")==4) then

						mechcost = mechcost

					end

					if (getElementData(source,"faction")==81) then 

			       	 mechcost = mechcost

		        	end



					local theTeam = getPlayerTeam(source)

	            	if not (exports.global:giveMoney(theTeam, mechcost) and exports.global:takeMoney(getVehicleOccupant(veh), mechcost))  then

						outputChatBox("Tu ne peux pas payer le nouveau GPS.", getVehicleOccupant(veh), 255, 0, 0)

			    	    outputChatBox("Le client ne peut pas se payer le nouveau GPS.", source, 255, 0, 0)

					end	

				else

					local vehID = getElementData(veh, "dbid")

					exports.global:sendLocalMeAction(source, "installe un GPS sur le véhicule.")

						setElementData(veh, "gps", 1)

						outputChatBox("Vous venez d'ajouter un GPS au véhicule.", source)

						exports.global:sendLocalMeAction(source, "installe un GPS sur le véhicule.")

						exports.logs:dbLog(source, 6, {  veh }, "AJOUTER GPS")

						exports.logs:logMessage("[ADD TINT-LST&R] " .. getPlayerName(source):gsub("_"," ") .. " a ajouté un GPS au véhicule #" .. vehID .. " - " .. exports.global:getVehicleName(veh) .. ".", 9)



			--else

				--outputChatBox("Faction Leaders Only!", source, 255, 0, 0)

			--end

			end

		elseif stat == 2 then

			local mechcost = 650

			if (getElementData(source,"faction")==4) then

				mechcost = mechcost

			end

			if (getElementData(source,"faction")==75) then

			mechcost = 450

	     	end

			if (getElementData(source,"faction")==73) then

            mechcost =  1000

            end	

			local theTeam = getPlayerTeam(source)

	        if not (exports.global:giveMoney(theTeam, mechcost) and exports.global:takeMoney(getVehicleOccupant(veh), mechcost)) then

				outputChatBox("Tu ne peux pas payer les frais pour retirer la teinte des vitres.", getVehicleOccupant(veh), 255, 0, 0)

			    outputChatBox("Le client ne peut pas se payer les frais pour retirer la teinte des vitres.", source, 255, 0, 0)

			else

				local vehID = getElementData(veh, "dbid")

				exports.global:sendLocalMeAction(source, "enlève un GPS du véhicule.")

				    setElementData(veh, "gps", 0)

					outputChatBox("Vous avez enlevé le GPS du véhicule..", source)

					exports.global:sendLocalMeAction(source, "a enlevé le GPS du véhicule.")

					exports.logs:dbLog(source, 6, {  veh }, "ENLEVER GPS")

					exports.logs:logMessage("[REMOVED TINT-BTR] " .. getPlayerName(source):gsub("_"," ") .. " a enlevé le GPS du véhicule #" .. vehID .. " - " .. exports.global:getVehicleName(veh) .. ".", 9)

end

			end

			end

addEvent("gpsVehicle", true)

addEventHandler("gpsVehicle", getRootElement(), gpsVehicle)



-- Full Service

function serviceVehicle(veh)

	if (veh) then

		local mechcost = 325

		if (getElementData(source,"faction")==4) then

			mechcost = mechcost

		end

		if (getElementData(source,"faction")==75) then

			mechcost = 175

		end

		if (getElementData(source,"faction")==73) then

            mechcost =  200

        end					

		local theTeam = getPlayerTeam(source)

	    if not (exports.global:takeItem(source, 405)) then

			outputChatBox("Tu n'as pas les outils nécessaire pour entretenir ce véhicule.", source, 255, 0, 0)

			-- outputChatBox("Le client ne peut pas se payer les pièces pour entretenir ce véhicule.", source, 255, 0, 0)

		else

			local health = getElementHealth(veh)

			if (health <= 850) then

				health = health + 150

			else

				health = 1000

			end

			

			fixVehicle(veh)

			setElementHealth(veh, health)

			if not getElementData(veh, "Impounded") or getElementData(veh, "Impounded") == 0 then

				exports.anticheat:changeProtectedElementDataEx(veh, "enginebroke", 0, false)

				if armoredCars[ getElementModel( veh ) ] then

					setVehicleDamageProof(veh, true)

				else

					setVehicleDamageProof(veh, false)

				end

			end

			exports.global:sendLocalMeAction(source, "sort sa boite à outils, puis répare le véhicule avec grande concentration.")

			exports.logs:dbLog(source, 31, {  veh }, "REPAIR QUICK-SERVICE")

		end

	else

		outputChatBox("Le client doit être à l'intérieur du véhicule pour pouvoir le réparer.", source, 255, 0, 0)

	end

end

addEvent("serviceVehicle", true)

addEventHandler("serviceVehicle", getRootElement(), serviceVehicle)



function changeTyre( veh, wheelNumber )

	if (veh) then

		local mechcost = 150

		if (getElementData(source,"faction")==4) then

			mechcost = mechcost 

		end

		if (getElementData(source,"faction")==75) then

			mechcost = 200	

		end

		if (getElementData(source,"faction")==73) then

            mechcost =  250

        end	

		local theTeam = getPlayerTeam(source)

	    if not exports.global:takeMoney(source, mechcost) then

			outputChatBox("Tu ne peux pas payer les pneus pour entretenir ce véhicule.", source, 255, 0, 0)

			-- outputChatBox("Le client ne peut pas se payer les pneus pour entretenir ce véhicule.", source, 255, 0, 0)

		else

			local wheel1, wheel2, wheel3, wheel4 = getVehicleWheelStates( veh )



			if (wheelNumber==1) then -- front left

				outputDebugString("Pneu du devant gauche changé.")

				setVehicleWheelStates ( veh, 0, wheel2, wheel3, wheel4 )

			elseif (wheelNumber==2) then -- back left

				outputDebugString("Pneu de l'arrière gauche changé.")

				setVehicleWheelStates ( veh, wheel1, wheel2, 0, wheel4 )

			elseif (wheelNumber==3) then -- front right

				outputDebugString("Pneu du devant droite changé.")

				setVehicleWheelStates ( veh, wheel1, 0, wheel2, wheel4 )

			elseif (wheelNumber==4) then -- back right

				outputDebugString("Pneu de l'arrière droite changé.")

				setVehicleWheelStates ( veh, wheel1, wheel2, wheel3, 0 )

			end

			

			exports.logs:dbLog(source, 31, {  veh }, "REPAIR TIRESWAP")

			exports.global:sendLocalMeAction(source, "remplace les pneus du véhicule.")

		end

	end

end

addEvent("tyreChange", true)

addEventHandler("tyreChange", getRootElement(), changeTyre)



function changePaintjob( veh, paintjob )

	if (veh) then

		local mechcost = 2350

		if (getElementData(source,"faction")==4) then

			mechcost = mechcost 

		end

		if (getElementData(source,"faction")==75) then

			mechcost = 1100

		end

		if (getElementData(source,"faction")==73) then

            mechcost =  5000

        end	

		local theTeam = getPlayerTeam(source)

	    if not (exports.global:giveMoney(theTeam, mechcost) and exports.global:takeMoney(getVehicleOccupant(veh), mechcost)) then

			outputChatBox("Tu ne peux pas payer un paintjob pour ce véhicule.", getVehicleOccupant(veh), 255, 0, 0)

			outputChatBox("Le client ne peut pas se payer un paintjob pour ce véhicule.", source, 255, 0, 0)

		else

			triggerEvent( "paintjobEndPreview", source, veh )

			if setVehiclePaintjob( veh, paintjob ) then

				local col1, col2 = getVehicleColor( veh )

				if col1 == 0 or col2 == 0 then

					setVehicleColor( veh, 1, 1, 1, 1 )

				end

				exports.logs:logMessage("[/changePaintJob] " .. getPlayerName(source) .." / ".. getPlayerIP(source)  .." OR " .. getPlayerName(client)  .." / ".. getPlayerIP(client)  .." changed vehicle " .. getElementData(veh, "dbid") .. " their colors to " .. col1 .. "-" .. col2, 29)

				exports.global:sendLocalMeAction(source, "repeint le véhicule.")

				exports.logs:dbLog(source, 6, {  veh }, "MODDING PAINTJOB ".. paintjob)

				exports['savevehicle-system']:saveVehicleMods(veh)

			else

				outputChatBox("Cette voiture a déjà cette peinture.", source, 255, 0, 0)

			end

		end

	end

end

addEvent("paintjobChange", true)

addEventHandler("paintjobChange", getRootElement(), changePaintjob)



function editVehicleHeadlights( veh, color1, color2, color3 )

	if (veh) then

		local mechcost = 1450

		if (getElementData(source,"faction")==4) then

			mechcost = mechcost 

		end

		if (getElementData(source,"faction")==75) then

			mechcost = 300

		end

		if (getElementData(source,"faction")==73) then

            mechcost =  1000

        end	

		local theTeam = getPlayerTeam(source)

	    if not exports.global:takeMoney(source, mechcost) then

			outputChatBox("Tu ne peux pas payer les nouveaux phares.", source, 255, 0, 0)

			-- outputChatBox("Le client ne peut pas se payer les nouveaux phares.", source, 255, 0, 0)

		else

			triggerEvent( "headlightEndPreview", source, veh )

			if setVehicleHeadLightColor ( veh, color1, color2, color3) then

				exports.logs:logMessage("[/changeHeadlights] " .. getPlayerName(source) .." / ".. getPlayerIP(source)  .." OR " .. getPlayerName(client)  .." / ".. getPlayerIP(client)  .." changed vehicle " .. getElementData(veh, "dbid") .. " their headlight colors to " .. color1 .. "-" .. color2 .. "-"..color3, 29)

				exports.global:sendLocalMeAction(source, "change les phares du véhicule.")

				exports.anticheat:changeProtectedElementDataEx(veh, "headlightcolors", {color1, color2, color3}, true)

				exports['savevehicle-system']:saveVehicleMods(veh)

				exports.logs:dbLog(source, 6, {  veh }, "MODDING HEADLIGHT ".. color1 .. " "..color2.." "..color3)

			else

				outputChatBox("Cette voiture a déjà ces phares.", source, 255, 0, 0)

			end

		end

	end

end

addEvent("editVehicleHeadlights", true)

addEventHandler("editVehicleHeadlights", getRootElement(), editVehicleHeadlights)



 -- 



function changeVehicleUpgrade( veh, upgrade )

	if (veh) then

		local item = false

		local u = upgrades[upgrade - 999]

		if not u then

			outputDebugString( getPlayerName( source ) .. " a essayé d'ajouter une amélioration #" .. upgrade )

			return

		end

		name = u[1]

		local mechcost = u[2]

		if (getElementData(source,"faction")==4) then

			mechcost = mechcost

		end

		if exports.global:hasItem( source, 114, upgrade ) then

			mechcost = 0

			item = true

		end

		

		if not item and not exports.global:hasMoney( source, mechcost ) then

		    outputChatBox("Vous n'avez pas les moyens d'ajouter " .. name .. " à ce véhicule.", getVehicleOccupant(veh), 255, 0, 0)

			outputChatBox("Le client ne peut pas se payer " .. name .. " pour améliorer ce véhicule.", source, 255, 0, 0)

		else

			for i = 0, 16 do

				if upgrade == getVehicleUpgradeOnSlot( veh, i ) then

					outputChatBox("Cette voiture a déjà cette amélioration.", source, 255, 0, 0)

					return

				end

			end

			if addVehicleUpgrade( veh, upgrade ) then

				if item then

					exports.global:takeItem(source, 114, upgrade)

				else

					exports.global:takeMoney(acheteur, mechcost)

				end

				exports.logs:logMessage("[changeVehicleUpgrade] " .. getPlayerName(source) .."/ " .. getPlayerIP(source)  .. " OR " .. getPlayerName(client)  .."/ " .. getPlayerIP(client)  .. "  changed vehicle " .. getElementData(veh, "dbid") .. ": added " .. name .. " to the vehicle.", 29)

				exports.global:sendLocalMeAction(source, "a ajouté " .. name .. " au véhicule.")

				exports['savevehicle-system']:saveVehicleMods(veh)

				exports.logs:dbLog(source, 6, {  veh }, "MODDING ADDUPGRADE "..name)

			else

				outputChatBox("Échec de l'application de la mise à niveau de la voiture.", source, 255, 0, 0)

			end

		end

	end

end

addEvent("changeVehicleUpgrade", true)

addEventHandler("changeVehicleUpgrade", getRootElement(), changeVehicleUpgrade)



function changeVehicleColour(veh, col1, col2, col3, col4)

	if (veh) then

		local mechcost = 2000

		if (getElementData(source,"faction")==4) then

			mechcost = 1200

		end

		if (getElementData(source,"faction")==75) then

			mechcost = 1500

		end

		if (getElementData(source,"faction")==73) then

            mechcost =  2000

        end	

		local theTeam = getPlayerTeam(source)

	    if not exports.global:takeMoney(source, mechcost) then

			outputChatBox("Tu ne peux pas payer la nouvelle peinture de ton véhicule.", getVehicleOccupant(veh), 255, 0, 0)

			outputChatBox("Le client ne peut pas se payer la nouvelle peinture de son véhicule.", source, 255, 0, 0)

		else

			col = { getVehicleColor( veh, true ) }

			

			local color1 = col1 or { col[1], col[2], col[3] }

			local color2 = col2 or { col[4], col[5], col[6] }

			local color3 = col3 or { col[7], col[8], col[9] }

			local color4 = col4 or { col[10], col[11], col[12] }

			

			--outputChatBox("1. "..toJSON(color1), source)

			--outputChatBox("2. "..toJSON(color2), source)

			--outputChatBox("3. "..toJSON(color3), source)

			--outputChatBox("4. "..toJSON(color4), source)

			

			if setVehicleColor( veh, color1[1], color1[2], color1[3], color2[1], color2[2], color2[3],  color3[1], color3[2], color3[3], color4[1], color4[2], color4[3]) then

				--exports.logs:logMessage("[repaintVehicle] " .. getPlayerName(source) .." ".. getPlayerIP(source) .." OR ".. getPlayerName(client) .."/"..getPlayerIP(client)  .." changed vehicle " .. getElementData(veh, "dbid") .. " colors to ".. col1 .. "-" .. col2, 29)

				exports.global:sendLocalMeAction(source, "repeint le véhicule.")

				exports['savevehicle-system']:saveVehicleMods(veh)

				exports.logs:dbLog(source, 6, {  veh }, "MODDING REPAINT "..toJSON(col))

			end

		end

	end

end

addEvent("repaintVehicle", true)

addEventHandler("repaintVehicle", getRootElement(), changeVehicleColour)



--Installing and Removing vehicle tinted windows

function changeVehicleTint(veh, stat)

	if veh and stat then

		if stat == 1 then

			--local leader = tonumber(getElementData(source, "factionleader"))

			--if leader == 1 then

				local mechcost = 2500

				if (getElementData(source,"faction")==4) then

					mechcost = mechcost

				end

				if (getElementData(source,"faction")==75) then

			    mechcost = 2500

		        end

				if (getElementData(source,"faction")==73) then

                mechcost =  2500

                end	

				local theTeam = getPlayerTeam(source)

	            if not exports.global:takeMoney(source, mechcost)  then

					outputChatBox("Tu ne peux pas payer la nouvelle teinte des vitres.", source, 255, 0, 0)

			        -- outputChatBox("Le client ne peut pas se payer la nouvelle teinte des vitres.", source, 255, 0, 0)

				else

					local vehID = getElementData(veh, "dbid")

					exports.global:sendLocalMeAction(source, "commence à placer la teinte sur les fenêtres.")

					

					local query = mysql:query_free("UPDATE vehicles SET tintedwindows = '1' WHERE id='" .. mysql:escape_string(vehID) .. "'")

					if query then

						for i = 0, getVehicleMaxPassengers(veh) do

							local player = getVehicleOccupant(veh, i)

							if (player) then

								triggerEvent("setTintName", veh, player)

							end

						end

						triggerClientEvent("tintWindows", veh)

						exports.anticheat:changeProtectedElementDataEx(veh, "tinted", true, true)

						outputChatBox("Vous venez d'ajouter la teinte aux vitres du véhicule.", source)

						exports.global:sendLocalMeAction(source, "ajoute les teintes aux vitres du véhicule.")

						exports.logs:dbLog(source, 6, {  veh }, "MODDING ADDTINT")

						exports.logs:logMessage("[ADD TINT-LST&R] " .. getPlayerName(source):gsub("_"," ") .. " a ajouté de la teinte au véhicule #" .. vehID .. " - " .. exports.global:getVehicleName(veh) .. ".", 9)

					else

						outputChatBox("Il y a eu un problème d'ajout de la teinte. S'il vous plaît, faites un rapport sur la mante.", source, 255, 0, 0)				

					end

				end

			--else

				--outputChatBox("Faction Leaders Only!", source, 255, 0, 0)

			--end

		elseif stat == 2 then

			local mechcost = 500

			if (getElementData(source,"faction")==4) then

				mechcost = mechcost

			end

			if (getElementData(source,"faction")==75) then

			mechcost = 450

	     	end

			if (getElementData(source,"faction")==73) then

            mechcost =  1000

            end	

			local theTeam = getPlayerTeam(source)

	        if not exports.global:takeMoney(source, mechcost) then

				outputChatBox("Tu ne peux pas payer les frais pour retirer la teinte des vitres.", getVehicleOccupant(veh), 255, 0, 0)

			    outputChatBox("Le client ne peut pas se payer les frais pour retirer la teinte des vitres.", source, 255, 0, 0)

			else

				local vehID = getElementData(veh, "dbid")

				exports.global:sendLocalMeAction(source, "commence à enlever la teinte des fenêtres.")

			

				local query = mysql:query_free("UPDATE vehicles SET tintedwindows = '0' WHERE id='" .. mysql:escape_string(vehID) .. "'")

				if query then

					for i = 0, getVehicleMaxPassengers(veh) do

						local player = getVehicleOccupant(veh, i)

						if (player) then

							triggerEvent("resetTintName", veh, player)

						end

					end

					triggerClientEvent("tintWindows", veh)

					exports.anticheat:changeProtectedElementDataEx(veh, "tinted", false, true)

					outputChatBox("Vous avez enlevé la teinte des vitres du véhicule..", source)

					exports.global:sendLocalMeAction(source, "a enlevée la teinte du véhicule.")

					exports.logs:dbLog(source, 6, {  veh }, "MODDING REMOVETINT")

					exports.logs:logMessage("[REMOVED TINT-BTR] " .. getPlayerName(source):gsub("_"," ") .. " a enlevé la teinte du véhicule #" .. vehID .. " - " .. exports.global:getVehicleName(veh) .. ".", 9)

				else

					outputChatBox("Il y a eu un problème pour enlever la teinte. S'il vous plaît rapport sur la mante.", source, 255, 0, 0)

				end

			end

		end

	end

end

addEvent("tintedWindows", true)

addEventHandler("tintedWindows", getRootElement(), changeVehicleTint)