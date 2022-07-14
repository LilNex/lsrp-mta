--------------------------------------------------
--------------------------------------------------
--												--
--				Script By : LilNex				--
--		                            			--
--												--
--------------------------------------------------
--------------------------------------------------



mysql = exports.mysql
setDevelopmentMode(true)
-- local Marker_Take = createMarker(1108.1650390625, -343.962890625, 74 -1, "arrow", 1.5, 0, 255, 0, 100) 

-- local Marker_Plant = createMarker(1095.697265625, -317.197265625, 73.9921875 -1, "cylinder", 1.5, 255, 255, 255, 100) 

-- local Marker_Harvest = createMarker(1095.697265625, -317.197265625, 73.9921875 -1, "cylinder", 1.5, 255, 255, 255, 2) 
local pArea = {}
local fArea = {}


function addJobFarm(player, cmd,  type)
    if type then
     if tonumber(getElementData(player,"admin_level")) >= 2 then
        local strType = ""
        if tonumber(type) == 1 then strType = "wood"
        elseif tonumber(type) == 2 then strType = "mine"
        end
        -- fName = mysql:query_fetch_assoc("SELECT name FROM `factions` WHERE `id`='" .. tostring(idFaction) .. "'")
        outputChatBox("This planting area ("..strType..") was set to civilians ", player,0,250,0)
        local x,y,z = getElementPosition(player)
        p = {}
        p.col = createColRectangle(x-15,y-15,30,30)
        p.marker = createMarker (x,y, z, "cylinder", 30, 20, 150, 20, 15 )
        p.blip = createBlip (x,y, z, 62)
        
        -- p.factionID = tonumber(idFaction)
        p.type = tonumber(type)
        p.strType = strType
        addEventHandler("onColShapeHit",p.col,function(source)
            if tonumber(type) == 1 then exports["SCR_Notifs"]:show_box(source, "Press N to start farm.", "info")
            elseif tonumber(type) == 2 then exports["SCR_Notifs"]:show_box(source, "Press N to start mine.", "info")
            elseif tonumber(type) == 3 then exports["SCR_Notifs"]:show_box(source, "Press N to collect garbage.", "info")
            elseif tonumber(type) == 4 then exports["SCR_Notifs"]:show_box(source, "Press N to collect sand.", "info")
            else exports["SCR_Notifs"]:show_box(source, "Press N to start farm.", "info")
            end
            bindKey(source,"N","down",farm)
    
       end)
       addEventHandler("onColShapeLeave",p.col,function(source)
        unbindKey(source,"N","down",farm)

   end)
    outputChatBox("sql insert",player)
       mysql:query_insert_free("INSERT INTO jobfarms ( x, y, z, type, strtype) VALUES ('"..tostring(x).."', '"..tostring(y).."', '"..tostring(z).."', '"..tostring(p.type).."', '"..tostring(p.strType).."' )")
    outputChatBox("table insert",player)
       
       table.insert(fArea,p)
     else
        outputChatBox("Can't do that homie ! Call an admin")
     end

    else
        outputChatBox("Syntax use: /addJobFarm [Type]",player)
        outputChatBox("Types : ",player)
        outputChatBox("1 - Wood ",player)
        outputChatBox("2 - Miner ",player)
        outputChatBox("3 - Recycler ",player)
        outputChatBox("4 - Glass ",player)
        
    end
end

addCommandHandler("addJobFarm", addJobFarm,false,false)


