addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd = engineLoadTXD('sapd.txd',true)
engineImportTXD(txd, 1917)
local dff = engineLoadDFF('sapd.dff', 0)
engineReplaceModel(dff, 1917)
local col = engineLoadCOL('sapd.col')
engineReplaceCOL(col, 1917)
engineSetModelLODDistance(1917, 500)

end)