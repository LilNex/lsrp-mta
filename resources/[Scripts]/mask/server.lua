function abrirVIP(player)
	local acc = getPlayerAccount ( player )
	local accName = getAccountName (acc)
	if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Everyone" ) ) then
			triggerClientEvent ( player, "AbrirGUI", resourceRoot )
	end
end

-- addEventHandler("onPlayerJoin", getRootElement(),
-- 	function()
-- 		bindKey(source, "F5", "down", abrirVIP)
-- 	end
-- )

-- addEventHandler("onResourceStart", getResourceRootElement(getThisResource()),
-- 	function()
-- 		for index, player in ipairs(getElementsByType("player")) do
-- 			-- bindKey(player, "F5", "down", abrirVIP)
-- 		end
-- 	end
-- )

addEvent("getVipValidade", true)
addEventHandler("getVipValidade", resourceRoot,
	function()
		--local vipTime = (call ( getResourceFromName ( "tempovip" ), "getVipTempo", client ))
		--local vipEnd = (call ( getResourceFromName ( "tempovip" ), "getVipValidade", client ))
		--if (vipTime and vipEnd) then
			--triggerClientEvent(client, "sendVipValidade", resourceRoot, vipTime, vipEnd)
		--end
	end
)