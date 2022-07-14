--@Ari
addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd = engineLoadTXD('1.txd',true)
engineImportTXD(txd, 8424)
local dff = engineLoadDFF('1.dff', 0)
engineReplaceModel(dff, 8424)
local col = engineLoadCOL('1.col')
engineReplaceCOL(col, 8424)
engineSetModelLODDistance(8424, 5000)


end)

