local attachedLightbars = {}

addEventHandler("onResourceStart", resourceRoot, function()
	for k, v in pairs(getElementsByType("vehicle")) do
		removeVehicleSirens(v)
	end
end)

addEventHandler("onElementDestroy", root, function()
	if getElementType(source) == "vehicle" then
		attachedLightbars[source] = nil
	end
end)

addEventHandler("onElementDestroy", root, function()
	if getElementType(source) == "vehicle" then
		attachedLightbars[source] = nil
	end
end)

addEvent("requestAttachedLightbarsS", true)
addEventHandler("requestAttachedLightbarsS", root, function()
	triggerClientEvent(source, "receiveAttachedLightbarsC", source, attachedLightbars)
end)

addEvent("attachLightbarS", true)
addEventHandler("attachLightbarS", root, function(data, player)
	if not attachedLightbars[source] then
		attachedLightbars[source] = {}
	end

	if sirenPositions[data[1]] then
		local sirensNum = 0
		for k, v in pairs(attachedLightbars[source]) do
			sirensNum = sirensNum + #sirenPositions[v[1]]
		end

		sirensNum = sirensNum + #sirenPositions[data[1]]

		if sirensNum < 9 then
			triggerClientEvent("attachLightbarC", source, data)
			table.insert(attachedLightbars[source], data)

			removeVehicleSirens(source)

			addVehicleSirens(source, sirensNum, 2, false, true, true, true)

			local sirenIndex = 0
			for k, v in pairs(attachedLightbars[source]) do
				local x, y, z = v[2], v[3], v[4]
				local rx, ry, rz = v[5], v[6], v[7]

				for i = 1, #sirenPositions[v[1]] do
					local value = sirenPositions[v[1]][i]
					
					if value then
						sirenIndex = sirenIndex + 1

						local matrix = createMatrix(x, y, z, rx, ry, rz)
						local ox, oy, oz = getMatrixOffset(matrix, value.x or 0, value.y or 0, value.z or 0)
						
						setVehicleSirens(source, sirenIndex, ox, oy, oz, value.r, value.g, value.b, value.mina or 180, value.maxa or 200)
					end
				end
			end
		else
			outputChatBox("** Too many lights on your vehicle! Current light(s): " .. sirensNum - #sirenPositions[data[1]] .. ". Maximum number of lights is 8", player, 215, 89, 89)
		end
	end
end)

addEvent("detachLightbarS", true)
addEventHandler("detachLightbarS", root, function(data)
	attachedLightbars[source] = nil

	triggerClientEvent("detachLightbarC", source, data)
	removeVehicleSirens(source, false)
	setVehicleSirensOn(source, false)
end)

function getMatrixOffset(m, x, y, z)
	return x * m[1][1] + y * m[2][1] + z * m[3][1] + m[4][1],
			x * m[1][2] + y * m[2][2] + z * m[3][2] + m[4][2],
			x * m[1][3] + y * m[2][3] + z * m[3][3] + m[4][3]
end

function createMatrix(x, y, z, rx, ry, rz)
	rx, ry, rz = math.rad(rx), math.rad(ry), math.rad(rz)
	return {
		[1] = {
			[1] = math.cos(rz) * math.cos(ry) - math.sin(rz) * math.sin(rx) * math.sin(ry),
			[2] = math.cos(ry) * math.sin(rz) + math.cos(rz) * math.sin(rx) * math.sin(ry),
			[3] = -math.cos(rx) * math.sin(ry),
			[4] = 1
		},
		[2] = {
			[1] = math.cos(rx) * math.sin(rz),
			[2] = math.cos(rz) * math.cos(rx),
			[3] = math.sin(rx),
			[4] = 1
		},
		[3] = {
			[1] = math.cos(rz) * math.sin(ry) + math.cos(ry) * math.sin(rz) * math.sin(rx),
			[2] = math.sin(rz) * math.sin(ry) - math.cos(rz) * math.cos(ry) * math.sin(rx),
			[3] = math.cos(rx) * math.cos(ry),
			[4] = 1
		},
		[4] = {
			[1] = x,
			[2] = y,
			[3] = z,
			[4] = 1
		}
	}
end