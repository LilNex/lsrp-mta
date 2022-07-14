function sspc1()
    exports.global:takeMoney(source, 30)
	exports.global:giveItem(source, 49,1)
end
addEvent("sspc1", true)
addEventHandler("sspc1", root, sspc1)

function sspc2()
    exports.global:takeMoney(source, 50)
	exports.global:giveItem(source, 10026,1)
end
addEvent("sspc2", true)
addEventHandler("sspc2", root, sspc2)
