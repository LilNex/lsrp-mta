local screenWidth, screenHeight = guiGetScreenSize()
local font = dxCreateFont('files/font.ttf', 15)
local font1 = dxCreateFont('files/font.ttf', 10)
local Players = {}
local idPlayers = {}
local crow = 0
local mrow = 11
local counter = 0

local currPlayers = 0

local aRanks = {
	[0] = {255,255,255},
	[1] = {247,202,24},
	[2] = {135,211,124},
	[3] = {135,211,124},
	[4] = {135,211,124},
	[5] = {135,211,124},
	[6] = {135,211,124},
	[7] = {255,167,0},
	[8] = {102,51,153},
	[9] = {210, 77, 87},
	[10] = {210, 77, 87},
	[11] = {65,131,215},
}

local alevel = {
	[1] = " [Staff]",
	[2] = " [Admin-1]",
	[3] = " [Admin-2]",
	[4] = " [Admin-3]",
	[5] = " [Admin-4]",
	[6] = " [Admin-5]",
	[7] = " [FőAdmin]",
	[8] = " [SzuperAdmin]",
	[9] = " (Rendszergazda)",
	[10] = " (Tulajdonos)",
	[11] = " <Fejlesztő/>",
}


bindKey("tab", "down", function()
	if getElementData(localPlayer, 'loggedin') == 1 then
		addEventHandler('onClientRender', root, scorec)
	end
end)

bindKey("tab", "up", function()
	if getElementData(localPlayer, 'loggedin') == 1 then
		removeEventHandler('onClientRender', root, scorec)
	end
end)

function scorec()
	for k,v in ipairs(getElementsByType("player")) do
		idPlayers[k] = v
	end
	table.sort(idPlayers,function(a,b)
		if a ~= localPlayer and b ~= localPlayer and getElementData(a,"playerid") and getElementData(b,"playerid") then
			return tonumber(getElementData(a,"playerid")) < tonumber(getElementData(b,"playerid"))
		end
	end)
	--scoreboard design
	dxDrawRectangle(screenWidth/2 - 320/2, screenHeight/2 - 390/2, 400, 420, tocolor(0,0,0,140)) -- háttér
	dxDrawRectangle(screenWidth/2 - 435/2, screenHeight/2 - 390/2, 50, 420, tocolor(0,0,0,140)) -- vékony bár

	dxDrawRectangle(screenWidth/2 - 435/2, screenHeight/2-225, 458, 30, tocolor(0,0,0,230)) -- felső bár

	dxDrawRectangle(screenWidth/2 - 300/2, screenHeight/2+200, 380, 20, tocolor(0,0,0,100)) -- playersbar
	dxDrawRectangle(screenWidth/2 - 298/2, screenHeight/2+201, 378*#idPlayers/750, 18, tocolor(49,121,203,100)) -- playersbar
	dxDrawText('	#DA5CE8Los Santos #FFFFFFRolePlay - #DA5CE8Score#FFFFFFBoard', screenWidth/2+10, screenHeight/2-210, _, _, tocolor(255,255,255,255),1, font, 'center', 'center', false, false, false, true)
	dxDrawText(#idPlayers .. '/150', screenWidth/2+40, screenHeight/2+210, _, _, tocolor(255,255,255,255),1, font1, 'center', 'center', false, false, false, true)
	dxDrawText('#DA5CE8I#ffffffD', screenWidth/2-140, screenHeight/2-182, _, _, tocolor(255,255,255,255),1, font, 'center', 'center', false, false, false, true)
	dxDrawText('#DA5CE8N#ffffffame', screenWidth/2-23, screenHeight/2-182, _, _, tocolor(255,255,255,255),1, font, 'center', 'center', false, false, false, true)
	dxDrawText('#DA5CE8H#ffffffours', screenWidth/2+215, screenHeight/2-182, _, _, tocolor(255,255,255,255),1, font, 'center', 'center', false, false, false, true)
	dxDrawImage(screenWidth/2 - 80, screenHeight/2 - 353, 200, 112, 'files/logoka.png', 0,0,0,tocolor(255,255,255,255*math.abs(getTickCount() % 3000 - 1500) / 1500))
	--vége




	lrow = crow + mrow  -1
	local counter = 0

	for k, v in pairs(idPlayers) do
		if k >= crow and k <= lrow then
			counter = counter + 1

			if tonumber(getElementData(v,"loggedin")) == 1 then
				pID = getElementData(v,"playerid") 
				pLVL = getElementData(v, 'hoursplayed' ) or 0
				alpha = 255
				adminL = alevel[getElementData(v,"adminlevel")]
				if getElementData(v,"adminduty") == 1 then
					pName = getElementData(v, 'anick') .. adminL
					colorR, colorG, colorB = unpack(aRanks[getElementData(v,"adminlevel")])
				else
					pName = getPlayerName(v):gsub('_', ' ')
					colorR, colorG, colorB = unpack(aRanks[0])
				end
			else
				alpha = 50
				pName = 'Downloading'
				pID = ''
				pLVL = ''
				colorR, colorG, colorB = unpack(aRanks[0])
			end

			roundedRectangle(screenWidth/2-157, screenHeight/2 - 193 + 32*counter, 393, 25, tocolor(0,0,0,100))
			--dxDrawImage(screenWidth/2-206, screenHeight/2 - 193 + 32*counter, 25, 25,exports["wls_avatars"]:getAvatars(v)  , 0,0,0,tocolor(255,255,255,255))
			dxDrawText(pID, screenWidth/2 - 141, screenHeight/2 - 181 + 32*counter, _, _, tocolor(255,255,255,255), 1, font, "center", "center")
			dxDrawText(pName, screenWidth/2 - 23, screenHeight/2 - 181 + 32*counter, _, _, tocolor(colorR, colorG, colorB, alpha), 1, font, 'center', 'center')
			dxDrawText(pLVL, screenWidth/2 + 215, screenHeight/2 - 181 + 32*counter, _, _, tocolor(255,255,255,255), 1, font, "center", "center")
		end
	end
end



addEventHandler('onClientPlayerQuit', getRootElement(), function()
	if source then
		idPlayers = {}
		for k,v in ipairs(getElementsByType("player")) do
			idPlayers[k] = v
		end

	end
end)



bindKey("mouse_wheel_down", "down", 
	function() 
		if getKeyState('tab') then
			if crow < #idPlayers - mrow then
				crow = crow + 1
			end
		end
	end
)

bindKey("mouse_wheel_up", "down", 
	function() 
		if getKeyState('tab') then
			if crow > 1 then
				crow = crow - 1
			end
		end
	end
)

function roundedRectangle(x, y, w, h, borderColor, bgColor, postGUI)
	if (x and y and w and h) then
		if (not borderColor) then
			borderColor = tocolor(0, 0, 0, 180)
		end
		if (not bgColor) then
			bgColor = borderColor
		end
		dxDrawRectangle(x, y, w, h, bgColor, postGUI);
		dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI);
		dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI);
		dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI);
		dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI);
        
        --Sarkokba pötty:
        dxDrawRectangle(x + 0.5, y + 0.5, 1, 2, borderColor, postGUI); -- bal felső
        dxDrawRectangle(x + 0.5, y + h - 1.5, 1, 2, borderColor, postGUI); -- bal alsó
        dxDrawRectangle(x + w - 0.5, y + 0.5, 1, 2, borderColor, postGUI); -- bal felső
        dxDrawRectangle(x + w - 0.5, y + h - 1.5, 1, 2, borderColor, postGUI); -- bal alsó
	end
end

