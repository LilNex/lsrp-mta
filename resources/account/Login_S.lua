--[[

All CopyRights Reserved To HkHaythem - ULG Dev Team © 2020
Don't Change AnyThing To Avoid Errors
To Contact Me : am.hk.haythem@gmail.com

]]--

local mysql = exports.mysql
local accountCharacters = {}
function validateCredentials(username,password,checksave)
	if not (username == "") then
		if not (password == "") then
			return true
		else
			exports["Hk_KSA-Notifications"]:show_box(source, "Please enter your password!", "error")
		end
	else
		exports["Hk_KSA-Notifications"]:show_box(source, "Please enter your username!", "error")
	end
	return false
end
addEvent("onRequestLogin",true)
addEventHandler("onRequestLogin",getRootElement(),validateCredentials)

function playerLogin(username,password,checksave)
	local encryptionRuleData, encryptionRuleQuery, accountCheckQuery, preparedQuery, accountData,newAccountHash,safeusername,safepassword = nil

	if not validateCredentials(username,password,checksave) then
		return false
	end

	--Get Encyption Rule for user.
	preparedQuery = "SELECT * FROM `accounts` WHERE `username`='".. mysql:escape_string(username) .."'"
	encryptionRuleQuery = mysql:query(preparedQuery)
	if encryptionRuleQuery then
	else
		exports["Hk_KSA-Notifications"]:show_box(source, "Failed to connect to game server. Database error!", "error")
		return false
	end

	if (mysql:num_rows(encryptionRuleQuery) > 0) then
	else
		exports["Hk_KSA-Notifications"]:show_box(source, "Account name '".. username .."' doesn't exist!", "error")
		return false
	end
	accountData = mysql:fetch_assoc(encryptionRuleQuery)
	mysql:free_result(encryptionRuleQuery)

	-- Check if the account is banned
	if exports.bans:checkAccountBan(accountData["id"]) then
		exports["Hk_KSA-Notifications"]:show_box(source, "Account is banned.", "error")
		return false
	end

	--Now check if passwords are matched or the account is activated, this is to prevent user with fake emails.
	--exports["Hk_KSA-Notifications"]:show_box(source, "Password Accepted! Authenticating..")
	local encryptionRule = accountData["salt"]
	local encryptedPW = string.lower(md5(string.lower(md5(password))..encryptionRule))

	if accountData["password"] ~= encryptedPW then
		exports["Hk_KSA-Notifications"]:show_box(source, "Password is incorrect for account name '".. username .."'!")
		return false
	end

	if accountData["activated"] == "0" then
		exports["Hk_KSA-Notifications"]:show_box(source, "Account '".. username .."' is not activated.")
		return false
	end

	--Validation is done, fetching some more details
	exports["Hk_KSA-Notifications"]:show_box(source, "Account authenticated! Logging in..")
        -- restartResource(getResourceFromName("id-system"))

	-- Check the account is already logged in
	local found = false
	for _, thePlayer in ipairs(exports.pool:getPoolElementsByType("player")) do
		local playerAccountID = tonumber(getElementData(thePlayer, "account:id"))
		if (playerAccountID) then
			if (playerAccountID == tonumber(accountData["id"])) and (thePlayer ~= client) then
				kickPlayer(thePlayer, thePlayer, "Someone else has logged into your account.")
				exports["Hk_KSA-Notifications"]:show_box(source, "Account is currently online. Disconnecting other user..", "error")
				break
			end
		end
	end


	-----------------------------------------------------------------------START THE MAGIC-----------------------------------------------------------------------------------
	triggerClientEvent(client, "items:inventory:hideinv", client)

	-- Start the magic
	setElementDataEx(client, "account:loggedin", true, true)
	setElementDataEx(client, "account:id", tonumber(accountData["id"]), true)
	setElementDataEx(client, "account:username", accountData["username"], true)
	setElementDataEx(client, "electionsvoted", accountData["electionsvoted"], true)
	
	setElementDataEx(client, "serial", accountData["mtaserial"], true)
	setElementDataEx(client, "email", accountData["email"], true)
	setElementDataEx(client, "account:registerdate", accountData["registerdate"], true)	
	setElementDataEx(client, "account:lastlogin", accountData["lastlogin"], true)
    setElementDataEx(client, "account:ip", accountData["ip"], true)	
	--STAFF PERMISSIONS / MAXIME
	setElementDataEx(client, "admin_level", tonumber(accountData['admin']), true)
	setElementDataEx(client, "supporter_level", tonumber(accountData['supporter']), true)
	setElementDataEx(client, "vct_level", tonumber(accountData['vct']), true)
	setElementDataEx(client, "mapper_level", tonumber(accountData['mapper']), true)
	setElementDataEx(client, "scripter_level", tonumber(accountData['scripter']), true)

	-- exports['report-system']:reportLazyFix(client)

	setElementDataEx(client, "adminreports", tonumber(accountData["adminreports"]), true)
	setElementDataEx(client, "adminreports_saved", tonumber(accountData["adminreports_saved"]))

	if tonumber(accountData['referrer']) and tonumber(accountData['referrer']) > 0 then
		setElementDataEx(client, "referrer", tonumber(accountData['referrer']), false, true)
	end

	if exports.integration:isPlayerLeadAdmin(client) then
		setElementDataEx(client, "hiddenadmin", accountData["hiddenadmin"], true)
	else
		setElementDataEx(client, "hiddenadmin", 0, true)
	end

	local vehicleConsultationTeam = exports.integration:isPlayerVehicleConsultant(client)
	setElementDataEx(client, "vehicleConsultationTeam", vehicleConsultationTeam, false)

	if  tonumber(accountData["adminjail"]) == 1 then
		setElementDataEx(client, "adminjailed", true, true)
	else
		setElementDataEx(client, "adminjailed", false, true)
	end
	setElementDataEx(client, "jailtime", tonumber(accountData["adminjail_time"]), true)
	setElementDataEx(client, "jailadmin", accountData["adminjail_by"], true)
	setElementDataEx(client, "jailreason", accountData["adminjail_reason"], true)
	setElementDataEx(client, "jaillink", accountData["adminjail_link"], true)

	if accountData["monitored"] ~= "" then
		setElementDataEx(client, "admin:monitor", accountData["monitored"], true)
	end

	exports.logs:dbLog("ac"..tostring(accountData["id"]), 27, "ac"..tostring(accountData["id"]), "Connected from "..getPlayerIP(client) .. " - "..getPlayerSerial(client) )
	mysql:query_free("UPDATE `accounts` SET `ip`='" .. mysql:escape_string(getPlayerIP(client)) .. "', `mtaserial`='" .. mysql:escape_string(getPlayerSerial(client)) .. "' WHERE `id`='".. mysql:escape_string(tostring(accountData["id"])) .."'")


	setElementDataEx(client, "jailreason", accountData["adminjail_reason"], true)
	
	triggerEvent("updateCharacters", client)

	exports.donators:loadAllPerks(client)
	local togNewsPerk, togNewsStatus = exports.donators:hasPlayerPerk(client, 3)
	if (togNewsPerk) then
		setElementDataEx(client, "tognews", tonumber(togNewsStatus), false, true)
	end

	--SETTINGS / MAXIME
	loadAccountSettings(client, accountData["id"])

	-- Check if player passed application
	--outputDebugString(type(accountData["appreason"]))
	if tonumber(accountData["appstate"]) < 3 then
		if exports.integration:isPlayerTrialAdmin(client) or exports.integration:isPlayerSupporter(client) then
			exports.mysql:query_free("UPDATE `accounts` SET `appstate`='3', `appreason`=NULL WHERE `id`='"..accountData["id"].."' ")
		else
	triggerClientEvent(client, "vehicle_rims", client)
	triggerClientEvent(client, "accounts:login:attempt", client, 0 )
	triggerEvent( "social:account", client, tonumber( accountData.id ) )
	triggerClientEvent (client,"hkStopAccountUI",client)
			return false
		end
	end

	triggerClientEvent(client, "vehicle_rims", client)
	triggerClientEvent(client, "accounts:login:attempt", client, 0 )
	triggerEvent( "social:account", client, tonumber( accountData.id ) )
	triggerClientEvent (client,"hkStopAccountUI",client,username,password)
