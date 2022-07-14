
mysql = exports.mysql

function updateList()
	local q = mysql:query("SELECT id,vip FROM accounts WHERE vip > 0")
	local tab = {}
	while true do
		local row = mysql:fetch_assoc(q)
		if not row then break end 
		table.insert(tab,row)

	end
	for k,v in ipairs(tab) do 
		VIP[tonumber(v["id"])] = tonumber(v["vip"])
	end 
	-- outputConsole("CONSOLE")
	for k,v in ipairs(getElementsByType("player")) do 
		local id = tonumber(getElementData(v,"account:id"))
		if VIP[id] then 
			setElementData(v,"nx_vip",VIP[id])
		else 
			setElementData(v,"nx_vip",0)

		end 
	end 
	
end
updateList()
function getMyData ( thePlayer, command )
	local data = getAllElementData ( thePlayer )     -- get all the element data of the player who entered the command
	for k, v in pairs ( data ) do                    -- loop through the table that was returned
		outputConsole ( k .. ": " .. tostring ( v ) )             -- print the name (k) and value (v) of each element data, we need to make the value a string, since it can be of any data type
	end
end
addCommandHandler("mydata",getMyData)


function amIVip ( thePlayer, command )
	 local bool = isPlayerVip(thePlayer)
	outputConsole ( "VIP : "..tostring(bool))         

end
addCommandHandler("amivip",amIVip)
addEvent("vip:Update",true)
addEventHandler('vip:Update',root,updateList)


addEventHandler("onPlayerSpawn", root, updateList)
addEventHandler("onResourceStart", resourceRoot, updateList)