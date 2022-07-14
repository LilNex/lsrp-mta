addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '275.txd' ) 
engineImportTXD( txd, 275 ) 
dff = engineLoadDFF('275.dff', 275) 
engineReplaceModel( dff, 275 )
end)

