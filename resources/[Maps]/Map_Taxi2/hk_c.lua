addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/hk_taxi.txd',true)
        engineImportTXD(txd, 4022)

	
	local dff = engineLoadDFF('files/hk_taxi.dff', 0) 
	engineReplaceModel(dff, 4022)


	local col = engineLoadCOL('files/hk_taxi.col') 
	engineReplaceCOL(col, 4022)

		
	engineSetModelLODDistance(4022, 500)
end 
)