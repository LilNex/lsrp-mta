local sx, sy = guiGetScreenSize()
local size = {765, 500}
local x, y = (sx/2 - size[1]/2), (sy/2 - size[2]/2)
local vip = {
	sidebar = {},
	tela = {},
	label = {}
}
local lblValidade = false
local action = {}
local notificacao = {}
local font = guiCreateFont( "fonts/oceanicdriftgradital.ttf", 25 )
local Window = {}
local Button = {}
local ScrollPane = {}

addEventHandler( "onClientResourceStart", resourceRoot,
	function( )
		-- Fundo preto
		vip.background = guiCreateStaticImage ( 0, 0, sx, sy, "imagens/gui/transparent.png", false )
		guiSetProperty ( vip.background , "ImageColours", "tl:94000000 tr:94000000 bl:94000000 br:94000000" )
		guiSetVisible ( vip.background, false )
		guiSetEnabled ( vip.background, false )
		
		-- Janela VIP
		vip.painel = criarJanelaVIP( x, y, size[1], size[2], "Painel Central Roleplay" )
		guiSetVisible ( vip.painel, false )
		
			-- Sidebar
			vip.sidebar.frame = guiCreateStaticImage ( 0, 0, 220, 500, "imagens/gui/transparent.png", false, vip.painel )
			guiSetProperty ( vip.sidebar.frame, "ImageColours", "tl:ff3b4346 tr:ff3b4346 bl:ff3b4346 br:ff3b4346" )
				
				vip.sidebar.personagem = addItemSidebar ( "PERSONAGEM", "imagens/gui/personicon.png" )				
				-- Tempo de VIP
				local black = guiCreateStaticImage ( 0, 420, 220, 80, "imagens/gui/transparent.png", false, vip.sidebar.frame )
				guiSetProperty ( black, "ImageColours", "tl:ff343c3f tr:ff343c3f bl:ff343c3f br:ff343c3f" )
				lblValidade = guiCreateLabel ( 0, 0, 220, 80, "", false, black )
				--guiSetEnabled(lblValidade,false)
				guiLabelSetHorizontalAlign(lblValidade,"center")
				guiLabelSetVerticalAlign(lblValidade,"center")
				guiLabelSetColor (lblValidade, 128, 128, 128 )
			
			-- Tela
			vip.tela.personagem = criarTela ( itens["Personagem"], "personagem")
			vip.tela.veiculo = criarTela ( itens["Veículo"], "veículo")
	end
)

addEvent("sendVipValidade", true)
addEventHandler("sendVipValidade", resourceRoot,
function(vipTime, vipEnd)
	local text = "Tempo de VIP: \n"..vipTime.."\n\nVencimento: "..vipEnd
	guiSetText(lblValidade, text)
end)

function criarJanelaVIP( x, y, width, height, title )
	-- Frame
	local frame = guiCreateStaticImage ( x, y-30, width, height+60, "imagens/gui/transparent.png", false)
	guiSetProperty ( frame, "ImageColours", "tl:00000000 tr:00000000 bl:00000000 br:00000000" )
	
	-- Header
	local header = guiCreateStaticImage ( 0, 0, width, 60, "imagens/gui/transparent.png", false, frame )
	guiSetProperty ( header, "ImageColours", "tl:FFf5f5f5 tr:FFf5f5f5 bl:FFf5f5f5 br:FFf5f5f5" )
	addEventHandler("onClientGUIMouseDown", header, mouseDown, false)
	
	-- "Border bottom"
	local border = guiCreateLabel ( 0, 0, 1, 1, "_____________________________________________________________________________________________________________", true, header )
	guiSetEnabled ( border, false )
	guiLabelSetHorizontalAlign ( border, "center" )
	guiLabelSetVerticalAlign ( border, "bottom" )
	guiLabelSetColor ( border, 247, 247, 247 )
	
	-- Title
	local lbl = guiCreateLabel ( 20, 0, width-40, 60, title, false, header )
	guiSetFont(lbl,font)
	guiSetEnabled(lbl,false)
	guiLabelSetHorizontalAlign(lbl,"left")
	guiLabelSetVerticalAlign(lbl,"center")
	guiLabelSetColor (lbl, 175, 175, 175 )
	
	-- Close button
	local hide = guiCreateStaticImage ( width-36, 22, 16, 16, "imagens/gui/close.png", false, header )
	guiSetProperty ( hide, "ImageColours", "tl:ffafafaf tr:ffafafaf bl:ffafafaf br:ffafafaf" )
	addEventHandler('onClientGUIClick', hide, fecharVIP, false)
	
	-- Body
	local body = guiCreateStaticImage ( 0, 60, width, height, "imagens/gui/transparent.png", false, frame )
	guiSetProperty ( body, "ImageColours", "tl:FFFFFFFF tr:FFFFFFFF bl:FFFFFFFF br:FFFFFFFF" )
	
	Window[body] = header
	
	return body