function addProcessArea(player, cmd, type)
    
    if type then
     if tonumber(getElementData(player,"admin_level")) >= 2 then
        local strType = ""
        if tonumber(type) == 1 then strType = "wood"
        elseif tonumber(type) == 2 then strType = "mine"
        elseif tonumber(type) == 3 then strType = "plastic"
        elseif tonumber(type) == 4 then strType = "glass"
        end
        -- fName = mysql:query_fetch_assoc("SELECT name FROM `factions` WHERE `id`='" .. tostring(idFaction) .. "'")
        outputChatBox("This processing area ("..strType..") was set to civilians ", player,0,250,0)
        local x,y,z = getElementPosition(player)
        p = {}
        p.col = createColRectangle(x-15,y-15,30,30)
        p.marker = createMarker (x,y, z, "cylinder", 30, 20, 20, 150, 15 )
        p.blip = createBlip (x,y, z, 61)

        -- p.factionID = tonumber(idFaction)
        p.type = tonumber(type)
        p.strType = strType
        addEventHandler("onColShapeHit",p.col,function(source)
            if tonumber(type) == 1 then exports["SCR_Notifs"]:show_box(source, "Press N to process wood into planks", "info")
            elseif tonumber(type) == 2 then exports["SCR_Notifs"]:show_box(source, "Press N to process minerals into iron", "info")
            elseif tonumber(type) == 3 then exports["SCR_Notifs"]:show_box(source, "Press N to recycle garbage into plastic", "info")
            elseif tonumber(type) == 4 then exports["SCR_Notifs"]:show_box(source, "Press N to process sand into glass", "info")
            else exports["SCR_Notifs"]:show_box(source, "Press N to start farm.", "info")
            end
            bindKey(source,"N","down",process)
    
       end)
       addEventHandler("onColShapeLeave",p.col,function(source)
        unbindKey(source,"N","down",process)

   end)
       mysql:query_insert_free("INSERT INTO jobprocess ( x, y, z,  type, strtype) VALUES ('"..tostring(x).."', '"..tostring(y).."', '"..tostring(z).."', '"..tostring(p.type).."', '"..tostring(p.strType).."' )")
       table.insert(pArea,p)
     else
        outputChatBox("Can't do that homie ! Call an admin")
     end

    else
        outputChatBox("Syntax use: /addProcessArea [Type]",player)
        outputChatBox("Types : ",player)
        outputChatBox("1 - Wood ",player)
        outputChatBox("2 - Miner ",player)
        outputChatBox("3 - Plastic ",player)
        outputChatBox("4 - Glass ",player)
    end
end


addCommandHandler("addProcessArea", addProcessArea,false,false)





function info (source)
    outputChatBox("[System] To get the marijuana plant type /takemarijuana", source, 51, 145, 251, true) 
    
end
-- addEventHandler("onMarkerHit", Marker_Take, info)





function farm (source)
    for k,v in ipairs(fArea) do


        if isElementWithinColShape(source, fArea[k].col) then
            local f = {}
            f.type = fArea[k].type

            if f.type == 1 then 
                f.neededItem = 505
                f.giveItem = 501
                f.anim1 = "CHAINSAW"
                f.anim2 = "CSAW_1"  
            elseif f.type == 2 then 
                f.neededItem = 510
                f.giveItem = 506
                f.anim1 = "CHAINSAW"
                f.anim2 = "CSAW_1"
            elseif f.type == 3 then 
                f.neededItem = 515
                f.giveItem = 216
                f.anim1 = "rob_bank"
                f.anim2 = "cat_safe_rob"
            elseif f.type == 4 then 
                f.neededItem = 515
                f.giveItem = 520
                f.anim1 = "rob_bank"
                f.anim2 = "cat_safe_rob"
            end
        -- if (getElementData(getPlayerTeam(source), "type")) == 2 then 
            if exports.global:hasItem( source, f.neededItem) then -- item pickaxe
              if exports["item-system"]:hasSpaceForItem(source,f.giveItem) then
                if  not getElementData(source, "Taking", true) then
                               if f.type == 1 then exports["SCR_Notifs"]:show_box(source, "You started farming wood.", "info")
                               elseif f.type == 2 then exports["SCR_Notifs"]:show_box(source, "You started mining minerals.", "info")
                               elseif f.type == 3 then exports["SCR_Notifs"]:show_box(source, "You started collecting garbage.", "info")
                               elseif f.type == 4 then exports["SCR_Notifs"]:show_box(source, "You started collecting sand.", "info")
                               else exports["SCR_Notifs"]:show_box(source, "You started farming.", "info")
                                end
                                
                               setElementData(source, "Taking", true)
                               setPedFrozen(source, true)
                               setPedAnimation(source, f.anim1, f.anim2, 20000, true, false, false, false) 
                            setTimer(function()
                                setPedFrozen(source, false)

                                if f.type == 1 then executeCommandHandler("ame", source,"cut the three down.")
                                elseif f.type == 2 then executeCommandHandler("ame", source,"mine the rock.")
                                elseif f.type == 3 then executeCommandHandler("ame", source,"collect garbages.")
                                elseif f.type == 4 then executeCommandHandler("ame", source,"collect sands.")
                                end

                                if f.type == 1 then exports["SCR_Notifs"]:show_box(source, "You got a wood timber. Go to process it into a plank on marker", "info")
                                elseif f.type == 2 then exports["SCR_Notifs"]:show_box(source, "You got a stone mineral. Go to process it into iron on marker", "info")
                                elseif f.type == 3 then exports["SCR_Notifs"]:show_box(source, "You got a garbage bin. Go to process it into plastic on marker", "info")
                                elseif f.type == 4 then exports["SCR_Notifs"]:show_box(source, "You got a bag of sand. Go to process it into glass on marker", "info")
                                end

                                exports.global:giveItem (source, f.giveItem, 1 )
                                -- exports["exp_system"]:addPlayerEXP(source,15)
                                setElementData(source, "Taking", false)
                                -- setElementVisibleTo(Marker_Plant, source, false)
                            end, Take_Time, 1)
                else 
                    exports["SCR_Notifs"]:show_box(source, "You already taking "..fArea[k].strType.." , stand by.", "error") 
                end
               else
                exports["SCR_Notifs"]:show_box(source, "You don't have space in your inventory", "error") 

               end
            else 
                exports["SCR_Notifs"]:show_box(source, "You don't have tools for that", "error") 
            end
        -- else
        --     exports["SCR_Notifs"]:show_box(source, "You are not a gang membre", "error") 
        -- end
        end
    end
