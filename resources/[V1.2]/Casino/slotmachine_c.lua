--[[
© Creditos do script: #Mods MTA:SA

© Creditos da pagina postadora: DropMTA

© Discord DropMTA: https://discord.gg/GZ8DzrmxUV

Acesse nosso site de mods: https://dropmta.blogspot.com/

]]--


local drum = "img/drum.png"
local druminteral = "img/cards.png"

local settings = {}
settings.drumColor = tocolor(90, 135, 228)
settings.stake = 50
settings.stakeMax = 500
settings.stakeMin = 50
settings.stakeStep = 50
settings.font = "font/Roboto.ttf"
settings.language = "english"
settings.jackpotSound = "sounds/jackpot.ogg" 
settings.positionsCol = {  
	
	{732.712890625, -1358.48828125, 23.5859375, 2, 0, 0}, 

}

settings.gamesPlayed = 0  -- ANTI-MACHO E ANTI-CHEAT NO CASSINO
settings.rolling = false
settings.cardsize = 256  


local cards = {
	
	{"slotMachineCards/goldbar.png", 20, 75},
	{"slotMachineCards/redbar.png", 10, 10},
	{"slotMachineCards/greenbar.png", 1, 5},

	{"slotMachineCards/bell.png", 5, 10},
	{"slotMachineCards/heart.png", 5, 10},
	{"slotMachineCards/horseshoe.png", 5, 10},
	{"slotMachineCards/goldclover.png", 10, 25},
	{"slotMachineCards/greenclover.png", 5, 10},

	{"slotMachineCards/goldenseven.png", 20, 75},
	{"slotMachineCards/redseven.png", 5, 25},

	{"slotMachineCards/ruby.png", 10, 25},
	{"slotMachineCards/emerald.png", 10, 25},
	{"slotMachineCards/diamond.png", 20, 75},

	{"slotMachineCards/cherry.png", 1, 5},
	{"slotMachineCards/grape.png", 1, 5},
	{"slotMachineCards/lemon.png", 1, 5},
	{"slotMachineCards/plum.png", 1, 5},
	{"slotMachineCards/watermelon.png", 1, 5},
}

local setList = { 
{{0.215, 0, "slotMachineCards/bell.png"}, {0.215, 0.36, "slotMachineCards/goldbar.png"}}, 
{{0.422, 0, "slotMachineCards/bell.png"}, {0.422, 0.36, "slotMachineCards/goldbar.png"}}, 
{{0.628, 0, "slotMachineCards/bell.png"}, {0.628, 0.36, "slotMachineCards/goldbar.png"}}, 
}

local setSettings = { 
{speedBasic = 0.004, count = 75, xstart = 0.215},
{speedBasic = 0.0045, count = 100, xstart = 0.422},
{speedBasic = 0.005, count = 133, xstart = 0.628},
}

local gui = {}
local dumpedCards = {}
local localisation = {}

localisation["english"] = {
	winenthiusastic = "Unbelievable! You won three cards. You gained %d$!",
	win = "Two cards, you're lucky!! You gained %d$",
	lose = "You lost it is sad :(",
	stakeMax = "You can not bet more %d$!",
	stakeMin = "Minimum bet rate %d$!",
	notEnoughCash = "You do not have enough money to make a higher bet.!",
	notEnoughCashOnRoll = "Your money is not enough.!",
	stakeInfo = "Bet\nTax\n%d$",
	roll = "Touch",
	leave = "Leave",
	whenRolling = "You have no money!",
}


localisation["polish"] = {
	winenthiusastic = "Três de uma vez! Isso não acontece com muita frequência. Você ganhou %d$!",
	win = "Golpe duplo, que sorte! Você ganhou %d$.",
	lose = "Você não teve sorte desta vez. Boa sorte na próxima vez :)",
	stakeMax = "Você não pode apostar mais do que %d$!",
	stakeMin = "A máquina não funcionará se a sua aposta estiver abaixo do mínimo %d$",
	notEnoughCash = "Você não tem dinheiro suficiente para aumentar sua aposta!",
	notEnoughCashOnRoll = "Você não tem dinheiro suficiente para começar o sorteio!",
	stakeInfo = "Atual\navaliar\n%d$",
	roll = "Toque",
	leave = "Sair",
	whenRolling = "Você não pode fazer isso enquanto o sorteio está em andamento!",
}