end
addEvent("accounts:login:attempt",true)
addEventHandler("accounts:login:attempt",getRootElement(),playerLogin)

function myCallback( responseData, errno, id )
    if errno == 0 then
        --Cache it
        exports.cache:addImage(id, responseData)
	end
end

function playerFinishApps()
	if source then
		client = source
	end
	local index = getElementData(client, "account:id")
	triggerClientEvent(client, "accounts:login:attempt", client, 0)--, accountCharacters[index] )
	triggerEvent( "social:account", client, index )
	triggerClientEvent (client,"hkStopAccountUI",client)
	triggerClientEvent (client,"apps:destroyGUIPart3",client)
	--accountCharacters[index] = nil
end
addEvent("accounts:playerFinishApps",true)
addEventHandler("accounts:playerFinishApps",getRootElement(),playerFinishApps)

--local lastClient = nil
function playerRegister(username,password,confirmPassword, email)
	--CHECK FOR EXISTANCE OF USERNAME AND EMAIL ADDRESS / MAXIME
	local preparedQuery1 = "SELECT `id` FROM `accounts` WHERE `username`='".. mysql:escape_string(username) .."' OR `email`='".. mysql:escape_string(email) .."' "
	local Q1 = mysql:query(preparedQuery1)
	if not Q1 then
		--triggerClientEvent(client,"set_warning_text",client,"Register","Error code 0002 occurred.")
		return false
	end

	if (mysql:num_rows(Q1) > 0) then
		exports["Hk_KSA-Notifications"]:show_box(source, "Username or email existed.", "error")
		mysql:free_result(Q1)
		return false
	end

	--CHECK FOR EXISTANCE OF MTA SERIAL TO ENCOUNTER MULTIPLE ACCOUNTS PER USER / MAXIME.
	local mtaSerial = getPlayerSerial(source)
	local preparedQuery2 = "SELECT `mtaserial`, `username`, `id` FROM `accounts` WHERE `mtaserial`='".. toSQL(mtaSerial) .."' LIMIT 1"
	local Q2 = mysql:query(preparedQuery2)
	if not Q2 then
		--triggerClientEvent(client,"set_warning_text",client,"Register","Error code 0003 occurred.")
		return false
	end

	local usernameExisted = mysql:fetch_assoc(Q2)
	if (mysql:num_rows(Q2) > 0) and usernameExisted["id"] ~= "1" then
		exports["Hk_KSA-Notifications"]:show_box(source, "Multiple Accounts is not allowed (Existed: "..tostring(usernameExisted["username"])..")", "error")
		return false
	end
	mysql:free_result(Q2)

	--START CREATING ACCOUNT.
	local encryptionRule = tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))
	local encryptedPW = string.lower(md5(string.lower(md5(password))..encryptionRule))
	local ipAddress = getPlayerIP(client)
	preparedQuery3 = "INSERT INTO `accounts` SET `username`='"..toSQL(username).."', `password`='"..toSQL(encryptedPW).."', `email`='"..toSQL(email).."', `registerdate`=NOW(), `ip`='"..toSQL(ipAddress).."', `salt`='"..toSQL(encryptionRule).."', `mtaserial`='"..mtaSerial.."', `activated`='1' "
	local id = mysql:query_insert_free(preparedQuery3)
	if id and tonumber(id) then
		triggerClientEvent(client,"hkRegisterDone",client, username, password)
		exports["Hk_KSA-Notifications"]:show_box(source, "Successfully Registered. Click Login!")
		return true
	else
		--triggerClientEvent(client,"set_warning_text",client,"Register","Could not create new account.")
		exports["Hk_KSA-Notifications"]:show_box(source, "Could not create new account.", "error")
		return false
	end
