-- MaYsTrO
local textsToDraw = {}
local font = "default-bold"
local fontHeight = 20
local characteraddition = 50
local statusColor = {247, 255, 35}

function addStatus(message)
	local infotable = {source,message,1}
	for i,k in pairs(textsToDraw) do
		if k[1] == source then
			removeStatus(k)
		end
	end

	for i,infotable in ipairs(textsToDraw) do
		if infotable[1] == source then
			infotable[3] = infotable[3] + 1
			notfirst = true
		end
	end
	local infotable = {source,message,-1}
	table.insert(textsToDraw,infotable)

end

function removeStatus(infotable)
	for i,v in ipairs(textsToDraw) do
		if v[1] == infotable[1] and v[2] == infotable[2] then
			table.remove(textsToDraw,i)
			break
		end
	end
end

function getStatusTextsToRemove()
	for i,v in ipairs(textsToDraw) do
		if v[1] == source then
			removeStatus(v)
		end
	end
end

function clearStatusTexts(source)
	for i,v in ipairs(textsToDraw) do
		if v[1] == source then
			removeStatus(v)
		end
	end
end
addEvent("clearStatus", true)
addEventHandler("clearStatus", getRootElement(), clearStatusTexts)

function displayStatus()
	for i,infotable in ipairs(textsToDraw) do
		local camPosXl, camPosYl, camPosZl = getPedBonePosition (infotable[1], 6)
		local camPosXr, camPosYr, camPosZr = getPedBonePosition (infotable[1], 7)
		local x,y,z = (camPosXl + camPosXr) / 2, (camPosYl + camPosYr) / 2, (camPosZl + camPosZr) / 2
		--local posx,posy = getScreenFromWorldPosition(x,y,z+0.25)
		local cx,cy,cz = getCameraMatrix()
		local px,py,pz = getElementPosition(infotable[1])
		local distance = getDistanceBetweenPoints3D(cx,cy,cz,px,py,pz)
		local posx,posy = getScreenFromWorldPosition(x,y,z+0.020*distance+0.10)
		local blocking = getPedOccupiedVehicle(getLocalPlayer()) or getPedOccupiedVehicle(infotable[1]) or nil
		if posx and distance <= 45 and isLineOfSightClear(cx,cy,cz,px,py,pz,true,true,false,true,false,true,true, blocking) then -- change this when multiple ignored elements can be specified
			local width = dxGetTextWidth(infotable[2],1,font)
			
			dxDrawRectangle(posx - (3 + (0.5 * width)),posy - (2 + (infotable[3] * fontHeight)),width + 5,19,tocolor(0,0,0,180))
            dxDrawRectangle(posx - (3 + (0.5 * width)),posy - (2 + (infotable[3] * fontHeight)),width + 0.50,1,tocolor(247, 255, 35, 255))

			dxDrawText(infotable[2],posx - (0.5 * width),posy - (infotable[3] * fontHeight),posx - (0.5 * width),posy - (infotable[3] * fontHeight),tocolor(unpack(statusColor)),1,font,"left","top",false,false,false)
		end
	end
end
addEvent("onClientStatus", true)
addEventHandler("onClientStatus",getRootElement(),addStatus)

addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), function()
	addEventHandler("onClientPlayerQuit",getRootElement(),getStatusTextsToRemove)
	addEventHandler("onClientRender",getRootElement(),displayStatus)
end)