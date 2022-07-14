local x, y = guiGetScreenSize ()
local relposx = x/2
local medX = x/2
local ancho = -3780
local sizeX = ancho/3
local mitSize = sizeX*0.5
local botX = medX-mitSize
local relposx = y/2
local medX2 = y/2
local ancho2 = -2160
local sizeX2 = ancho2/3
local mitSize2 = sizeX2*0.5
local botX2 = medX2-mitSize2

local screenW, screenH = guiGetScreenSize()
local resW, resH = 1366,768
local x, y = (screenW/resW), (screenH/resH)  

animations = {}
painel = {
	[1] = false
}

function createBlur()
    -- exports["FM_blur"]:dxDrawBluredRectangle(0, 0, screenW, screenH, tocolor(255, 255, 255, 255))
end

function painelanim ()
	local mx,my = getCursorPosition ()
	local fullx,fully = guiGetScreenSize()
	cursorx,cursory = mx*fullx,my*fully
		
	dxDrawImage ( botX+sizeX+550, botX2+sizeX2+290, 120, 120,"Arquivos/Imagens/mouse.png", cursorx+cursory, 0, 0, tocolor ( 255, 255, 255) )
	dxDrawImage ( botX+sizeX+550, botX2+sizeX2+80, 120, 120,"Arquivos/Imagens/Abdominal.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+550, botX2+sizeX2+80, 120, 120) and 255 or 100 ))
	dxDrawImage ( botX+sizeX+440, botX2+sizeX2+140, 120, 120,"Arquivos/Imagens/Punheta.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+440, botX2+sizeX2+140, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+350, botX2+sizeX2+230, 120, 120,"Arquivos/Imagens/dedo.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+350, botX2+sizeX2+230, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+360, botX2+sizeX2+350, 120, 120,"Arquivos/Imagens/MaoNaCabeca.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+360, botX2+sizeX2+350, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+440, botX2+sizeX2+450, 120, 120,"Arquivos/Imagens/Mortal.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+440, botX2+sizeX2+450, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+550, botX2+sizeX2+490, 120, 120,"Arquivos/Imagens/cancel.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+550, botX2+sizeX2+490, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+665, botX2+sizeX2+150, 120, 120,"Arquivos/Imagens/Flexao.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+665, botX2+sizeX2+150, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+760, botX2+sizeX2+230, 120, 120,"Arquivos/Imagens/DancaFort.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+760, botX2+sizeX2+230, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+750, botX2+sizeX2+350, 120, 120,"Arquivos/Imagens/dance.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+750, botX2+sizeX2+350, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+665, botX2+sizeX2+450, 120, 120,"Arquivos/Imagens/DancaJapa.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+665, botX2+sizeX2+450, 120, 120) and 255 or 100) )
end



function animations.click (_, estado)
	if painel[1] == true then
		if estado == "down" then
			if isCursorOnElement(botX+sizeX+550, botX2+sizeX2+80, 120, 120) then
				playSound("Arquivos/Sons/click.mp3")
				triggerServerEvent("anim.abdominal", localPlayer)
			elseif isCursorOnElement(botX+sizeX+440, botX2+sizeX2+140, 120, 120) then
				playSound("Arquivos/Sons/click.mp3")
				triggerServerEvent("anim.punheta", localPlayer)
			elseif isCursorOnElement(botX+sizeX+665, botX2+sizeX2+150, 120, 120) then
				playSound("Arquivos/Sons/click.mp3")
				triggerServerEvent("anim.flexao", localPlayer)
			elseif isCursorOnElement(botX+sizeX+760, botX2+sizeX2+230, 120, 120) then
				playSound("Arquivos/Sons/click.mp3")
				triggerServerEvent("anim.fortnite2", localPlayer)
			elseif isCursorOnElement(botX+sizeX+750, botX2+sizeX2+350, 120, 120) then
				playSound("Arquivos/Sons/click.mp3")
				triggerServerEvent("anim.fortnite8", localPlayer)
			elseif isCursorOnElement(botX+sizeX+665, botX2+sizeX2+450, 120, 120) then
				playSound("Arquivos/Sons/click.mp3")
				triggerServerEvent("anim.danca", localPlayer)
			elseif isCursorOnElement(botX+sizeX+440, botX2+sizeX2+450, 120, 120) then
				playSound("Arquivos/Sons/click.mp3")
				triggerServerEvent("anim.mortal", localPlayer)
			elseif isCursorOnElement(botX+sizeX+360, botX2+sizeX2+350, 120, 120) then
				playSound("Arquivos/Sons/click.mp3")
				triggerServerEvent("anim.render", localPlayer)
			elseif isCursorOnElement(botX+sizeX+350, botX2+sizeX2+230, 120, 120) then
				playSound("Arquivos/Sons/click.mp3")
				triggerServerEvent("anim.dedo", localPlayer)
			elseif isCursorOnElement(botX+sizeX+550, botX2+sizeX2+490, 120, 120) then
				playSound("Arquivos/Sons/click.mp3")
				triggerServerEvent("anim.cancel", localPlayer)
			end
		end
	end
end
addEventHandler("onClientClick", root, animations.click )

function abrir ()
	if not painel[1] then 
	addEventHandler("onClientRender" , root , createBlur)
		addEventHandler("onClientRender", root, painelanim)
		playSound("Arquivos/Sons/click.mp3")
		showChat(false)
	else
		removeEventHandler("onClientRender", root, painelanim)
		removeEventHandler("onClientRender", root, createBlur)
		showCursor(false)
		showChat(true)
	end

	painel[1] = not painel[1]
	showCursor(painel[1])
end
bindKey("5", "both", abrir)


function isCursorOnElement(x,y,w,h)
	if (not isCursorShowing()) then
		return false
	end
	local mx,my = getCursorPosition ()
	local fullx,fully = guiGetScreenSize()
	cursorx,cursory = mx*fullx,my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end

--[[                               
                                   ################################################
                                   #                     Render                   #                                                                
                                   ################################################
--]]

addEventHandler("onClientResourceStart", resourceRoot,
    function()
        triggerServerEvent("onClientSync_render", resourceRoot)
	end
)

local ifpFM_Render = nil

addEventHandler("onClientResourceStart", resourceRoot,
    function ( startedRes )
    ifpFM_Render = engineLoadIFP ("Ipf/render.ifp", "newAnimBlock_Render")
    if ifpFM_Render  then 
    outputDebugString ("Animação de Render: Ativada.")
    else
    outputDebugString ("Animação de Render: Não foi Carregada.")
    end
    end
)

addEvent( getResourceName(getThisResource()).."anim_Render", true )
addEventHandler( getResourceName(getThisResource()).."anim_Render", root,
	function(enable)
		if (enable) then setPedAnimation(source, "newAnimBlock_Render", "render", -1, false, false, false,true)
		else setPedAnimation(source)
		end		
	end
)

addEventHandler("onClientResourceStop", resourceRoot,
	function()
		if ifpFM_Render then
			for _,player in ipairs(getElementsByType("player")) do
				local _, anim = getPedAnimation(player)
				if (anim == "render") then
					setPedAnimation(player)
				end
			end
			destroyElement(ifpFM_Render)
		end
	end
)

--[[                               
                                   ################################################
                                   #                     Flexão                   #                                                                
                                   ################################################
--]]

addEventHandler("onClientResourceStart", resourceRoot,
    function()
        triggerServerEvent("onClientSync_flexao", resourceRoot)
	end
)

local ifpFM_Flexao = nil

addEventHandler("onClientResourceStart", resourceRoot,
    function ( startedRes )
    ifpFM_Flexao = engineLoadIFP ("Ipf/flexao.ifp", "newAnimBlock_Flexao")
    if ifpFM_Flexao  then 
    outputDebugString ("Animação de Flexao: Ativada.")
    else
    outputDebugString ("Animação de Flexao: Não foi Carregada.")
    end
    end
)

addEvent( getResourceName(getThisResource()).."anim_Flexao", true )
addEventHandler( getResourceName(getThisResource()).."anim_Flexao", root,
	function(enable)
		if (enable) then setPedAnimation(source, "newAnimBlock_Flexao", "Flexao",  -1, true, false,false)
		else setPedAnimation(source)
		end		
	end
)

addEventHandler("onClientResourceStop", resourceRoot,
	function()
		if ifpFM_Flexao then
			for _,player in ipairs(getElementsByType("player")) do
				local _, anim = getPedAnimation(player)
				if (anim == "Flexao") then
					setPedAnimation(player)
				end
			end
			destroyElement(ifpFM_Flexao)
		end
	end
)

--[[                               
                                   ################################################
                                   #                     Mortal                   #                                                                
                                   ################################################
--]]

addEventHandler("onClientResourceStart", resourceRoot,
    function()
        triggerServerEvent("onClientSync_mortal", resourceRoot)
	end
)

local ifpFM_Mortal = nil

addEventHandler("onClientResourceStart", resourceRoot,
    function ( startedRes )
    ifpFM_Mortal = engineLoadIFP ("Ipf/mortal.ifp", "newAnimBlock_Mortal")
    if ifpFM_Mortal  then 
    outputDebugString ("Animação de Mortal: Ativada.")
    else
    outputDebugString ("Animação de Mortal: Não foi Carregada.")
    end
    end
)

addEvent( getResourceName(getThisResource()).."anim_Mortal", true )
addEventHandler( getResourceName(getThisResource()).."anim_Mortal", root,
	function(enable)
		if (enable) then setPedAnimation(source, "newAnimBlock_Mortal", "corkstfolha",  -1, true, false,false)
		else setPedAnimation(source)
		end		
	end
)

addEventHandler("onClientResourceStop", resourceRoot,
	function()
		if ifpFM_Mortal then
			for _,player in ipairs(getElementsByType("player")) do
				local _, anim = getPedAnimation(player)
				if (anim == "corkstfolha") then
					setPedAnimation(player)
				end
			end
			destroyElement(ifpFM_Mortal)
		end
	end
)

--[[                               
                                   ################################################
                                   #                  Abdominal                   #                                                                
                                   ################################################
--]]

addEventHandler("onClientResourceStart", resourceRoot,
    function()
        triggerServerEvent("onClientSync_abdominal", resourceRoot)
	end
)

local ifpFM_Abdominal = nil

addEventHandler("onClientResourceStart", resourceRoot,
    function ( startedRes )
    ifpFM_Abdominal = engineLoadIFP ("Ipf/abdominal.ifp", "newAnimBlock_Abdominal")
    if ifpFM_Abdominal  then 
    outputDebugString ("Animação de Abdominal: Ativada.")
    else
    outputDebugString ("Animação de Abdominal: Não foi Carregada.")
    end
    end
)

addEvent( getResourceName(getThisResource()).."anim_Abdominal", true )
addEventHandler( getResourceName(getThisResource()).."anim_Abdominal", root,
	function(enable)
		if (enable) then setPedAnimation(source, "newAnimBlock_Abdominal", "Abdominal",  -1, true, false,false)
		else setPedAnimation(source)
		end		
	end
)

addEventHandler("onClientResourceStop", resourceRoot,
	function()
		if ifpFM_Abdominal then
			for _,player in ipairs(getElementsByType("player")) do
				local _, anim = getPedAnimation(player)
				if (anim == "Abdominal") then
					setPedAnimation(player)
				end
			end
			destroyElement(ifpFM_Abdominal)
		end
	end
)

--[[                               
                                   ################################################
                                   #                    Fortnite                  #                                                                
                                   ################################################
--]]

local customIfp = nil
function setPedFortniteAnimation (ped,animation,tiempo,repetir,mover,interrumpible)
 if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
 if isElement(ped) then
  if animation == "baile 1" or animation == "baile 2" or animation == "baile 3" or animation == "baile 4" or animation == "baile 5" or animation == "baile 6" or animation == "baile 7" or animation == "baile 8" or animation == "baile 9" or animation == "baile 10" or animation == "baile 11" or animation == "baile 12" or animation == "baile 13" then
   for i = 1,3 do
    setPedAnimation(ped, "Fortnite_"..i.."", animation, tiempo, true, false, false) 
    if tiempo > 1 then
     setTimer(setPedAnimation,tiempo,1,ped,false)
     setTimer(setPedAnimation,tiempo+100,1,ped,false)
    end
   end
  end
 end
end
addEvent("setPedFortniteAnimation",true)
addEventHandler("setPedFortniteAnimation",getRootElement(),setPedFortniteAnimation)

addEventHandler("onClientResourceStart", resourceRoot,
function ( startedRes )
 customIfp = engineLoadIFP ("Ipf/Fortnite pt1.ifp", "Fortnite_1")
 customIfp2 = engineLoadIFP ("Ipf/Fortnite pt2.ifp", "Fortnite_2")
 customIfp3 = engineLoadIFP ("Ipf/Fortnite pt3.ifp", "Fortnite_3")
 if customIfp and customIfp2 and customIfp3 then
  outputDebugString ("Animação de Fortnite: Ativada.")
 else
  outputDebugString ("Animação de Fortnite: Não foi Carregada.")
 end
end)

--[[                               
                                   ################################################
                                   #                    Dança                     #                                                                
                                   ################################################
--]]

addEventHandler("onClientResourceStart", resourceRoot,
    function()
        triggerServerEvent("onClientSync_danca", resourceRoot)
	end
)

local ifpFM_Danca = nil

addEventHandler("onClientResourceStart", resourceRoot,
    function ( startedRes )
    ifpFM_Danca = engineLoadIFP ("Ipf/danca.ifp", "newAnimBlock_Danca")
    if ifpFM_Danca  then 
    outputDebugString ("Animação de Dança: Ativada.")
    else
    outputDebugString ("Animação de Dança: Não foi Carregada.")
    end
    end
)

addEvent( getResourceName(getThisResource()).."anim_Danca", true )
addEventHandler( getResourceName(getThisResource()).."anim_Danca", root,
	function(enable)
		if (enable) then setPedAnimation(source, "newAnimBlock_Danca", "Anim_VIP",  -1, true, false,false)
		else setPedAnimation(source)
		end		
	end
)

addEventHandler("onClientResourceStop", resourceRoot,
	function()
		if ifpFM_Danca then
			for _,player in ipairs(getElementsByType("player")) do
				local _, anim = getPedAnimation(player)
				if (anim == "Anim_VIP") then
					setPedAnimation(player)
				end
			end
			destroyElement(ifpFM_Danca)
		end
	end
)