end
addCommandHandler("farm", farm) 


function process (source)
  for k,v in ipairs(pArea) do
    if isElementWithinColShape(source, pArea[k].col) then
        local f = {}
        f.type = pArea[k].type
     --    outputConsole("area t : "..tostring(pArea[k].type), source)
            if f.type == 1 then 
                f.neededItem = 501
                f.giveItem = 502
                f.anim1 = "CHAINSAW"
                f.anim2 = "CSAW_1"
            elseif f.type == 2 then 
                f.neededItem = 506
                f.giveItem = 507
                f.anim1 = "CHAINSAW"
                f.anim2 = "CSAW_1"
            elseif f.type == 3 then 
                f.neededItem = 216
                f.giveItem = 516
                f.anim1 = "CHAINSAW"
                f.anim2 = "CSAW_1"
            elseif f.type == 4 then 
                f.neededItem = 520
                f.giveItem = 521
                f.anim1 = "CHAINSAW"
                f.anim2 = "CSAW_1"
            end
        
          if (exports.global:hasItem( source, f.neededItem))  then
              if exports["item-system"]:hasSpaceForItem(source,f.giveItem) then

                if not getElementData(source, "Processing", true) then
                        if f.type == 1 then executeCommandHandler("ame", source,"start making planks.")
                        elseif f.type == 2 then executeCommandHandler("ame", source,"process minerals.")
                        elseif f.type == 3 then executeCommandHandler("ame", source,"recycles garbages.")
                        elseif f.type == 4 then executeCommandHandler("ame", source,"make glass.")
                        end
                          
                          exports["SCR_Notifs"]:show_box(source, "You are started the processing", "info")
                          setPedFrozen(source, true)
                          setElementData(source, "Processing", true)
                        
                          setPedAnimation(source, f.anim1, f.anim2, 10000, true, false, false, false) 

                            setTimer(function(p)
                                setPedFrozen(source, false)
                                if f.type == 1 then
                                    exports["SCR_Notifs"]:show_box(source, "You processed wood into plank", "info")
                                elseif f.type == 2 then 
                                   exports["SCR_Notifs"]:show_box(source, "You processed minerals into iron.", "info")
                                elseif f.type == 3 then
                                    exports["SCR_Notifs"]:show_box(source, "You recycled garbage into plastic.", "info")
                                elseif f.type == 4 then 
                                   exports["SCR_Notifs"]:show_box(source, "You processed into glass.", "info")
                                end
                                
                                exports.global:takeItem(source, f.neededItem)
                                exports.global:giveItem(source, f.giveItem,1)
                                setElementData(source, "Processing", false)
                                
                            end, 10000, 1,p)
                    
                else 
                    exports["SCR_Notifs"]:show_box(source, "You already processing", "error") 
                end
               else
                    exports["SCR_Notifs"]:show_box(source, "You don't have space in your inventory", "error") 
               end
            else 
                if f.type == 1 then exports["SCR_Notifs"]:show_box(source, "You don't have wood on you", "error") 
                elseif f.type == 2 then exports["SCR_Notifs"]:show_box(source, "You don't have minerals on you", "error") 
                elseif f.type == 3 then exports["SCR_Notifs"]:show_box(source, "You don't have garbage on you to recycle", "error") 
                elseif f.type == 4 then exports["SCR_Notifs"]:show_box(source, "You don't have sand on you.", "error") 
                end
                
            end
         
        -- else 
        --     exports["SCR_Notifs"]:show_box(source, "You are not a gang membre.", "error") 
        -- end
    end
    -- else 
    --     exports["SCR_Notifs"]:show_box(source, "You are not in a planting area.", "error") 
    -- end
  end
