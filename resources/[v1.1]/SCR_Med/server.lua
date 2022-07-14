function start_Spasatel(player)
    setElementData(player,"Lifeguard_Skin ",getElementModel(player))
    setElementModel(player,skinS[1])
    --local veh = createVehicle(vehS[1],vehSpas[1], vehSpas[2], vehSpas[3], 0, 0, 180)
    setElementData(player,"Rescuer_machine ",veh)
    --warpPedIntoVehicle(player,veh)
    setElementData(veh, "vehicle:Work", true)
    setElementData(veh, "vehicle:Work:Owner", player)
end
addEvent("start_Spasatel", true)
addEventHandler("start_Spasatel", getRootElement(), start_Spasatel)

function enterVehicle ( player )
    local data = getElementData(source, "vehicle:Work")
	if not data then return end
	
	local owner = getElementData(source, "vehicle:Work:Owner")
	if owner ~= player then
	    cancelEvent()
        exports.PopupSys:Draw("Это не ваш транспорт.",player,"Info")
	end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterVehicle )

function stop_Spasatel(player)
    local state = getElementData(player,"Lifeguard_working")
    local veh0 = getElementData(player,"Rescuer_machine ")
    if state then
        if veh0 then
            --destroyElement(veh0)
            setElementData(player,"Rescuer_machine ",nil)
        end
    end
    setElementModel(player,getElementData(player,"Lifeguard_Skin "))
    triggerClientEvent("deleteMarkerSpasatel",player,player)
end
addEvent("stop_Spasatel", true)
addEventHandler("stop_Spasatel", getRootElement(), stop_Spasatel)

function giveMoneySpasatel(player, summa)
    local state = getElementData(player,"Lifeguard_working")
    if state then
        exports.global:giveMoney(player, summa)
        --givePlayerMoney(player, summa)
        outputChatBox("[#14B4E7SERVER#FFFFFF] You've finished your shift. Your salary:  #00FF00"..summa.." #FFFFFF.",player,255,255,255,true)
    end
end
addEvent("giveMoneySpasatel", true)
addEventHandler("giveMoneySpasatel", getRootElement(), giveMoneySpasatel) 

function onPlayerWasted()
    giveMoneySpasatel(source)
end
addEventHandler("onPlayerWasted", getRootElement(), onPlayerWasted)

function onPlayerQuit()
    giveMoneySpasatel(source)
end
addEventHandler("onPlayerQuit", getRootElement(), onPlayerQuit)

function onVehicleStartEnter( player, seat, jacked )
local veh = source
local pveh = getElementData(player,"Rescuer_machine ")
    if veh == pveh then
        setElementData(player,"destruction",nil)
    end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), onVehicleStartEnter)

setTimer(function()
for lol,player in ipairs(getElementsByType("player")) do
    local pveh = getElementData(player,"Rescuer_machine ")
    if pveh then
        --local driverA = getVehicleOccupant(pveh)
        if driverA == player then
            if getElementData(player,"destruction") then
                setElementData(player,"destruction",nil)
            end
        else
            if getElementData(player,"destruction") then
                setElementData(player,"destruction",tonumber(getElementData(player,"destruction")) - 1)
                if tonumber(getElementData(player,"destruction")) < 0 then
                    setElementData(player,"destruction",nil)
                    stop_Spasatel(player)
                    --exports.PopupSys:Draw("Você abandonou o veículo de trabalho e ele foi encerrado.",player,"Info")
                end
            end
        end
   end
end
end,1000,0)

function onVehicleExit(player,seat)
    if seat == 0 then
        local pveh = getElementData(player,"Rescuer_machine ")
        if source == pveh then
            setElementData(player,"destruction",60)
            --exports.PopupSys:Draw("Если вы не вернетесь в транспорт, через 60 сек. он будет убран.",player,"Warning")
        end
    end
end
addEventHandler("onVehicleExit", getRootElement(), onVehicleExit)