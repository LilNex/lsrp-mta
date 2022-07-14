function cPayDay(faction, pay, profit, interest, donatormoney, tax, incomeTax, vtax, ptax, rent, grossincome, Perc)
	--local cPayDaySound = playSound("mission_accomplished.mp3")
	local bankmoney = getElementData(getLocalPlayer(), "bankmoney")
	local moneyonhand = getElementData(getLocalPlayer(), "money")
	local wealthCheck = moneyonhand + bankmoney
	setSoundVolume(cPayDaySound, 0.7)
	local info = {}
	-- output payslip
	exports.SCR_Info:addNotification("[ P  A  Y  ~  D  A  Y ] ","success",5000)
	outputChatBox("=================[ PAYDAY ]=================", 0, 102, 254) 
	table.insert(info, {""})
	--table.insert(info, {""})
	-- state earnings/money from faction
	if not (faction) then
		if (pay + tax > 0) then
			--outputChatBox(, 255, 194, 14, true)
			outputChatBox("  State Benefits : $" .. exports.global:formatMoney(pay+tax), 255, 194, 14)	
		end
	else
		if (pay + tax > 0) then
			--outputChatBox(, 255, 194, 14, true)
			outputChatBox("  Faction Pay : $" .. exports.global:formatMoney(pay+tax), 255, 194, 14) 
		end
	end
	
	-- business profit
	if (profit > 0) then
		--outputChatBox(, 255, 194, 14, true)
		outputChatBox("  Business Profit: $" .. exports.global:formatMoney(profit), 255, 194, 14) 
	end
	
	-- bank interest
	if (interest > 0) then
		--outputChatBox(,255, 194, 14, true)
		outputChatBox("  Bank Interest: $" .. exports.global:formatMoney(interest) .. " (≈" ..("%.2f"):format(Perc) .. "%)", 255, 194, 14)  
	end
	
	-- donator money (nonRP)
	if (donatormoney > 0) then
		--outputChatBox(, 255, 194, 14, true)
		outputChatBox("  Donator Money: $" .. exports.global:formatMoney(donatormoney), 255, 194, 14) 
	end
	
	-- Above all the + stuff
	-- Now the - stuff below
	
	-- income tax
	if (tax > 0) then
		--outputChatBox(, 255, 194, 14, true)
		outputChatBox("  Income Tax of " .. (math.ceil(incomeTax*100)) .. "%: $" .. exports.global:formatMoney(tax), 255, 194, 14) 
	end
	
	if (vtax > 0) then
		--outputChatBox(, 255, 194, 14, true)
		outputChatBox("  Vehicle Tax: $" .. exports.global:formatMoney(vtax), 255, 194, 14) 
	end
	
	if (ptax > 0) then
		--outputChatBox(, 255, 194, 14, true )
		outputChatBox("  Property Expenses: $" .. exports.global:formatMoney(ptax), 255, 194, 14) 
	end
	
	if (rent > 0) then
		--outputChatBox(, 255, 194, 14, true)
		outputChatBox("  Apartment Rent: $" .. exports.global:formatMoney(rent), 255, 194, 14) 
	end
	
	--outputChatBox("------------------------------------------------------------------", 255, 194, 14)
	
	if grossincome == 0 then
		--outputChatBox(,255, 194, 14, true)
        outputChatBox("  Gross Income: $0", 255, 194, 14) 
	elseif (grossincome > 0) then
		--outputChatBox(,255, 194, 14, true)
		--outputChatBox(, 255, 194, 14)
		outputChatBox("  Gross Income: $" .. exports.global:formatMoney(grossincome), 255, 194, 14) 
		outputChatBox("  Transferred to your bank account.", 255, 1, 1) 
	else
		--outputChatBox(, 255, 194, 14, true)
		--outputChatBox(, 255, 194, 14)
		outputChatBox("  Gross Income: $" .. exports.global:formatMoney(grossincome), 255, 194, 14)
		outputChatBox("  Taking from your bank account.", 255, 1, 1) 
	end
	
	
	if (pay + tax == 0) then
		if not (faction) then
			--outputChatBox(, 255, 0, 0)
			outputChatBox("  The government could not afford to pay you your state benefits." )
		else
			--outputChatBox(, 255, 0, 0)
			outputChatBox("  Your employer could not afford to pay your wages." ) 
		end
	end
	
	if (rent == -1) then
		--outputChatBox(, 255, 0, 0)
		outputChatBox("  You were evicted from your apartment, as you can't pay the rent any longer.", 255, 194, 14) 
	end
	
	outputChatBox("===========================================", 0, 102, 254)
	-- end of output payslip
	--triggerEvent("hudOverlay:drawOverlayTopRight", localPlayer, info ) 
	--triggerEvent("updateWaves", getLocalPlayer())
end
addEvent("cPayDay", true)
addEventHandler("cPayDay", getRootElement(), cPayDay)