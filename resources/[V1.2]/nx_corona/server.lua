
-- mysql = exports.mysql

-- function updateList()
-- 	local q = mysql:query("SELECT * FROM corona ")
-- 	local tab = {}
-- 	while true do
-- 		local row = mysql:fetch_assoc(q)
-- 		if not row then break end 
-- 		table.insert(tab,row)

-- 	end
-- 	for k,v in ipairs(tab) do 
-- 		VIP[tonumber(v["charID"])] = [tonumber(v["dose1"]),tonumber(v["dose1"])]
-- 	end 
	
-- 	for k,v in ipairs(getElementsByType("player")) do 
-- 		local id = tonumber(getElementData(v,"account:id"))
-- 		if VIP[id] then 
-- 			setElementData(v,"nx_vip",VIP[id])
-- 		else 
-- 			setElementData(v,"nx_vip",0)

-- 		end 
-- 	end 
	
-- end

-- 
addCommandHandler("givepasscorona",function(player,cmd,p1)
	if getElementData(player,"faction") == 2 then 
		if p1 then 
			local owner, ownerName = exports.global:findPlayerByPartialNick(player, p1)
			local charID = getElementData(owner,"dbid")
			exports.global:giveItem(owner,650,tonumber(charID))
			outputChatBox("You gave "..getPlayerName(owner).." a vaccinal pass.",player,0,255,0)
			outputChatBox(" "..getPlayerName(player).." gived you a vaccinal pass.",owner,0,255,0)

		else 	
			outputChatBox("SYNTAX : /"..cmd.." [pass owner name]",player)
			
		end 

	end
end)


