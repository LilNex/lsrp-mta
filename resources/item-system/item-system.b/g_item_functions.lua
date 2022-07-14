function getItemRotInfo(id)
	if not g_items[id] then
		return 0, 0, 0, 0
	else
		return  g_items[id][5], g_items[id][6], g_items[id][7], g_items[id][8]
	end
end

local _vehiclecache = {}
local function findVehicleName( value )
	if _vehiclecache[value] then
		return _vehiclecache[value]
	end
	
	for _, theVehicle in pairs( getElementsByType( "vehicle" ) ) do
		if getElementData( theVehicle, "dbid" ) == value then
			_vehiclecache[value] = exports.global:getVehicleName( theVehicle )
			return _vehiclecache[value]
		end
	end
	return "?"
end

function getItemName(id, value)
	if not id or not tonumber(id) then
		return "Loading.."
	end
	if id == -100 then
		return "Body Armor"	
	elseif id == -46 then -- MTA Client bug
		return "Parachute"
	elseif id < 0 then
		return getWeaponNameFromID( -id )
	elseif not g_items[id] then
		return "?"
	elseif id == 3 and value then
		return g_items[id][1] .. " (" .. findVehicleName(value) .. ")", findVehicleName(value)
	elseif ( id == 4 or id == 5 ) and value then
		local pickup = exports['interior-system']:findParent( nil, value )
		local name = isElement(pickup) and getElementData( pickup, "name" )
		return g_items[id][1] .. ( name and ( " (" .. name .. ")" ) or "" ), name
	elseif ( id == 80 ) and value then
		return value
	-- elseif ( id == 214 ) and value then
		-- return value
	elseif ( id == 90 or id == 171 or id == 172 ) and value then
		local itemValue = explode(";", value)
		if itemValue[1] and itemValue[2] then
			local customName = tostring(itemValue[1]).." helmet"
			return customName
		else
			return g_items[id][1]
		end
	elseif ( id == 96 ) and value and value ~= 1 then
		return value
	elseif ( id == 89 or id == 95 or id == 109 or id == 110 ) and value and value:find( ";" ) ~= nil then
		return value:sub( 1, value:find( ";" ) - 1 )
	elseif (id == 115 or id == 116) and value then
		local itemExploded = explode(":", value )
		return itemExploded[3] 
	elseif (id == 150) and value then --ATM card
		local itemExploded = explode(";", value )
		local text = "ATM card"
		if itemExploded and itemExploded[3] then
			if tonumber(itemExploded[3]) == 1 then
				text = text.." - Basic"
			elseif tonumber(itemExploded[3]) == 2 then
				text = text.." - Premium"
			elseif tonumber(itemExploded[3]) == 3 then
				text = text.." - Ultimate"
			end
		end
		return text
	elseif(id == 165) then --video disc
		local disc = tonumber(value) or 0
		if disc > 1 then
			local discData = exports.fakevideo:getFakevideoData(disc)
			if discData then
				return 'DVD "'..tostring(discData.name)..'"'
			end 
		else
			return "Empty DVD"
		end
		return "DVD"
	elseif(id == 175) then --poster
		if value and not tonumber(value) then
			local itemExploded = explode(";", value)
			local name = tostring(itemExploded[1].." Poster")
			return name
		else
			return g_items[id][1]
		end
	--[[elseif(id == 178) then
		local yup = split(value, ":")
		return yup[1] or "book".." by ".. yup[2] or ""]]
	else
		return g_items[id][1]
	end
end

function getItemValue(id, value)
	if id == 80 then
		return ""
	-- elseif id == 214 then
		-- return ""
	--elseif id == 96 then
		--return 1
	elseif id == 10 and tostring(value) == "1" then
		return 6
	elseif (id == 89 or id == 95 or id == 109 or id == 110) and value and value:find( ";" ) ~= nil then
		return value:sub( value:find( ";" ) + 1 )
	elseif (id == 115 and value) then
		return explode(":", value)[2]
	elseif id == 116 and value then
		return value:gsub("^(%d+):(%d+):", "%2 ")
	else
		return value
	end
