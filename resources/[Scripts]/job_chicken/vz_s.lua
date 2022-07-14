local meats = {}

local boxes = {}



addEvent("givePlayerMeat",true)

addEventHandler("givePlayerMeat",getRootElement(),function(playerSource)

	if not isElement(meats[playerSource]) then

		meats[playerSource] = createObject(2806,0,0,0)

		setObjectScale(meats[playerSource],0.7)

		setElementCollisionsEnabled(meats[playerSource], false)

		setElementInterior(meats[playerSource],getElementInterior(playerSource))

		setElementDimension(meats[playerSource],getElementDimension(playerSource))

		exports.bone_attach:attachElementToBone(meats[playerSource],playerSource,12, 0.10, 0.05, 0.15, 0, 80, 80)

		setElementData(playerSource,"meat",meats[playerSource])

		setPedAnimation(playerSource, "CARRY", "crry_prtial", 0, true, false, true, true)

		setElementData(playerSource,"isMeatInHand",true)

	end

end)



addEvent("takePlayerMeat",true)

addEventHandler("takePlayerMeat",getRootElement(),function(playerSource)

	if isElement(meats[playerSource]) then

		exports.bone_attach:detachElementFromBone(meats[playerSource])

		destroyElement(meats[playerSource])

		meats[playerSource] = false

		setPedAnimation(playerSource,"CARRY","putdwn",1100,false,false,false,false)

		setElementData(playerSource,"isMeatInHand",false)

		toggleControl(playerSource,"fire", true)

		-- toggleControl(playerSource,"sprint", true)

		toggleControl(playerSource,"crouch", true)

		toggleControl(playerSource,"jump", true)

	end

end)



addEvent("givePlayerBox",true)

addEventHandler("givePlayerBox",getRootElement(),function (playerSource)

	if not isElement(boxes[playerSource] ) then

		boxes[playerSource] = createObject(1271,0,0,0)

		setObjectScale(boxes[playerSource],0.7)

		setElementInterior(boxes[playerSource],getElementInterior(playerSource))

		setElementDimension(boxes[playerSource],getElementDimension(playerSource))

		exports.bone_attach:attachElementToBone(boxes[playerSource],playerSource,12,0.2,0.2,0.2,0,90,65)

		setPedAnimation(playerSource, "CARRY", "crry_prtial", 0, true, false, true, true)

		setElementData(playerSource,"isBoxInHand",true)

	end

end)



addEvent("takePlayerBox",true)

addEventHandler("takePlayerBox",getRootElement(),function(playerSource)

	if isElement(boxes[playerSource]) then

		exports.bone_attach:detachElementFromBone(boxes[playerSource])

		destroyElement(boxes[playerSource])

		boxes[playerSource] = false

		setPedAnimation(playerSource,"CARRY","putdwn",1100,false,false,false,false)

		setElementData(playerSource,"isBoxInHand",false)

		toggleControl(playerSource,"fire", true)

		-- toggleControl(playerSource,"sprint", true)

		toggleControl(playerSource,"crouch", true)

		toggleControl(playerSource,"jump", true)

	end

end)



local entrar = createMarker(2491.1787109375, -2468.890625, 17.882808685303-0.85,"cylinder",1,65, 255, 55,60)

local sair = createMarker(965.03198, 2107.87915, 1011.0-0.85,"cylinder",1,65, 255, 55,60)

setElementDimension(sair,48)

setElementInterior(sair,1)



function entrar1 (source)

        setElementInterior(source, 1, 962.68292, 2107.75903, 1011.03027)

        setElementDimension(source, 48)

end

addEventHandler ("onMarkerHit", entrar, entrar1)



function sair1 (source)

        setElementInterior(source, 0, 2492.3642578125, -2470.390625, 17.882808685303)

        setElementDimension(source, 0)

exports.global:takeItem(source, 115, 2)

end

addEventHandler ("onMarkerHit", sair, sair1)



---------------



local marker_machete = createMarker (961.408203125, 2098.9658203125, 1011-0.5, "cylinder", 0.6, 16, 255, 55,60)

setElementInterior(marker_machete,1)

setElementDimension(marker_machete,48)



local marker_emprego = createMarker (960.48828125, 2098.9658203125, 1011-0.5, "cylinder", 0.6, 16, 255, 55,60)

setElementInterior(marker_emprego,1)

setElementDimension(marker_emprego,48)



function msg_emprego(source)

	if isElementWithinMarker(source, marker_emprego) then

		outputChatBox("#00ff37[Job] #ffffff/jobm تاكد انك اخذت الوظيفة بكتابة امر ",source,255,255,255,true)

	end

end

addEventHandler("onMarkerHit", marker_emprego, msg_emprego)



function equipar(source) 			

local Emprego = getElementData ( source, "char.job" )

	if isElementWithinMarker(source, marker_machete) then

	  if Emprego == 1 then

	    if (exports.global:hasItem(source, 115, 2)) then

			outputChatBox("#00ff37[Job] #ffffffلديك منجل بالفعل",source,255,255,255,true)

		else

			outputChatBox("#00ff37[Job] #ffffffلقد جهزت المنجل الخاص بك",source,255,255,255,true)

			exports.global:giveItem(source, 115, 2)

        end			

	  else

			outputChatBox("#00ff37[Job] #ffffffلم تاخذ الوظيفة",source,255,255,255,true)

	  end

	end

end

--addCommandHandler("gvm", equipar)

addEventHandler( "onMarkerHit",marker_machete,equipar )



function emprego(source) 			

local Emprego = getElementData ( source, "char.job" )

	if isElementWithinMarker(source, marker_emprego) then

		if Emprego == 1 then

			outputChatBox("#00ff37[Job] #ffffffأنت تعمل بالفعل كجزار",source,255,255,255,true)

	    else

			outputChatBox("#00ff37[Job] #ffffffأنت الآن تعمل جزار",source,255,255,255,true)

			setElementData ( source, "char.job", 1)

		end

	end

end

addCommandHandler("jobm", emprego)



function givemaitmoney()


	local paymenet = math.random(125,200)

	
	if exports.nx_vip:isPlayerVip(thePlayer) == 3 then
		paymenet = paymenet +(75 * paymenet) / 100
	 end

	exports.global:giveMoney(source,paymenet)

	outputChatBox("#00ff37[Job] #ffffff$ "..paymenet.."",source,255,255,255,true)



end

addEvent("vz_GiveMoney", true)

addEventHandler("vz_GiveMoney", root, givemaitmoney)

createBlip(2491.1787109375, -2468.890625, 17.882808685303,40,2,0,0,255,255,0)