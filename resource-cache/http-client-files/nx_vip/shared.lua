

VIP = {}

function isPlayerVip(plr)
	triggerEvent("vip:Update",getResourceRootElement())

	local accID = tonumber(getElementData(plr,"account:id")) or false
	if accID then 
		if VIP[accID] > 0 then 
			return VIP[accID]
		else  
			return 0 
		end 

	end
end 

function getVipList()
	triggerEvent("vip:Update",getResourceRootElement())
	return VIP

end
triggerEvent("vip:Update",getResourceRootElement())
