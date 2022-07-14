_createPed = createPed
function createPed ( ... )
	-- Store our ped and set randomizer
	local ped
	repeat
		ped = _createPed ( math.random ( 7, 17 ), ... )
	until ped
	if not ped then
		outputDebugString("CREATE "..tostring(getElementType(ped)).." "..tostring(ped).." "..tostring(table.concat({...}," ")), 1)
		return false
	end
	CITIZENS_PEDS[ped] = math.random ( 1, 8 )
	return ped
end