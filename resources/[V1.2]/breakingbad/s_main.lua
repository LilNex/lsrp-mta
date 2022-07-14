--------------------------------------------------
--------------------------------------------------
--									   --
--				Script By : LilNex		   --
--		                            		   --
--									   --
--------------------------------------------------
--------------------------------------------------
-- -----------TODO-----------------
-- ADD BTOOLS TO SQL TABLE 'vehicles'


mysql = exports.mysql
gbl = exports.global
setDevelopmentMode(true)
-- local Marker_Take = createMarker(1108.1650390625, -343.962890625, 74 -1, "arrow", 1.5, 0, 255, 0, 100) 

-- local Marker_Plant = createMarker(1095.697265625, -317.197265625, 73.9921875 -1, "cylinder", 1.5, 255, 255, 255, 100) 

-- local Marker_Harvest = createMarker(1095.697265625, -317.197265625, 73.9921875 -1, "cylinder", 1.5, 255, 255, 255, 2) 

local mrk_keypad = createMarker(keypadLoc[1],keypadLoc[2],keypadLoc[3]-0.75,"cylinder",1,124,200,50)
local mrk_keypadOp = createMarker(keypadOp[1],keypadOp[2],keypadOp[3]-0.75,"cylinder",1,124,200,50)
local mrk_dep = createMarker(depot[1],depot[2],depot[3]-0.75,"cylinder",5,0,125,125)

addEventHandler("onMarkerHit",mrk_keypad,function(plr,mrk)
     outputChatBox("You need a keypad cracker to open that gate.",plr)
     outputChatBox("Type /gatecrack to open the gate.",plr)
     -- triggerClientEvent(plr,"gate:ctrigger",plr)
end)

addEventHandler("onMarkerHit",mrk_keypadOp,function(plr,mrk)
     triggerClientEvent(plr,"gate:ctrigger",plr)
end)

addEventHandler("onMarkerHit",mrk_dep,function(plr,mrk)
     triggerClientEvent(plr,"bbad:openDepotGui",plr)

end)

addCommandHandler("gatecrack",function(plr,cmd)
     if isElementWithinMarker(plr,mrk_keypad) then 
          if gbl:hasItem(plr,550)then 
               gbl:takeItem(plr,550)
               triggerClientEvent(plr,"gate:ctrigger",plr)

          else 
               outputChatBox("You need a keypad cracker to open that gate",plr,220,0,0)
          end 
     end

end)

addEvent("bbad:StealPseudo",true)
addEventHandler("bbad:StealPseudo",root,function()
     for k,v in ipairs(getElementsByType("player")) do 
          if getElementData(v,"faction") == 1 then 
              outputChatBox("[RADIO] : A factory is being robbed near "..getElementZoneName(source)..".",v,0,20,220)
              -- table.insert(pTable )
          end 
  
      end 
     if isElementWithinMarker(source,mrk_dep) then 
          setElementFrozen(source,true)
          setPedAnimation(source,"ROB_BANK","CAT_Safe_Rob",5000)

          setTimer(function(plr)
               setPedAnimation(plr,"ROB_BANK","CAT_Safe_Rob",1000)
          end,1000,35,source)

          setTimer(function(plr,mrk)
               setPedAnimation(plr,false)
               setElementFrozen(plr,false)
               if isElementWithinMarker(plr,mrk) then 
                    --GIVE ITEM PSEUDO
                    exports['item-system']:giveItem(plr,552,100)
               end

          end,36000,1,source,mrk_dep)

     else 
          outputChatBox("You are not near the depot",source,200,0,0)
     end

end)






addEvent("bbad:installTool1",true)
addEvent("bbad:installTool2",true)
addEvent("bbad:installTool3",true)
addEventHandler("bbad:installTool1",root,function(veh)
     t = mysql:query_fetch_assoc("SELECT bTool1 FROM `vehicles` WHERE `id`= '" .. tostring(getElementData(veh,"dbid")) .. "'")
     -- outputChatBox(tostring(bTool1),source)
     if tonumber(t['bTool1']) == 0 then 
          if gbl:hasItem(source,570) then 
               gbl:takeItem(source,570)
               mysql:query_insert_free("UPDATE `vehicles` SET bTool1 = 1 WHERE id = '"..tostring(getElementData(veh,"dbid")).."'")
               outputChatBox("You've installed a tube furnance inside your Journey",source,0,200,0)
          end
     else 
          outputChatBox("You already have a tube furnance installed on your Journey",source,250,0,0)
     end
end)
addEventHandler("bbad:installTool2",root,function(veh)
     t = mysql:query_fetch_assoc("SELECT bTool2 FROM `vehicles` WHERE `id`= '" .. tostring(getElementData(veh,"dbid")) .. "'")
     if tonumber(t['bTool2']) == 0 then 
          if gbl:hasItem(source,571) then 
               gbl:takeItem(source,571)
               mysql:query_insert_free("UPDATE `vehicles` SET bTool2 = 1 WHERE id = '"..tostring(getElementData(veh,"dbid")).."'")
               outputChatBox("You've installed Chemistry Tubes inside your Journey",source,0,200,0)
          end
     else 
          outputChatBox("You already have Chemistry Tubes installed on your Journey",source,250,0,0)
     end
end)
addEventHandler("bbad:installTool3",root,function(veh)
     t = mysql:query_fetch_assoc("SELECT bTool3 FROM `vehicles` WHERE `id`= '" .. tostring(getElementData(veh,"dbid")) .. "'")
     if tonumber(t['bTool3']) == 0 then 
          if gbl:hasItem(source,572) then 
               gbl:takeItem(source,572)
               mysql:query_insert_free("UPDATE `vehicles` SET bTool3 = 1 WHERE id = '"..tostring(getElementData(veh,"dbid")).."'")
               outputChatBox("You've installed a Catalyser inside your Journey",source,0,200,0)
          end
     else 
          outputChatBox("You already have a Catalyser installed on your Journey",source,250,0,0)
     end
end)