end
addCommandHandler("process", process) 




-----------------------------------------------------------------------------------------------------------------------------------------------------------------
addEventHandler("onResourceStart",getResourceRootElement(),function()

    for k,v in ipairs(getElementsByType("player")) do
        setElementData(v, "Taking", false)
        setElementData(v, "Processing", false)
    end
    

    local q = mysql:query("SELECT * FROM jobfarms")
	while true do
		local row = mysql:fetch_assoc(q)
	     if not row then break end
        local x = row["x"]
        local y = row["y"]
        local z = row["z"]
        local p = {}
        p.col = createColRectangle(x-15, y-15, 30, 30)
        p.marker = createMarker (x,y, z, "cylinder", 30, 20, 150, 20, 15 )
        p.blip = createBlip (x,y, z, 62)
        
        -- p.factionID = tonumber(row["factionid"])
        p.type = tonumber(row["type"])
        p.strType = tostring(row["strtype"])
        addEventHandler("onColShapeHit",p.col,function(source)
            if tonumber(p.type) == 1 then exports["SCR_Notifs"]:show_box(source, "Press N to start farm.", "info")
            elseif tonumber(p.type) == 2 then exports["SCR_Notifs"]:show_box(source, "Press N to start mine.", "info")
            elseif tonumber(p.type) == 3 then exports["SCR_Notifs"]:show_box(source, "Press N to collect garbage.", "info")
            elseif tonumber(p.type) == 4 then exports["SCR_Notifs"]:show_box(source, "Press N to collect sand.", "info")
            else exports["SCR_Notifs"]:show_box(source, "Press N to start farm.", "info")
            end
            bindKey(source,"N","down",farm)
    
       end)
       addEventHandler("onColShapeLeave",p.col,function(source)
        unbindKey(source,"N","down",farm)

   end)
       table.insert(fArea,p)

	end
    mysql:free_result(q)


    local q = mysql:query("SELECT * FROM jobprocess")
	while true do
		local row = mysql:fetch_assoc(q)
		if not row then break end
        local x = row["x"]
        local y = row["y"]
        local z = row["z"]
        local p = {}
        p.col = createColRectangle(x-15,y-15,30,30)
        p.marker = createMarker (x,y, z, "cylinder", 30, 20, 20, 150, 15 )
        p.blip = createBlip (x,y, z, 61)
        

        -- p.factionID = tonumber(row["factionid"])
        p.type = tonumber(row["type"])
        p.strType = tostring(row["strtype"])

        addEventHandler("onColShapeHit",p.col,function(source)
          --   outputChatBox(tostring(p.type),source)
          --   outputChatBox(tostring(p.strType),source)
            if tonumber(p.type) == 1 then exports["SCR_Notifs"]:show_box(source, "Press N to process wood into planks", "info")
            elseif tonumber(p.type) == 2 then exports["SCR_Notifs"]:show_box(source, "Press N to process minerals into iron", "info")
            elseif tonumber(p.type) == 3 then exports["SCR_Notifs"]:show_box(source, "Press N to recycle garbage into plastic", "info")
            elseif tonumber(p.type) == 4 then exports["SCR_Notifs"]:show_box(source, "Press N to process sand into glass", "info")
            else exports["SCR_Notifs"]:show_box(source, "Press N to start process.", "info")
            end
            bindKey(source,"N","down",process)
    
       end)
       addEventHandler("onColShapeLeave",p.col,function(source)
        unbindKey(source,"N","down",process)

   end)
       table.insert(pArea,p)
	end
	mysql:free_result(q)

    

end)


