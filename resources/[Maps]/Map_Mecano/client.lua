addEventHandler('onClientResourceStart', resourceRoot,
function()
	
local txd = engineLoadTXD('ari.txd',true)
engineImportTXD(txd, 5311)
local dff = engineLoadDFF('ari.dff', 0)
engineReplaceModel(dff, 5311)
local col = engineLoadCOL('ari.col')
engineReplaceCOL(col, 5311)

end)

-- map : Ari




