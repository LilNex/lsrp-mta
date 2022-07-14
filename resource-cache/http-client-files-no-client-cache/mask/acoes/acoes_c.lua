------------------------------------------------------------------
----------------- Ações client-side
------------------------------------------------------------------

addEvent ( "pAcao05", true )
addEventHandler ( "pAcao05", resourceRoot,
	function(item)
		local speed = getGameSpeed()
		if (speed == 1) then
			setGameSpeed(5)
			triggerEvent("exibirNotificacao", resourceRoot, "ativado", item, "Velocidade 5x ativada")
		else
			setGameSpeed(1)
			triggerEvent("exibirNotificacao", resourceRoot, "desativado", item, "Velocidade 5x desativada")
		end
	end
)

------------------------------------------------------------------

function jumCar()
	local veiculo = getPedOccupiedVehicle(getLocalPlayer())
	if not veiculo then
		return
	end
	if (isVehicleOnGround(veiculo) == true) then
		local v1, v2, v3 = getElementVelocity (veiculo)
		setElementVelocity(veiculo, v1, v2, v3 + 0.25)
	end
end
addEvent ( "vAcao04", true )
addEventHandler ( "vAcao04", resourceRoot,
	function(item)
		if  not (getKeyBoundToFunction(jumCar) == "lshift") then
			bindKey("lshift", "down", jumCar)
			triggerEvent("exibirNotificacao", resourceRoot, "ativado", item, "Pulo com o veículo habilitado")
		else
			unbindKey("lshift", "down", jumCar)
			triggerEvent("exibirNotificacao", resourceRoot, "desativado", item, "Pulo com o veículo desativado")
		end
	end
)

--[[
	Code made by villeser
	Name: carspeedboost
	Source: https://community.multitheftauto.com/index.php?p=resources&s=details&id=3499
--]]
local boostTimer = false
local currentlyBoosting = false
function startBoost (key, keyState)
  	local vehicle = getPedOccupiedVehicle ( getLocalPlayer () )
	if ( vehicle ) then
		if ( getVehicleController ( vehicle ) == getLocalPlayer () ) then
			boostTimer = setTimer(startCarBoost, 50, 0, vehicle)
			currentlyBoosting = true
		end
	end
end
function startCarBoost(vehicle)
	local vehSpeedX, vehSpeedY, vehSpeedZ = getElementVelocity ( vehicle )
	setElementVelocity ( vehicle, vehSpeedX*1.05, vehSpeedY*1.05, vehSpeedZ*1.05)
end
function stopBoost( key, keystate )
	if ( currentlyBoosting ) then
		killTimer( boostTimer )
		currentlyBoosting = false
	end
end
-- End code by villeser

addEvent ( "vAcao05", true )
addEventHandler ( "vAcao05", resourceRoot,
	function(item)
		if not (getKeyBoundToFunction(startBoost) == "lalt") then
			bindKey("lalt", "down", startBoost)
			bindKey("lalt", "up", stopBoost)
			triggerEvent("exibirNotificacao", resourceRoot, "ativado", item, "Super speed foi ativado")
		else
			unbindKey("lalt", "down", startBoost)
			unbindKey("lalt", "up", stopBoost)
			triggerEvent("exibirNotificacao", resourceRoot, "desativado", item, "Super speed foi desativado")
		end
	end
)

local colisao = true
addEvent ( "vAcao06", true )
addEventHandler ( "vAcao06", resourceRoot,
	function(item)
		local pvehicle = getPedOccupiedVehicle(localPlayer)
		if (colisao) then
			colisao = false
			triggerEvent("exibirNotificacao", resourceRoot, "ativado", item, "Colisão com demais veículos foi desativada")
		else
			colisao = true
			triggerEvent("exibirNotificacao", resourceRoot, "desativado", item, "Colisão com demais veículos foi ativada")
		end
		
		for i, v in pairs(getElementsByType("vehicle")) do
			if (pvehicle) then
				setElementCollidableWith( pvehicle, v, colisao )
			end
		end
	end
)

addEvent ( "vAcao07", true )
addEventHandler ( "vAcao07", resourceRoot,
	function(item)
		if not isWorldSpecialPropertyEnabled("aircars") then
			setWorldSpecialPropertyEnabled("aircars", true)
			triggerEvent("exibirNotificacao", resourceRoot, "ativado", item, "Voar com o veículo ativado")
		else
			setWorldSpecialPropertyEnabled("aircars", false)
			triggerEvent("exibirNotificacao", resourceRoot, "desativado", item, "Voar com o veículo desativado")
		end
		
	end
)

addEvent ( "vAcao08", true )
addEventHandler ( "vAcao08", resourceRoot,
	function(item)
		if not isWorldSpecialPropertyEnabled("hovercars") then
			setWorldSpecialPropertyEnabled("hovercars", true)
			triggerEvent("exibirNotificacao", resourceRoot, "ativado", item, "Carro anfíbio habilitado")
		else
			setWorldSpecialPropertyEnabled("hovercars", false)
			triggerEvent("exibirNotificacao", resourceRoot, "desativado", item, "Carro anfíbio desativado")
		end
	end
)

addEvent ( "vAcao14", true )
addEventHandler ( "vAcao14", resourceRoot,
	function(item)
		if not isWorldSpecialPropertyEnabled("extrabunny") then
			setWorldSpecialPropertyEnabled("extrabunny", true)
			triggerEvent("exibirNotificacao", resourceRoot, "ativado", item, "Super pulo de bike ativado")
		else
			setWorldSpecialPropertyEnabled("extrabunny", false)
			triggerEvent("exibirNotificacao", resourceRoot, "desativado", item, "Super pulo de bike desativado")
		end
	end
)

