local Amountm = 300 
local Amountn = 600 
blipLift = nil

-- function displayLoadedRes ( res )
-- 	outputChatBox ( "#0000FF[EVENTS] : #FFFFFFتم بداء حدث سرقة المتاجر", root, 255, 255, 255, true )
-- end
-- addEventHandler ( "onResourceStart", root, displayLoadedRes )

maxCaisse = 30000
addEvent("shop-lifting:end", true)
addEventHandler("shop-lifting:end", root, function(ped)
	-- if isElementWithinColShape(source, col) then 
		outputChatBox("event",source)
	if getElementData(source,"robbing") then 
		outputChatBox("give",source)

		local Amount = tonumber(getElementData(ped,"caisse"))
		setElementData(ped,"caisse", 0)
		exports['global']:giveDirtyMoney(source, Amount)
		exports["SCR_Notifs"]:show_box(source, "You received $"..Amount.." of dirty money. Run for your life!", "info")
		setElementData(source,"robbing",false)
		-- COOLDOWN
		setTimer(function(ped)
			setElementData(ped,"robbed", false)


		end,300000,1,ped)
	else 
		exports["SCR_Notifs"]:show_box(source,"You failed the robbing ! ","error")
	end 
	-- end
	-- 
end)

function whenPlayerChangeChar()
	if source == source then
		if getElementData(source,"robbing") then
			triggerClientEvent(source, "endLiftingShop", source)
		end
	end
end
addEvent("updateCharacters", true)
addEventHandler("updateCharacters", root, whenPlayerChangeChar)


addEvent("fillShop")
addEventHandler("fillShop",root,function()
	local peds = getElementsByType("ped")
	for k,v in ipairs(peds) do 
		if (getElementData(v,"ped:type") or "none") == "shop" then 
			caisse = tonumber(getElementData(v,"caisse")) or 0
			if not (caisse > maxCaisse) then 
				Amount = math.random(Amountm, Amountn)
				setElementData(v,"caisse", (caisse + Amount) )

			end
		end

	end 
end)

addEventHandler("onResourceStart", getResourceRootElement(),function()
	triggerEvent("fillShop",root)
	triggerEvent("fillShop",root)
end)

setTimer(function()
	triggerEvent("fillShop",root)

end,300000,0)


addEvent("sendMessageToTeam", true)
addEventHandler("sendMessageToTeam", root,
function(teamName, message, theLift)
	str = message.." at "..exports.gps:getPlayerStreetLocation(theLift).."! Please respond ASAP!"
	-- str = message.." at ".."nil".."! Please respond ASAP!"
	-- exports.webhooker:sendLSPDDiscord(str)

	for k,v in ipairs(getElementsByType("player")) do
		if tonumber(getElementData(v,"faction")) == 1 then
		local duty = tonumber(getElementData(v, "duty"))
		if (duty>=0) then
			-- triggerClientEvent(v, "createBackupBlip2", theLift)
			local x,y,z = getElementPosition(theLift)
			local dim = getElementDimension(theLift)
			local interior = getElementInterior(theLift)
			if interior > 0 then 
				data = mysql:query_fetch_assoc("SELECT * FROM interiors WHERE id = '"..tostring(interior).."'")
				local bx = tonumber(data["interiorx"])
				local by = tonumber(data["interiory"])
				local bz = tonumber(data["interiorz"])
				marker = createMarker(x,y,z, "checkpoint", 20,255, 0, 0, 30, getResourceRootElement())
				blip = createBlip(x,y,z,0,3,255,0,0,255,0,99999.0,getResourceRootElement())
				setElementVisibleTo(marker,v,true)
				setElementVisibleTo(blip,v,true)
				outputChatBox(message, v, 255, 194, 14)
				-- attachElements(marker,blip)
				addEventHandler("onMarkerHit", marker,function(hitElement)
					-- for k,v in ipairs(getAttachedElements(marker)) do
					-- 	destroyElement(v)
					-- end
					setElementVisibleTo(marker,hitElement,false)
					setElementVisibleTo(blip,hitElement,false)
					
				end)
			else 
				blipLift = createBlip(x,y,z,0,2,255,0,0,255,0,99999.0,getResourceRootElement())
				markerLift = createMarker(x,y,z, "checkpoint", 30,255, 0, 0, 0, getResourceRootElement())
				setElementVisibleTo(markerLift,v,true)
				setElementVisibleTo(blipLift,v,true)
				-- attachElements(markerLift,blipLift)
				outputChatBox(message, v, 255, 194, 14)--getPlayerStreetLocation
				addEventHandler("onMarkerHit", markerLift,function(hitElement)
					-- for k,v in ipairs(getAttachedElements(markerLift)) do
					-- 	destroyElement(v)
					-- end
					setElementVisibleTo(markerLift,hitElement,false)
					setElementVisibleTo(blipLift,hitElement,false)
					-- setElementAlpha(markerLift,0)
					
				end)
			end
			
		end
		end
	end
	
end)

function delBlipLift()
	destroyElement(blipLift)
end
addEvent("delTheBlipLift", true)
addEventHandler("delTheBlipLift", root, delBlipLift)