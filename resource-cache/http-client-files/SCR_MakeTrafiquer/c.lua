-- © Creditos: Varzen Advanced

local screenW,screenH = guiGetScreenSize() -- Interface resolução
local resW,resH = 1366,768
local x,y =  (screenW/resW), (screenH/resH)

local localtemp = 20000-- Tempo em milesegundos = 20segundos

function barraprogresso ()-- Barra de progresso
        local progresso = interpolateBetween(x*0, 0, 0, x*100, 0, 0, (getTickCount()-tick)/localtemp, "Linear")
		dxDrawRectangle(x*508, y*355, x*185, y*25, tocolor(0, 0, 0, 180), false)
		dxDrawRectangle(x*508, y*355, x*185/100*progresso, y*25, tocolor(255, 0, 0, 180), false)
        dxDrawText(""..math.floor(progresso).."%", x*515, y*360, x*782, y*499, tocolor(255, 255, 255, 255), 1.00, "arial", "left", "top", false, false, true, false, false)
end

function barra()-- Função que habilita a parra de progresso
	tick = getTickCount()-- Puxa o tick do interpolate para função
	addEventHandler("onClientRender", root, barraprogresso)-- Você ativa a barra de progresso quando o evento "VZ:PROGRESSO" é disparado
	setTimer(function()
        removeEventHandler("onClientRender", root, barraprogresso)-- E remove ele depois do tempo exigido = 20segundos
	end, localtemp, 1)
end
addEvent("VZ:PROGRRESSO", true)
addEventHandler("VZ:PROGRRESSO",root, barra)