end

local sidebarClicked = false
local sidebarEffect = {}
local sidebarItemPosy = 0
function addItemSidebar(title,img,order)
	local row = false
	row = guiCreateStaticImage ( 0, sidebarItemPosy, 220, 40, "imagens/gui/transparent.png", false, vip.sidebar.frame )
	guiSetProperty(row, "ImageColours", "tl:00000000 tr:00000000 bl:00000000 br:00000000")
	
	addEventHandler ( "onClientGUIClick", row, sidebarClick, false )
	addEventHandler ( "onClientMouseEnter", row, sidebarHover, false )
	addEventHandler ( "onClientMouseLeave", row, sidebarLeave, false )
	
	local icone = guiCreateStaticImage (13, 8, 24, 24, img, false, row )
	guiSetProperty ( icone, "ImageColours", "tl:FF748489 tr:FF748489 bl:FF748489 br:FF748489" )
	guiSetEnabled ( icone, false )
	
	local texto = guiCreateLabel ( 50, 0, 160, 40, title, false, row )
	guiSetFont ( texto, "sans" )
	guiSetEnabled ( texto, false )
	guiLabelSetVerticalAlign ( texto, "center" )
	guiLabelSetColor ( texto, 116, 132, 137 )
	
	local border = guiCreateLabel ( 0, 0, 220, 40, "________________________________", false, row )
	guiSetEnabled ( border, false )
	guiLabelSetHorizontalAlign ( border, "center" )
	guiLabelSetVerticalAlign ( border, "bottom" )
	guiLabelSetColor ( border, 105, 113, 116 )

	sidebarEffect[row] = {icone,texto}
	
	if (sidebarItemPosy == 0) then
		guiSetProperty ( row, "ImageColours", "tl:FF32373a tr:FF32373a bl:FF32373a br:FF32373a" )
		guiSetProperty ( icone, "ImageColours", "tl:FFFFFFFF tr:FFFFFFFF bl:FFFFFFFF br:FFFFFFFF" )
		guiLabelSetColor ( texto, 255, 255, 255 )
		sidebarClicked = row
	end
	
	sidebarItemPosy = sidebarItemPosy + 40
	return row
end

