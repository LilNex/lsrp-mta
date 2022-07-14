local objects = 
{
	-- Callum
	createObject(18088,1809.8737792969,-2454.1083984375,14.443499565125,0,0,0,23),
	createObject(1567,1809.8776855469,-2452.2927246094,12.534182548523,0,0,0,23),
	createObject(1567,1806.3408203125,-2455.4716796875,12.5546875,0,0,90,23),
	createObject(2406,1812.0883789063,-2453.1223144531,13.810459136963,0,0,270,23),
	createObject(2404,1812.1608886719,-2452.6206054688,13.810459136963,0,0,270,23),
	createObject(1642,1809.1223144531,-2454.7692871094,12.5546875,0,0,90,23),
	createObject(1646,1811.7775878906,-2456.0549316406,12.892117500305,0,0,180,23),
	createObject(1598,1806.6870117188,-2452.7038574219,12.859687805176,0,0,0,23),
	createObject(1810,1808.8858642578,-2452.9252929688,12.5546875,0,0,0,23),
	createObject(1810,1807.6884765625,-2452.9384765625,12.5546875,0,0,0,23),
	createObject(1810,1808.30078125,-2452.931640625,12.5546875,0,0,0,23),
	createObject(2528,1811.7287597656,-2450.3537597656,12.5546875,0,0,270,23),
	createObject(2517,1808.8100585938,-2452.556640625,12.5546875,0,0,0,23),
	createObject(2524,1808.810546875,-2450.62109375,12.5546875,0,0,90,23),
	createObject(2817,1809.6594238281,-2450.7956542969,12.5546875,0,0,0,23),
	createObject(1744,1809.4134521484,-2448.8662109375,13.520572662354,0,0,0,23),
	createObject(1744,1810.130859375,-2448.8662109375,13.520572662354,0,0,0,23),
	createObject(1744,1812.30859375,-2448.8662109375,13.520572662354,0,0,0,23),
	createObject(2750,1809.2348632813,-2449.3413085938,13.911070823669,270,0,0,23),
	createObject(2749,1812.0977783203,-2449.0090332031,13.865374565125,0,0,0,23),
	createObject(2751,1810.3131103516,-2449.1225585938,13.907945632935,0,0,0,23),
	createObject(2752,1810.9857177734,-2449.0966796875,13.861070632935,0,0,0,23),
	createObject(2384,1811.1215820313,-2456.9191894531,14.335722923279,0,0,180,23),
	createObject(1946,1808.6918945313,-2456.8962402344,15.196178436279,0,0,0,23),
	createObject(1738,1808.6589355469,-2457.0424804688,13.209318161011,0,0,0,23),
	createObject(2295,1806.8720703125,-2456.6694335938,12.560227394104,0,0,150,23),
	createObject(18088,1817.4030761719,-2454.9797363281,14.443499565125,0,0,90,23),
	createObject(2264,1811.6340332031,-2454.8112792969,13.995469093323,0,0,270,23),
	createObject(2251,1811.0447998047,-2457.0903320313,15.833228111267,0,0,0,23),
	createObject(2226,1809.9645996094,-2456.8735351563,14.232562065125,0,0,180,23),
	createObject(14772,1809.9200439453,-2456.8500976563,15.180892944336,0,0,180,23),
	createObject(2421,1808.5482177734,-2457.0419921875,14.232562065125,0,0,180,23)
}

local col = createColSphere(1810.876953125, -2453.58203125, 13.5546875,50)
local function watchChanges( )
	if getElementDimension( getLocalPlayer( ) ) > 0 and getElementDimension( getLocalPlayer( ) ) ~= getElementDimension( objects[1] ) and getElementInterior( getLocalPlayer( ) ) == getElementInterior( objects[1] ) then
		for key, value in pairs( objects ) do
			setElementDimension( value, getElementDimension( getLocalPlayer( ) ) )
		end
	elseif getElementDimension( getLocalPlayer( ) ) == 0 and getElementDimension( objects[1] ) ~= 65535 then
		for key, value in pairs( objects ) do
			setElementDimension( value, 65535 )
		end
	end
end
addEventHandler( "onClientColShapeHit", col,
	function( element )
		if element == getLocalPlayer( ) then
			addEventHandler( "onClientRender", root, watchChanges )
		end
	end
)
addEventHandler( "onClientColShapeLeave", col,
	function( element )
		if element == getLocalPlayer( ) then
			removeEventHandler( "onClientRender", root, watchChanges )
		end
	end
)
-- Put them standby for now.
for key, value in pairs( objects ) do
	setElementDimension( value, 65535 )
end
