--[[

 _       _____ _____  _____  
| |     / ____|  __ \|  __ \ 
| |    | (___ | |__) | |__) |
| |     \___ \|  _  /|  ___/ 
| |____ ____) | | \ \| |     
|______|_____/|_|  \_\_|     
                 
* Whistling maded by J.Smith
* Copyright 2021-2022 Los Santos Roleplay
				 
]]--

local seconds = 4 
local key = "n" 


local siffle = {
  tick = {},
  times = {},
  doing = {},
};

function Whistling(ThePlayerLS)
  if not isPedOnGround (ThePlayerLS) then return end
  if isPedInVehicle(ThePlayerLS) then return end 
  if getTickCount() - (siffle.tick[ThePlayerLS] or 0) >= seconds * 1000 then 
    if siffle.doing[ThePlayerLS] == false or siffle.doing[ThePlayerLS] == nil then
      controls(ThePlayerLS, false)
      setPedAnimation(ThePlayerLS, "food", "eat_burger", -1, false, false, false, false) 
      setTimer(setPedAnimationProgress, 800, 1, ThePlayerLS, "eat_burger", 1) 
      siffle.doing[ThePlayerLS] = true
      siffle.tick[ThePlayerLS] = getTickCount()
      local cx, cy, cz = getElementPosition(ThePlayerLS)
      triggerClientEvent(getRootElement(), "LSRP_Wis", ThePlayerLS, cx, cy, cz) 
      siffle.times[ThePlayerLS] = setTimer(function() 
        setPedAnimation(ThePlayerLS, "ghands", "gsign2lh", -1, false, false, false, false)
        setTimer(function() 
          cancelAnimn(ThePlayerLS) 
          controls(ThePlayerLS, true)
        end, 1000, 1) 
      end, 1000, 1)  
    end
  end
end 

function cancelAnimn(player)
  --setPedAnimation(player) 
  --setPedWalkingStyle(player, 0) 
  siffle.doing[player] = false
  if isTimer (siffle.times[player]) then killTimer (siffle.times[player]) siffle.times[player] = nil end
end

function Res()
  for _, player in ipairs(getElementsByType("player")) do
    siffle.tick[player] = 4
    siffle.doing[player] = false
    bindKey(player, key, "down", Whistling)
  end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), Res)

function Join()
  for _, player in ipairs(getElementsByType("player")) do
    siffle.tick[player] = 4
    siffle.doing[player] = false
    bindKey(player, key, "down", Whistling)
  end
end
addEventHandler("onPlayerJoin", getRootElement(), Join)

function Clean()
  for _, player in ipairs(getElementsByType("player")) do
    unbindKey(player, key, "down", Whistling)
    if isTimer (siffle.times[ThePlayerLS]) then killTimer (siffle.times[ThePlayerLS]) end
      if siffle.doing[player] then
        destroyElement(siffle.doing[player] )
        siffle.doing[player] = nil
        siffle.tick[player] = nil
      end
  end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), Clean)

function Wasted()
  for _, player in ipairs(getElementsByType("player")) do
    if isTimer (siffle.times[ThePlayerLS]) then killTimer (siffle.times[ThePlayerLS]) end
      if siffle.doing[player] then
        destroyElement(siffle.doing[player] )
        siffle.doing[player] = nil
        siffle.tick[player] = 4
      end
  end
end
addEventHandler("onPlayerWasted", getRootElement(), Wasted)

function controls(player, state)
  if state == false then
    toggleControl ( player, "jump", false )
  elseif state == true then
    toggleControl ( player, "jump", true )
  end
end
