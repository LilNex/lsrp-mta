
local MarkerOutTrash = createMarker(2783.189453125, -2345.1318359375, 13.6328125-0.98,"cylinder",4,255,150,0,70)
local MarkerOutTrash1 = createMarker(-396.4765625, -1777.017578125, 4-0.98,"cylinder",3,255,255,255,100)
local MarkerOutTrash2 = createMarker(-51.4462890625, -40.6142578125, 3.4171875-0.98,"cylinder",4,255,200,0,100)
local MarkerOutTrash3 = createMarker( -1507.96484375, 1975.2841796875, 48.4171371453106-0.98,"cylinder",3,255,255,0,100)
local MarkerOutTrash4 = createMarker(2668.65234375, -2230.384765625, 13.6328125-0.98,"cylinder",3,255,150,0,70)
createBlipAttachedTo (MarkerOutTrash,28)
createBlipAttachedTo (MarkerOutTrash1,59)
createBlipAttachedTo (MarkerOutTrash2,28)
createBlipAttachedTo (MarkerOutTrash3,28)
createBlipAttachedTo (MarkerOutTrash4,28)

--createVehicle(408,2178.9794921875, -1982.3056640625, 13.551454544067)

--addEventHandler("onMarkerHit", MarkerOutTrash, function(hitElement)
setTimer ( function ()

for _,thePlayer in ipairs ( getElementsByType ( "player" ) ) do
   if isElementWithinMarker ( thePlayer,MarkerOutTrash ) then

      if not isPedInVehicle(thePlayer) then


         paymenet = math.random(20,40)
         paymenet1 = math.random(20,50)
         if getElementData(thePlayer, "job") == 11 then
            if exports.global:hasItem(thePlayer, 101) then
               if exports.nx_vip:isPlayerVip(thePlayer) == 3 then
                  paymenet = paymenet +(75 * paymenet) / 100
                  exports.global:takeItem(thePlayer, 101)
                  exports.global:giveMoney(thePlayer,paymenet)
                  exports["SCR_Notifs"]:show_box(thePlayer,"[Grape-Prime] : $ لقد بعت عصير العنب ولقد حصلت على "..paymenet.." ", "Info")
               else
                  exports.global:takeItem(thePlayer, 101)
                  exports.global:giveMoney(thePlayer,paymenet)
                  exports["SCR_Notifs"]:show_box(thePlayer,"[Grape] : $ لقد بعت عصير العنب ولقد حصلت على "..paymenet.." ", "Info")

               end



            else
               exports["SCR_Notifs"]:show_box(thePlayer," انت لا تملك عصائر كافية لبيعها ", "Info")
            end
         else
            exports["SCR_Notifs"]:show_box(thePlayer," لست موظفا لكي تبيع العصائر", "Info")
         end
      else
         outputChatBox("#7400d4[Grape]:#FFFFFF انزل من السيارة",thePlayer, 255, 255, 255,true)

      end

   end
end

end,5000,0 )



setTimer ( function ()

for _,thePlayer in ipairs ( getElementsByType ( "player" ) ) do
   if isElementWithinMarker ( thePlayer,MarkerOutTrash4 ) then

      if not isPedInVehicle(thePlayer) then
         local numPdMembers = #getPlayersInTeam(exports.factions:getTeamFromFactionID(1)) --PD and HP

         paymenet = math.random(50,100)
         paymenet1 = math.random(50,120)
         if getElementData(thePlayer, "job") == 11 then
            if exports.global:hasItem(thePlayer, 63) then
               if numPdMembers < 10 then
                  if exports.nx_vip:isPlayerVip(thePlayer) == 3 then
                     paymenet = paymenet +(75 * paymenet) / 100
                  end
                  exports.global:takeItem(thePlayer, 63)
                  exports.global:giveMoney(thePlayer,tonumber(paymenet))
                  exports["SCR_Notifs"]:show_box(thePlayer,"[Grape] : $ لقد بعت الخمر ولقد حصلت على "..paymenet.." ", "Info")
               else
                  if exports.nx_vip:isPlayerVip(thePlayer) == 3 then
                     paymenet = paymenet +(75 * paymenet) / 100
                  end
                  exports.global:takeItem(thePlayer, 63)
                  exports.global:giveMoney(thePlayer,tonumber(paymenet))
                  exports["SCR_Notifs"]:show_box(thePlayer,"[Grape] : $ لقد بعت الخمر ولقد حصلت على "..paymenet.." ", "Info")

               end



            else
               exports["SCR_Notifs"]:show_box(thePlayer,"انت لا تملك خمر كافي لبيعة", "Info")
            end
         else
            exports["SCR_Notifs"]:show_box(thePlayer," لست موظفا لتبيع الخمر", "Info")
         end
      else
         outputChatBox("#7400d4[Grape]:#FFFFFF انزل من السيارة",thePlayer, 255, 255, 255,true)



      end
   end
end
end,5000,0 )




setTimer ( function (	)
for _,thePlayer in ipairs ( getElementsByType ( "player" ) ) do

   if isElementWithinMarker ( thePlayer,MarkerOutTrash2) then
      if not isPedInVehicle ( thePlayer ) then
         if getElementData(thePlayer, "job") == 11 then
            if exports.global:hasSpaceForItem(thePlayer,37) then
               if exports.global:hasItem(thePlayer, 310) then

                  exports.global:takeItem(thePlayer, 310)
                  exports.global:giveItem(thePlayer, 101, 1)
                  exports.global:giveItem(thePlayer, 101, 1)
                  exports.global:giveItem(thePlayer, 101, 1)
                  exports.global:giveItem(thePlayer, 101, 1)
                  exports.global:giveItem(thePlayer, 101, 1)
                  outputChatBox("#7400d4[Grape]:#FFFFFF You made 5 grape juice",thePlayer, 255, 255, 255,true)
               else
                  outputChatBox("#7400d4[Grape]:#FFFFFF You don't have grape",thePlayer, 255, 0, 0,true)
               end
            else
               outputChatBox("#7400d4[Grape]:#FFFFFF You don't have enough space",thePlayer, 255, 255, 255,true)
            end
         else
            outputChatBox("#7400d4[Grape]:#FFFFFF You don't have this job",thePlayer, 255, 255, 255,true)

         end
      else
         outputChatBox("#7400d4[Grape]:#FFFFFF Exit your vehicle",thePlayer, 255, 255, 255,true)

      end

   end

end
end,5000,0 )



setTimer ( function (	)
for _,thePlayer in ipairs ( getElementsByType ( "player" ) ) do
   if isElementWithinMarker ( thePlayer,MarkerOutTrash3) then
      if not isPedInVehicle ( thePlayer ) then
         if getElementData(thePlayer, "job") == 11 then
            if exports.global:hasSpaceForItem(thePlayer,63) then
               if exports.global:hasItem(thePlayer, 310) then

                  exports.global:takeItem(thePlayer, 310)
                  exports.global:giveItem(thePlayer, 63, 1)
                  outputChatBox("#7400d4[Grape]:#FFFFFF You made 1 alcohol with grape taste",thePlayer, 255, 255, 255,true)
               else
                  outputChatBox("#7400d4[Grape]:#FFFFFF You don't have grape",thePlayer, 255, 0, 0,true)
               end
            else
               outputChatBox("#7400d4[Grape]:#FFFFFF You don't have enough space",thePlayer, 255, 255, 255,true)
            end
         else
            outputChatBox("#7400d4[Grape]:#FFFFFF You don't have this job",thePlayer, 255, 255, 255,true)

         end
      else
         outputChatBox("#7400d4[Grape]:#FFFFFF Exit your vehicle",thePlayer, 255, 255, 255,true)

      end

   end

end
end,5000,0 )


setTimer ( function (	)
for _,thePlayer in ipairs ( getElementsByType ( "player" ) ) do
   if isElementWithinMarker ( thePlayer,MarkerOutTrash1) then
      if not isPedInVehicle ( thePlayer ) then

         if getElementData(thePlayer, "job") == 11 then
            if exports.global:hasSpaceForItem(thePlayer,310) then              
                  setPedFrozen(thePlayer,true)
                  setPedAnimation(thePlayer,"bomber","bom_plant",1000,true,false,false,false)
                  -- for i = 1, 2 do
                     exports.global:giveItem(thePlayer, 310, 1)
                  -- end

                  outputChatBox("#7400d4[Grape]:#FFFFFF You recolted 1 grape",thePlayer, 255, 255, 255,true)
                  setTimer(setElementFrozen,1000, 1,thePlayer,false)

            else
               outputChatBox("#7400d4[Grape]:#FFFFFF You don't have enough space",thePlayer, 255, 255, 255,true)
            end
         else
            outputChatBox("#7400d4[Grape]:#FFFFFF You don't have this job",thePlayer, 255, 255, 255,true)

         end
      else
         outputChatBox("#7400d4[Grape]:#FFFFFF Exit your vehicle",thePlayer, 255, 255, 255,true)

      end

   end

end
end,3500,0 )

function displayLoadedRes ( res )
   if getResourceName(res) == "Trash2" then
      for k, player in ipairs(getElementsByType("player")) do
         setElementData(player , "firstTime"..getPlayerName(player)  , false)
      end
   end
end
addEventHandler ( "onResourceStart", getRootElement(), displayLoadedRes )