end
addEvent("accounts:register:attempt",true)
addEventHandler("accounts:register:attempt",getRootElement(),playerRegister)

function hkRecoverPassword(Username, NewPassword)
	local hkSerial = getPlayerSerial(source)
	local hkPreparedQuery = "SELECT * FROM `accounts` WHERE `username`='".. toSQL(Username) .."' LIMIT 1"
	local hkQuery = mysql:query(hkPreparedQuery)
	if not hkQuery then
	    outputDebugString("Database Error Contact Scripter: am.hk.haythem@gmail.com")
		return false
	end	
	if not (mysql:num_rows(hkQuery) > 0) then
		exports["Hk_KSA-Notifications"]:show_box(source, "Account name '".. Username .."' doesn't exist!", "error")
		return false
	end
	local hkAccountData = mysql:fetch_assoc(hkQuery)	
	local hkAccountUser = hkAccountData["username"]
	local hkAccountSerial = hkAccountData["mtaserial"]
	if (hkSerial==hkAccountSerial) then
	    local hkEncryptionRule = tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))..tostring(math.random(0,9))
	    local hkPasswordEncrypted = string.lower(md5(string.lower(md5(NewPassword))..hkEncryptionRule))
		mysql:query_free("UPDATE `accounts` SET `password`='"..toSQL(hkPasswordEncrypted).."', `salt`='"..toSQL(hkEncryptionRule).."' WHERE `username`='"..toSQL(Username).."'")
		exports["Hk_KSA-Notifications"]:show_box(source, "You Have Change Your Password to: "..NewPassword, "error")	
	else
		exports["Hk_KSA-Notifications"]:show_box(source, "This Account: '".. Username .."' is not yours", "error")
    end	    
end
addEvent("hkRecoverPassword",true)
addEventHandler("hkRecoverPassword",getRootElement(), hkRecoverPassword)

function toSQL(stuff)
	return mysql:escape_string(stuff)
end