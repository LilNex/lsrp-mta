------------------------------------------------------------------
----------------- Ações server-side
------------------------------------------------------------------

addEvent("pAcao01", true)
addEventHandler("pAcao01", resourceRoot,
	function(item)
		setElementHealth(client, 200)
		setPedArmor(client, 100)
		triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Vida e Colete foram completados!")
	end
)

local vipweapons = {31,34,4,24}
addEvent("pAcao02", true)
addEventHandler("pAcao02", resourceRoot,
	function(item)
		for i,v in ipairs(vipweapons) do
			giveWeapon(client, v, 999, (v == 4))
		end
		triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Você agora está com armas VIP")
	end
)

function getJetPack(player)
	if not doesPedHaveJetPack ( player ) then
		givePedJetPack ( player )
	else
		removePedJetPack ( player )
	end
end

addEvent("pAcao03", true)
addEventHandler("pAcao03", resourceRoot,
	function(item)
		if not doesPedHaveJetPack ( client ) then
			if givePedJetPack ( client ) then
				bindKey ( client, "K", "down", getJetPack )
				triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "JetPack ativado")
			end
		else
			removePedJetPack ( client )
			unbindKey ( client, "K", "down", getJetPack )
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "JetPack desativado")
		end
	end
)

addEvent("pAcao04", true)
addEventHandler("pAcao04", resourceRoot,
	function(item)
		if (getElementAlpha(client) == 255) then
			setElementAlpha(client,0)
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Seu personagem agora está invisível")
		else
			setElementAlpha(client,255)
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "Seu personagem agora está visível")
		end
	end
)

local tirohack = {}
addEvent("pAcao07", true)
addEventHandler("pAcao07", resourceRoot,
	function(item)
		if not tirohack[client] then
			tirohack[client] = true
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Balas de ferro ativado")
		else
			tirohack[client] = nil
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "Balas de ferro desativado")
		end
	end
)
addEventHandler ( "onPlayerDamage", getRootElement(),
	function(attacker, attackerweapon, bodypart, loss)
		if (tirohack[attacker]) then
			if (attackerweapon >= 22 and attackerweapon <= 34) then
				local vida = getElementHealth(source)-(loss*0.2)
				if (vida <= 0) then
					killPed ( source, attacker, attackerweapon, bodypart, false )
				else
					setElementHealth ( source, vida )
				end
			end
		end
	end
)
addEventHandler ( "onPlayerQuit", root,
	function()
		if (tirohack[source]) then tirohack[source] = nil end
	end
)

local katanahack = {}
addEvent("pAcao08", true)
addEventHandler("pAcao08", resourceRoot,
	function(item)
		if not katanahack[client] then
			katanahack[client] = true
			giveWeapon (client,8,999,true)
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Você ativou seu sabre de luz")
		else
			katanahack[client] = nil
			takeWeapon(client,8)
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "Sabre de luz desativado")
		end
	end
)
addEventHandler ( "onPlayerDamage", getRootElement(),
	function(attacker, attackerweapon)
		if (attackerweapon == 8) then
			if (katanahack[attacker]) then
				killPed ( source, attacker, attackerweapon )
			end
		end
	end
)
addEventHandler ( "onPlayerQuit", root,
	function()
		if (katanahack[source]) then katanahack[source] = nil end
	end
)

addEvent("pAcao12", true)
addEventHandler("pAcao12", resourceRoot,
	function(item)
		setElementModel(client, 22)
		triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Skin VIP setada")
	end
)
addEventHandler("onElementModelChange", root,
	function(oldskin)
		if getElementType ( source ) == "player" then
			if getElementModel ( source ) == 22 then
			local acc = getPlayerAccount ( source )
			local accName = getAccountName (acc)
			if not (isObjectInACLGroup ("user."..accName, aclGetGroup ( "Vip" ) )) then
					outputChatBox("*A skin "..tostring(22).." é exclusiva para jogadores VIPs",source,255,0,0,false)
					setTimer (  setElementModel, 100, 1, source, oldskin )
				end
			end
		end
	end
)