local itemEffect = {}
local telaCont = 0
local posy = 10
function criarTela(itens,categoria)
	telaCont = telaCont + 1
	local list = guiCreateScrollPane(220, 0, 545, 500, false, vip.painel)
	
	if (telaCont == 1) then guiSetVisible ( list, true )
	else guiSetVisible ( list, false )
	end

	for i, item in pairs ( itens ) do
		local frame = guiCreateStaticImage (10, posy, 540, 80, "imagens/gui/transparent.png", false, list )
		addEventHandler ( "onClientMouseEnter", frame, itemHover )
		addEventHandler ( "onClientMouseLeave", frame, itemLeave )
		
		local border = guiCreateLabel (0, 0, 540, 80, "______________________________________________________________________________", false, frame )
		guiSetEnabled (border, false )
		guiLabelSetHorizontalAlign (border, "center" )
		guiLabelSetVerticalAlign (border, "bottom" )
		guiLabelSetColor ( border, 247, 247, 247 )

		local icon = guiCreateStaticImage ( 20, 10, 60, 60, item.icone, false, frame )
		guiSetEnabled ( icon, false )
		
		local titulo = guiCreateLabel ( 90, 20, 200, 20, string.upper(item.titulo), false, frame )
		guiLabelSetColor ( titulo, 50, 50, 50 )
		guiSetFont ( titulo, "default-bold-small" )
		guiSetEnabled ( titulo, false )
		
		local descricao = guiCreateLabel ( 90, 40, 340, 45, item.descricao, false, frame )
		guiLabelSetColor ( descricao, 128, 128, 128 )
		guiLabelSetHorizontalAlign (descricao, "left", true )
		guiSetEnabled ( descricao, false )
		
		local btn = false
		if (item.toogle) then
			btn = guiCreateButton ( 440, 25, 70, 30, "ON / OFF", false, frame )
		else
			btn = guiCreateButton ( 440, 25, 70, 30, "USAR", false, frame )
		end
		
		local imgnotificacao = guiCreateStaticImage ( 20, 60, 12, 12, "imagens/gui/onoff.png", false, frame )
		guiSetEnabled(imgnotificacao, false)
		guiSetVisible(imgnotificacao,false)
		local lblnotificacao = guiCreateLabel (20, 55, 490, 20, "", false, frame )
		guiLabelSetHorizontalAlign(lblnotificacao,"right")
		guiLabelSetVerticalAlign(lblnotificacao,"center")
		guiLabelSetColor (lblnotificacao, 255, 0, 0 )
		guiSetEnabled(lblnotificacao, false)
		guiSetVisible(lblnotificacao,false)
		
		local codigo = categoria..item.titulo
		notificacao[codigo] = {imgnotificacao,lblnotificacao}
		
		action[btn] = {
			funcao = item.acao,
			codigo = codigo
		}
		
		itemEffect[frame] = {frame,btn}
		itemEffect[btn] = {frame,btn}
		
		posy = posy + 80
	end
	return list
end

function sidebarClick(btn)
	if (btn == "left") then
		guiSetProperty (source, "ImageColours", "tl:FF32373a tr:FF32373a bl:FF32373a br:FF32373a" )
		guiSetProperty (sidebarEffect[source][1], "ImageColours", "tl:FFFFFFFF tr:FFFFFFFF bl:FFFFFFFF br:FFFFFFFF" )
		guiLabelSetColor (sidebarEffect[source][2], 255, 255, 255 )
		sidebarClicked = source
		for i,v in pairs(sidebarEffect) do
			if (i ~= sidebarClicked) then
				guiSetProperty ( i, "ImageColours", "tl:00000000 tr:00000000 bl:00000000 br:00000000" )
				guiSetProperty ( sidebarEffect[i][1], "ImageColours", "tl:FF748489 tr:FF748489 bl:FF748489 br:FF748489" )
				guiLabelSetColor ( sidebarEffect[i][2], 116, 132, 137 )
			end
		end
	end
end

function sidebarHover()
	guiSetProperty ( source, "ImageColours", "tl:FF32373a tr:FF32373a bl:FF32373a br:FF32373a" )
	guiSetProperty ( sidebarEffect[source][1], "ImageColours", "tl:FFFFFFFF tr:FFFFFFFF bl:FFFFFFFF br:FFFFFFFF" )
	guiLabelSetColor ( sidebarEffect[source][2], 255, 255, 255 )
end

function sidebarLeave()
	if (not (sidebarClicked == source)) then
		guiSetProperty ( source, "ImageColours", "tl:00000000 tr:00000000 bl:00000000 br:00000000" )
		guiSetProperty ( sidebarEffect[source][1], "ImageColours", "tl:FF748489 tr:FF748489 bl:FF748489 br:FF748489" )
		guiLabelSetColor ( sidebarEffect[source][2], 116, 132, 137 )
	end