----------------------------------SELLING -------------------------------------
        woodSell = createMarker(2179.15625, -2256.3525390625, 14.7734375-1, "cylinder", 6, 255, 255, 255, 100)
        woodSell_Blip = createBlip (2179.15625, -2256.3525390625, 14.7734375-1, 9)
-- 

idItem1 = 502
idItem2 = 507
idItem3 = 516
idItem4 = 521
setTimer ( function ()
    for _,thePlayer in ipairs ( getElementsByType ( "player" ) ) do
         if isElementWithinMarker ( thePlayer,woodSell ) then
              if not isPedInVehicle(thePlayer) then
                   paymenet = 100
                   -- if getElementData(thePlayer, "job") == 11 then
                        if exports.global:hasItem(thePlayer, idItem1) then
                            if exports.nx_vip:isPlayerVip(thePlayer) == 3 then
                                  exports.global:takeItem(thePlayer, idItem1)
                                  paymenet = paymenet +(75 * paymenet) / 100

                                  exports.global:giveMoney(thePlayer,paymenet)
                                  exports["SCR_Notifs"]:show_box(thePlayer,"You selled 1 wood plank for $"..paymenet, "Info")
                             else
                                  exports.global:takeItem(thePlayer, idItem1)
                                  exports.global:giveMoney(thePlayer,paymenet)
                                  exports["SCR_Notifs"]:show_box(thePlayer,"You selled 1 wood plank for $"..paymenet, "Info")
                             end
                        else
                             exports["SCR_Notifs"]:show_box(thePlayer,"You don't have wood planks on you ", "Error")
                        end
                   -- else
                   --      exports["SCR_Notifs"]:show_box(thePlayer," لست موظفا لكي تبيع العصائر", "Info")
                   -- end
              else
                   outputChatBox("Can't do that with a vehicle",thePlayer, 255, 255, 255,true)
              end
         end
    end
end,5000,0 )



    local ironSell = createMarker(2461.7607421875, -2117.7275390625, 13.552991867065-1, "cylinder", 6, 255, 255, 255, 100)
    local ironSell_Blip = createBlip (2461.7607421875, -2117.7275390625, 13.552991867065-1, 35)

    setTimer ( function ()
        for _,thePlayer in ipairs ( getElementsByType ( "player" ) ) do
             if isElementWithinMarker ( thePlayer,ironSell ) then
                  if not isPedInVehicle(thePlayer) then
                       paymenet = 90
                       -- if getElementData(thePlayer, "job") == 11 then
                            if exports.global:hasItem(thePlayer, idItem2) then
                                 if exports.nx_vip:isPlayerVip(thePlayer) == 3 then
                                      exports.global:takeItem(thePlayer, idItem2)
                                      paymenet = paymenet +(75 * paymenet) / 100

                                      exports.global:giveMoney(thePlayer,paymenet)
                                      exports["SCR_Notifs"]:show_box(thePlayer,"You selled 1 iron for $"..paymenet, "Info")
                                 else
                                      exports.global:takeItem(thePlayer, idItem2)
                                      exports.global:giveMoney(thePlayer,paymenet)
                                      exports["SCR_Notifs"]:show_box(thePlayer,"You selled 1 iron for $"..paymenet, "Info")
                                 end
                            else
                                 exports["SCR_Notifs"]:show_box(thePlayer,"You don't have iron ingots on you ", "Error")
                            end
                       -- else
                       --      exports["SCR_Notifs"]:show_box(thePlayer," لست موظفا لكي تبيع العصائر", "Info")
                       -- end
                  else
                       outputChatBox("Can't do that with a vehicle",thePlayer, 255, 255, 255,true)
                  end
             end
        end
        end,5000,0 )
    


        local plasticSell = createMarker( 2248.8251953125, -2552.203125, 8.3046875-1, "cylinder", 6, 255, 255, 255, 100)
        local plasticSell_Blip = createBlip ( 2248.8251953125, -2552.203125, 8.3046875-1, 35)
    
        setTimer ( function ()
            for _,thePlayer in ipairs ( getElementsByType ( "player" ) ) do
                 if isElementWithinMarker ( thePlayer,plasticSell ) then
                      if not isPedInVehicle(thePlayer) then
                           paymenet = 80
                           -- if getElementData(thePlayer, "job") == 11 then
                                if exports.global:hasItem(thePlayer, idItem3) then
                                     if exports.nx_vip:isPlayerVip(thePlayer) == 3 then

                                          exports.global:takeItem(thePlayer, idItem3)
                                          paymenet = paymenet +(75 * paymenet) / 100
                                          exports.global:giveMoney(thePlayer,paymenet)
                                          exports["SCR_Notifs"]:show_box(thePlayer,"You selled 1 plastic for $"..paymenet, "Info")
                                     else
                                          exports.global:takeItem(thePlayer, idItem3)
                                          exports.global:giveMoney(thePlayer,paymenet)
                                          exports["SCR_Notifs"]:show_box(thePlayer,"You selled 1 plastic for $"..paymenet, "Info")
                                     end
                                else
                                     exports["SCR_Notifs"]:show_box(thePlayer,"You don't have plastic on you ", "Error")
                                end
                           -- else
                           --      exports["SCR_Notifs"]:show_box(thePlayer," لست موظفا لكي تبيع العصائر", "Info")
                           -- end
                      else
                           outputChatBox("Can't do that with a vehicle",thePlayer, 255, 255, 255,true)
                      end
                 end
            end
            end,5000,0 )


            local sandSell = createMarker( 2675.5908203125, -1545.021484375, 24.313377380371-1, "cylinder", 6, 255, 255, 255, 100)
            local sandSell_Blip = createBlip ( 2675.5908203125, -1545.021484375, 24.313377380371-1, 35)
        
            setTimer ( function ()
                for _,thePlayer in ipairs ( getElementsByType ( "player" ) ) do
                     if isElementWithinMarker ( thePlayer,sandSell ) then
                          if not isPedInVehicle(thePlayer) then
                               paymenet = 150
                               -- if getElementData(thePlayer, "job") == 11 then
                                    if exports.global:hasItem(thePlayer, idItem4) then
                                         if exports.nx_vip:isPlayerVip(thePlayer) == 3 then

                                              exports.global:takeItem(thePlayer, idItem4)
                                             paymenet = paymenet +(75 * paymenet) / 100

                                              exports.global:giveMoney(thePlayer,paymenet)
                                              exports["SCR_Notifs"]:show_box(thePlayer,"You selled 1 glass for $"..paymenet, "Info")
                                         else
                                              exports.global:takeItem(thePlayer, idItem4)
                                              exports.global:giveMoney(thePlayer,paymenet)
                                              exports["SCR_Notifs"]:show_box(thePlayer,"You selled 1 glass for $"..paymenet, "Info")
                                         end
                                    else
                                         exports["SCR_Notifs"]:show_box(thePlayer,"You don't have glass on you ", "Error")
                                    end
                               -- else
                               --      exports["SCR_Notifs"]:show_box(thePlayer," لست موظفا لكي تبيع العصائر", "Info")
                               -- end
                          else
                               outputChatBox("Can't do that with a vehicle",thePlayer, 255, 255, 255,true)
                          end
                     end
                end
                end,5000,0 )
        