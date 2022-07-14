anim = {}

function setPedFortniteAnimation (ped,animation,tiempo,repetir,mover,interrumpible)
 if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
 if isElement(ped) then
  if animation == "baile 1" or animation == "baile 2" or animation == "baile 3" or animation == "baile 4" or animation == "baile 5" or animation == "baile 6" or animation == "baile 7" or animation == "baile 8" or animation == "baile 9" or animation == "baile 10" or animation == "baile 11" or animation == "baile 12" or animation == "baile 13" then
   for i = 1,3 do
    triggerClientEvent ( root, "setPedFortniteAnimation", root, ped,animation,tiempo,repetir,mover,interrumpible )
    if tiempo > 1 then
     setTimer(setPedAnimation,tiempo,1,ped,false)
     setTimer(setPedAnimation,tiempo+100,1,ped,false)
    end
   end
  end
 end
end

local abdominalFM = {}
function anim.abdominal()
triggerClientEvent(abdominalFM, getResourceName(getThisResource()).."anim_Abdominal", source,true)
end
addEvent("anim.abdominal", true)
addEventHandler("anim.abdominal", root, anim.abdominal)

addEvent("onClientSync_abdominal", true )
addEventHandler("onClientSync_abdominal", resourceRoot,
    function()
        table.insert(abdominalFM, client)
		for player, enable in ipairs(abdominalFM) do
			if (enable) then
				---triggerClientEvent(client, "anim_Abdominal", player, true)
			end
		end
    end 
)

function anim.punheta()
	setPedAnimation(source, "paulnmac", "wank_loop")
end
addEvent("anim.punheta", true)
addEventHandler("anim.punheta", root, anim.punheta)

local flexaoFM = {}
function anim.flexao()
triggerClientEvent(flexaoFM, getResourceName(getThisResource()).."anim_Flexao", source,true)
end
addEvent("anim.flexao", true)
addEventHandler("anim.flexao", root, anim.flexao)

addEvent("onClientSync_flexao", true )
addEventHandler("onClientSync_flexao", resourceRoot,
    function()
        table.insert(flexaoFM, client)
		for player, enable in ipairs(flexaoFM) do
			if (enable) then
			---	triggerClientEvent(client, "anim_Flexao", player, true)
			end
		end
    end 
)

function anim.fortnite2()
	setPedFortniteAnimation(source,"baile 2",-1,true,false,false,false)
end
addEvent("anim.fortnite2", true)
addEventHandler("anim.fortnite2", root, anim.fortnite2)

function anim.fortnite8()
setPedFortniteAnimation(source,"baile 8",-1,true,false,false,false)
end
addEvent("anim.fortnite8", true)
addEventHandler("anim.fortnite8", root, anim.fortnite8)

local dancaFM = {}
function anim.danca()
triggerClientEvent(dancaFM, getResourceName(getThisResource()).."anim_Danca", source,true)
end
addEvent("anim.danca", true)
addEventHandler("anim.danca", root, anim.danca)

addEvent("onClientSync_danca", true )
addEventHandler("onClientSync_danca", resourceRoot,
    function()
        table.insert(dancaFM, client)
		for player, enable in ipairs(dancaFM) do
			if (enable) then
				--triggerClientEvent(client, "anim_Danca", player, true)
			end
		end
    end 
)

local mortalFM = {}
function anim.mortal()
triggerClientEvent(mortalFM, getResourceName(getThisResource()).."anim_Mortal", source,true)
end
addEvent("anim.mortal", true)
addEventHandler("anim.mortal", root, anim.mortal)

addEvent("onClientSync_mortal", true )
addEventHandler("onClientSync_mortal", resourceRoot,
    function()
        table.insert(mortalFM, client)
		for player, enable in ipairs(mortalFM) do
			if (enable) then
				---triggerClientEvent(client, "anim_Mortal", player, true)
			end
		end
    end 
)

local renderFM = {}
function anim.render()
	triggerClientEvent(renderFM, getResourceName(getThisResource()).."anim_Render", source,true)
end
addEvent("anim.render", true)
addEventHandler("anim.render", root, anim.render)

addEvent("onClientSync_render", true )
addEventHandler("onClientSync_render", resourceRoot,
    function()
        table.insert(renderFM, client)
		for player, enable in ipairs(renderFM) do
			if (enable) then
			---	triggerClientEvent(client, "anim_Render", player, true)
			end
		end
    end 
)

function anim.dedo()
	setPedAnimation(source, "RIOT", "RIOT_FUKU", -1, false, false, true, false)
end
addEvent("anim.dedo", true)
addEventHandler("anim.dedo", root, anim.dedo)

function anim.cancel()
	setPedAnimation(source)
end
addEvent("anim.cancel", true)
addEventHandler("anim.cancel", root, anim.cancel)
