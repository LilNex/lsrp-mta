function epc1()
    exports.global:takeMoney(source, 55)
	exports.global:giveItem(source, 93,1)
end
addEvent("epc1", true)
addEventHandler("epc1", root, epc1)

function epc2()
    exports.global:takeMoney(source, 101)
	exports.global:giveItem(source, 102,1)
end
addEvent("epc2", true)
addEventHandler("epc2", root, epc2)
