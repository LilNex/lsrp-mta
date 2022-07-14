local screenwidth, screenheight = guiGetScreenSize ()
local posw, posh = 352,183

Window = guiCreateWindow(527, 308, 352, 183, "Location System | v.0.1", false)
button1 = guiCreateButton(10, 33, 334, 15, "Faggio - 30 Minutes. (Prix: 500$)", false, Window)
button2 = guiCreateButton(10, 58, 333, 15, "Moutain Bike - 1 heure. (Prix: 150$)", false, Window)
button3 = guiCreateButton(10, 83, 333, 15, "BMX - 1 heure. (Prix: 150$)", false, Window)
button40 = guiCreateButton(11, 108, 331, 15, "[En dev - Bientot]", false, Window)
button50 = guiCreateButton(10, 133, 331, 15, "[En dev - Bientot]", false, Window)
button6 = guiCreateButton(9, 157, 331, 15, "Fermer", false, Window)    

Marker = createPickup ( 1645.337890625, -2326.65625, 13.546875, 3, 1239, 50 )

addEventHandler( "onClientResourceStart", getRootElement( ),
	function ( )
		guiSetVisible(Window, false)
	end
)

function GuiOpen ( hitPlayer )
	if ( hitPlayer == getLocalPlayer () ) then
		if ( Window ~= nil ) then
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
		triggerServerEvent ( "rentroller", getLocalPlayer(), kunde )
		guiSetInputEnabled ( false )
		guiSetVisible ( Window, false )
		showCursor ( false )		
	end
end

function button2Func ( button, state )
	if button == "left" and state == "up" then
		local kunde = getLocalPlayer()
		triggerServerEvent ( "rentroller1", getLocalPlayer(), kunde )
		guiSetInputEnabled ( false )
		guiSetVisible ( Window, false )
		showCursor ( false )		
	end
end

function button3Func ( button, state )
	if button == "left" and state == "up" then
		local kunde = getLocalPlayer()
		triggerServerEvent ( "rentroller2", getLocalPlayer(), kunde )
		guiSetInputEnabled ( false )
		guiSetVisible ( Window, false )
		showCursor ( false )		
	end
end

function button4Func ( button, state )
	if button == "left" and state == "up" then
		local kunde = getLocalPlayer()
		triggerServerEvent ( "rentroller3", getLocalPlayer(), kunde )
		guiSetInputEnabled ( false )
		guiSetVisible ( Window, false )
		showCursor ( false )		
	end
end

function button5Func ( button, state )
	if button == "left" and state == "up" then
		local kunde = getLocalPlayer()
		triggerServerEvent ( "rentroller4", getLocalPlayer(), kunde )
		guiSetInputEnabled ( false )
		guiSetVisible ( Window, false )
		showCursor ( false )		
	end
end