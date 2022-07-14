rentCar = {}


function rentCarFuntion ( player ) 

local prix = 1000

    if exports.global:hasMoney(player, prix) then

        local vehicleID = 473



		local r = getPedRotation(player)

		local x, y, z = getElementPosition(player)



		local plate = tostring( getElementData(player, "account:id") )

		if #plate < 8 then

			plate = " " .. plate

			while #plate < 8 do

				plate = string.char(math.random(string.byte('A'), string.byte('Z'))) .. plate

				if #plate < 8 then

				end

			end

		end



		local veh = createVehicle(vehicleID, 2312.3798828125, -2422.3408203125, 13.444363594055, 0, 0, 178.66516113281, plate)

		warpPedIntoVehicle( player, veh )



		local dbid = 500

		exports.pool:allocateElement(veh, dbid)

		setElementInterior(veh, getElementInterior(player))

		exports.global:giveItem(targetPlayer, 3, 500)

		setElementDimension(veh, getElementDimension(player))

		exports["SCR_Notifs"]:show_box(source,"Rent success, Don't destroyed! ","info")



		setVehicleOverrideLights(veh, 1)

		setVehicleEngineState(veh, false)

		setVehicleFuelTankExplodable(veh, false)

		setVehicleVariant(veh, exports['vehicle-system']:getRandomVariant(getElementModel(veh)))



		exports.anticheat:changeProtectedElementDataEx(veh, "dbid", dbid)

		exports.anticheat:changeProtectedElementDataEx(veh, "fuel", exports["fuel-system"]:getMaxFuel(veh), false)

		exports.anticheat:changeProtectedElementDataEx(veh, "Impounded", 0)

		exports.anticheat:changeProtectedElementDataEx(veh, "engine", 0, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldx", x, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldy", y, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldz", z, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "faction", -1)

		exports.anticheat:changeProtectedElementDataEx(veh, "owner", -1, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "job", 0, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "handbrake", 0, true)

		exports['vehicle-interiors']:add( veh )

        exports.global:takeMoney(player, prix)

	    

       setTimer( 

       function ()

		  destroyElement(veh)

		  exports.global:takeItem(targetPlayer, 3, 500)

		  exports["SCR_Notifs"]:show_box(source,"Your rental has just ended, and you pay a $1550! ","info")

	      exports.global:takeMoney(player, 100)

       end

       ,18000000,1

       )

	else

	exports["SCR_Notifs"]:show_box(source,"You don't have money ! ","error")

end

end 

addEvent( "stnrentroller", true )

addEventHandler( "stnrentroller", getRootElement(),rentCarFuntion )



rentCar2 = {}



function rentCar2Funtion ( player ) 

local prix = 1550

    if exports.global:hasMoney(player, prix) then

        local vehicleID = 473



		local r = getPedRotation(player)

		local x, y, z = getElementPosition(player)



		local plate = tostring( getElementData(player, "account:id") )

		if #plate < 8 then

			plate = " " .. plate

			while #plate < 8 do

				plate = string.char(math.random(string.byte('A'), string.byte('Z'))) .. plate

				if #plate < 8 then

				end

			end

		end



		local veh = createVehicle(vehicleID, 2312.3798828125, -2422.3408203125, 13.444363594055, 0, 0, 178.66516113281, plate)

		warpPedIntoVehicle( player, veh )



		local dbid = 500

		exports.pool:allocateElement(veh, dbid)

		setElementInterior(veh, getElementInterior(player))

		exports.global:giveItem(targetPlayer, 3, 500)

		setElementDimension(veh, getElementDimension(player))

		exports["SCR_Notifs"]:show_box(source,"Rent success, Don't destroyed! ","info")



		setVehicleOverrideLights(veh, 1)

		setVehicleEngineState(veh, false)

		setVehicleFuelTankExplodable(veh, false)

		setVehicleVariant(veh, exports['vehicle-system']:getRandomVariant(getElementModel(veh)))



		exports.anticheat:changeProtectedElementDataEx(veh, "dbid", dbid)

		exports.anticheat:changeProtectedElementDataEx(veh, "fuel", exports["fuel-system"]:getMaxFuel(veh), false)

		exports.anticheat:changeProtectedElementDataEx(veh, "Impounded", 0)

		exports.anticheat:changeProtectedElementDataEx(veh, "engine", 0, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldx", x, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldy", y, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldz", z, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "faction", -1)

		exports.anticheat:changeProtectedElementDataEx(veh, "owner", -1, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "job", 0, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "handbrake", 0, true)

		exports['vehicle-interiors']:add( veh )

        exports.global:takeMoney(player, prix)

	    

       setTimer( 

       function ()

		  destroyElement(veh)

		  exports.global:takeItem(targetPlayer, 3, 500)

		  exports["SCR_Notifs"]:show_box(source,"Your rental has just ended, and you pay a $1550! ","info")

	      exports.global:takeMoney(player, 100)

       end

       ,3600000,1

       )

	else

	exports["SCR_Notifs"]:show_box(source,"You don't have money ! ","error")

end

end 

addEvent( "stnrentroller1", true )

addEventHandler( "stnrentroller1", getRootElement(),rentCar2Funtion )



rentCar3 = {}



function rentCar3Funtion ( player ) 

local prix = 5500

    if exports.global:hasMoney(player, prix) then

        local vehicleID = 473



		local r = getPedRotation(player)

		local x, y, z = getElementPosition(player)



		local plate = tostring( getElementData(player, "account:id") )

		if #plate < 8 then

			plate = " " .. plate

			while #plate < 8 do

				plate = string.char(math.random(string.byte('A'), string.byte('Z'))) .. plate

				if #plate < 8 then

				end

			end

		end



		local veh = createVehicle(vehicleID, 2312.3798828125, -2422.3408203125, 13.444363594055, 0, 0, 178.66516113281, plate)

		warpPedIntoVehicle( player, veh )

		local dbid = 500

		exports.pool:allocateElement(veh, dbid)

		setElementInterior(veh, getElementInterior(player))

		exports.global:giveItem(targetPlayer, 3, 500)

		exports["SCR_Notifs"]:show_box(source,"Rent success, Don't destroyed! ","info")

		setElementDimension(veh, getElementDimension(player))



		setVehicleOverrideLights(veh, 1)

		setVehicleEngineState(veh, false)

		setVehicleFuelTankExplodable(veh, false)

		setVehicleVariant(veh, exports['vehicle-system']:getRandomVariant(getElementModel(veh)))



		exports.anticheat:changeProtectedElementDataEx(veh, "dbid", dbid)

		exports.anticheat:changeProtectedElementDataEx(veh, "fuel", exports["fuel-system"]:getMaxFuel(veh), false)

		exports.anticheat:changeProtectedElementDataEx(veh, "Impounded", 0)

		exports.anticheat:changeProtectedElementDataEx(veh, "engine", 0, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldx", x, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldy", y, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldz", z, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "faction", -1)

		exports.anticheat:changeProtectedElementDataEx(veh, "owner", -1, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "job", 0, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "handbrake", 0, true)

		exports['vehicle-interiors']:add( veh )

        exports.global:takeMoney(player, prix)

	    

       setTimer( 

       function ()

		  destroyElement(veh)

		  exports.global:takeItem(targetPlayer, 3, 500)

		  exports["SCR_Notifs"]:show_box(source,"Your rental has just ended, and you pay a $1000! ","info")

	      exports.global:takeMoney(player, 100)

       end

       ,3600000,1

       )

	else

	exports["SCR_Notifs"]:show_box(source,"You don't have money ! ","error")

end

end 

addEvent( "stnrentroller2", true )

addEventHandler( "stnrentroller2", getRootElement(),rentCar3Funtion )

addCommandHandler("stnrentroller2",rentCar3Funtion )



rentCar4 = {}



function rentCar4Funtion ( player ) 

local prix = 600

     if getDistanceBetweenPoints3D ( 1645.337890625, -2326.65625, 13.546875, getElementPosition(player) ) <2 and exports.global:hasMoney(player, prix) then

        local vehicleID = 551



		local r = getPedRotation(player)

		local x, y, z = getElementPosition(player)



		local plate = tostring( getElementData(player, "account:id") )

		if #plate < 8 then

			plate = " " .. plate

			while #plate < 8 do

				plate = string.char(math.random(string.byte('A'), string.byte('Z'))) .. plate

				if #plate < 8 then

				end

			end

		end



		local veh = createVehicle(vehicleID, 1547.0068359375, -2319.2109375, 13.554655075073, 0, 0, r, plate)

		warpPedIntoVehicle( player, veh )

		local dbid = 500

		exports.pool:allocateElement(veh, dbid)

		setElementInterior(veh, getElementInterior(player))

		exports.global:giveItem(targetPlayer, 3, tonumber(insertid))

		setElementDimension(veh, getElementDimension(player))



		setVehicleOverrideLights(veh, 1)

		setVehicleEngineState(veh, false)

		setVehicleFuelTankExplodable(veh, false)

		setVehicleVariant(veh, exports['vehicle-system']:getRandomVariant(getElementModel(veh)))



		exports.anticheat:changeProtectedElementDataEx(veh, "dbid", dbid)

		exports.anticheat:changeProtectedElementDataEx(veh, "fuel", exports["fuel-system"]:getMaxFuel(veh), false)

		exports.anticheat:changeProtectedElementDataEx(veh, "Impounded", 0)

		exports.anticheat:changeProtectedElementDataEx(veh, "engine", 0, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldx", x, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldy", y, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldz", z, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "faction", -1)

		exports.anticheat:changeProtectedElementDataEx(veh, "owner", -1, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "job", 0, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "handbrake", 0, true)

		exports['vehicle-interiors']:add( veh )

        exports.global:takeMoney(player, prix)

	    

       setTimer( 

       function ()

		  destroyElement(veh)

		  exports.global:takeItem(targetPlayer, 3, 500)

       end

       ,3600000,1

       )

	else

	exports["SCR_Notifs"]:show_box(source,"You don't have money ! ","error")

end

end 	

addEvent( "stnrentroller3", true )

addEventHandler( "stnrentroller3", getRootElement(),rentCar4Funtion )

addCommandHandler("stnrentroller3",rentCar4Funtion )



rentCar5 = {}



function rentCar5Funtion ( player ) 

local prix = 400

     if getDistanceBetweenPoints3D ( 1645.337890625, -2326.65625, 13.546875, getElementPosition(player) ) <2 and exports.global:hasMoney(player, prix) then

        local vehicleID = 401



		local r = getPedRotation(player)

		local x, y, z = getElementPosition(player)



		local plate = tostring( getElementData(player, "account:id") )

		if #plate < 8 then

			plate = " " .. plate

			while #plate < 8 do

				plate = string.char(math.random(string.byte('A'), string.byte('Z'))) .. plate

				if #plate < 8 then

				end

			end

		end



		local veh = createVehicle(vehicleID, 1547.0068359375, -2319.2109375, 13.554655075073, 0, 0, r, plate)

		warpPedIntoVehicle( player, veh )

		local dbid = 500

		exports.pool:allocateElement(veh, dbid)

		setElementInterior(veh, getElementInterior(player))
		exports.global:giveItem(targetPlayer, 3, tonumber(insertid))

		setElementDimension(veh, getElementDimension(player))



		setVehicleOverrideLights(veh, 1)

		setVehicleEngineState(veh, false)

		setVehicleFuelTankExplodable(veh, false)

		setVehicleVariant(veh, exports['vehicle-system']:getRandomVariant(getElementModel(veh)))



		exports.anticheat:changeProtectedElementDataEx(veh, "dbid", dbid)

		exports.anticheat:changeProtectedElementDataEx(veh, "fuel", exports["fuel-system"]:getMaxFuel(veh), false)

		exports.anticheat:changeProtectedElementDataEx(veh, "Impounded", 0)

		exports.anticheat:changeProtectedElementDataEx(veh, "engine", 0, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldx", x, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldy", y, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "oldz", z, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "faction", -1)

		exports.anticheat:changeProtectedElementDataEx(veh, "owner", -1, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "job", 0, false)

		exports.anticheat:changeProtectedElementDataEx(veh, "handbrake", 0, true)

		exports['vehicle-interiors']:add( veh )

        exports.global:takeMoney(player, prix)

	    

       setTimer( 

       function ()

		  destroyElement(veh)

		  exports.global:takeItem(targetPlayer, 3, 500)

       end

       ,3600000,1

       )

	else

	exports["SCR_Notifs"]:show_box(source,"You don't have money ! ","error")

end

end 

addEvent( "stnrentroller4", true )

addEventHandler( "stnrentroller4", getRootElement(),rentCar5Funtion )

addCommandHandler("stnrentroller4",rentCar5Funtion )