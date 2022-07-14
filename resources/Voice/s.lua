
function createMarkerAttachedTo(element, mType, size, r, g, b, a, visibleTo, xOffset, yOffset, zOffset)
	mType, size, r, g, b, a, visibleTo, xOffset, yOffset, zOffset = mType or "checkpoint", size or 4, r or 0, g or 0, b or 255, a or 255, visibleTo or getRootElement(), xOffset or 0, yOffset or 0, zOffset or 0
	assert(isElement(element), "Bad argument @ 'createMarkerAttachedTo' [Expected element at argument 1, got " .. type(element) .. "]") assert(type(mType) == "string", "Bad argument @ 'createMarkerAttachedTo' [Expected string at argument 2, got " .. type(mType) .. "]") assert(type(size) == "number", "Bad argument @ 'createMarkerAttachedTo' [Expected number at argument 3, got " .. type(size) .. "]") assert(type(r) == "number", "Bad argument @ 'createMarkerAttachedTo' [Expected number at argument 4, got " .. type(r) .. "]")	assert(type(g) == "number", "Bad argument @ 'createMarkerAttachedTo' [Expected number at argument 5, got " .. type(g) .. "]") assert(type(b) == "number", "Bad argument @ 'createMarkerAttachedTo' [Expected number at argument 6, got " .. type(b) .. "]") assert(type(a) == "number", "Bad argument @ 'createMarkerAttachedTo' [Expected number at argument 7, got " .. type(a) .. "]") assert(isElement(visibleTo), "Bad argument @ 'createMarkerAttachedTo' [Expected element at argument 8, got " .. type(visibleTo) .. "]") assert(type(xOffset) == "number", "Bad argument @ 'createMarkerAttachedTo' [Expected number at argument 9, got " .. type(xOffset) .. "]") assert(type(yOffset) == "number", "Bad argument @ 'createMarkerAttachedTo' [Expected number at argument 10, got " .. type(yOffset) .. "]") assert(type(zOffset) == "number", "Bad argument @ 'createMarkerAttachedTo' [Expected number at argument 11, got " .. type(zOffset) .. "]")
	local m = createMarker(0, 0, 0, mType, size, r, g, b, a, visibleTo)
	if m then if attachElements(m, element, xOffset, yOffset, zOffset) then return m end end return false
end



function setVoiceVol(playerSource, commandName)
	local markerRange = nil
	range = getElementData(playerSource, "range") or 5
	if range == 5 then
		setElementData(playerSource,"range",15)
		outputChatBox("Vous Criez", playerSource)
	elseif range == 15 then
		setElementData(playerSource,"range",2.5)
		outputChatBox("Vous Chuchoter", playerSource)	
	elseif range == 2.5 then
		setElementData(playerSource,"range",5)
		outputChatBox("Vous Parlez normal", playerSource)
	end
	range = getElementData(playerSource, "range")
	local markerRange = createMarkerAttachedTo(playerSource, "cylinder", range, 120,100,0,100,playerSource)
	setTimer(function()
		local markerRange = getAttachedElements (playerSource)
		for i,v in ipairs ( markerRange ) do
			if  getElementType(v) == "marker" then
				-- detachElements ( v, playerSource )
				destroyElement(v)
			end
		end
	end,1000,1)
end

function bind()
	if not isKeyBound(source,"F9","down",setVoiceVol) then
		bindKey(source,"F9","down",setVoiceVol)
	end
end    --End function
addEventHandler("onPlayerSpawn", root, bind)
addEventHandler("onResourceStart",resourceRoot,function()
	for k,v in ipairs(getElementsByType("player")) do 
		if not isKeyBound(v,"F9","down",setVoiceVol) then
			bindKey(v,"F9","down",setVoiceVol)
		end
	end

end)
addCommandHandler("setvoicevol",setVoiceVol )
addCommandHandler("changevoicevol",setVoiceVol )

function getNearPlayers(element)

	local TP = {}

	local x, y, z = getElementPosition(element)

	for i, player in ipairs(getElementsByType("player")) do

		local px, py, pz = getElementPosition(player)
		range = getElementData(element,"range") or 5
		if player ~= element and getDistanceBetweenPoints3D(x, y, z, px, py, pz) <= range then

			table.insert(TP, player)

		end

	end

	return TP

end



setTimer(function()

	for i, player in ipairs(getElementsByType("player")) do

		setPlayerVoiceBroadcastTo(player, getNearPlayers(player))

	end

end, 1500, 0) 




