txd = engineLoadTXD ( "obje.txd" )
engineImportTXD ( txd, 1862 )
col = engineLoadCOL ( "obje.col" )
engineReplaceCOL ( col, 1862 )
dff = engineLoadDFF ( "obje.dff", 0 )
engineReplaceModel ( dff, 1862 )
engineSetModelLODDistance(1862, 1500)


txd = engineLoadTXD ( "obje.txd" )
engineImportTXD ( txd, 9482 )
dff = engineLoadDFF ( "1.dff", 0 )
engineReplaceModel ( dff, 9482 )
engineSetModelLODDistance(9482, 1500)















