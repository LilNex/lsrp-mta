function applyMods()
   local txd = engineLoadTXD ( "lifts.txd")
   engineImportTXD ( txd, 2052 )
   local dff = engineLoadDFF("liftposts.dff", 2052 )
   engineReplaceModel(dff, 2052)
   local col = engineLoadCOL ( "liftposts.col")
   engineReplaceCOL ( col, 2052 )
   local txd = engineLoadTXD ( "lifts.txd")
   engineImportTXD ( txd, 2053 )
   local dff = engineLoadDFF("ramps.dff", 2053 )
   engineReplaceModel(dff, 2053)
   local col = engineLoadCOL ( "ramps.col")
   engineReplaceCOL ( col, 2053 )
   
   local txd = engineLoadTXD ( "stand.txd")
   engineImportTXD ( txd, 2365 )
   local dff = engineLoadDFF("stand.dff", 2365 )
   engineReplaceModel(dff, 2365)
   local col = engineLoadCOL ( "stand.col")
   engineReplaceCOL ( col, 2365 )
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()),
     function()
         applyMods()
         setTimer (applyMods, 1000, 2)
end
)