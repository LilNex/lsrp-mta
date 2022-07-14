local backupBlip = nil
addEvent("createBackupBlip2", true)
addEvent("destroyBackupBlip2", true)
Markers = {}
addEventHandler("createBackupBlip2", getRootElement(), function ()
	if (backupBlip) then
		destroyElement(backupBlip)
		backupBlip = nil
	end
	backupBlip = nil
	local x, y, z = getElementPosition(source)
	backupMarker = createMarker(x, y, z, "checkpoint", 10, 250, 0, 0, 100)
	backupBlip = createBlip(x, y, z, 0, 3, 250, 0, 0, 255, 255, 32767)
	attachElements(backupMarker, backupBlip)
	addEventHandler("onClientMarkerHit", backupMarker,function()
		destroyElement(this)
		destroyElement(backupBlip)
	end)
	
	-- table.insert(Markers, backupMarker)
	backupMarker = nil
end)
addEventHandler("destroyBackupBlip2", getRootElement(), function ()
	if (backupBlip) then
		destroyElement(backupBlip)
		backupBlip = nil
	end
end)