-- MISC FUNCTIONS

local function outputOnScreen(str, r, g, b)
	local labels = {{},{},{}}
	labels[1] = {str, r, g, b}
	labels[2] = {guiGetText(gui.labelList1), guiLabelGetColor(gui.labelList1)}
	labels[3] = {guiGetText(gui.labelList2), guiLabelGetColor(gui.labelList2)}
	for k,v in ipairs(labels) do
		guiLabelSetColor(gui["labelList"..k], v[2], v[3], v[4])
		guiSetText(gui["labelList"..k], v[1])
	end
end

local function copyTable() end
copyTable = function(t1)
	local newTable = {}
	for k, v in ipairs(t1) do
		if type(v) ~= "table" then
			newTable[k] = v
		else
			newTable[k] = copyTable(v)
		end
	end
	return newTable
end

local function getFontSizeFromResolution(w, h, base)
	local w = w/base
	local h = h/base
	local result = math.floor(math.sqrt(h*w))
	return result
end


local sw, sh = guiGetScreenSize()
local function drawImage(x, y, card)
	local topy = y - 0.23
	local bottomy = 0.75 - y
	if topy < 0 then
		local hrr = (0.25+topy)/0.25
		dxDrawImageSection(x*sw, (y-topy)*sh, 0.15*sw, (0.25+topy)*sh, 0, (1-hrr)*settings.cardsize, settings.cardsize, hrr*settings.cardsize, card)
	elseif bottomy > 0 and bottomy < 0.25 then
		dxDrawImageSection(x*sw, y*sh, 0.15*sw, bottomy*sh, 0, 0, settings.cardsize, (bottomy/0.25)*settings.cardsize, card)
	else
		dxDrawImageSection(x*sw, y*sh, 0.15*sw, 0.25*sh, 0, 0, settings.cardsize, settings.cardsize, card)
	end
end

