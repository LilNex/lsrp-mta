----------------------------------

--MADE BY: S1lvador

--RE-DISTRIBUTE IS NOT ALLOWED

----------------------------------



--SPEED CAMS [SYNTAX: X, Y, Z, SPEED, MONEY, MARKER SIZE]

local cameraTable = {

    {x=1538.1474609375, y=-1732.330078125, z=13.3828125, speed=60, size=15}, -- Pershing

	{x=1529.5966796875, y=-1672.4990234375, z=13.39714717865, speed=60, size=10}, -- Little Mexico

	{x=1608.2861328125, y=-1592.4560546875, z=13.3828125, speed=60, size=20}, -- IGS

	{x=1821.5654296875, y=-1622.337890625, z=13.3828125, speed=60, size=20}, -- Corona

	{x=2332.0703125, y=-1733.4501953125, z=13.382502861023, speed=60, size=20}, -- Ganton

	{x=1778.248046875, y=-1732.251953125, z=13.38, speed=60, size=20}, --East Los Santos (Highway)

	{x=1925.255, y=-1752.322265625, z=13.3828125, speed=60, size=20}, --Idlewood

	{x=2112.541015625, y=-1677.964843755, z=13.372898712158, speed=60, size=20}, --Market

	{x=2323.064453125, y=-1732.158203125, z=13.38, speed=60, size=20}, -- Hopital

	{x=902.6376953125, y=-1779.671875, z=13.54, speed=60, size=30}, -- Santa Maria Beach 1


};

local cameras = {}

local warningTimers = {}

local toPay = {}

local enableBlips = false



----------------------------------------------------------------------------------

--> Don't edit under this : 

----------------------------------------------------------------------------------



addEventHandler("onResourceStart",resourceRoot,

	function ()

	for index, camera in ipairs(cameraTable) do

		local marker = createMarker(camera.x, camera.y, camera.z, "cylinder", camera.size, 255, 200, 0, 0, root) 

		cameras[marker] = {speed=camera.speed}

		addEventHandler("onMarkerHit", marker, onCameraMarkerHit)

		if (enableBlips) then

			local blip = createBlip(camera.x, camera.y, camera.z, 0, 1, 255, 0, 0, 255, 0, 70, getRootElement())

			setBlipVisibleDistance(blip, 200)

		end

	end

end)

function onCameraMarkerHit(hitElement)


    if (getElementType(hitElement) ~= "player" ) then return end

	if (not isPedInVehicle(hitElement)) then return end

	local vehicle = getPedOccupiedVehicle(hitElement)
	
	if not vehicle then return end

	local driver = getVehicleOccupant ( vehicle, 0 )

	if (not driver) then return end

	if (not getVehicleSirensOn(vehicle)) then

	local speedx, speedy, speedz = getElementVelocity(vehicle)

	local cX, cY, cZ = getElementPosition(vehicle)

	local speed = cameras[source].speed

    local actualSpeed = (speedx^2 + speedy^2 + speedz^2)^(0.5)

    local mph = math.floor(actualSpeed * 111.847)

    if (mph >= speed ) then
		setTimer(triggerClientEvent, 100, 1, "showPicture", hitElement)
		setTimer(fadeCamera, 100, 1, hitElement, true, 1.0, 255, 255, 255)


		if tonumber(getElementData(driver,"faction")) == 1 then 
			return
		end
	

		local overSpeed = mph - speed
		exports.global:takeMoney(driver, 75)


		local money = overSpeed * 10

		outputChatBox("#A9FD00================================================================", hitElement, 255, 200, 0, true)

            outputChatBox("#A9FD00[Radar-System] #FEFEFEYou've got flashed! (Reason: Driving over ".. speed .." mph).", hitElement, 255, 200, 0, true)

			outputChatBox("#A9FD00[Radar-System] #FEFEFEThe LSPD has received the full informations of your vehicule.", hitElement, 255, 200, 0, true)
			
			outputChatBox("#A9FD00[Radar-System] #FEFEFEWe've 75$ take of your money! Be careful.", hitElement, 255, 200, 0, true)

			
            --fadeCamera(hitElement, false, 0.5, 255, 255, 255)



			warningTimers[hitElement] = setTimer(sendWarningToCops, 100, 1, vehicle, hitElement, mph, getElementPosition(hitElement))

			toPay[hitElement] = money

		end

    end