local mysql = exports.mysql
local staffTitles = exports.integration:getStaffTitles()
function getStaffInfo(username, error)
	local user = mysql:query_fetch_assoc("SELECT id, username, admin, supporter, vct, scripter, mapper FROM accounts WHERE username='"..mysql:escape_string(username).."'")
	local changelogs = {}
	local mQuery1 = nil
	mQuery1 = mysql:query("SELECT (CASE WHEN to_rank>from_rank THEN 1 ELSE 0 END) AS promoted, s.id, a1.username, team, from_rank, to_rank, a2.username AS `by`, details, DATE_FORMAT(date,'%b %d, %Y %h:%i %p') AS date FROM staff_changelogs s LEFT JOIN accounts a1 ON s.userid=a1.id LEFT JOIN accounts a2 ON s.`by`=a2.id WHERE s.userid="..user.id.." ORDER BY id DESC")
	while true do
		local row = mysql:fetch_assoc(mQuery1)
		if not row then break end
		table.insert(changelogs, row )
	end
	mysql:free_result(mQuery1)
	local staffInfo = {}
	staffInfo.user = user
	staffInfo.changelogs = changelogs
	staffInfo.error = error
	triggerClientEvent(source, "openStaffManager", source, staffInfo)
end
addEvent("staff:getStaffInfo", true)
addEventHandler("staff:getStaffInfo", root, getStaffInfo)

function getTeamsData()
	staffTitles = exports.integration:getStaffTitles()
	local users = {}
	local q = mysql:query("SELECT a.id, username, admin, supporter, vct, scripter, mapper, adminreports, AVG(rating) AS rating, COUNT(f.staff_id) AS feedbacks FROM accounts a LEFT JOIN feedbacks f ON a.id=f.staff_id WHERE admin > 0 OR supporter > 0 OR vct > 0 OR scripter>0 OR mapper>0 GROUP BY a.id ORDER BY admin DESC, adminreports DESC, supporter DESC, vct DESC, scripter DESC, mapper DESC")
	while true do
		local row = mysql:fetch_assoc(q)
		if not row then break end
		for i, k in ipairs(staffTitles) do
			if not users[i] then users[i] = {} end
			if tonumber(row.admin) > 0 and i == 1 then
				if not row.rank then row.rank = {} end
				row.rank[i] = tonumber(row.admin)
				table.insert(users[i], row)
			end
			if tonumber(row.supporter) > 0 and i == 2 then
				if not row.rank then row.rank = {} end
				row.rank[i] = tonumber(row.supporter)
				table.insert(users[i], row)
			end
			if tonumber(row.vct) > 0 and i == 3 then
				if not row.rank then row.rank = {} end
				row.rank[i] = tonumber(row.vct)
				table.insert(users[i], row)
			end
			if tonumber(row.scripter) > 0 and i == 4 then
				if not row.rank then row.rank = {} end
				row.rank[i] = tonumber(row.scripter)
				table.insert(users[i], row)
			end
			if tonumber(row.mapper) > 0 and i == 5 then
				if not row.rank then row.rank = {} end
				row.rank[i] = tonumber(row.mapper)
				table.insert(users[i], row)
			end
		end
	end
	mysql:free_result(q)
	triggerClientEvent(source, "openStaffManager", source, nil, users )
end
addEvent("staff:getTeamsData", true)
addEventHandler("staff:getTeamsData", root, getTeamsData)

function getChangelogs()
	local changelogs = {}
	local mQuery1 = nil
	mQuery1 = mysql:query("SELECT (CASE WHEN to_rank>from_rank THEN 1 ELSE 0 END) AS promoted, s.id, a1.username, team, from_rank, to_rank, a2.username AS `by`, details, DATE_FORMAT(date,'%b %d, %Y %h:%i %p') AS date FROM staff_changelogs s LEFT JOIN accounts a1 ON s.userid=a1.id LEFT JOIN accounts a2 ON s.`by`=a2.id ORDER BY id DESC")
	while true do
		local row = mysql:fetch_assoc(mQuery1)
		if not row then break end
		table.insert(changelogs, row )
	end
	mysql:free_result(mQuery1)
	triggerClientEvent(source, "openStaffManager", source, nil, nil, changelogs )
end
addEvent("staff:getChangelogs", true)
addEventHandler("staff:getChangelogs", root, getChangelogs)

