------------------------
-- Script Copyright © --
------------------------
-- Script By : SwiTzeX
-- For : Los Santos Project
-- GameMode : RolePlay
------------------------

function consoleCheck(text)
	triggerServerEvent("test",localPlayer,text)
end
addEventHandler("onClientConsole",getLocalPlayer(),consoleCheck)
