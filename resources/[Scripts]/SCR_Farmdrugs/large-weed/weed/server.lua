addEvent("weed.onRequest",true)
addEventHandler("weed.onRequest",getRootElement(),function()setTimer(triggerClientEvent,1000,1,source,"weed.onSend",source,get("weedID"),get("weedGrowTime"),get("weedCash"),get("seedCash"),get("playerSeeds"),get("playerWeed"))end)