function editStaff(userid, ranks, details)
	local error = nil
	if not userid or not tonumber(userid) then
		outputChatBox("Internal Error!", source, 255, 0, 0)
		return false
	else
		userid = tonumber(userid)
	end
	local target = nil
	for i, player in pairs(getElementsByType("player")) do
		if getElementData(player, "account:id") == userid then
			target = player
			break
		end
	end
	staffTitles = exports.integration:getStaffTitles()
	local user = mysql:query_fetch_assoc("SELECT id, username, admin, supporter, vct, scripter, mapper FROM accounts WHERE id='"..mysql:escape_string(userid).."'")
	local tail = ''
	if details and string.len(details)>0 then
		details = "'"..mysql:escape_string(details).."'"
	else
		details = "NULL"
	end
	if ranks[1] and ranks[1] ~= tonumber(user.admin) then
		tail = tail.."admin="..ranks[1]..","
		mysql:query_free("INSERT INTO staff_changelogs SET userid="..userid..", details="..details..", `by`="..getElementData(source, "account:id")..", team=1, from_rank="..user.admin..", to_rank="..ranks[1])
		exports.global:sendMessageToStaff("[STAFF UPDATE] "..exports.global:getPlayerFullIdentity(source, 1, true).." has "..(ranks[1] > tonumber(user.admin) and "promoted" or "demoted").." '"..user.username.."' from "..staffTitles[1][tonumber(user.admin)].." to "..staffTitles[1][ranks[1]]..".", true)
		exports.announcement:makePlayerNotification(target or user.id, exports.global:getPlayerFullIdentity(source, 1, true).." has "..(ranks[1] > tonumber(user.admin) and "promoted" or "demoted").." you from "..staffTitles[1][tonumber(user.admin)].." to "..staffTitles[1][ranks[1]]..".", (ranks[1] > tonumber(user.admin) and "Congratulations!" or "Sorry!"))
		if target then exports.anticheat:changeProtectedElementDataEx(target, "admin_level", ranks[1], true) end
	end
	if ranks[2] and ranks[2] ~= tonumber(user.supporter) then
		tail = tail.."supporter="..ranks[2]..","
		mysql:query_free("INSERT INTO staff_changelogs SET userid="..userid..", details="..details..", `by`="..getElementData(source, "account:id")..", team=2, from_rank="..user.supporter..", to_rank="..ranks[2])
		exports.global:sendMessageToStaff("[STAFF UPDATE] "..exports.global:getPlayerFullIdentity(source, 1, true).." has "..(ranks[2] > tonumber(user.supporter) and "promoted" or "demoted").." '"..user.username.."' from "..staffTitles[2][tonumber(user.supporter)].." to "..staffTitles[2][ranks[2]]..".", true)
		exports.announcement:makePlayerNotification(target or user.id, exports.global:getPlayerFullIdentity(source, 1, true).." has "..(ranks[2] > tonumber(user.supporter) and "promoted" or "demoted").." you from "..staffTitles[2][tonumber(user.supporter)].." to "..staffTitles[2][ranks[2]]..".", (ranks[2] > tonumber(user.supporter) and "Congratulations!" or "Sorry!"))
		if target then exports.anticheat:changeProtectedElementDataEx(target, "supporter_level", ranks[2], true) end
		
	end
	if ranks[3] and ranks[3] ~= tonumber(user.vct) then
		tail = tail.."vct="..ranks[3]..","
		mysql:query_free("INSERT INTO staff_changelogs SET userid="..userid..", details="..details..", `by`="..getElementData(source, "account:id")..", team=3, from_rank="..user.vct..", to_rank="..ranks[3])
		exports.global:sendMessageToStaff("[STAFF UPDATE] "..exports.global:getPlayerFullIdentity(source, 1, true).." has "..(ranks[3] > tonumber(user.vct) and "promoted" or "demoted").." '"..user.username.."' from "..staffTitles[3][tonumber(user.vct)].." to "..staffTitles[3][ranks[3]]..".", true)
		exports.announcement:makePlayerNotification(target or user.id, exports.global:getPlayerFullIdentity(source, 1, true).." has "..(ranks[3] > tonumber(user.vct) and "promoted" or "demoted").." you from "..staffTitles[3][tonumber(user.vct)].." to "..staffTitles[3][ranks[3]]..".", (ranks[3] > tonumber(user.vct) and "Congratulations!" or "Sorry!"))
		if target then exports.anticheat:changeProtectedElementDataEx(target, "vct_level", ranks[3], true) end
		
	end
	if ranks[4] and ranks[4] ~= tonumber(user.scripter) then
		tail = tail.."scripter="..ranks[4]..","
		mysql:query_free("INSERT INTO staff_changelogs SET userid="..userid..", details="..details..", `by`="..getElementData(source, "account:id")..", team=4, from_rank="..user.scripter..", to_rank="..ranks[4])
		exports.global:sendMessageToStaff("[STAFF UPDATE] "..exports.global:getPlayerFullIdentity(source, 1, true).." has "..(ranks[4] > tonumber(user.scripter) and "promoted" or "demoted").." '"..user.username.."' from "..staffTitles[4][tonumber(user.scripter)].." to "..staffTitles[4][ranks[4]]..".", true)
		exports.announcement:makePlayerNotification(target or user.id, exports.global:getPlayerFullIdentity(source, 1, true).." has "..(ranks[4] > tonumber(user.scripter) and "promoted" or "demoted").." you from "..staffTitles[4][tonumber(user.scripter)].." to "..staffTitles[4][ranks[4]]..".", (ranks[4] > tonumber(user.scripter) and "Congratulations!" or "Sorry!"))
		if target then exports.anticheat:changeProtectedElementDataEx(target, "scripter_level", ranks[4], true) end
		
	end
	if ranks[5] and ranks[5] ~= tonumber(user.mapper) then
		tail = tail.."mapper="..ranks[5]..","
		mysql:query_free("INSERT INTO staff_changelogs SET userid="..userid..", details="..details..", `by`="..getElementData(source, "account:id")..", team=5, from_rank="..user.mapper..", to_rank="..ranks[5])
		exports.global:sendMessageToStaff("[STAFF UPDATE] "..exports.global:getPlayerFullIdentity(source, 1, true).." has "..(ranks[5] > tonumber(user.mapper) and "promoted" or "demoted").." '"..user.username.."' from "..staffTitles[5][tonumber(user.mapper)].." to "..staffTitles[5][ranks[5]]..".", true)
		exports.announcement:makePlayerNotification(target or user.id, exports.global:getPlayerFullIdentity(source, 1, true).." has "..(ranks[5] > tonumber(user.mapper) and "promoted" or "demoted").." you from "..staffTitles[5][tonumber(user.mapper)].." to "..staffTitles[5][ranks[5]]..".", (ranks[5] > tonumber(user.mapper) and "Congratulations!" or "Sorry!"))
		if target then exports.anticheat:changeProtectedElementDataEx(target, "mapper_level", ranks[5], true) end
		
	end
	if tail ~= '' then
		tail = string.sub(tail, 1, string.len(tail)-1)
		if not mysql:query_free("UPDATE accounts SET "..tail.." WHERE id="..userid) then
			outputChatBox("Internal Error!", source, 255, 0, 0)
			return false
		end
	end
	triggerEvent("staff:getStaffInfo", source, user.username, "Staff rank for "..user.username.." has been set!")
