-----------------------------------
---- Los Santos - RolePlay 
---- All rights reserved to Arseni 
------------------------------------

function checkHim(thePlayer)
if (getElementType(thePlayer) == "player" ) then
local car = getPedOccupiedVehicle(thePlayer)
local speedx, speedy, speedz = getElementVelocity(car)
local factionType = tonumber(getElementData(theTeam, "type"))
actualSpeed = (speedx^2 + speedy^2 + speedz^2)^(0.5)
mph = math.floor(actualSpeed * 111.847)
if isPedInVehicle(thePlayer) and (getVehicleEngineState(car) == false ) and exports.global:hasItem(thePlayer, 215)  then 
triggerClientEvent("disableBinCol", thePlayer)
exports.global:takeItem(thePlayer, 215)
exports['vehicle-manager']:addVehicleLogs(tonumber(getElementData(car,"dbid")), "Trafiqued the car", thePlayer)

else
outputChatBox("[System] You should to buy a trafficker.", thePlayer, 255, 0, 0, false)
                 end 
			end
		end
addCommandHandler("trafiquerfils", checkHim)

function cammy()
setCameraTarget(source, source)
end
addEvent("setCamBack", true)
addEventHandler("setCamBack", root, cammy)


function switchEngine ( playerSource )
    local theVehicle = getPedOccupiedVehicle ( playerSource )
 
    if theVehicle and getVehicleController ( theVehicle ) == playerSource then
        local state = getVehicleEngineState ( theVehicle )
        setVehicleEngineState ( theVehicle, not state )
    end
end
--addCommandHandler ( "engine", switchEngine )

function freeze(jij)
local car = getPedOccupiedVehicle(jij)
setElementFrozen(car, true)
end
addEvent("setFrozen", true)
addEventHandler("setFrozen", root, freeze)

function unfreeze(jij)
local car = getPedOccupiedVehicle(jij)
setElementFrozen(car, false)
end
addEvent("setUnFrozen", true)
addEventHandler("setUnFrozen", root, unfreeze)