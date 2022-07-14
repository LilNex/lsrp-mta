local screenwidth, screenheight = guiGetScreenSize ()
local posw, posh = 352,183

Window = guiCreateWindow(527, 308, 352, 183, "Boat Fishing Rent | v1.2", false)
button1 = guiCreateButton(10, 33, 334, 15, "Zodiac 30 Minutes. (Prix: 1000$)", false, Window)
button2 = guiCreateButton(10, 58, 333, 15, "Zodiac - 1 heure. (Prix: 1550$)", false, Window)
button3 = guiCreateButton(10, 83, 333, 15, "Zodiac - 4 heure. (Prix: 5500$)", false, Window)
button40 = guiCreateButton(11, 108, 331, 15, "[Floka Soon (Soon)]", false, Window)
button50 = guiCreateButton(10, 133, 331, 15, "[Boat Ship Large (Soon)]", false, Window)
button6 = guiCreateButton(9, 157, 331, 15, "Close", false, Window)    

Marker = createPickup ( 2311.5498046875, -2379.37109375, 13.546875, 3, 1239, 50 )

addEventHandler( "onClientResourceStart", getRootElement( ),
	function ( )
		guiSetVisible(Window, false)
	end
)

function GuiOpen ( hitPlayer )
	if ( hitPlayer == getLocalPlayer () ) then
		if ( Window ~= nil ) then 
		if not exports.global:hasItem(localPlayer, 10025) then
			outputChatBox("#01C3FE[Boat Rent] #ffffffYou must have #73AA5FFishing Card #ffffffto rent here!  ",225,122,188, true)	
            return			
		end	
			if exports.global:hasItem(localPlayer, 10025) then
				guiSetVisible ( Window, true )
				guiBringToFront ( Window )
				guiSetInputEnabled ( true )
				addEventHandler ( "onClientGUIClick", button1, button1Func, false )
            	addEventHandler ( "onClientGUIClick", button2, button2Func, false )	
	        	addEventHandler ( "onClientGUIClick", button3, button3Func, false )	
	        	addEventHandler ( "onClientGUIClick", button4, button4Func, false )	
		    	addEventHandler ( "onClientGUIClick", button5, button4Func, false )		
				addEventHandler ( "onClientGUIClick", button6, button6Func, false )
				showCursor ( true )
			end			
		end
	end

end
addEventHandler ( "onClientPickupHit", Marker, GuiOpen )

function button6Func ( button, state )
	if button == "left" and state == "up" then
		guiSetInputEnabled ( false )
		guiSetVisible ( Window, false )
		showCursor ( false )
	end
end

function button1Func ( button, state )
	if button == "left" and state == "up" then
		local kunde = getLocalPlayer()
		triggerServerEvent ( "stnrentroller", getLocalPlayer(), kunde )
		guiSetInputEnabled ( false )
		guiSetVisible ( Window, false )
		showCursor ( false )		
	end
end

function button2Func ( button, state )
	if button == "left" and state == "up" then
		local kunde = getLocalPlayer()
		triggerServerEvent ( "stnrentroller1", getLocalPlayer(), kunde )
		guiSetInputEnabled ( false )
		guiSetVisible ( Window, false )
		showCursor ( false )		
	end
end

function button3Func ( button, state )
	if button == "left" and state == "up" then
		local kunde = getLocalPlayer()
		triggerServerEvent ( "stnrentroller2", getLocalPlayer(), kunde )
		guiSetInputEnabled ( false )
		guiSetVisible ( Window, false )
		showCursor ( false )		
	end
end

function button4Func ( button, state )
	if button == "left" and state == "up" then
		local kunde = getLocalPlayer()
		triggerServerEvent ( "stnrentroller3", getLocalPlayer(), kunde )
		guiSetInputEnabled ( false )
		guiSetVisible ( Window, false )
		showCursor ( false )		
	end
end

function button5Func ( button, state )
	if button == "left" and state == "up" then
		local kunde = getLocalPlayer()
		triggerServerEvent ( "stnrentroller4", getLocalPlayer(), kunde )
		guiSetInputEnabled ( false )
		guiSetVisible ( Window, false )
		showCursor ( false )		
	end
end