local function generateSets()
	for i = 1, #setList do
		for i2 = 1, setSettings[i].count do
			local newcard = {0, 0, "str"}
			newcard[1] = setSettings[i].xstart
			newcard[2] = 0.4*i2+0.25
			newcard[3] = cards[math.random(1, #cards)][1]
			table.insert(setList[i], newcard)
		end
		setSettings[i].speed = setSettings[i].speedBasic * 40
	end
	if math.sqrt(settings.gamesPlayed) > math.random(22, 50) and math.random(1,2)%2==0 then 
		setList[1][setSettings[1].count - 1][3] = cards[math.random(1,4)][1]
		setList[2][setSettings[2].count - 1][3] = cards[math.random(5,8)][1]
		setList[3][setSettings[3].count - 1][3] = cards[math.random(9,12)][1]
	end
	collectgarbage("collect")
end
local function getPlayerMoney()
	return tonumber(getElementData(localPlayer,"money")) or 0


end

local function calculateRewards()
	local multiplier = {name, multiplier = 0, columns = 0}
	
	multiplier.columns = multiplier.columns + ((setList[1][2][3] == setList[2][2][3] and setList[1][2][3] == setList[3][2][3] and 3)  or (setList[1][2][3] == setList[2][2][3] and 2) or (setList[2][2][3] == setList[3][2][3] and 2) or (setList[1][2][3] == setList[3][2][3] and 2) or 0)
	
	multiplier.name = (setList[1][2][3] == setList[2][2][3] and setList[1][2][3] == setList[3][2][3] and setList[1][2][3]) or (setList[1][2][3] == setList[2][2][3] and setList[1][2][3]) or (setList[2][2][3] == setList[3][2][3] and setList[2][2][3]) or (setList[1][2][3] == setList[3][2][3] and setList[3][2][3])
	if multiplier.columns ~= 0 then
		for k,v in ipairs(cards) do
			if v[1] == multiplier.name then
				multiplier.multiplier = v[multiplier.columns]
			end
		end
	end
	
	dumpedCards = {}  
	collectgarbage("collect") 
	
	if multiplier.columns == 3 then
		outputOnScreen(string.format(localisation[settings.language].winenthiusastic, settings.stake*multiplier.multiplier), 255, 255, 0)
		triggerServerEvent("casinoGivePlayerMoney", localPlayer, settings.stake*multiplier.multiplier)
		guiSetText(gui.labelMoney, getPlayerMoney() + settings.stake*multiplier.multiplier.."$")
		playSound(settings.jackpotSound)
	elseif multiplier.columns == 2 then
		outputOnScreen(string.format(localisation[settings.language].win, settings.stake*multiplier.multiplier), 220, 220, 0)
		triggerServerEvent("casinoGivePlayerMoney", localPlayer, settings.stake*multiplier.multiplier)
		guiSetText(gui.labelMoney, getPlayerMoney() + settings.stake*multiplier.multiplier.."$")
		playSound(settings.jackpotSound)
	else
		outputOnScreen(localisation[settings.language].lose, 250, 168, 0)
	end
	settings.gamesPlayed = settings.gamesPlayed + 1
end	


local delta = getTickCount()
local function main()
	delta = (getTickCount() - delta)  
	delta = delta < 34 and delta or 34  
	dxDrawRectangle(0, 0, sw, sh, tocolor(0, 0, 0 ,150))
	dxDrawImage(0.15*sw, 0.2*sh, 0.7*sw, 0.6*sh, druminteral)
	for key, set in ipairs (setList) do
		if #set == 2 and key == #setList then
			if settings.rolling then
				calculateRewards()
				settings.rolling = false
			end
		end
		for index, card in ipairs(set) do
			if settings.rolling then 
				if #set < 40 then
					setSettings[key].speed = setSettings[key].speedBasic * #set
				end
				if #set ~= 2 then
					card[2] = card[2] - setSettings[key].speed * delta/17
				end
			end
			if card[2] < 0.75 and card[2] >= 0 then
				drawImage(card[1], card[2], card[3])
			elseif card[2] < -0.42 then
				table.insert(dumpedCards, table.remove(set, index))
			end
		end
	end
	dxDrawImage(0.1*sw, 0.2*sh, 0.8*sw, 0.6*sh, drum, 0, 0, 0, settings.drumColor)
	delta = getTickCount()
end

local prizesPanel = {}
prizesPanel.labels = {}
prizesPanel.images = {}

local function generatePrizesPanel()
	local offsetx = 0
	local offsety = 0
	local icons = copyTable(cards)
	-- 2x in columns
	table.sort(icons, function (a,b) return a[2] < b[2] end)
	for k,v in ipairs(icons) do
		if icons[k-1] and v[2] ~= icons[k-1][2] then
			local label = guiCreateLabel(0.145 + offsetx, 0.006 + offsety, 0.03, sw/sh*0.03, icons[k-1][2].."x", true)
			table.insert(prizesPanel.labels, label)
			offsety = offsety + 0.046
			offsetx = 0
		end
		local img = guiCreateStaticImage(0.15 + offsetx, 0.01 + offsety, 0.03, sw/sh*0.026, v[1], true)
		table.insert(prizesPanel.images, img)
		offsetx = offsetx + 0.04
		if k == #icons then
			local label = guiCreateLabel(0.145 + offsetx, 0.006 + offsety, 0.03, sw/sh*0.03, v[2].."x", true)
			table.insert(prizesPanel.labels, label)
		end
	end 
	
	for k,v in ipairs(prizesPanel.labels) do
		guiLabelSetColor(v, 255, 50, 50)
	end
	local count = #prizesPanel.labels
	
	
	table.sort(icons, function (a,b) return a[3] > b[3] end)
	offsetx = 0
	offsety = 0
	for k,v in ipairs(icons) do
		if icons[k-1] and v[3] ~= icons[k-1][3] then
			local label = guiCreateLabel(0.815 - offsetx, 0.006 + offsety, 0.04, sw/sh*0.03, icons[k-1][3].."x", true)
			table.insert(prizesPanel.labels, label)
			offsety = offsety + 0.046
			offsetx = 0
		end
		local img = guiCreateStaticImage(0.815 - offsetx, 0.01 + offsety, 0.03, sw/sh*0.026, v[1], true)
		table.insert(prizesPanel.images, img)
		offsetx = offsetx + 0.04
		if k == #icons then
			local label = guiCreateLabel(0.815 - offsetx, 0.006 + offsety, 0.04, sw/sh*0.03, v[3].."x", true)
			table.insert(prizesPanel.labels, label)
		end
	end 
	
	local font = guiCreateFont(settings.font, getFontSizeFromResolution(sw, sh, 70))
	for k,v in ipairs(prizesPanel.labels) do
		guiSetFont(v, font)
		if count < k then 
			guiLabelSetColor(v, 255, 255, 50)
		end
	end
	
	local label1 = guiCreateLabel(0.32, 0.145, 0.12, 0.05, "Dobro!", true)
	local label2 = guiCreateLabel(0.56, 0.015, 0.12, 0.05, "Triplo!", true)
	font = guiCreateFont(settings.font, getFontSizeFromResolution(sw, sh, 40))
	guiSetFont(label1, font)
	guiSetFont(label2, font)
	guiLabelSetColor(label1, 255, 50, 50)
	guiLabelSetColor(label2, 255, 255, 50)
	table.insert(prizesPanel.labels, label1)
	table.insert(prizesPanel.labels, label2)
	for k,v in ipairs(prizesPanel.labels) do
		guiLabelSetHorizontalAlign(v, "center") 
		guiLabelSetVerticalAlign(v, "center")
	end

	for k,v in ipairs(prizesPanel.labels) do
		guiSetVisible(v, false)
	end
	for k,v in ipairs(prizesPanel.images) do
		guiSetVisible(v, false)
	end
	
	collectgarbage("collect")
end
generatePrizesPanel()


local function onPlayerStartRoll()
	if settings.rolling then
		outputOnScreen(localisation[settings.language].whenRolling, 250, 50, 50)
		return
	end
	if settings.stake > getPlayerMoney() then
		outputOnScreen(localisation[settings.language].notEnoughCashOnRoll, 255, 50, 50)
		return
	end
	settings.rolling = true
	triggerServerEvent("casinoTakePlayerMoney", localPlayer, settings.stake)
	guiSetText(gui.labelMoney, getPlayerMoney() - settings.stake.."$")
	setList = {
		{setList[1][2]},
		{setList[2][2]},
		{setList[3][2]},
	}	
	generateSets()
end

local function onPlayerLeave()
	if settings.rolling then
		outputOnScreen(localisation[settings.language].whenRolling, 250, 50, 50)
		return
	end
	for k,v in pairs(gui) do
		guiSetVisible(v, false)
	end
	showCursor(false, false)
	removeEventHandler("onClientRender", root, main)
	setElementFrozen(localPlayer, false)
	showChat(true)
	-- showPlayerHudComponent("all", true)
	for k,v in ipairs(prizesPanel.labels) do
		guiSetVisible(v, false)
	end
	for k,v in ipairs(prizesPanel.images) do
		guiSetVisible(v, false)
	end
end

local function stakeUp()
	if settings.rolling then
		outputOnScreen(localisation[settings.language].whenRolling, 250, 50, 50)
		return
	end
	local potencialStake = settings.stake + settings.stakeStep
	if potencialStake > getPlayerMoney() then
		outputOnScreen(localisation[settings.language].notEnoughCash, 250, 50, 50)
		return
	elseif potencialStake > settings.stakeMax then
		outputOnScreen(string.format(localisation[settings.language].stakeMax, settings.stakeMax), 255, 168, 0)
		return
	end
	settings.stake = potencialStake
	guiSetText(gui.labelStake, string.format(localisation[settings.language].stakeInfo, settings.stake))
end

local function stakeDown()
	if settings.rolling then
		outputOnScreen(localisation[settings.language].whenRolling, 250, 50, 50)
		return
	end
	local potencialStake = settings.stake - settings.stakeStep
	if potencialStake < settings.stakeMin then
		outputOnScreen(string.format(localisation[settings.language].stakeMin, settings.stakeMin), 255, 168, 0)
		return
	end
	settings.stake = potencialStake
	guiSetText(gui.labelStake, string.format(localisation[settings.language].stakeInfo, settings.stake))
end

local function createGUI()
	gui.buttonRoll = guiCreateButton(0.6, 0.792, 0.23, 0.1, localisation[settings.language].roll, true) --start roll
	gui.buttonLeave = guiCreateButton(0.37, 0.792, 0.23, 0.1, localisation[settings.language].leave, true) --leave
	gui.buttonStakeUp = guiCreateButton(0.32, 0.792, 0.05, 0.1, ">", true)
	gui.buttonStakeDown = guiCreateButton(0.17, 0.792, 0.05, 0.1, "<", true)

	gui.labelStake = guiCreateLabel(0.22, 0.792, 0.10, 0.1, string.format(localisation[settings.language].stakeInfo, settings.stake), true) --current stake
	guiLabelSetHorizontalAlign(gui.labelStake, "center") 
	guiLabelSetVerticalAlign(gui.labelStake, "center")
	gui.labelMoney = guiCreateLabel(0.79, 0, 0.2, 0.2, getPlayerMoney().."$", true)
	guiLabelSetHorizontalAlign(gui.labelMoney, "right") 
	guiLabelSetVerticalAlign(gui.labelMoney, "top")
	guiLabelSetColor(gui.labelMoney, 133, 187, 101)

	gui.labelList1 = guiCreateLabel(0, 0.9, 1, 0.03, "", true)
	gui.labelList2 = guiCreateLabel(0, 0.93, 1, 0.03, "", true)
	gui.labelList3 = guiCreateLabel(0, 0.96, 1, 0.03, "", true)
	for i = 1, 3 do
		guiLabelSetHorizontalAlign(gui["labelList"..i], "center") 
		guiLabelSetVerticalAlign(gui["labelList"..i], "center")
	end
	
	local font = guiCreateFont(settings.font, getFontSizeFromResolution(sw, sh, 75))
	for k,v in pairs(gui) do
		guiSetFont(v, font)
	end
	guiSetFont(gui.labelMoney, "sa-header")
	
	addEventHandler("onClientGUIMouseUp", gui.buttonRoll, onPlayerStartRoll)
	addEventHandler("onClientGUIMouseUp", gui.buttonLeave, onPlayerLeave)
	addEventHandler("onClientGUIMouseUp", gui.buttonStakeUp, stakeUp)
	addEventHandler("onClientGUIMouseUp", gui.buttonStakeDown, stakeDown)
	for k,v in pairs(gui) do
		guiSetVisible(v, false)
	end
end
createGUI()

local function setGUIlanguage(language)
	settings.language = language
	guiSetText(gui.labelStake, string.format(localisation[settings.language].stakeInfo, settings.stake))
	guiSetText(gui.buttonRoll, localisation[settings.language].roll)
	guiSetText(gui.buttonLeave, localisation[settings.language].leave)
end

local function showGUI(el, md)
	if not md or getElementType(el) ~= "player" or el ~= localPlayer then
		return
	end
	for k,v in pairs(gui) do
		guiSetVisible(v, true)
	end
	showCursor(true, true)
	addEventHandler("onClientRender", root, main)
	setElementFrozen(localPlayer, true)
	showChat(false)
	-- showPlayerHudComponent("all", false)
	guiSetText(gui.labelMoney, getPlayerMoney().."$")
	for k,v in ipairs(prizesPanel.labels) do
		guiSetVisible(v, true)
	end
	for k,v in ipairs(prizesPanel.images) do
		guiSetVisible(v, true)
	end
end

local function setup()
	for k,v in ipairs(settings.positionsCol) do
		local col = createColSphere(v[1], v[2], v[3], v[4])
		setElementDimension(col, v[5])
		setElementInterior(col, v[6])
		addEventHandler("onClientColShapeHit", col, showGUI)
	end
end
setup()
addEvent("casino:openGUI",true)
addEventHandler("casino:openGUI",root,function(pl,_)
	showGUI(source,source)
end)