end



--Color Names

local colors = {

	"white", "blue", "red", "dark green", "purple",

	"yellow", "blue", "gray", "blue", "silver",

	"gray", "blue", "dark gray", "silver", "gray",

	"green", "red", "red", "gray", "blue",

	"red", "red", "gray", "dark gray", "dark gray",

	"silver", "brown", "blue", "silver", "brown",

	"red", "blue", "gray", "gray", "dark gray",

	"black", "green", "light green", "blue", "black",

	"brown", "red", "red", "green", "red",

	"pale", "brown", "gray", "silver", "gray",

	"green", "blue", "dark blue", "dark blue", "brown",

	"silver", "pale", "red", "blue", "gray",

	"brown", "red", "silver", "silver", "green",

	"dark red", "blue", "pale", "light pink", "red",

	"blue", "brown", "light green", "red", "black",

	"silver", "pale", "red", "blue", "dark red",

	"purple", "dark red", "dark green", "dark brown", "purple",

	"green", "blue", "red", "pale", "silver",

	"dark blue", "gray", "blue", "blue", "blue",

	"silver", "light blue", "gray", "pale", "blue",

	"black", "pale", "blue", "pale", "gray",

	"blue", "pale", "blue", "dark gray", "brown",

	"silver", "blue", "dark brown", "dark green", "red",

	"dark blue", "red", "silver", "dark brown", "brown",

	"red", "gray", "brown", "red", "blue",

	"pink", [0] = "black"

}



function vehicleColor( c1, c2 )

	local color1 = colors[ c1 ] or "Unknown"

	local color2 = colors[ c2 ] or "Unknown"

	if color1 ~= color2 then

		return color1 .. " & " .. color2

	else

		return color1

	end

end



function sendWarningToCops(theVehicle, thePlayer, speed, x, y, z)

if isTimer(warningTimers[thePlayer]) then

	toPay[thePlayer] = nil

	if isTimer(warningTimers[thePlayer]) then killTimer(warningTimers[thePlayer]) end

	local direction = "in an unknown direction"

	local areaName = getZoneName(x, y, z)

	local nx, ny, nz = getElementPosition(thePlayer)

	local vehicleName = getVehicleName(theVehicle)

	local color1, color2 = getVehicleColor(theVehicle)

	local dx = nx - x

	local dy = ny - y

	if dy > math.abs(dx) then

		direction = "northbound"

	elseif dy < -math.abs(dx) then

		direction = "southbound"

	elseif dx > math.abs(dy) then

		direction = "eastbound"

	elseif dx < -math.abs(dy) then

		direction = "westbound"

	end

	if not (vehicleName == "Police LS") or (vehicleName == "Premier") or (vehicleName == "Police SF") or (vehicleName == "Police LV") or (vehicleName == "FBI Rancher") or (vehicleName == "Ambulance") then 

		local theTeam = getTeamFromName("Los Santos Police Department")

		local teamPlayers = getPlayersInTeam(theTeam)

		for key, value in ipairs(teamPlayers) do

		local duty = tonumber(getElementData(value, "duty"))

			if (duty>0) then

				--outputChatBox("[RADIO] All units, Traffic violation at " .. areaName .. ".", value, 1, 3, 255)

				--outputChatBox("[RADIO] Vehicle was a " .. vehicleColor(color1, color2) .. " " .. vehicleName .. " travelling at " .. tostring(math.ceil(speed)) .. " KPH.", value, 1, 3, 255)

				--outputChatBox("[RADIO] Suggested Fine, The plate is '"..  getVehiclePlateText ( theVehicle ) .."' and heading " .. direction .. ", Over.", value, 1, 3, 255)

				outputChatBox("#FFE400[#00B9FFTraffic#FFE400] #FF8B00Traffic violation at " .. areaName .. " by "..  getVehiclePlateText ( theVehicle ) .." with " .. tostring(math.ceil(speed)) .. " KPH", value, 1, 3, 255, true)

								

end

			end

		end

	end

end