end

function itemHover()
	if (itemEffect[source]) then
		guiSetProperty ( itemEffect[source][1], "ImageColours", "tl:FFf5f5f5 tr:FFf5f5f5 bl:FFf5f5f5 br:FFf5f5f5" )
	end
end

function itemLeave()
	if (itemEffect[source]) then
		guiSetProperty ( itemEffect[source][1], "ImageColours", "tl:FFFFFFFF tr:FFFFFFFF bl:FFFFFFFF br:FFFFFFFF" )
	end
end

function fecharVIP()
	triggerEvent ( "AbrirGUI", resourceRoot )
end

local timer = {}
local cor = {}
addEvent("exibirNotificacao", true)
addEventHandler("exibirNotificacao", resourceRoot,
	function(tipo,item,texto)
		if not (tipo and item and texto) then return end
		if (notificacao[item]) then
			if (tipo == "ativado") then
				cor[1] = "0f911a"
				cor[2] = {15,145,26}
			elseif (tipo == "desativado") then
				cor[1] = "d83131"
				cor[2] = {216,49,49}
			end
		
			guiSetVisible( notificacao[item][2], true )
			guiSetText ( notificacao[item][2], string.upper(texto) )
			guiLabelSetColor ( notificacao[item][2], unpack(cor[2]) )
		
			guiSetPosition ( notificacao[item][1], 490-guiLabelGetTextExtent ( notificacao[item][2] ), 60, false )
			guiSetProperty ( notificacao[item][1], "ImageColours", "tl:FF"..cor[1].." tr:FF"..cor[1].." bl:FF"..cor[1].." br:FF"..cor[1].."" )
			guiSetVisible( notificacao[item][1], true )
			
			if isTimer ( timer[notificacao[item][2]] ) then killTimer ( timer[notificacao[item][2]] ) end
			timer[notificacao[item][2]] = setTimer (
				function (img,lbl)
					guiSetVisible(img,false)
					guiSetVisible(lbl,false)
					timer[lbl] = nil
				end
			,2500, 1, notificacao[item][1], notificacao[item][2] )
		end
	end
)

addEvent("AbrirGUI", true)
addEventHandler("AbrirGUI", resourceRoot,
	function()
		triggerServerEvent("getVipValidade", resourceRoot)
		local state = not guiGetVisible( vip.painel )
		playSoundFrontEnd ( 1 )
		guiSetVisible( vip.background, state )
		guiSetVisible( vip.painel, state )
		showCursor( state )
	end
)
		
addEventHandler ( "onClientGUIClick", resourceRoot,
	function(button)
		if button == "left" then
			if (source == vip.sidebar.personagem) then
				if ( guiGetVisible(vip.tela.personagem)) then return end
				playSoundFrontEnd ( 7 )
				guiSetVisible( vip.tela.personagem, true )
				guiSetVisible( vip.tela.veiculo, false )
			elseif (source == vip.sidebar.veiculo) then
				if ( guiGetVisible(vip.tela.veiculo)) then return end
				playSoundFrontEnd ( 7 )
				guiSetVisible( vip.tela.personagem, false )
				guiSetVisible( vip.tela.veiculo, true )
			end
			
			if (action[source]) then
				playSoundFrontEnd ( 14 )
				--print(action[source].notificacao.element)
				action[source].funcao ( action[source].codigo )
			end
		end
	end
)