end

	
function getItemDescription(id, value)
	--if true then return "blag" end
	local i = g_items[id]
	if i then
		local desc = i[2]
		if id == 90 or id == 171 or id == 172 then
			local itemValue = explode(";", value)
			if itemValue[3] then
				local helmetDesc = tostring(itemValue[3])
				return helmetDesc
			else
				return desc:gsub("#v",value)
			end
		elseif id == 96 and value ~= 1 then
			return desc:gsub("PDA","Laptop")
		elseif id == 114 then 
			if tonumber(value) == nil then return nil end
			local v = tonumber(value) - 999
			return desc:gsub("#v", vehicleupgrades[v] or "?")
		elseif id == 150 then--ATM card
			local itemExploded = explode(";", value)
			if tonumber( itemExploded[2] ) > 0 then
				return "Card Number: '"..itemExploded[1].."', Owner: '"..tostring(exports.cache:getCharacterNameFromID(itemExploded[2])):gsub("_", " ").."'"
			else
				return "Card Number: '"..itemExploded[1].."', Owner: '"..tostring(exports.cache:getBusinessNameFromID(math.abs(itemExploded[2]))).."'"
			end
		elseif id == 152 then--ID card
			local itemExploded = explode(";", value)
			return "A sleek plastic ID card has name of "..tostring(itemExploded[1]):gsub("_", " ")..", photo and some other basic information."
		elseif id == 178 then
			local yup = split(value, ":")
            return yup[1] .." by ".. yup[2]
		else
			return desc:gsub("#v",value)
		end
	end
end

function getItemType(id)
	return ( g_items[id] or { nil, nil, 4 } )[3]
end

function getItemModel(id, value)
	if id == 115 and value then
		--return value
		local itemExploded = explode(":", value )
		return weaponmodels[ tonumber(itemExploded[1]) ] or 1271
	else
		return ( g_items[id] or { nil, nil, nil, 1271 } )[4]
	end
end

function explode(div,str) -- credit: http://richard.warburton.it
  if (div=='') then return false end
  local pos,arr = 0,{}
  -- for each divider found
  for st,sp in function() return string.find(str,div,pos,true) end do
	table.insert(arr,string.sub(str,pos,st-1)) -- Attach chars left of current divider
	pos = sp + 1 -- Jump past current divider
  end
  table.insert(arr,string.sub(str,pos)) -- Attach chars right of last divider
  return arr
end

function getItemTab(id)
	if getItemType( id ) == 2 then
		return 3
	elseif getItemType( id ) == 8 or getItemType( id ) == 9 then
		return 4
	elseif getItemType( id ) == 10 then
		return 1
	else
		return 2
	end
end

function getItemWeight( itemID, itemValue, metadata )
	if not metadata then
		if(detailedDebug and sourceResource) then
			local theSource = getResourceName(sourceResource)
			outputDebugString("getItemWeight: metadata: missing (source: "..tostring(theSource)..")", 2)
		end
		metadata = {}
	elseif type(metadata) ~= "table" then
		if detailedDebug then
			local theSource
			if(sourceResource) then
				theSource = getResourceName(sourceResource)
			else
				theSource = "unknown"
			end
			outputDebugString("getItemWeight: metadata:"..tostring(metadata).." (source: "..tostring(theSource)..")", 2)
		end
		metadata = {}
	end
	if metadata.weight then
		return tonumber(metadata.weight) or 1
	else
		local weight = g_items[ itemID ] and g_items[ itemID ].weight
		if not weight then return 0 end
		return type(weight) == "function" and weight( tonumber(itemValue) or itemValue ) or weight
	end
end

function getItemScale( itemID )
	local scale = g_items[ itemID ] and g_items[ itemID ].scale
	return scale
end
function getItemDoubleSided( itemID )
	local dblsided = g_items[ itemID ] and g_items[ itemID ].doubleSided
	return dblsided
end
function getItemTexture( itemID, itemValue )
	if itemID == 90 or itemID == 171 or itemID == 172 then --helmet
		if itemValue then
			local texname = {
				[90] = "helmet",
				[171] = "helmet_b",
				[172] = "helmet_f"
			}
			itemValue = explode(";", itemValue)
			if itemValue[2] then
				local texture = { {tostring(itemValue[2]), texname[itemID]} }
				return texture
			end
		end
	elseif itemID == 167 and itemValue then --framed picture
		itemValue = explode(";", itemValue)
		if itemValue[2] then
			local texture = { {tostring(itemValue[2]), "cj_painting34"} }
			return texture
		end
	elseif itemID == 175 and itemValue then --poster
		itemValue = explode(";", itemValue)
		if itemValue[2] then
			local texture = { {tostring(itemValue[2]), "cj_don_post_2"} }
			return texture
		end
	end
	local texture = g_items[ itemID ] and g_items[ itemID ].texture
	return texture
end
function getItemPreventSpawn( itemID, itemValue )
	local preventSpawn = g_items[ itemID ] and g_items[ itemID ].preventSpawn
	return preventSpawn
