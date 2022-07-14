function pc1()
    exports.global:takeMoney(source, 55)
	exports.global:giveItem(source, 93,1)
end
addEvent("pc1", true)
addEventHandler("pc1", root, pc1)

function pc2()
    exports.global:takeMoney(source, 101)
	exports.global:giveItem(source, 102,1)
end
addEvent("pc2", true)
addEventHandler("pc2", root, pc2)
