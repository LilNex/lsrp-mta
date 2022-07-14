--Settings block for c_characters.lua/line 87
endCam = {
        [0] = {591.1669921875, -1827.3310546875, 10.137532234191, 570.09375, -1849.947265625, 4.968677997},
        [1] = {2511.8854980469, -1679.1414794922, 17.823833465576, 2425.4426269531, -1641.1086425781, -15.056860923767},
        [2] = {1553.4459228516, -1365.8366699219, 332.95718383789, 1495.1271972656, -1295.9808349609, 291.49520874023},
        [3] = {-2233.2431640625, -1705.6872558594, 484.6149597168, -2268.3579101563, -1797.0213623047, 463.99838256836},
}
startCam = {
        [0] = {1309.4599609375, -2123.7509765625, 106.98361206055, 1309.53515625, -1818.5615234375, 76.211189270 },
        [1] = {2637.0703125, -1719.1510009766, 90.978698730469, 2636.2329101563, -1718.8670654297, 90.511764526367},
        [2] = {1862.1447753906, -1743.5769042969, 616.80279541016, 1807.4505615234, -1676.6506347656, 566.50939941406},
        [3] = {-1553.6662597656, -1547.2840576172, 76.449432373047, -1653.0958251953, -1555.7768554688, 69.997413635254},
}
originalStartCam = {
        [0] = {1309.4599609375, -2123.7509765625, 106.98361206055, 1309.53515625, -1818.5615234375, 76.211189270 },
        [1] = {2637.0703125, -1719.1510009766, 90.978698730469, 2636.2329101563, -1718.8670654297, 90.511764526367},
        [2] = {1862.1447753906, -1743.5769042969, 616.80279541016, 1807.4505615234, -1676.6506347656, 566.50939941406},
        [3] = {-1553.6662597656, -1547.2840576172, 76.449432373047, -1653.0958251953, -1555.7768554688, 69.997413635254},
}
pedPos = {
        [0] = {581.5712890625, -1835.89453125, 5.6328125, 306.9929},
        [1] = {2502.59765625, -1679.40234375, 13.375785827637, 256.50445556641},
        [2] = {1549.615234375, -1362.326171875, 329.45889282227, 202.84092712402},
        [3] = {-2236.76171875, -1710.3046875, 480.88693237305, 310.16250610352},
}
globalspeed = 25 --Higher value = slower
speed = {}
doneCam = {
	[0] = {false, false, false, false, false, false},
	[1] = {false, false, false, false, false, false},
	[2] = {false, false, false, false, false, false},
	[3] = {false, false, false, false, false, false},
}

function getSelectionScreenID()
	local hasThisPerk, thisPerkValue = exports.donators:hasPlayerPerk(localPlayer, 24) --Groove St
	if hasThisPerk and tonumber(thisPerkValue) == 1 then
		return 1
	end

	hasThisPerk, thisPerkValue = exports.donators:hasPlayerPerk(localPlayer, 25) --Star Tower
	if hasThisPerk and tonumber(thisPerkValue) == 1 then
		return 2
	end

	hasThisPerk, thisPerkValue = exports.donators:hasPlayerPerk(localPlayer, 26) --Mount Chiliad
	if hasThisPerk and tonumber(thisPerkValue) == 1 then
		return 3
	end

	return 0
end

addEventHandler("accounts:login:request", getRootElement(),
function ()
    local hkLoggedIn = getElementData(getLocalPlayer(), "loggedin")
	if (hkLoggedIn == 1) then return end
	setElementDimension ( getLocalPlayer(), 0 )
	setElementInterior( getLocalPlayer(), 0 )
	clearChat()
	triggerServerEvent("onJoin", getLocalPlayer())
end)

--[[ LoginScreen_openLoginScreen( ) - Open the login screen ]]--
local wLogin, lUsername, tUsername, lPassword, tPassword, chkRememberLogin, bLogin, bRegister--[[, updateTimer]] = nil
function LoginScreen_openLoginScreen(title)
	hkStartAccountUI()
end
addEvent("beginLogin", true)
addEventHandler("beginLogin", getRootElement(), LoginScreen_openLoginScreen)


function LoginScreen_Register()
	local username = guiGetText(tUsername)
	local password = guiGetText(tPassword)
	if (string.len(username)<3) then
		LoginScreen_showWarningMessage( "Your username must be a minimum of 3 characters!" )
	elseif (string.find(username, ";", 0)) or (string.find(username, "'", 0)) or (string.find(username, "@", 0)) or (string.find(username, ",", 0)) or (string.find(username, " ", 0)) then
		LoginScreen_showWarningMessage("Your username cannot contain ;,@.' or space!")
	elseif (string.len(password)<6) then
	    LoginScreen_showWarningMessage("Your password is too short. \n You must enter 6 or more characters.", 255, 0, 0)
    elseif (string.len(password)>=30) then
        LoginScreen_showWarningMessage("Your password is too long. \n You must enter less than 30 characters.", 255, 0, 0)
    elseif (string.find(password, ";", 0)) or (string.find(password, "'", 0)) or (string.find(password, "@", 0)) or (string.find(password, ",", 0)) then
        LoginScreen_showWarningMessage("Your password cannot contain ;,@'.", 255, 0, 0)
	else
		showChat(true)
		triggerServerEvent("accounts:register:attempt", getLocalPlayer(), username, password)
	end
