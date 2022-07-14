--[[
© Creditos do script: #Mods MTA:SA

© Creditos da pagina postadora: DropMTA

© Discord DropMTA: https://discord.gg/GZ8DzrmxUV

Acesse nosso site de mods: https://dropmta.blogspot.com/

]]--
locations={
	--N3x
	[1]={305.78515625, -93.4560546875, 997.93127441406, 0, 0, 185.05378723145,2153,10},
	[2]={306.548828125, -93.4560546875, 997.93811035156, 0, 0, 185.05378723145,2153,10},
	[3]={307.2529296875, -93.4560546875, 997.93811035156, 0, 0, 185.05378723145,2153,10},


	-- SHANKIZ
	[4]={1408.43359375, 1835.6083984375, 11.842970085144, 0, 0, 185.05378723145,2738,11},
	[5]={1409.46484375, 1835.609375, 11.842970085144, 0, 0, 185.05378723145,2738,11},
	-- [4]={306.548828125, -93.4560546875, 997.93811035156, 0, 0, 185.05378723145,2153,10},

	--9W9IZA
	[6]={ 1132.896484375, -1.59375, 1000.6796875, 0, 0, 185.05378723145,1000,12},
	[7]={1135.107421875, -3.8681640625, 1000.6796875, 0, 0, 185.05378723145,1000,12},
	[8]={1134.990234375, 0.6103515625, 1000.6796875, 0, 0, 185.05378723145,1000,12},

}

local function takeStake(stake)
	if source ~= client then
		outputDebugString("Possível trapaceiro no cassino", 2)
	end
	-- takePlayerMoney(client, stake)
	exports.global:takeMoney(client,stake)
end

local function givePrize(prize)
	if source ~= client then
		outputDebugString("Possível trapaceiro no cassino", 2)
	end
	-- givePlayerMoney(client, prize)
	exports.global:giveMoney(client,prize)

end

addEvent("casinoTakePlayerMoney", true)
addEvent("casinoGivePlayerMoney", true)
addEventHandler("casinoTakePlayerMoney", root, takeStake)
addEventHandler("casinoGivePlayerMoney", root, givePrize)


addCommandHandler("addcasinoplay",function(player,cmd)
	-- local x,y,z = getElementPosition(player)
	-- local rx,ry,rz= getElementRotation(player)
	-- mSlot = createObject(1834,x,y,z-0.75,rx,ry,rz)
	-- local pSlot = createMarker(x, y-1, z-0.5,"cylinder",1,0,150,0,30)
	-- addEventHandler("onMarkerHit",pSlot,function(hitE)
	-- 	triggerClientEvent(hitE,"casino:openGUI",hitE,hitE)
	-- end)

end)

for k,v in ipairs(locations) do 
	-- outputChatBox(toJSON(v),root)
	local mSlot = createObject(1834, v[1], v[2], v[3]-0.75, v[4], v[5], v[6])
	local pSlot = createMarker(v[1], v[2], v[3]-0.5,"cylinder",0.7,0,150,0,30)
	setElementDimension(pSlot,v[7])
	setElementInterior(pSlot,v[8])

	addEventHandler("onMarkerHit",pSlot,function(hitE)
		triggerClientEvent(hitE,"casino:openGUI",hitE,hitE)
	end)

end