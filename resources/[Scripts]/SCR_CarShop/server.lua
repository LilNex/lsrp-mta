mysql = exports.mysql

function SmallestID( )
	local result = mysql:query_fetch_assoc("SELECT MIN(e1.id+1) AS nextID FROM vehicles AS e1 LEFT JOIN vehicles AS e2 ON e1.id +1 = e2.id WHERE e2.id IS NULL")
	if result then
		local id = tonumber(result["nextID"]) or 1
		return id
	end
	return false
end

function donatearac(thePlayer, arac_id, ucret, aracadi, vergi)

    if tonumber(getElementData(thePlayer, "money")) < tonumber(ucret) then
		outputChatBox("[!]: You don't have enough money for this vehicle", thePlayer, 57,57,57,true)
	return end

	if exports.global:canPlayerBuyVehicle(thePlayer) then
		local id = arac_id
		local r = 307
		local x, y, z = 1780.2646484375, -1692.8671875, 13.65625
		local letter1 = string.char(math.random(65,90))
		local letter2 = string.char(math.random(65,90))
		local plate = tonumber(34).. " ".. letter1 .. letter2 .. " " .. math.random(1000, 9999)
		local factionVehicle = -1
		local dbid = getElementData(thePlayer, "dbid")
		local veh = createVehicle(id, x, y, z, 0, 0, 200, plate)
		local vehicleName = getVehicleName(veh)
		destroyElement(veh)
		local dimension = getElementDimension(thePlayer)
		local interior = getElementInterior(thePlayer)
		local var1, var2 = exports['vehicle-system']:getRandomVariant(id)
		local smallestID = SmallestID()
		local insertid = mysql:query_insert_free("INSERT INTO vehicles SET id='" .. mysql:escape_string(smallestID) .. "', model='" .. mysql:escape_string(id) .. "', x='" .. mysql:escape_string(x) .. "', y='" .. mysql:escape_string(y) .. "', z='" .. mysql:escape_string(z) .. "', rotx='0', roty='0', rotz='" .. mysql:escape_string(r) .. "', color1='[ [ 0, 0, 0 ] ]', color2='[ [ 0, 0, 0 ]]', color3='[ [ 0, 0, 0 ] ] ', color4='[ [ 0, 0, 0 ] ]', faction='" .. mysql:escape_string(factionVehicle) .. "', owner='" .. mysql:escape_string(dbid) .. "', plate='" .. mysql:escape_string(plate) .. "', currx='" .. mysql:escape_string(x) .. "', curry='" .. mysql:escape_string(y) .. "', currz='" .. mysql:escape_string(z) .. "', currrx='0', currry='0', currrz='" .. mysql:escape_string(r) .. "', locked=1, interior='" .. mysql:escape_string(interior) .. "', currinterior='" .. mysql:escape_string(interior) .. "', dimension='" .. mysql:escape_string(dimension) .. "', currdimension='" .. mysql:escape_string(dimension) .. "', tintedwindows='" .. mysql:escape_string(0) .. "',variant1="..var1..",variant2="..var2..", creationDate=NOW(), createdBy="..getElementData(thePlayer, "account:id").."")
		if (insertid) then
			local owner = ""
			owner = getPlayerName( thePlayer )
			exports.global:giveItem(thePlayer, 3, tonumber(insertid))
			exports.logs:logMessage("[MAKEVEH DONATEGUI] " .. getPlayerName( thePlayer ) .. " created car #" .. insertid .. " (" .. vehicleName .. ") - " .. owner, 9)
			exports.logs:dbLog(thePlayer, 6, { "ve" .. insertid }, "SPAWNVEH DONATEGUI'"..vehicleName.."' $0 "..owner )
			exports.global:takeMoney(thePlayer,tonumber(ucret))
			exports['vehicle-system']:reloadVehicle(insertid)
			local hiddenAdmin = getElementData(thePlayer, "hiddenadmin")
			local adminTitle = exports.global:getPlayerAdminTitle(thePlayer)
			local adminUsername = getElementData(thePlayer, "account:username")
			local adminID = getElementData(thePlayer, "account:id")
			
			local addLog = mysql:query_free("INSERT INTO `vehicle_logs` (`vehID`, `action`, `actor`) VALUES ('"..tostring(insertid).."', 'DONATEGUI "..vehicleName.." ($0 - to "..owner..")', '"..adminID.."')") or false
			if not addLog then
				outputDebugString("An error occurred while creating the vehicle log")
			end
		end
	else
		outputChatBox("[!]You don't have enough car space to buy.", thePlayer, 255, 194, 14, true)
	end
end
addEvent("serverSide",true)
addEventHandler("serverSide",root,donatearac)