end
addEvent("staff:editStaff", true)
addEventHandler("staff:editStaff", root, editStaff)

function makePlayerStaff(thePlayer, commandName, who, rank) 
		if not (who) or not (tonumber(rank)) then
			outputChatBox("SYNTAX: /" .. commandName .. " [Player Partial Name/ID] [Staff Team ID] [Rank]", thePlayer, 255, 194, 14)
			outputChatBox("SYNTAX: /" .. commandName .. " [Exact Username] [Rank, -1 .. -4 = GMs, 1 .. 7 = Admins]", thePlayer, 255, 194, 14)
		else
			local targetPlayer, targetPlayerName = exports.global:findPlayerByPartialNick(thePlayer, who)
			local username = false
			local targetUsername = false
			local currentRank = false
			local adminID = false
			rank = tonumber(rank)

			if not targetPlayer then
				return false
			end

			targetUsername = getElementData(targetPlayer, "account:username")
			currentRank = getElementData(targetPlayer, "admin_level")
			adminID = getElementData(targetPlayer, "account:id")


			if (rank > 0) or (rank == -999999999) then
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "duty_admin", 1, true)
			else
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "duty_admin", 0, true)
			end

			if (rank < 0) then
				local gmrank = -rank
				outputChatBox("You set " .. targetPlayerName .. "'s GM rank to " .. tostring(gmrank) .. ".", thePlayer, 0, 255, 0)
				
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "account:gmlevel", gmrank, false)
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "duty_supporter", 1, true)
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "admin_level", 0, false)
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "duty_admin", 0, true)
			elseif rank == 0 then
				
				outputChatBox("You set " .. targetPlayerName .. " to Player.", thePlayer, 0, 255, 0)
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "admin_level", 0, false)
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "duty_admin", 0, true)
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "account:gmlevel", 0, false)
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "duty_supporter", 0, true)
			else
				
				outputChatBox("You set " .. targetPlayerName .. "'s Admin rank to " .. tostring(rank) .. ".", thePlayer, 0, 255, 0)
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "admin_level", rank, false)
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "duty_admin", 1, true)
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "account:gmlevel", 0, false)
				exports.anticheat:changeProtectedElementDataEx(targetPlayer, "duty_supporter", 0, true)
			end




			exports.logs:dbLog(thePlayer, 4, targetPlayer, "MAKEADMIN " .. rank)
			exports.global:updateNametagColor(targetPlayer)
		end
end
--addCommandHandler("really", makePlayerStaff, false, false)
-- bindKey(root,"l","down",setVoiceVol)