end

function LoginScreen_RefreshIMG()
	currentslide =  currentslide + 1
	if currentslide > totalslides then
		currentslide = 1
	end
end

--[[ LoginScreen_closeLoginScreen() - Close the loginscreen ]]

--[[ checkCredentials() - Used to validate and send the contents of the login screen  ]]--
function checkCredentials()
	local username = guiGetText(tUsername)
	local password = guiGetText(tPassword)
	guiSetText(tPassword, "")
	--appendSavedData("hashcode", "")
	if (string.len(username)<3) then
		outputChatBox("Your username is too short. You must enter 3 or more characters.", 255, 0, 0)
	else
		local saveInfo = guiCheckBoxGetSelected(chkRememberLogin)
		triggerServerEvent("accounts:login:attempt", getLocalPlayer(), username, password, saveInfo)

		if (saveInfo) then
			--appendSavedData("username", tostring(username))
		else
			--appendSavedData("username", "")
		end
	end
end

local warningBox, warningMessage, warningOk = nil
function LoginScreen_showWarningMessage( message )

	if (isElement(warningBox)) then
		destroyElement(warningBox)
	end

	local x, y = guiGetScreenSize()
	warningBox = guiCreateWindow( x*.5-150, y*.5-65, 300, 120, "Attention!", false )
	guiWindowSetSizable( warningBox, false )
	warningMessage = guiCreateLabel( 40, 30, 220, 60, message, false, warningBox )
	guiLabelSetHorizontalAlign( warningMessage, "center", true )
	guiLabelSetVerticalAlign( warningMessage, "center" )
	warningOk = guiCreateButton( 130, 90, 70, 20, "Ok", false, warningBox )
	addEventHandler( "onClientGUIClick", warningOk, function() destroyElement(warningBox) end )
	guiBringToFront( warningBox )
end
addEventHandler("accounts:error:window", getRootElement(), LoginScreen_showWarningMessage)

function defaultLoginText()
	loginTitleText = "MTA Roleplay"
end

addEventHandler("accounts:login:attempt", getRootElement(),
	function (statusCode, additionalData)
		if (statusCode == 0) then
			if (isElement(warningBox)) then
				destroyElement(warningBox)
			end

			local newAccountHash = getElementData(getLocalPlayer(), "account:newAccountHash")
			--appendSavedData("hashcode", newAccountHash or "")
			hkChShowCharactersUI() -- HkHaythem
		elseif (statusCode > 0) and (statusCode < 5) then
			LoginScreen_showWarningMessage( additionalData )
		elseif (statusCode == 5) then
			LoginScreen_showWarningMessage( additionalData )
			-- TODO: show make app screen?
		end
	end
)

local Window = {}
local Button = {}
local Label = {}
local Edit = {}

function showPasswordUpdate()
	showCursor(true)
	Window[1] = guiCreateWindow(0.3562,0.3997,0.2891,0.2383,"SECURITY NOTICE:",true)
		guiSetInputEnabled ( true)
		Label[1] = guiCreateLabel(0.0378,0.153,0.9324,0.2404,"We have noticed a potential security flaw with your account.\nTo help prevent any loss of data, we highly reccomend that\nyou enter a new password in the box below!",true,Window[1])
			guiLabelSetColor(Label[1],0,200,0)
			guiLabelSetHorizontalAlign(Label[1],"center",false)
		Edit[1] = guiCreateEdit(0.4243,0.4481,0.5351,0.1475,"",true,Window[1])
			guiEditSetMasked(Edit[1], true)
		Edit[2] = guiCreateEdit(0.4243,0.6175,0.5351,0.1475,"",true,Window[1])
			guiEditSetMasked(Edit[2], true)
		Label[2] = guiCreateLabel(0.1649,0.4754,0.2432,0.1038,"New Password:",true,Window[1])
		Label[3] = guiCreateLabel(0.1216,0.6284,0.2784,0.1038,"Confirm Password:",true,Window[1])
		Button[1] = guiCreateButton(0.427,0.8087,0.527,0.1257,"Change Password",true,Window[1])
			addEventHandler("onClientGUIClick", Button[1], function()
				triggerServerEvent("account:forceChange:validate", getLocalPlayer(), guiGetText(Edit[1]), guiGetText(Edit[2]))
			end)
end
addEvent("account:forceChangePassword:GUI", true)
addEventHandler("account:forceChangePassword:GUI", getRootElement(), showPasswordUpdate)

function closePasswordUpdate()
	destroyElement(Window[1])
	showCursor(false)
	guiSetInputEnabled ( false)
end
addEvent("account:forceChange:GUIClose", true)
addEventHandler("account:forceChange:GUIClose", getRootElement(), closePasswordUpdate)