--[[
	Code newgui design by [M]ister
	For full version (all gui functions supported): contato@mtabrasil.com.br
--]]
------------------------------------------------------------------
----------------- gui Window
------------------------------------------------------------------
guiCreateWindow = function ( x, y, width, height, title, relative )
	-- BackGround
	local bg = guiCreateStaticImage ( x-20, y-20, width+40, height+40, "imagens/gui/transparent.png", relative)
	guiSetProperty ( bg, "ImageColours", "tl:807f7f7f  tr:807f7f7f  bl:807f7f7f  br:807f7f7f " )
	addEventHandler("onClientGUIMouseDown", bg, mouseDown, false)
	
	-- Body
	local wnd = guiCreateStaticImage ( 20, 20, width, height, "imagens/gui/transparent.png", false, bg )
	guiSetProperty ( wnd, "ImageColours", "tl:FFFFFFFF tr:FFFFFFFF bl:FFFFFFFF br:FFFFFFFF" )
	
	Window[wnd] = bg
	return wnd
end

------------------------------------------------------------------
----------------- gui Button
------------------------------------------------------------------
guiCreateButton = function ( x, y, width, height, text, relative, parent )
	local btn = guiCreateStaticImage (x, y, width, height, "imagens/gui/button.png", relative, parent )
	local lbl = guiCreateLabel(0, 0, 1, 1, text, true, btn)
	guiSetEnabled ( lbl, false )
	guiLabelSetHorizontalAlign(lbl,"center")
	guiLabelSetVerticalAlign(lbl,"center")
	guiLabelSetColor(lbl,100,100,100)
	
	Button[btn] = {}
	Button[btn].text = lbl
	return btn
end

------------------------------------------------------------------
----------------- gui ScrollPane
------------------------------------------------------------------
_guiCreateScrollPane = guiCreateScrollPane
guiCreateScrollPane = function ( x, y, width, height, relative, parent )
	-- Pane
	local panebg = guiCreateStaticImage ( x, y, width-20, height, "imagens/gui/transparent.png", relative, parent )
	guiSetProperty ( panebg, "ImageColours", "tl:00000000 tr:00000000 bl:00000000 br:00000000" )
	local pane = _guiCreateScrollPane ( 0, 0, width, height, relative, panebg )
	
	-- Scroll
	local scrollbg = guiCreateStaticImage ( x+width-20, y+10, 20, height-20, "imagens/gui/transparent.png", relative, parent )
	guiSetProperty ( scrollbg, "ImageColours", "tl:00000000 tr:00000000 bl:00000000 br:00000000" )
	local scrollBar = guiCreateStaticImage ( 5, 0, 10, height-20, "imagens/gui/transparent.png", relative, scrollbg )
	guiSetProperty ( scrollBar, "ImageColours", "tl:ff3b4346 tr:ff3b4346 bl:ff3b4346 br:ff3b4346" )
	local scrollBar2 = guiCreateStaticImage ( 5, 0, 10, 0, "imagens/gui/transparent.png", relative, scrollbg )
	guiSetProperty ( scrollBar2, "ImageColours", "tl:ff3b4346 tr:ff3b4346 bl:ff3b4346 br:ff3b4346" )
	local scroll = guiCreateStaticImage ( 6, 1, 8, 60, "imagens/gui/transparent.png", relative, scrollbg )
	guiSetProperty ( scroll, "ImageColours", "tl:FFcccccc tr:FFcccccc bl:FFcccccc br:FFcccccc" )

	ScrollPane[pane] = {}
	ScrollPane[pane].scroll = {scroll = scroll, scrollBar = scrollBar, scrollBar2 = scrollBar2, panebg=panebg, scrollbg=scrollbg}
	guiSetEnabled(scrollBar,false)
	addEventHandler("onClientGUIMouseDown", scroll, mouseDown, false)
	
	return pane
end


------------------------------------------------------------------
----------------- getter/setter
------------------------------------------------------------------
_guiSetVisible = guiSetVisible
function guiSetVisible (guiElement, state )
	if Window[guiElement] then
		_guiSetVisible ( getElementParent(guiElement), state )
	elseif ScrollPane[guiElement] then
		_guiSetVisible ( guiElement, state )
		_guiSetVisible ( ScrollPane[guiElement].scroll.panebg, state )
		_guiSetVisible ( ScrollPane[guiElement].scroll.scrollbg, state )
	else
		if (isElement(guiElement)) then
			_guiSetVisible ( guiElement, state )
		end
	end
