

addEventHandler ("onPlayerWeaponFire", root, 
function (weapons)
      if (getElementData(source, "faction") == 1 or getElementData(source, "faction") == 3 or getElementData(source, "faction") == 59 or getElementData(source, "faction") == 84 or getElementData(source, "faction") == 83 or getElementData(source, "faction") == 102 or getElementData(source, "faction") == 50) then return end
      if  (getElementData(source, "Fire")) then return end
      setElementData(source, "Fire", true)
      x,y,z = getElementPosition(source)
      local weaponName = getWeaponNameFromID(weapons)
      local localidade = getZoneName(x, y, z)
      local teams = getPlayersInTeam( getTeamFromName("Los Santos Police Department") ) and getPlayersInTeam( getTeamFromName("Los Santos Sheriff Department") ) and getPlayersInTeam( getTeamFromName("Federal Bureau Of Investigation") ) 
      local team = getPlayersInTeam( getTeamFromName("Los Santos Police Department") )
      if localidade ~= "Los Santos" then
        tee = teams
      else
        tee = team
      end
      for key, value in ipairs( getElementsByType("player") ) do
        fId = getElementData(value,"faction")
         if fId == 1 or fId == 102 then
               outputChatBox ("[Radio] We've noticed a gunshots using ( "..weaponName.." )" , value, 8, 139, 255 ,true)
               outputChatBox ("[Radio] We will add the location to your gps , the location will be removed in 30 seconds." , value, 8, 139, 255 ,true)
               local blip = createBlip ( x,y,z, 20 , 4, 0, 0, 255)
             setElementVisibleTo(blip, root, false)
             setElementVisibleTo(blip, value, true)
             playSoundFrontEnd ( value, 44 )
             
             setTimer ( function()
                 destroyElement(blip)
             end, 30000, 1)
            
          end
         end
      
      setTimer(setElementData, 30000, 1, source, "Fire", false)
end)
