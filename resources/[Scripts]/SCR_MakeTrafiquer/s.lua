-- © Creditos: Varzen Advanced

local Mmarker = createMarker (-2177.740234375, -2414.94140625, 34.6, "cylinder", 1, 255,0,0,80)
setElementDimension(Mmarker,0)
setElementInterior(Mmarker,0)

function Mensaguem(source)
	outputChatBox("[Make-Trafiquer] If you have 2000$ , type /maketraf to create a trafiquer. .", source, 1, 254, 222,true)
end
addEventHandler("onMarkerHit", Mmarker, Mensaguem)

local armas = {34,34}
local municao = math.random(30,80)

function Fprogresso(source)
local armas_aleatoria = armas[math.random(#armas)]
	if getElementData(source, "VZ:MARKER:ATIVO") == false then
		if isElementWithinMarker(source, Mmarker) then 
		    if (exports.global:hasMoney( source, 50 )) then
				setElementData(source, "VZ:MARKER:ATIVO", true)
				setElementFrozen(source, true)
				setPedAnimation(source,"WEAPONS", "shp_1h_lift_end", 20000, true, false, false, false)
				triggerClientEvent(source, "VZ:PROGRRESSO", root)
                exports.global:takeMoney(source, 2000)
                exports.global:giveItem ( source, 215, 1 )
				outputChatBox("[Make-Trafiquer] You are making the trafiquer , stand by ! ", source, 58, 246, 90,true)
				setTimer(function()
					setElementData(source, "VZ:MARKER:ATIVO", false)
					setElementFrozen(source, false)
				outputChatBox("[Make-Trafiquer] You maked a trafiquer.", source, 5, 247, 45,true)

				end, 20000, 1)
			else
			outputChatBox("[Make-Trafiquer] Not enough.", source, 247, 5, 5,true)
			end
		end
	else
	outputChatBox("[Make-Trafiquer] You are already making a Trafiquer", source, 247, 5, 5,true)
	end
end
addCommandHandler("maketraf", Fprogresso)