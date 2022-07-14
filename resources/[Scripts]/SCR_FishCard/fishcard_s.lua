function sBuyPasseport1()
    exports.global:takeMoney(source, 5000)
	exports.global:giveItem(source, 10025,1)
	exports.SCR_Info:addNotification("Congratulations, you bought Fishcard","success",5000)
end
addEvent("sBuyPasseport1", true)
addEventHandler("sBuyPasseport1", root, sBuyPasseport1)