addEventHandler ( "onPlayerWeaponSwitch", root,
	function ( _, currentWeaponID )
		if (currentWeaponID == 8) then
			if (not katanahack[source]) then
				outputChatBox("*Arma exclusiva para jogadores VIPs",source,255,0,0,false)
				setTimer(takeWeapon,50,1,source,8)
			end
		end
	end
)

local bomb = {}
addEvent("pAcao15", true)
addEventHandler("pAcao15", resourceRoot,
	function(item)
		if (not bomb[client]) then
			bomb[client] = createObject(1654,getElementPosition(client))
			setElementCollisionsEnabled ( bomb[client], false )
			exports.bone_attach:attachElementToBone(bomb[client],client,11,0,-0.1,-0.1,0,0,0)
			bindKey(client,"x", "down", explodir)
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Você se tornou um homem-bomba")
		else
			removerBomb(client)
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "A bomba foi desarmada do seu corpo")
		end
	end
)
function explodir(player)
	local x,y,z = getElementPosition(player)
	for i=1,2 do createExplosion ( x, y, z, 6, player ) end
	killPed (player)
	removerBomb(player)
	unbindKey(player,"x", "down", explodir)
end
function removerBomb(player)
	if (bomb[player]) then
		if (isElement(bomb[player])) then
			if (exports.bone_attach:isElementAttachedToBone(bomb[player])) then
				exports.bone_attach:detachElementFromBone(bomb[player])
				if isElement(bomb[player]) then destroyElement(bomb[player]) end
				bomb[player] = nil
			end
		end
	end
end
addEventHandler ( "onPlayerQuit", root,
	function()
		removerBomb(source)
	end
)

addEvent("pAcao16", true)
addEventHandler("pAcao16", resourceRoot,
	function(item)
		for i = 69,79 do
			setPedStat(client, i, 999)
		end
		triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Seu personagem agora está com todas habilidades")
	end
)

addEvent("pAcao17", true)
addEventHandler("pAcao17", resourceRoot,
	function(item)
		if (not isPedHeadless (client)) then
			setPedHeadless(client, true)
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Você removeu sua cabeça")
		else
			setPedHeadless(client, false)
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "Você colocou sua cabeça no lugar")
		end
	end
)

addEvent("pAcao18", true)
addEventHandler("pAcao18", resourceRoot,
	function(item)
		if (getPedWalkingStyle(client) == 0) then
			setPedWalkingStyle(client,122)
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Modo de andar ativado")
		else
			setPedWalkingStyle(client,0)
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "Modo de andar desativado")
		end
	end
)

addEvent("pAcao19", true)
addEventHandler("pAcao19", resourceRoot,
	function(item)
		setPlayerWantedLevel ( client, 0 )
		triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Level de procurado foi zerado")
	end
)

addEvent("pAcao20", true)
addEventHandler("pAcao20", resourceRoot,
	function(item)
		setElementData(client, "Morreu", 0)
		triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Sua quantidade de mortes foi zerada")
	end
)

------------------------------------------------------------------

addEvent("vAcao01", true)
addEventHandler("vAcao01", resourceRoot,
	function(item)
		local veh = getPedOccupiedVehicle(client)
		if (veh) then
			if not (isVehicleDamageProof(veh)) then
				setVehicleDamageProof(veh, true)
				triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Seu veículo está indestrutível")
			else
				setVehicleDamageProof(veh, false)
				triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "Agora sei veículo pode receber dano")
			end
		end
	end
)

addEvent("vAcao02", true)
addEventHandler("vAcao02", resourceRoot,
	function(item)
		local veh = getPedOccupiedVehicle(client)
		if (veh) then
			if (getElementAlpha(veh) == 255) then
				setElementAlpha(veh,0)
				triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Invisibilidade do veículo foi ativada")
			else
				setElementAlpha(veh,255)
				triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "Invisibilidade do veículo foi desativada")
			end
		end
	end
)

