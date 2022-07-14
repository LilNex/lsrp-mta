-- Sx = StriZeX

-- Backup : LRSP



local rid = 1

addEventHandler("onResourceStart", resourceRoot,

function()



	db = dbConnect("sqlite", "database.db")

	dbExec(db, "CREATE TABLE IF NOT EXISTS rubbish (id, x, y, z, rot, int, dim, weight)")

	

	local result = dbPoll(dbQuery(db, "SELECT * FROM rubbish"), -1)

	for k,t in ipairs(result) do

		local id, x, y, z, rot, int, dim, weight = t["id"],t["x"],t["y"],t["z"],t["rot"],t["int"],t["dim"],t["weight"]

		local rubbish = createObject(1331, x, y, z, 0, 0, rot-180) 

		setElementDimension(rubbish, dim)

		setElementInterior(rubbish, int)

		setElementID(rubbish,id)

		setElementData(rubbish,"rubbs",weight)

		setElementFrozen(rubbish,true)

		rid = id+1

		-- outputChatBox(t["id"]..", "..t["x"]..", "..t["y"]..", "..t["z"]..", "..t["rot"]..", "..t["int"]..", "..t["dim"]..", "..t["weight"])

	end

end

)













function addTrush(thePlayer)

local isStaff = exports.integration:isPlayerTrialAdmin(thePlayer)

if isStaff then

	local dimension = getElementDimension(thePlayer)

	local interior = getElementInterior(thePlayer)

	local x, y, z  = getElementPosition(thePlayer)



	local rotation = getPedRotation(thePlayer)

	local rubbish = createObject(1331, x, y, z-0.1, 0, 0, rotation-180) 

	setElementDimension(rubbish, dimension)

	setElementInterior(rubbish, interior)

	setElementID(rubbish,rid)

	setElementData(rubbish,"rubbs",0)

	setElementFrozen(rubbish,true)



	dbExec(db, "INSERT INTO rubbish VALUES(?, ?, ?, ?, ?, ?, ?, ?)", rid, x, y, z, rotation, interior, dimension, 0)



	local x = x + ((math.cos(math.rad(rotation)))*5)

	local y = y + ((math.sin(math.rad(rotation)))*5)

	setElementPosition(thePlayer, x, y, z)

	

	rid = rid + 1

end

end

addCommandHandler("addrubbish", addTrush)



addEvent("Sx",true)

addEventHandler("Sx",root,

function()

	dbExec(db, "DELETE FROM rubbish WHERE id = ?", tonumber(getElementID(source)))

	destroyElement(source)

end)



addEvent("prub",true)

addEventHandler("prub",root,

function(thePlayer)

local tt = getElementData(source,"rubbs")

	if tt < 40 then 

		setElementData(source,"rubbs",tt+1)

		dbExec(db, "UPDATE rubbish SET weight = ? WHERE id = ?", tt+1, getElementID(source))

		exports.global:takeItem(thePlayer, 216, 1)

	end

end)



addEvent("trub",true)

addEventHandler("trub",root,

function(thePlayer)

local tn = getElementData(source,"rubbs")

	if tn > 0 then 

		setElementData(source,"rubbs",tn-1)

		dbExec(db, "UPDATE rubbish SET weight = ? WHERE id = ?", tn+1, getElementID(source))

		exports.global:giveItem(thePlayer, 216, 1)

	end

end)



addEvent("sellnow",true)

addEventHandler("sellnow",root,

function() 

local plastic = 3 --3Sx

local wood = 4  --4Sx

local iron = 5  -- 5Sx

local other = math.random(wood,iron)

local money = math.random(plastic,other)

	local takerub = exports.global:giveMoney(source, money) and exports.global:takeItem(source, 216, 1) 



	

	if (takerub) then

		if money == plastic then

			outputChatBox(">You sell Plastices",source, 0, 255, 0)

		elseif money == other then

		if other == iron then

			outputChatBox(">You sell Iron",source, 0, 255, 0)

		elseif other == wood then

			outputChatBox(">You sell wood",source, 0, 255, 0)

			end

		end

	end

end)