setTimer(
	function()
		for _, player in pairs(getElementsByType('player')) do
			local veiculo = getPedOccupiedVehicle(player)
			if veiculo then
				if not isElementOnScreen(veiculo) then return end
				if getElementData(player,"luzespolicias") then
					setVehicleOverrideLights ( vehicle, 2 )
					if getVehicleLightState(veiculo,2) == 0 then
						setVehicleHeadLightColor(veiculo,255,0,0)
						setVehicleLightState ( veiculo, 2,  1 )
						setVehicleLightState ( veiculo, 3,  0 )
						setVehicleLightState ( veiculo, 0,  0 )
						setVehicleLightState ( veiculo, 1,  1 )
					else
						setVehicleHeadLightColor(veiculo,0,0,255)
						setVehicleLightState ( veiculo, 2,  0 )
						setVehicleLightState ( veiculo, 3,  1 )
						setVehicleLightState ( veiculo, 0,  1 )
						setVehicleLightState ( veiculo, 1,  0 )
					end
				elseif getElementData(player,"luzesdiscoteca") then
					setVehicleOverrideLights ( veiculo, 2 )
					if getVehicleLightState ( veiculo, 0 ) == 1 then
						setVehicleLightState ( veiculo, 0, 0 )
						setVehicleLightState ( veiculo, 1, 0 )
						setVehicleLightState ( veiculo, 2, 1 )
						setVehicleLightState ( veiculo, 3, 1 )
					else
						setVehicleLightState ( veiculo, 0, 1 )
						setVehicleLightState ( veiculo, 1, 1 )
						setVehicleLightState ( veiculo, 2, 0 )
						setVehicleLightState ( veiculo, 3, 0 )
					end
					setVehicleHeadLightColor(veiculo,math.random(0,255),math.random(0,255),math.random(0,255))
				end
			end
		end
	end
,500,0)


local gradiente = {
	arco_ires = {},
	preto_branco = {},
	rosa_azul = {}
}
addEventHandler("onClientPreRender",getRootElement(),
	function()
		for _, player in pairs(getElementsByType("player")) do
			local veiculo = getPedOccupiedVehicle(player)
			if (veiculo) and isElementOnScreen(veiculo) then
				local cor = {}
				cor[1],cor[2],cor[3] = getVehicleColor(veiculo,true)
				
				-------------- Preto ~ Branco
				if (getElementData(player,"preto_branco")) then
					if (not gradiente.preto_branco[player]) then
						for i=1,3 do
							if (cor[i] < 255) then
								cor[i] = cor[i] + 3
								if (cor[i] > 255) then cor[i] = 255 end
							end
							if (cor[1] == 255 and cor[2] == 255 and cor[3] == 255) then
								gradiente.preto_branco[player] = true
								break
							end
						end
					else
						for i=1,3 do
							if (cor[i] > 0) then
								cor[i] = cor[i] - 3
								if (cor[i] < 0) then cor[i] = 0 end
							end
							if (cor[1] == 0 and cor[2] == 0 and cor[3] == 0) then
								gradiente.preto_branco[player] = false
								break
							end
						end
					end
					setVehicleColor(veiculo,cor[1],cor[2],cor[3])
				end
				
				-------------- Rosa ~ Azul
				if (getElementData(player,"rosa_azul")) then
					if (not gradiente.rosa_azul[player]) then
						cor[2] = 0
						cor[3] = 255
						if (cor[1] < 255) then
							cor[1] = cor[1] + 3
							if (cor[1] > 255) then cor[1] = 255 end
						end
						if (cor[1] == 255) then gradiente.rosa_azul[player] = true end
						
					else
						if (cor[1] > 0) then
							cor[1] = cor[1] - 3
							if (cor[1] < 0) then cor[1] = 0 end
						end
						if (cor[1] == 0) then gradiente.rosa_azul[player] = false end
					end
					setVehicleColor(veiculo,cor[1],cor[2],cor[3])
				end
				
				-------------- Arco íres (rainbow)
				
				if (getElementData(player, "arco_ires")) then
					if (not gradiente.arco_ires[player]) then
						gradiente.arco_ires[player] = 0
						cor[1],cor[2],cor[3] = 0,0,0
					end
					if (gradiente.arco_ires[player] == 0) then
						if (cor[1] < 255) then
							cor[1] = cor[1] + 3
							if (cor[1] > 255) then cor[1] = 255 end
						else
							gradiente.arco_ires[player] = 1
						end
					elseif (gradiente.arco_ires[player] == 1) then
						if (cor[2] < 255) then
							cor[2] = cor[2] + 3
							if (cor[2] > 255) then cor[2] = 255 end
						else
							gradiente.arco_ires[player] = 2
						end
					elseif (gradiente.arco_ires[player] == 2) then
						if (cor[3] < 255) then
							cor[3] = cor[3] + 3
							if (cor[3] > 255) then cor[3] = 255 end
							if (cor[1] > 0) then
								cor[1] = cor[1] - 3
							else
								cor[1] = 0
							end
						else
							gradiente.arco_ires[player] = 3
						end
					elseif (gradiente.arco_ires[player] == 3) then
						if (cor[2] > 0) then
							cor[2] = cor[2] - 3
							if (cor[2] < 0) then cor[2] = 0 end
							if (cor[1] > 0) then
								cor[1] = cor[1] - 3
							else
								cor[1] = 0
							end
						else
							gradiente.arco_ires[player] = 4
						end
					elseif (gradiente.arco_ires[player] == 4) then
						if (cor[3] > 0) then
							cor[3] = cor[3] - 3
							if (cor[3] < 0) then cor[3] = 0 end
						else
							gradiente.arco_ires[player] = 0
						end
					end
					setVehicleColor(veiculo, cor[1], cor[2], cor[3])
				end
				
			end
		end
	end
)