end
function getItemUseNewPickupMethod( itemID )
	local use = g_items[ itemID ] and g_items[ itemID ].newPickupMethod
	return use
	--return true
end
function getItemHideItemValue( itemID )
	local use = g_items[ itemID ] and g_items[ itemID ].hideItemValue
	return use
end
function isItem( id )
	return g_items[tonumber(id)]
end

function isStorageItem( itemID, itemValue ) --true if item can hold other items
	local storage = g_items[ itemID ] and g_items[ itemID ].storage
	return storage
end
function getItemWeightCapacity( itemID, itemValue, metadata ) --weight capacity for shelf items
	if itemID == 223 then --Storage generic by Chaos
		local capacity = tonumber(split(itemValue, ":")[3]) or 10
		return capacity
	else
		if g_items[ itemID ] and g_items[ itemID ].capacity then
			local capacity = tonumber(g_items[ itemID ].capacity)
			if capacity then
				return capacity
			end
		end
		return 0
	end
end
function canStorageTakeItem( itemID, itemValue, addItemID, addItemValue )
	if g_items[ itemID ] and g_items[ itemID ].acceptItems then
		local acceptedItems = g_items[ itemID ].acceptItems
		if acceptedItems[addItemID] or acceptedItems[-getItemType(addItemID)] then
			return true
		else
			return false
		end
	else
		return true
	end
end
itemBannedByAltAltChecker = { 
	[2] = true, --CELLPHONE
	[3] = true, --VEHICLE KEY
	[4] = true, --HOUSE KEY
	[5] = true, --BUSINESS KEY
	[68] = true, --LOTTERY TICKET
	[73] = true, --ELEVATOR REMOTE
	[74] = true, --BOMB
	[75] = true, --BOMB REMOTE
	[98] = true, --GARAGE REMOTE
	[114] = true, --VEHICLE UPGRADE
	[115] = true, --WEAPONS
	[116] = true, --AMMOPACKS
	[134] = true, --MONEY
	[150] = true, --ATM CARD
}

function getPlayerMaxCarryWeight(element)
	local weightCount = 15 -- Default storage capability in kg 

	if hasItem(element, 48) then weightCount = weightCount + 10 end -- backpack
	if hasItem(element, 126) then weightCount = weightCount + 7.5 end -- duty belt
	if hasItem(element, 160) then weightCount = weightCount + 2 end -- briefcase
	if hasItem(element, 163) then weightCount = weightCount + 15 end -- dufflebag
	if hasItem(element, 164) then weightCount = weightCount + 15 end -- medical bag
	return weightCount
end

itemBannedByAltAltChecker = {
	[2] = true, --CELLPHONE
	[3] = true, --VEHICLE KEY
	[4] = true, --HOUSE KEY
	[5] = true, --BUSINESS KEY
	[68] = true, --LOTTERY TICKET
	[73] = true, --ELEVATOR REMOTE
	[74] = true, --BOMB
	[75] = true, --BOMB REMOTE
	[98] = true, --GARAGE REMOTE
	[114] = true, --VEHICLE UPGRADE
	[115] = true, --WEAPONS
	[116] = true, --AMMOPACKS
	[134] = true, --MONEY
	[150] = true, --ATM CARD
}



splittableItems = {
	[30]=" gram(s)", [31]=" gram(s)", [32]=" gram(s)", [33]=" gram(s)", [34]=" gram(s)", [35]=" ml(s)", [36]=" tablet(s)",
	[37]=" gram(s)", [38]=" gram(s)", [39]=" gram(s)", [40]=" ml(s)", [41]=" tab(s)", [42]=" shroom(s)", [43]=" tablet(s)", [134] = " money",
	[147]="picture frame", [115]="weapons", [300]="dirtymoney", [116] = "ammopack"
 }


-- returns the number of available item slots for that element
function isTruck( element )
	local model = getElementModel( element )
	return model == 498 or model == 609 or model == 499 or model == 524 or model == 455 or model == 414 or model == 456
end

function isVan(element)
	local model = getElementModel( element )
	return model == 482 or model == 440 or model == 418 or model == 413 or model == 459 or model == 582 or model == 423
end

function isSUV( element )
	local model = getElementModel( element )
	return model == 400 or model == 489 or model == 579 or model == 582 or model == 490
end

function isTrailer(element)
	local model = getElementModel(element)
	return model == 435 or model == 450 or model == 591
end

function matchingMetadata(data1, data2)
	for k, v in pairs(data1) do
		if v ~= data2[k] then
			return false
		end
	end
	return true
end