end

_guiGetVisible = guiGetVisible
function guiGetVisible (guiElement)
	if (Window[guiElement]) then
		return _guiGetVisible ( getElementParent(guiElement) )
	elseif ScrollPane[guiElement] then
		return _guiGetVisible ( ScrollPane[guiElement].scroll.panebg )
	else
		if (isElement(guiElement)) then
			_guiGetVisible ( guiElement )
		end
	end
	return false
end

-- https://wiki.multitheftauto.com/wiki/OnClientGUIMouseUp
------------------------------------------------------------------
----------------- Movable function
------------------------------------------------------------------
function mouseDown ( btn, x, y )
	if btn == "left" then
		local elementPos
		-- Window move
		for i,v in pairs(Window) do
			if (v == source) then
				clickedElement = v
				elementPos = { guiGetPosition( getElementParent(i), false ) }
				offsetPos = { x - elementPos[ 1 ], y - elementPos[ 2 ] }
				return
			end
		end
		
		-- ScrollPane
		for i,v in pairs(ScrollPane) do
			if v.scroll and (v.scroll.scroll == source) then
				clickedElement = source
				elementPos = { guiGetPosition( source, false ) }
				offsetPos = { elementPos[ 1 ], y - elementPos[ 2 ] }
				return
			end
		end
	end
end

addEventHandler("onClientGUIMouseUp", resourceRoot,
	function ( btn, x, y )
		if btn == "left" then
			clickedElement = nil
		end
	end
)

addEventHandler("onClientClick", getRootElement(),
	function(button,state)
		if button == "left" and state == "up" then
			if ( clickedElement ) then clickedElement = nil end
		end
	end
)

addEventHandler( "onClientCursorMove", getRootElement( ),
    function ( _, _, x, y )
		if not clickedElement then return end
		
		for i,v in pairs(Window) do
			if (v == clickedElement) then
				guiSetPosition( getElementParent(i), x - offsetPos[ 1 ], y - offsetPos[ 2 ], false )
				return
			end
		end
		
		local _, heightScroll = guiGetSize ( clickedElement, false )
		local _, heightScrollBar = guiGetSize ( getElementParent(clickedElement), false )
		heightScrollBar = heightScrollBar - 2
		if (y - offsetPos[ 2 ] >= 0 and ((y - offsetPos[ 2 ])+heightScroll) <= heightScrollBar) then
			guiSetPosition( clickedElement, offsetPos[ 1 ], y - offsetPos[ 2 ] + 1, false )
			posyScroll = y - offsetPos[ 2 ]
			for i,v in pairs(ScrollPane) do
				if (v.scroll.scroll == clickedElement) then
					guiSetSize ( v.scroll.scrollBar2, 2, posyScroll, false )
					local calc = (((posyScroll)*100)/(heightScrollBar-heightScroll))
					guiScrollPaneSetVerticalScrollPosition (i, calc)
					return
				end
			end
		end
		
    end
)

----------------- Efeito hover
addEventHandler( "onClientMouseEnter", resourceRoot, 
	function()
		-- Button
		if (Button[source]) then
			guiStaticImageLoadImage ( source, "imagens/gui/buttonhover.png" )
			return
		end
	end
)

addEventHandler( "onClientMouseLeave", resourceRoot, 
	function()
		-- Button
		if (Button[source]) then
			guiStaticImageLoadImage ( source, "imagens/gui/button.png" )
			return
		end
	end
)
----------------- Efeito click
addEventHandler ( "onClientGUIClick", getRootElement(),
	function(btn,state)
		--if (btn == "left") then
			--if (Button[source]) then
				--guiStaticImageLoadImage ( source, "imagens/gui/buttonclicked.png" )
			--end
		--end
	end
)
--[[
	End Code newgui design
--]]