local dxfont0_hkfontMed = dxCreateFont(":Hk_KSA-DxLibrary/hk_fonts/hkfontMed.ttf", 12)
local dxfont1_hkfontMed = dxCreateFont(":Hk_KSA-DxLibrary/hk_fonts/hkfontMed.ttf", 10)
local screenW, screenH = guiGetScreenSize()

local hk = {}
setElementData(localPlayer, "Thirst", 100)
setElementData(localPlayer, "Hunger", 100)

function convertNumber( number )  
    local formatted = number  
    while true do      
        formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1.%2' )    
        if ( k==0 ) then      
            break   
        end  
    end  
    return formatted
end
addEventHandler("onClientRender", root, function()
	if not isPlayerMapVisible() and getElementData(localPlayer, "loggedin") == 1 and isActive() then
local time = getRealTime()
local hours = time.hour
local minutes = time.minute
local seconds = time.second
local monthday = time.monthday
local month = time.month
local year = time.year
if (hours > 12)then
    hours = hours - 12
end
local hkFormattedDate = string.format("%02d/%02d/%04d", monthday, month + 1, year + 1900)
local hkFormattedTime = string.format("%02d:%02d", hours, minutes)	

 			      local hkMoney = getElementData(localPlayer, "money")
        local hkBankMoney = getElementData(localPlayer, "bankmoney")
		local hk_Faction = getElementData(localPlayer, "faction")
		if (tonumber(hk_Faction) == -1) then
		    hkFactionRankName = "Chomeur"
		else
			local theTeam = getPlayerTeam(localPlayer)
			hkFactionRankName = getTeamName(theTeam)
		end


        -- dxDrawImage(screenW * 0.8638, screenH * 0.0260, screenW * 0.0886, screenH * 0.0508, ":hud/hk_files/hkLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        -- dxDrawText("#4BFF00"..hkFormattedDate.."#ffffff :تاريخ اليوم", screenW * 0.8367, screenH * 0.0898, screenW * 0.9524, screenH * 0.1159, tocolor(255, 255, 255, 255), 1.00, "pricedown", "right", "center", false, false, false, true, false)
        -- dxDrawText("#4BFF00"..hkFormattedTime.."#ffffff :التوقيت", screenW * 0.7496, screenH * 0.0898, screenW * 0.8192, screenH * 0.1159, tocolor(255, 255, 255, 255), 1.00, dxfont0_hkfontMed, "right", "center", false, false, false, true, false)
        
        --cash
        dxDrawImage(screenW * 0.9348, screenH * 0.0406, screenW * 0.0176, screenH * 0.0208, ":hud/hk_files/hk_infos_cash.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(convertNumber(getElementData(localPlayer, "money")), screenW * 0.8799, screenH * -0.0555, screenW * 0.9275, screenH * 0.1615, tocolor(255, 255, 255, 255), 1.00, "pricedown", "right", "center", false, false, false, false, false)
        --dirty money
        dxDrawImage(screenW * 0.9348, screenH * 0.0746, screenW * 0.0176, screenH * 0.0208, ":hud/hk_files/hk_infos_cash.png", 0, 0, 0, tocolor(255, 0, 0, 255), false)
        dxDrawText(tostring(getElementData(localPlayer, "dirtymoney")), screenW * 0.8799, screenH * 0.01, screenW * 0.9275, screenH * 0.1615, tocolor(255, 0, 0, 255), 1.00, "pricedown", "right", "center", false, false, false, false, false)
        --bank
        dxDrawImage(screenW * 0.8551, screenH * 0.0406, screenW * 0.0176, screenH * 0.0208, ":hud/hk_files/hk_infos_bank.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(convertNumber(getElementData(localPlayer, "bankmoney")), screenW * 0.7972, screenH * -0.0555, screenW * 0.8477, screenH * 0.1615, tocolor(255, 255, 255, 255), 1.00, "pricedown", "right", "center", false, false, false, false, false)
        --job
        dxDrawImage(screenW * 0.7723, screenH * 0.0406, screenW * 0.0176, screenH * 0.0208, ":hud/hk_files/hk_infos_job.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(hkFactionRankName, screenW * 0.6867, screenH * 0.0406, screenW * 0.7650, screenH * 0.0615, tocolor(255, 255, 255, 255), 1.00, "pricedown", "right", "center", false, false, false, false, false)     
		
        ----down
        dxDrawImage(screenW * 0.9531, screenH * 0.8862, screenW * 0.0293, screenH * 0.0521, ":hud/hk_files/hk_cache.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9165, screenH * 0.8862, screenW * 0.0293, screenH * 0.0521, ":hud/hk_files/hk_cache.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.8799, screenH * 0.8862, screenW * 0.0293, screenH * 0.0521, ":hud/hk_files/hk_cache.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9531, screenH * 0.8862, screenW * 0.0293, screenH * 0.0521, ":hud/hk_files/hk_hunger.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9165, screenH * 0.8862, screenW * 0.0293, screenH * 0.0521, ":hud/hk_files/hk_thirst.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.8799, screenH * 0.8862, screenW * 0.0293, screenH * 0.0521, ":hud/hk_files/hk_health.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

		-- local hk_hunger = getElementData(localPlayer, "hk_hunger")
		-- local hk_thirst = getElementData(localPlayer, "hk_thirst")

	
		dxDrawText(tostring(hk.hunger).."%", screenW * 0.99, screenH * 1.6435, screenW * 0.9524, screenH * 0.2604, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawText(tostring(hk.thirst).."%", screenW * 0.95, screenH * 1.6435, screenW * 0.9158, screenH * 0.2604, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawText(tostring(math.floor(getElementHealth(localPlayer))).."%", screenW * 0.91, screenH * 1.6435, screenW * 0.8792, screenH * 0.2604, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
    end
end)
addEvent("hud:update",true)
addEventHandler("hud:update",localPlayer,function(infos)
    hk = infos


end)

--Set The Values Of Parametres on Player Join or On Resource Start
-- function hkSetElementsValues()
--     -- if (source == localPlayer) then 
-- 	setElementData(localPlayer,"Hunger",80)
-- 	setElementData(localPlayer,"Thirst",65)	
-- 	setElementData(localPlayer,"hk_urination", 42)		
--     hk.hunger = 80
-- 	hk.thirst = 65
-- 	hk.health = getElementHealth(localPlayer)
--     hk.dirtymoney = getElementData(localPlayer,"dirtymoney")
--     -- end
-- end
-- addEventHandler("onClientPlayerJoin", getRootElement(), hkSetElementsValues)
-- addEventHandler("onClientResourceStart", getRootElement(), hkSetElementsValues)

setTimer(function()
    if getElementData(getLocalPlayer(), "loggedin") == 1 then
        local Hkthirst = getElementData(localPlayer, "Thirst")
        hk.thirst = Hkthirst
        setElementData(localPlayer, "Thirst", Hkthirst-1)
    end	
    end, 30000, 0) -- -1 Thirst per 0.5 minute
    
    setTimer(function()
    if getElementData(getLocalPlayer(), "loggedin") == 1 then
        local HkHunger = getElementData(localPlayer, "Hunger")
        hk.hunger = HkHunger
        setElementData(localPlayer, "Hunger", HkHunger-1)
    end	
    end, 45000, 0) -- -1 Hunger per 1 minute


--Fixing The Bugs Like Values become > 100 and < 0

function hkfixbugs()
    if (getElementData(localPlayer, "Hunger")>100) then
        setElementData(localPlayer, "Hunger", 100)
    elseif (getElementData(localPlayer, "Hunger")<0) then
        setElementData(localPlayer, "Hunger", 0)
    end
    if (getElementData(localPlayer, "Thirst")>100) then
        setElementData(localPlayer, "Thirst", 100)
    elseif (getElementData(localPlayer, "Thirst")<0) then
        setElementData(localPlayer, "Thirst", 0)
    end
    
end
addEventHandler("onClientElementDataChange", root, hkfixbugs)

--Set The Effects Of Parametres when their value=0
function ParametresEffects()
	local hk_the_hunger = getElementData(localPlayer, "Hunger")
	local hk_the_thirst = getElementData(localPlayer, "Thirst")	
	
	if (hk_the_hunger==0) then
		if getElementHealth(localPlayer) < 26 then
			setElementHealth(localPlayer, getElementHealth(localPlayer) - 25)
			setElementData(localPlayer, "Hunger", 100)
		else
			setElementHealth(localPlayer, getElementHealth(localPlayer) - 25)
			setElementData(localPlayer, "Hunger", 10)
		end	
	end	
	if (hk_the_thirst==0) then
		if getElementHealth(localPlayer) < 26 then
			setElementHealth(localPlayer, getElementHealth(localPlayer) - 25)
			setElementData(localPlayer, "Thirst", 100)
		else
			setElementHealth(localPlayer, getElementHealth(localPlayer) - 25)
			setElementData(localPlayer, "Thirst", 10)
		end	
	end	

end
addEventHandler("onClientElementDataChange", root, ParametresEffects)

--Set The Timer
-- local hk_second = 1000
-- local hk_minute = 60*hk_second
-- local minutte_number = 1
-- local hk_timer = minutte_number*hk_minute

-- setTimer(function()
--     setElementData(localPlayer, "Hunger", getElementData(localPlayer, "Hunger")-1)
-- end, hk_timer,0) 

-- setTimer(function()
--     setElementData(localPlayer, "Thirst", getElementData(localPlayer, "Thirst")-1)
-- end, hk_timer,0)
 

-- setTimer(function()
-- setElementData(localPlayer, "hk_urination", getElementData(localPlayer, "hk_urination")+1)
-- end, hk_timer,0) 
