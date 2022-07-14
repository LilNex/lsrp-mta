local host     							= 'host='..get( "hostname" ) ..';dbname='..get( "database" ) 
local username 							= get( "username" ) 
local password 							= get( "password" ) 
local mainOptions, secondaryOptions  	= 'share=0;tag=Main Connection;batch=0;log=1', 'share=0;tag=Secondary Connection;batch=1;log=1'
local mainConnection, secondaryConnection

addEventHandler("onResourceStart", resourceRoot,
function()
	mainConnection 		= dbConnect("mysql", host, username, password, mainOptions)
	secondaryConnection = dbConnect("mysql", host, username, password, secondaryOptions)
	outputServerLog("Connections: "..tostring(mainConnection)..' '..tostring(secondaryConnection))
end)

function getDBDetails()
	return mainConnection, secondaryConnection
end