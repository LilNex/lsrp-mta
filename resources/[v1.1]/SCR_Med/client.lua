--[[addEventHandler('onClientResourceStart', resourceRoot, function()     
    local txd = engineLoadTXD('files/car.txd',vehS[1])
    engineImportTXD(txd,vehS[1])
    local dff = engineLoadDFF('files/car.dff',vehS[1])
    engineReplaceModel(dff,vehS[1])
end)--]]

--------------------------------------------[Dispositivo]
local dxMarker = createMarker(pickupUs[1],pickupUs[2],pickupUs[3]-0.4, "cylinder", 1, 255, 255, 255, 0)

addEventHandler( "onClientRender", root, function ()
       local x, y, z = getElementPosition(dxMarker)
       local Mx, My, Mz = getCameraMatrix()
        if (getDistanceBetweenPoints3D(x, y, z, Mx, My, Mz) <= 20) then
           local WorldPositionX, WorldPositionY = getScreenFromWorldPosition(x, y, z +1, 0.07)
            if (WorldPositionX and WorldPositionY) then
			    dxDrawText("Medic Daily Tasks", WorldPositionX - 1, WorldPositionY + 1, WorldPositionX - 1, WorldPositionY + 1, tocolor(0, 0, 0, 255), 1.52, "default-bold", "center", "center", false, false, false, false, false)
			    dxDrawText("Medic Daily Tasks", WorldPositionX - 1, WorldPositionY + 1, WorldPositionX - 1, WorldPositionY + 1, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center", false, false, false, false, false)
            end
      end
end 
)
---------------------------------------------

local allSkins = getValidPedModels()

local pickupUs = createPickup(pickupUs[1],pickupUs[2],pickupUs[3], 3, 1275, 50)
local blip = createBlipAttachedTo(pickupUs, 42)
setBlipVisibleDistance(blip, 400)

function centerWindow ( center_window )
	local sx, sy = guiGetScreenSize ( )
	local windowW, windowH = guiGetSize ( center_window, false )
	local x, y = ( sx - windowW ) / 2, ( sy - windowH ) / 2
	guiSetPosition ( center_window, x, y, false )
end

local sw,sh = guiGetScreenSize()
local window={}
local label={}
local button={}

wndCon = guiCreateWindow(0,0,500,110,"Medic System",false)
centerWindow(wndCon)
labeCon = guiCreateLabel(0,25,490,50,"Welcome to Paramedic work.\nYour mission is to answer calls and rescue people. ",false,wndCon)
guiSetFont(labeCon, "default-bold-small")
guiLabelSetHorizontalAlign(labeCon, "center", false)
buttonCon1 = guiCreateButton(20,70,200,30,"...",false,wndCon)
buttonCon2 = guiCreateButton(280,70,200,30,"Cancel",false,wndCon)
guiSetVisible(wndCon,false)

function createMarkerSpasatel(player)
    if player == getLocalPlayer() then
        local skin = allSkins[math.random(1,#allSkins)]
        local d = math.random(1,#Customer)
        local marker = createMarker(Customer[d][1],Customer[d][2],Customer[d][3]-1, "cylinder", 1, 255, 255, 255, 20)
        setElementData(marker,"Rescuer_marker_patient ",true)
        setElementData(player,"Rescuer_marker_patient ",marker)
        local blip = createBlipAttachedTo(marker, 41)
        setElementData(player,"Rescuer_patient_blip",blip)
        local ped = createPed(skin,Customer[d][1],Customer[d][2],Customer[d][3])
        setElementFrozen(ped,true)
        setPedAnimation(ped,"crack","crckdeth2",-1,true,false,false,false)
        setElementData(player,"Rescuer_patient ",ped)
        local location = getZoneName(Customer[d][1],Customer[d][2],Customer[d][3])
        outputChatBox("[#14B4E7SERVER#FFFFFF]"..Customer[d][4]..". located in : #00FF00"..location,255,255,255,true)
    end
end

function deleteMarkerSpasatel(player)
    if player == getLocalPlayer() then
        local ped = getElementData(player,"Rescuer_patient ")
        local blip = getElementData(player,"Rescuer_patient_blip")
        local marker = getElementData(player,"Rescuer_marker_patient ")
        if marker then
            if isElement(marker) then destroyElement(marker) end
        end
        if blip then
            if isElement(blip) then destroyElement(blip) end
        end
        if ped then
            if isElement(ped) then destroyElement(ped) end
        end
    end
end
addEvent("deleteMarkerSpasatel", true)
addEventHandler("deleteMarkerSpasatel", getRootElement(), deleteMarkerSpasatel)

function startClick()
    local player = getLocalPlayer()
    if (source == buttonCon1) then
        guiSetVisible(wndCon,false)
        showCursor(false)
        local state = getElementData(player,"Lifeguard_working")
        if not state then
            if (getElementData(getPlayerTeam(localPlayer), "type")) == 4 then
                outputChatBox("[RADIO] This is dispatch you got a new tasks , the location is in your gps.", player, 245, 40, 135)
               triggerServerEvent("start_Spasatel",player,player)
               setElementData(player,"Lifeguard_working",0)
               createMarkerSpasatel(player)
            
               setElementData(player,"Rescuer_machine_patient ",0)
               setElementData(player,"Earned_Now_Con ",moneyCon)
            else 
                exports["SCR_Notifs"]:show_box("You are not a medic faction membre.", "error")	
            end 

        else
            local hodok = tonumber(state)
            local profit = getElementData(player,"Earned_Total_Con ")
            if not profit then profit = 0 end
            
            setElementData(player,"Earned_Total_Con ",nil)
            setElementData(player,"Earned_Now_Con ",nil)
            triggerServerEvent("stop_Spasatel",player,player)
            triggerServerEvent("giveMoneySpasatel",player,player,profit)
            setElementData(player,"Lifeguard_working",nil)
            deleteMarkerSpasatel(player)
        end
    elseif (source == buttonCon2) then
        guiSetVisible(wndCon,false)
        showCursor(false)
    end
end
addEventHandler("onClientGUIClick", getRootElement(), startClick)

function onClientMarkerHit(player, mdim )
    if player == getLocalPlayer() then
        if mdim then
            local veh = getPedOccupiedVehicle(player)
            local state = getElementData(player,"Lifeguard_working")
            if getElementData(source,"Rescuer_marker_patient ") then
                if not veh then
                    if (exports.global:hasItem( player, 70)) then 
                               setElementFrozen(player,true)
                               setPedAnimation(player,"medic","cpr",8000,false,true,true,false)
                                setElementData(player,"Rescuer_machine_patient ",tonumber(getElementData(player,"Rescuer_machine_patient ")) + 1)
                                setTimer(function()
                                if isElement(player) and getElementData(player,"Lifeguard_working") then
                                local pacienty = tonumber(getElementData(player,"Rescuer_machine_patient "))
                                if pacienty > 0 then
                                setElementData(player,"Lifeguard_working",tonumber(state) + pacienty)
                                setElementData(player,"Rescuer_machine_patient ",0)
                                if not getElementData(player,"Earned_Total_Con ") then
                                    setElementData(player,"Earned_Total_Con ",0)
                                end
                                if not getElementData(player,"Earned_Now_Con ") then setElementData(player,"Earned_Now_Con ",0) end
                                setElementData(player,"Earned_Total_Con ",getElementData(player,"Earned_Total_Con ") + getElementData(player,"Earned_Now_Con "))
                                deleteMarkerSpasatel(player)
                                setElementFrozen(player,false)
                                outputChatBox("[RADIO] The patient was saved, good job! You receive: "..getElementData(player,"Earned_Now_Con ")..".",245, 40, 135)
                                outputChatBox("[RADIO] Total receivable: "..getElementData(player,"Earned_Total_Con ")..".",245, 40, 135)
                                setTimer(function() createMarkerSpasatel(player) end, 10000,1)
                            end
                        end
                         end,8000,1)
                    else 
                        exports["SCR_Notifs"]:show_box("You mush have the first aid kit.", "error")	
                    end 
                end
            end
        end
    end
end
addEventHandler("onClientMarkerHit", getRootElement(), onClientMarkerHit )

addEventHandler ( "onClientPickupHit", getRootElement(), function(ply)
	if ply ~= localPlayer then return end
	if source == pickupUs then
        local state = getElementData(ply,"Lifeguard_working")
        local veh = getPedOccupiedVehicle(ply)
        if not veh then
            guiSetVisible(wndCon,true)
            showCursor(true)
            if not state then
                guiSetText(buttonCon1,"Take tasks")
            else
                guiSetText(buttonCon1,"Finish")
            end
        end
	end
end)