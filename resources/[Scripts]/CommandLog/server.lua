------------------------
-- Script Copyright © --
------------------------
-- Script By : SwiTzeX
-- For : Los Santos Project
-- GameMode : RolePlay
------------------------

--[[addEventHandler ( "onResourceStart",root,
function()
	if not fileExists("log.txt") then
	 	Commandlog = fileCreate("log.txt")
		fileClose(Commandlog) 
	end
end)]]

CommandsNI = {
["Previous"] = true,
["aim"] = true,
["sit"] = true,
["togglecursor"] = true,
["Toggle"] = true,
["say"] = true,
["a"] = true,
["LocalOOC"] = true,
["say"] = true,
["s"] = true,
["b"] = true,
["teamsay"] = true,
["s"] = true,
["s"] = true,
["Next"]= true
}

addEvent("test",true)
addEventHandler("test",root,
function(command)
	if not CommandsNI[gettok(command,1,' ')] then  
		local time = getRealTime()
		local hours = time.hour
		local minutes = time.minute
		local seconds = time.second
		local days = time.monthday
		local months = time.month
		local years = time.year + 1900
		if fileExists("["..days.."-"..months.."-"..years.."].log") then 
			Commandlog = fileOpen("["..days.."-"..months.."-"..years.."].log") 
		else                    
			Commandlog = fileCreate("["..days.."-"..months.."-"..years.."].log")
		end    
		local Pname = getPlayerName(source) 
		local username = getElementData(source,"account:username")             
		pos = fileGetSize( Commandlog ); 
		newPos = fileSetPos ( Commandlog, pos );                                
		fileWrite(Commandlog, "["..hours..":"..minutes..":"..seconds.."] (PlayerName:"..Pname.." | UserName:"..username..") :" ..command.."\n")    
		fileClose(Commandlog)  
	end 
end)