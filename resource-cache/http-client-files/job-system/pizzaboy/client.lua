---- UndR
local pizza = {
	[448]=true;
}

local pizzaDeliveryTarget
local pizzaDeliveryBlip

local function clickToThrow(btn, state)
	if btn == "mouse1" and state == true then
		if not isElement (pizzaDeliveryTarget) then
			removeEventHandler ("onClientKey", root, clickToThrow)
		else
			local localPos = {getElementPosition (localPlayer)}
			local targetPos = {getElementPosition (pizzaDeliveryTarget)}
			if getDistanceBetweenPoints3D (localPos[1], localPos[2], localPos[3], targetPos[1], targetPos[2], targetPos[3]) < 10 then
				local pizza = createObject (1582, localPos[1], localPos[2] - 0.1, localPos[3] + 0.7)
				moveObject (pizza, 400, targetPos[1], targetPos[2], targetPos[3])
				setTimer (destroyElement, 3000, 1, pizza)
				setElementCollisionsEnabled (pizza, false)
				
				localPos = nil
				targetPos = nil
				clearPizzaboyMission()
				triggerServerEvent ("payMeWhatYouOweMe", localPlayer)
			end
		end
	end
end

addEvent ("requestPizzajobStart", true)
local function startPizzajob (locationTable)
	local randomLocation = locationTable[math.random(#locationTable)]
	pizzaDeliveryTarget = createMarker (randomLocation[1], randomLocation[2], randomLocation[3], "cylinder", 4, 255, 50, 50, 100)
	pizzaDeliveryBlip = createBlipAttachedTo (pizzaDeliveryTarget, 29)
	addEventHandler ("onClientKey", root, clickToThrow)
	outputChatBox ("* PIZZA * #FFFFFFDeliver the pizza to the customer located in "..getZoneName(randomLocation[1], randomLocation[2], randomLocation[3]), 255, 50, 50, true)
end
addEventHandler ("requestPizzajobStart", localPlayer, startPizzajob)

function clearPizzaboyMission()
	if isElement (pizzaDeliveryTarget) then
		destroyElement (pizzaDeliveryTarget)
	end
	
	if isElement (pizzaDeliveryBlip) then
		destroyElement (pizzaDeliveryBlip) 
	end
	removeEventHandler ("onClientKey", root, clickToThrow)
end
addEventHandler ("onClientPlayerWasted", localPlayer, clearPizzaboyMission)
addEventHandler("onClientVehicleExit", getRootElement(),
    function(thePlayer, leave)
        if thePlayer == getLocalPlayer() then
local vehID = getElementModel (source)
if(pizza[vehID])then
if isElement (pizzaDeliveryTarget) then
		destroyElement (pizzaDeliveryTarget)
	end
	
	if isElement (pizzaDeliveryBlip) then
		destroyElement (pizzaDeliveryBlip) 
	end
	removeEventHandler ("onClientKey", root, clickToThrow)

        end
    end
end
)

addCommandHandler("stopjob", clearPizzaboyMission)
function enterPizza ( thePlayer, seat, jacked )
	if(thePlayer == getLocalPlayer())then
		local vehID = getElementModel (source)
		if(pizza[vehID])then
			if seat == 1 then
if not getElementData(getLocalPlayer(), "job") == 8 then
exports.under_info:showBox("You're not a Pizza Boy, go to CityHall.", "info",5000)
			triggerServerEvent("removePlayerFromPizza", getLocalPlayer())
                  end
            end
        end
     end
end
addEventHandler("onClientVehicleEnter", getRootElement(), enterPizza) 