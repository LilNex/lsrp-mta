-------------------------------------------------
-- THIS FILE CONVERTS 64 GTA AREAS DATA TO 256 --
-------------------------------------------------

addCommandHandler ( "convert", function()
	local AREA_CONVERTED = {}
	for areaID = 0, 255 do
		AREA_CONVERTED[areaID] = {}
		local old_areaID = getOldAreaFromNew ( areaID )
		local asx, asy = getAreaPosition ( areaID )
		local aex, aey = asx + 375, asy - 375
		local temp_t = AREA_PATHS[old_areaID]
		for old_nodeID, old_nodeData in pairs ( temp_t ) do
			local x, y, z = old_nodeData.x, old_nodeData.y, old_nodeData.z
			local nodeID = convertNodeID ( old_nodeID, areaID )
			if ( ( asx <= x and x <= aex ) and ( aey <= y and y <= asy ) ) then
				AREA_CONVERTED[areaID][nodeID] = {}
				AREA_CONVERTED[areaID][nodeID].id = nodeID
				AREA_CONVERTED[areaID][nodeID].x = x
				AREA_CONVERTED[areaID][nodeID].y = y
				AREA_CONVERTED[areaID][nodeID].z = z
				AREA_CONVERTED[areaID][nodeID].width = old_nodeData.width
				AREA_CONVERTED[areaID][nodeID].type = old_nodeData.type
				AREA_CONVERTED[areaID][nodeID].leftlanes = old_nodeData.leftlanes
				AREA_CONVERTED[areaID][nodeID].rightlanes = old_nodeData.rightlanes
				AREA_CONVERTED[areaID][nodeID].flags = old_nodeData.flags
				AREA_CONVERTED[areaID][nodeID].neighbours = {}
				for neighbour, dist in pairs ( old_nodeData.neighbours ) do
					local n = getNode ( neighbour )
					local nAreaID = getAreaFromPosition ( n.x, n.y )
					if ( old_nodeID == 590050 ) then
						print ( neighbour.." "..convertNodeID ( neighbour, nAreaID ) )
					end
					AREA_CONVERTED[areaID][nodeID].neighbours[convertNodeID ( neighbour, nAreaID )] = dist
				end
			end
		end
		table.sort ( AREA_CONVERTED[areaID], function ( a, b ) return a < b end )
	end
	-- so we dont get too long execution crap
	setTimer ( save, 50, 1, AREA_CONVERTED )
end )

function save ( AREA_CONVERTED )
	local fp = fileCreate ( "converted.lua" )
	fileWrite ( fp, "AREA_PATHS = {\n" )
	for areaID = 0, 255 do
		local areaData = AREA_CONVERTED[areaID]
		fileWrite ( fp, "\t["..( areaID ).."] = {\n" )
		local first = true
		for nodeID, nodeData in pairs ( areaData ) do
			if ( first ) then
				fileWrite ( fp, "\t\t["..nodeID.."] = { " )
				first = false
			else
				fileWrite ( fp, ",\n\t\t["..nodeID.."] = { " )
			end
			fileWrite ( fp, "id = "..nodeID..", " )
			fileWrite ( fp, "x = "..nodeData.x..", " )
			fileWrite ( fp, "y = "..nodeData.y..", " )
			fileWrite ( fp, "z = "..nodeData.z..", " )
			first = true
			fileWrite ( fp, "neighbours = {" )
			for neighbour, dist in pairs ( nodeData.neighbours ) do
				if ( first ) then
					fileWrite ( fp, "["..neighbour.."] = "..dist )
					first = false
				else
					fileWrite ( fp, ", ["..neighbour.."] = "..dist )
				end
			end
			fileWrite ( fp, "} " )
			fileWrite ( fp, "}" )
		end
		fileWrite ( fp, "\n\t},\n" )
	end
	fileWrite ( fp, "}\n" )
	fileClose ( fp )
	print ( "Finished" )
end

function convertNodeID ( nodeID, areaID )
	return ( nodeID % 65536 ) + areaID * 8884
end

function getOldAreaFromNew ( areaID )
	return 8 * math.floor ( areaID / 32 ) + math.floor ( ( areaID % 16 ) / 2)
end

function getAreaPosition ( areaID )
	local row = math.floor ( areaID / 16 )
	local column = areaID % 16
	return column * 375 - 3000, 0 - ( 6000 - ( ( row + 1 ) * 375 ) - 3000 )
end

function getAreaFromPosition ( x, y )
	local column = math.floor ( ( x + 3000 ) / 375 )
	local row = math.floor ( ( y + 3000 ) / 375 )
	return column + ( row * 16 )
end

addCommandHandler ( "convert_limits", function ()
	local fp = fileCreate ( "area_limits.lua" )
	fileWrite ( fp, "AREA_LIMITS = {\n" )
	for i = 0, 255 do
		fileWrite ( fp, "\t["..i.."] = { ALL = 10 }" )
		if ( i < 255 ) then fileWrite ( fp, "," ) end
		fileWrite ( fp, "\n" )
	end
	fileWrite ( fp, "}\n" )
	fileClose ( fp )
end )