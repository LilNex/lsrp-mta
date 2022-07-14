

addEventHandler("onClientResourceStart", resourceRoot,
function()
	
	local txd = engineLoadTXD("models/texture.txd") -- txd neve
	engineImportTXD(txd, 6910)
	
	local dff = engineLoadDFF("models/deli.dff", 1934) -- dff neve
	engineReplaceModel(dff, 6910)
	
	local col = engineLoadCOL("models/deli.col") -- col neve
	engineReplaceCOL(col, 6910)
	
	engineSetModelLODDistance(6910, 500)     
end
)

addEventHandler("onClientResourceStart", resourceRoot,
function()
	
	local txd = engineLoadTXD("models/texture.txd") -- txd neve
	engineImportTXD(txd, 9169)
	
	local dff = engineLoadDFF("models/eszaki.dff", 9169) -- dff neve
	engineReplaceModel(dff, 9169)
	
	local col = engineLoadCOL("models/deli.col") -- col neve
	engineReplaceCOL(col, 9169)
	
	engineSetModelLODDistance(9169, 500)     
end
)

addEventHandler("onClientResourceStart", resourceRoot,
function()
	
	local col = engineLoadCOL("models/roadFix.col") -- col neve
	engineReplaceCOL(col, 5489)
	
	engineSetModelLODDistance(5489, 500)     
end
)