local vipcar = {}
addEvent("vAcao03", true)
addEventHandler("vAcao03", resourceRoot,
	function(item)
		if (vipcar[client]) and (isElement(vipcar[client])) then destroyElement(vipcar[client]) end
		if isPedInVehicle(client) then removePedFromVehicle(client) end
		local rx,ry,rz = getElementRotation(client)
		local x,y,z = getElementPosition(client)
		vipcar[client] = createVehicle(506,x,y,z,rx,ry,rz)
		warpPedIntoVehicle(client,vipcar[client])
		triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Você pegou o carro VIP")
	end
)
addEventHandler ( "onVehicleStartEnter", root,
	function(player,seat)
		if getElementModel ( source ) == 506 and seat == 0 then
			local acc = getPlayerAccount ( source )
			local accName = getAccountName (acc)
			if not (isObjectInACLGroup ("user."..accName, aclGetGroup ( "Vip" ) )) then
				cancelEvent()
				outputChatBox("*O veículo "..getVehicleNameFromModel(506).." é exclusiva para jogadores VIPs",player,255,0,0,false)
			end
		end
	end
)
addEventHandler ( "onPlayerQuit", root,
	function()
		if (vipcar[source]) and (isElement(vipcar[source])) then
			destroyElement(vipcar[source])
			vipcar[source] = nil
		end
	end
)

addEvent("vAcao09", true)
addEventHandler("vAcao09", resourceRoot,
	function(item)
		if not getElementData(client,"arco_ires") then
			setElementData(client, "arco_ires", true)
			if (getElementData(client,"preto_branco")) then removeElementData(client,"preto_branco") end
			if (getElementData(client,"rosa_azul")) then removeElementData(client,"rosa_azul") end
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Cores de arco íres habilitado")
		else
			removeElementData(client,"arco_ires")
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "Cores de arco íres desativado")
		end
	end
)

addEvent("vAcao10", true)
addEventHandler("vAcao10", resourceRoot,
	function(item)
		if not getElementData(client,"preto_branco") then
			setElementData(client, "preto_branco", true)
			if (getElementData(client,"arco_ires")) then removeElementData(client,"arco_ires") end
			if (getElementData(client,"rosa_azul")) then removeElementData(client,"rosa_azul") end
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Pintura gradiente Branco-Preto ativado")
		else
			removeElementData(client,"preto_branco")
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "Pintura gradiente Branco-Preto desativado")
		end
	end
)

addEvent("vAcao11", true)
addEventHandler("vAcao11", resourceRoot,
	function(item)
		if not getElementData(client,"rosa_azul") then
			setElementData(client, "rosa_azul", true)
			if (getElementData(client,"arco_ires")) then removeElementData(client,"arco_ires") end
			if (getElementData(client,"preto_branco")) then removeElementData(client,"preto_branco") end
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Pintura gradiente Rosa-Azul ativado")
		else
			removeElementData(client,"rosa_azul")
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "Pintura gradiente Rosa-Azul desativado")
		end
	end
)

addEvent("vAcao12", true)
addEventHandler("vAcao12", resourceRoot,
	function(item)
		if not getElementData(client,"luzespolicias") then
			setElementData ( client, "luzespolicias", true )
			if (getElementData(client,"luzesdiscoteca")) then removeElementData(client,"luzesdiscoteca") end
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "As luzes policias foram ativadas")
		else
			removeElementData(client,"luzespolicias")
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "As luzes policias foram desativadas")
		end
	end
)

addEvent("vAcao13", true)
addEventHandler("vAcao13", resourceRoot,
	function(item)
		if not getElementData(client,"luzesdiscoteca") then
			setElementData ( client, "luzesdiscoteca", true )
			if (getElementData(client,"luzespolicias")) then removeElementData(client,"luzespolicias") end
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "ativado", item, "Luzes de discoteca habilitadas")
		else
			removeElementData(client,"luzesdiscoteca")
			triggerClientEvent ( client, "exibirNotificacao", resourceRoot, "desativado", item, "Luzes de discoteca foram desativadas")
		end
	end
)