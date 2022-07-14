rentCar = {}



function rentCarFuntion ( player ) 

local prix = 500

    if getDistanceBetweenPoints3D ( 1645.337890625, -2326.65625, 13.546875, getElementPosition(player) ) <2 and exports.global:hasMoney(player, prix) then

        local vehicleID = 462



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



		local veh = createVehicle(vehicleID, 1547.0068359375, -2319.2109375, 13.554655075073, 0, 0, 178.66516113281, plate)

		warpPedIntoVehicle( player, veh )

		local dbid = 500

		exports.pool:allocateElement(veh, dbid)

		setElementInterior(veh, getElementInterior(player))

		exports.global:giveItem(source, 3, 500)

		outputChatBox("#357621[Location-System] #F7BB2DVous venez de louer un faggio pour une durée de 30 minutes à 500$.", player, 255, 200, 0, true)

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

		  exports.global:takeItem(source, 3, 500)

		  outputChatBox("#357621[Location-System] #F7BB2DVotre location vient de prendre fin , ansi que vous payez 100$ de caution.", player, 255, 200, 0, true)

	      exports.global:takeMoney(player, 100)

		end

       ,1800000,1

       )

	else

	outputChatBox("Vous n'avez pas assez d'argent.", player)

end

end 

addEvent( "rentroller", true )

addEventHandler( "rentroller", getRootElement(),rentCarFuntion )



rentCar2 = {}



function rentCar2Funtion ( player ) 

local prix = 150

    if getDistanceBetweenPoints3D ( 1645.337890625, -2326.65625, 13.546875, getElementPosition(player) ) <2 and exports.global:hasMoney(player, prix) then

        local vehicleID = 509



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



		local veh = createVehicle(vehicleID, 1547.0068359375, -2319.2109375, 13.554655075073, 0, 0, 178.66516113281, plate)

		warpPedIntoVehicle( player, veh )



		local dbid = 500

		exports.pool:allocateElement(veh, dbid)

		setElementInterior(veh, getElementInterior(player))

		exports.global:giveItem(targetPlayer, 3, 500)

		setElementDimension(veh, getElementDimension(player))

		outputChatBox("#357621[Location-System] #F7BB2DVous venez de louer une Moutain Bike pour une durée d'une heure à 150$.", player, 255, 200, 0, true)



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

		  outputChatBox("#357621[Location-System] #F7BB2DVotre location vient de prendre fin , ansi que vous payez 100$ de caution.", player, 255, 200, 0, true)

	      exports.global:takeMoney(player, 100)

       end

       ,3600000,1

       )

	else

	outputChatBox("Vous n'avez pas assez d'argent.", player)

end

end 

addEvent( "rentroller1", true )

addEventHandler( "rentroller1", getRootElement(),rentCar2Funtion )



rentCar3 = {}



function rentCar3Funtion ( player ) 

local prix = 150

    if getDistanceBetweenPoints3D ( 1645.337890625, -2326.65625, 13.546875, getElementPosition(player) ) <2 and exports.global:hasMoney(player, prix) then

        local vehicleID = 481



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



		local veh = createVehicle(vehicleID, 1547.0068359375, -2319.2109375, 13.554655075073, 0, 0, 178.66516113281, plate)

		warpPedIntoVehicle( player, veh )

		local dbid = 500

		exports.pool:allocateElement(veh, dbid)

		setElementInterior(veh, getElementInterior(player))

		exports.global:giveItem(targetPlayer, 3, 500)

		outputChatBox("#357621[Location-System] #F7BB2DVous venez de louer une BMX pour une durée d'une heure à 150$.", player, 255, 200, 0, true)

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

		  outputChatBox("#357621[Location-System] #F7BB2DVotre location vient de prendre fin , ansi que vous payez 100$ de caution.", player, 255, 200, 0, true)

	      exports.global:takeMoney(player, 100)

       end

       ,3600000,1

       )

	else

	outputChatBox("Vous n'avez pas assez d'argent.", player)

end

end 

addEvent( "rentroller2", true )

addEventHandler( "rentroller2", getRootElement(),rentCar3Funtion )

addCommandHandler("rentroller2",rentCar3Funtion )



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

	outputChatBox("Vous n'avez pas assez d'argent.", player)

end

end 	

addEvent( "rentroller3", true )

addEventHandler( "rentroller3", getRootElement(),rentCar4Funtion )

addCommandHandler("rentroller3",rentCar4Funtion )



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

	outputChatBox("Vous n'avez pas assez d'argent.", player)

end

end 

addEvent( "rentroller4", true )

addEventHandler( "rentroller4", getRootElement(),rentCar5Funtion )

addCommandHandler("rentroller4",rentCar5Funtion )