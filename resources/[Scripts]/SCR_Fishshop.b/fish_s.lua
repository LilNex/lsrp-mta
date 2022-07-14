function spc1()
    exports.global:takeMoney(source, 30)
	exports.global:giveItem(source, 49,1)
end
addEvent("spc1", true)
addEventHandler("spc1", root, spc1)

function spc2()
    exports.global:takeMoney(source, 50)
	exports.global:giveItem(source, 10026,1)
end
addEvent("spc2", true)
addEventHandler("spc2", root, spc2)
