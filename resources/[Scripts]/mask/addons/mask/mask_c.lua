local mascaras = {
	{"cavalo",1484},
	{"gato",1665,180},
	{"porco",1666},
	{"guaxinim",1669,180},
	{"mascote",1912},
	{"macaco",1899},
	{"hookey",1909},
}

for _,mask in pairs(mascaras) do
	txd = engineLoadTXD ( "addons/mask/models/"..mask[1]..".txd" )
	engineImportTXD ( txd, mask[2] )
	dff = engineLoadDFF ( "addons/mask/models/"..mask[1]..".dff" )
	engineReplaceModel ( dff, mask[2] )
end

local sx,sy = guiGetScreenSize()
local wnd = guiCreateWindow((sx-420-20), 20, 420, 350, "Painel de Máscaras", false)
guiSetVisible(wnd, false)
local scrollpane = guiCreateScrollPane( 10, 20, 405, 272, false, wnd)
local remover = guiCreateButton(10, 312, 120, 30, "Remove", false, wnd)
local fechar = guiCreateButton(290, 312, 120, 30, "Close", false, wnd)
local ativar = {}

local x,y,cont = unpack{0,0,0}
for _,mask in pairs(mascaras) do
	guiCreateStaticImage ( x, y, 80, 86, "addons/mask/icon/"..mask[1]..".png", false, scrollpane )
	local lbl = guiCreateLabel ( x, y+86, 80, 20, string.upper(mask[1]), false, scrollpane )
	guiSetFont ( lbl, "default-bold-small" )
	guiLabelSetHorizontalAlign(lbl,"center")
	guiLabelSetVerticalAlign(lbl,"center")
	guiLabelSetColor ( lbl, 128, 128, 128 )
	local btn = guiCreateButton(x, y+86+20, 80, 20, "Use", false, scrollpane)
	ativar[btn] = {mask[2],mask[3] or 90}	
	x = x + 100
	cont = cont + 1
	if (cont == 4) then
		x = 0
		y = y + 136
		cont = 0
	end
end

addEventHandler("onClientGUIClick", resourceRoot, function(button,state)
	if button == "left" then
		if (ativar[source]) then
			triggerServerEvent("setMask",resourceRoot,ativar[source][1],ativar[source][2])
		elseif (source == remover) then
			triggerServerEvent("removeMask",resourceRoot)
		elseif (source == fechar) then
			guiSetVisible(wnd, false)
			showCursor ( false )
		end
	end
end)

addEvent("pAcao10",true)
addEventHandler("pAcao10",resourceRoot,
	function()
		if getElementData(localPlayer,"nx_vip") == 0  then 
			return 
		end
		for _, guiElement in ipairs(getElementChildren(getResourceGUIElement())) do
			if isElement(guiElement) then
				guiSetVisible(guiElement, false)
			end
		end
		
		local _,_,rz = getElementRotation(localPlayer)
		local x,y,z = getElementPosition(localPlayer)
		x = x + math.sin ( math.rad(rz) ) * 25
		y = y - math.cos ( math.rad(rz) ) * 25
		setCameraTarget ( x,y,z )
		
		guiSetVisible(wnd, true)
		showCursor ( true )
		guiBringToFront ( wnd)
	end
)