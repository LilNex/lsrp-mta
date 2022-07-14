local mysql = exports.mysql
setElementData(root, "Robbing", false)

--local rid = 1
addEventHandler("onResourceStart", resourceRoot,
function()

	db = dbConnect("sqlite", "database.db")
	dbExec(db, "CREATE TABLE IF NOT EXISTS Watercoller (id, x, y, z, rot, int, dim, weight)") --CREATE TABLE IF NOT EXISTS rubbish
	
	local result = dbPoll(dbQuery(db, "SELECT * FROM Watercoller"), -1)
	for k,t in ipairs(result) do
		local id, x, y, z, rot, int, dim, weight = t["id"],t["x"],t["y"],t["z"],t["rot"],t["int"],t["dim"],t["weight"]
		local Watercoller = createObject(2942, x, y, z, 0, 0, rot-180) -- -180 / 1808 -- 2002
		setElementDimension(Watercoller, dim)
		setElementInterior(Watercoller, int)
		setElementID(Watercoller,id)
		setElementFrozen(Watercoller,true)
		rid = id+1

	end
end
)


function withdraw()
	local amount = 500
	local bankmoney = getElementData(source, "bankmoney")
	if getElementData(source, "bankmoney") >= amount then
    exports.global:giveMoney(source, 500)
	exports.anticheat:changeProtectedElementDataEx(source, "bankmoney", bankmoney - amount, false)
	outputChatBox("[ATM] You withrawed 500$ from your bank account.", source, 128, 255, 0, true)
	showCursor(false)
	--setElementData(source, "bankmoney", getElementData(source, "bankmoney") -amount) 
    mysql:query_free("UPDATE characters SET bankmoney=bankmoney-'"..amount.."' WHERE id='"..getElementData(source, "dbid").."' ")
	end 
end
addEvent("withdraw", true)
addEventHandler("withdraw", root, withdraw)

function rob()
	local prices = {1400, 1500, 2000, 2300, 1000, 1500, 3000, 4000, 3750, 5000} 
	local amount = prices [ math.random ( #prices ) ] 
    -- local fireTeam = getTeamFromName("Los Santos Police Department")
	x,y,z = getElementPosition(source)
	local localidade = getZoneName(x, y, z)
	if not getElementData(source, "Robbing", true) then
		if (exports.global:hasItem( source, 404)) then 
			if (fireTeam) then
				-- local playersOnFireTeam = getPlayersInTeam ( fireTeam ) 
				exports.webhooker:sendLSPDDiscord("[RADIO] Here is dispatch , an ATM is being robbed at "..getElementZoneName(source).."! Please respond ASAP!")
				for k, v in ipairs (getElementsByType("player")) do
					fID = getElementData(v,"faction")
				  if fID == 1 or fID == 102 then 
					outputChatBox("[RADIO] Here is dispatch , an ATM is being robbed  at "..getElementZoneName(source).."! Please respond ASAP!",v,245, 40, 135)
					outputChatBox("[RADIO] Check your gps",v,245, 40, 135)
					local blip1 = createBlip ( x,y,z, 20 , 0, 0, 0, 255)
					setElementVisibleTo(blip, root, false)
					setElementVisibleTo(blip, v, true)
					playSoundFrontEnd ( v, 44 )

					setTimer ( function()
						destroyElement(blip1)
					end, 30000, 1)
				  end
				end
			end 
	           setElementFrozen(source, true)
		       setPedAnimation(source,"WEAPONS", "shp_1h_lift_end", 20000, true, false, false, false)
			   setElementData(source, "Robbing", true)
			   outputChatBox("[ATM-Rob] You are robbing this ATM , the LSPD has been alerted about this crime.", source, 128, 255, 0, true)
			   exports.global:takeItem(source, 404)
			setTimer(function(source)
			outputChatBox("[ATM-Rob] The ATM has been robbed , you got ".. amount .."$", source, 128, 255, 0, true)
			setElementFrozen(source, false)
			exports.global:giveMoney(source, amount)
			setElementData(source, "Robbing", false)
			end, 20000, 1, source)
		else 
			outputChatBox("[ATM-Rob] Error - You don't have the required item.", source, 255, 0, 0, true)
			setElementFrozen(source, false)
		end
	else 
		outputChatBox("[ATM-Rob] Error - You are already robbing.", source, 255, 0, 0, true)
		setElementFrozen(source, false)
		setElementData(source, "Robbing", false)
	end 
end
addEvent("rob", true)
addEventHandler("rob", root, rob)






function addwt(thePlayer)
local isStaff = exports.integration:isPlayerTrialAdmin(thePlayer)
if isStaff then
	local dimension = getElementDimension(thePlayer)
	local interior = getElementInterior(thePlayer)
	local x, y, z  = getElementPosition(thePlayer)

	local rotation = getPedRotation(thePlayer)
	local Watercoller = createObject(2942, x, y, z-0.1, 0, 0, rotation-180) -- z-0.1 -1808
	setElementDimension(Watercoller, dimension)
	setElementInterior(Watercoller, interior)
	setElementID(Watercoller,rid)
	setElementFrozen(Watercoller,true)

	dbExec(db, "INSERT INTO Watercoller VALUES(?, ?, ?, ?, ?, ?, ?, ?)", rid, x, y, z, rotation, interior, dimension, 0)

	local x = x + ((math.cos(math.rad(rotation)))*5)
	local y = y + ((math.sin(math.rad(rotation)))*5)
	setElementPosition(thePlayer, x, y, z)
	
	rid = rid + 1
end
end
--addCommandHandler("addwatercoller", addwt)

addEvent("Mk",true)
addEventHandler("Mk",root,
function()
	dbExec(db, "DELETE FROM Watercoller WHERE id = ?", tonumber(getElementID(source)))
	destroyElement(source)
end)


