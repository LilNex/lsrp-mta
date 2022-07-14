addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd = engineLoadTXD('policeS.txd',true)
engineImportTXD(txd, 1745)
local dff = engineLoadDFF('policeS.dff', 0)
engineReplaceModel(dff, 1745)
local col = engineLoadCOL('policeS.col')
engineReplaceCOL(col, 1745)
engineSetModelLODDistance(1745, 500)

end)