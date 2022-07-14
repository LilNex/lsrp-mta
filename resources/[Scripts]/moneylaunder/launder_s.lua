
mysql = exports.mysql


laundersP={}



function createMoneyLaunder(player,cmd,owner,maxl)
    if getElementData(player,"faction") == LAUNDER_FACTION then
        local owner, ownerName = exports.global:findPlayerByPartialNick(player, owner)
        if owner and tonumber(maxl) then
            local lP = {}
            local x,y,z = getElementPosition(player)
            local dim = getElementDimension(player)
            local int = getElementInterior(player)
            z = z-0.74
            lP.point = createMarker(x,y,z,"cylinder",1.5,255,150,0,70)
            setElementDimension(lP.point,dim)
            setElementInterior(lP.point,int)
            lP.maxlaunder = tonumber(maxl)
            lP.toFaction = tonumber(getElementData(player,"faction"))
            lP.ownerID = tonumber(getElementData(owner,"dbid"))
            mysql:query_insert_free("INSERT INTO launders ( x, y, z, dim,intr, maxlaunder,ownerID, toFaction) VALUES ("..tostring(x)..", "..tostring(y)..", "..tostring(z)..", "..tostring(dim)..", "..tostring(int)..", "..tostring(lP.maxlaunder)..", "..tostring(lP.ownerID)..", "..tostring(lP.toFaction).." )")
            addEventHandler("onMarkerHit", lP.point, function(hitElement)
                if tonumber(getElementData(hitElement, "dbid")) == lP.ownerID then
                if not isPedInVehicle(hitElement) then
                    triggerClientEvent(hitElement,"launder-menu:open",hitElement,lP)
            
                    setElementFrozen(hitElement, true)
                else 
                    outputChatBox("Can't do that with a vehicle", hitElement)
            
                end
            else
                outputChatBox("It's not your business, contact the owner.",hitElement)
            end
            
            end)
            table.insert(laundersP, lP)
            lP = nil
            
        else 
            outputChatBox("SYNTAX : /createmoneylaunder [owner] [max ammount launder]",player)
        end
    end

end
addCommandHandler("createmoneylaunder",createMoneyLaunder)



-- addEventHandler("onMarkerHit", launderP.point, function(hitElement)
--     if not isPedInVehicle(hitElement) then
--         triggerClientEvent(hitElement,"launder-menu:open",hitElement,launderP)

--         setElementFrozen(hitElement, true)
--     else 
--         outputChatBox("Can't do that with a vehicle", hitElement)

--     end

-- end)


function launder(thePlayer, launderP)
        maxLaunder = launderP.maxlaunder
          if not isPedInVehicle(thePlayer)  then
               paymenet = math.random(373,543)
               paymenet1 = math.random(643,824)
            --if getElementData(thePlayer, "job") == 11 then
                setPedAnimation(thePlayer, "BOMBER", "BOM_Plant", 20000, true, false, false, false)
                
                setTimer(function()

                    if exports.global:takeDirtyMoney(thePlayer, maxLaunder) then
                        f = (maxLaunder * 90) / 100
                        exports.global:giveMoney(thePlayer, f)
                        cancel[thePlayer] = true
                        setTimer(function()
                            cancel[thePlayer] = false                            
                        end,300000,1)
                        setPedAnimation(thePlayer, false)
                        mysql:query_free("UPDATE characters SET bankmoney = bankmoney + '"..tostring(maxLaunder - f).."' WHERE id = '"..tostring(594).."' ")
                        -- setElementFrozen(thePlayer, false)
                        exports["SCR_Notifs"]:show_box(thePlayer, "10% was took from $"..maxLaunder, "info") 
                    else
                        setPedAnimation(thePlayer, false)
                        -- setElementFrozen(thePlayer, false)

                        exports["SCR_Notifs"]:show_box(thePlayer,"You don't have dirty money", "Info")
                    end
                -- else
                --     outputChatBox("Come back boss !!!",thePlayer, 255, 255, 255,true)
                --   end
            
                end,20000,1)
            
            --   else
              --         exports["SCR_Notifs"]:show_box(thePlayer,"You have nothing to do here kid", "Info")
           --    end
              
          else
                   outputChatBox("Can't do that boss !",thePlayer, 255, 255, 255,true)
           end
            
        -- end,5000,0 )
end

addEvent("startLaunder",true)
addEventHandler("startLaunder",root, launder)


addEventHandler("onResourceStart",getResourceRootElement(),function()
    local q = mysql:query("SELECT * FROM launders")
	while true do
		local row = mysql:fetch_assoc(q)
		if not row then break end
        local x = row["x"]
        local y = row["y"]
        local z = row["z"]
        local dim = row["dim"]
        local int = row["intr"]
        local lP = {}
        lP.point = createMarker(x,y,z,"cylinder",1.5,255,0,0,70)
        setElementDimension(lP.point,dim)
            setElementInterior(lP.point,int)
        lP.maxlaunder = row["maxlaunder"]
        lP.toFaction = row["toFaction"]
        lP.ownerID = row["ownerID"]
        addEventHandler("onMarkerHit", lP.point, function(hitElement)
            if not isPedInVehicle(hitElement) then
                if tonumber(getElementData(hitElement,"dbid")) == tonumber(lP.ownerID) then
                    triggerClientEvent(hitElement,"launder-menu:open",hitElement,lP)
        
                    setElementFrozen(hitElement, true)
                else 
                    outputChatBox("It's not your business",hitElement)
                end
            else 
                outputChatBox("Can't do that with a vehicle", hitElement)
        
            end
        
        end)

        table.insert(laundersP, lP)

    end
    mysql:free_result(q)


end)