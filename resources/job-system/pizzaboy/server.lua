---UndR

local moneyPerPizza = 10
local pizzaSkins = {
	[155]=true;
}

local pizzaVehicles = {
	[448]=true;
}

-- Note that location name must correspond to the area in San Andreas you'd like Pizza Job available in, for example: ["RC"] won't work, instead, put ["Red County"]
local locations = {
	["Los Santos"] = {
		{ 2068.3, -1731.66, 13 };
		{ 2067.29, -1702.8, 13.1 };
		{ 2068.97, -1656.69, 13 };
		{ 1978, -1674, 14 };
		{ 2091.375, -1583.7392578125, 13.278553009033 };
		{ 2170.09375, -1603.6416015625, 14.347630500793 };
		{ 2157.1142578125, -1702.5361328125, 15.0859375 };
		{ 2262.873046875, -1765.33984375, 13.546875 };
		{ 2318.89453125, -1722.7431640625, 13.537718772888 };
	};
}

local function initializeOnVehicleEnter (p, s)
	if p and s == 0 and pizzaVehicles[getElementModel(source)] then
local job = getElementData(p, "job") or 0
if job == 8 then
		local sourcePos = {getElementPosition(p)}
		local playerZone = getZoneName (sourcePos[1], sourcePos[2], sourcePos[3], true)
		if locations[playerZone] then
			triggerClientEvent (p, "requestPizzajobStart", p, locations[playerZone])
			outputChatBox ("[Pizza-Job] Info:#FFFFFF Use left mouse button when near delivery location to throw the pizza", p, 255, 50, 50, true)
                        exports.under_info:showBoxS(p, "-> Check F11, delivery to Pizza blips..", "info",5000)
		end
		sourcePos = nil
		playerZone = nil
end
	end
end
addEventHandler ("onVehicleEnter", root, initializeOnVehicleEnter)
addEvent ("payMeWhatYouOweMe", true)
local function payMeWhatYouOweMe()
exports.global:giveMoney(client, moneyPerPizza) 
exports.under_info:showBoxS(client, "[Pizza-Job] You received 10$ #FFFFFF for the delivery.", "info",5000)
	outputChatBox ("[Pizza-Job] You got paid $"..moneyPerPizza.. " for the delivery", client, 255, 50, 50)
	setTimer (function(client)
		if not client then return end
		local sourcePos = {getElementPosition(client)}
		local playerZone = getZoneName (sourcePos[1], sourcePos[2], sourcePos[3], true)
		triggerClientEvent (client, "requestPizzajobStart", client, locations[playerZone])
		sourcePos = nil
		playerZone = nil
	end, 1500, 1, client)
end
addEventHandler ("payMeWhatYouOweMe", root, payMeWhatYouOweMe)

function ejectPlayerFromPizza()

	exports.anticheat:changeProtectedElementDataEx(source, "realinvehicle", 0, false)

	removePedFromVehicle(source)

end

addEvent("removePlayerFromPizza", true)

addEventHandler("removePlayerFromPizza", getRootElement(), ejectPlayerFromPizza)