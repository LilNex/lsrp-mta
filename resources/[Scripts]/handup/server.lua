﻿addEvent("onClientSyncVOZ", true )
addEventHandler("onClientSyncVOZ", root,
    function()
	setPedAnimation(source, "GHANDS", "gsign1", 0, true, false, false)
	setTimer ( setPedAnimationProgress, 100, 1, source, "gsign1", 1.16)
	setTimer ( setPedAnimationSpeed, 1500, 1, source, "gsign1", 0)
	
    end
)


addEvent("onClientSyncVOZparar", true )
addEventHandler("onClientSyncVOZparar", root,
    function()
		setTimer ( setPedAnimation, 100, 1, source,  "GHANDS", "gsign1", 5000, false, false, false)
		setTimer ( setPedAnimation, 250, 1, source, nil)
		
    end
)