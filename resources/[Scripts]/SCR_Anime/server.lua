
function animasyonyap(sira, durum)
	for i,v in pairs(getElementsByType("player")) do
		if getElementData(v, "dans") then
		if durum == "Special" then
		triggerClientEvent("animasyon2",v,v,sira,"Special")
		end
			if durum == "Normal" then
			triggerClientEvent("animasyon2",v,v,sira,"Normal")
			end
		end	
	end
end
addEvent("animasyonyap", true)
addEventHandler("animasyonyap",root, animasyonyap)


function animasyonbitir(plr)
		setPedAnimation(plr)
end
addEvent("animasyonbitir", true)
addEventHandler("animasyonbitir",root, animasyonbitir)


addCommandHandler("Special",function(plr)
for i,v in pairs(getElementsByType("player")) do
	if v == plr then
	triggerClientEvent("animasyon2",v,v,0,"animboz")
	end
end
end)

