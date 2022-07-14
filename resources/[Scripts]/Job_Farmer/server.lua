createBlip (-1052.7275390625,-1204.4248046875,128.95002746582, 47)



boxes = {}

obj = {

	--{-1035.171875, -1180.478515625, 129.21875},

	--{-1032.677734375,-1180.478515625, 129.21875},

}

markers = {

	{-1073.2978515625, -1221.01953125, 129.21875},

	{-1060.1416015625, -1253.9609375, 129.21875},

	{-1071, -1243.482421875, 129.21875},

	{-1083.7802734375, -1247.1865234375, 129.21875},

}

jobmarkers = {

	{-1035.171875,-1180.478515625, 129.8},

	{-1032.677734375,-1180.478515625, 129.8},

}



checkm = false



centerMarker = createMarker(-1057.40234375,-1192.216796875,128.1,"cylinder",1.8,255,0,0,150)

setElementInterior(centerMarker,0)

setElementDimension(centerMarker,0)

setElementVisibleTo(centerMarker,root,false)



for i,pos in ipairs(obj) do

	obj[i] = createObject(3095,pos[1], pos[2], pos[3],0,90,180)

	setElementInterior(obj[i],0)

	setElementDimension(obj[i],0)

end



function onPlayerTakenParts(player,matchingDimension)

	if getElementType(player) == "player" then

		if getElementData(player,"worldjob") == true then

			if not getElementData(player,"part") == true then

				if not getElementData(player,"weapon") == true then

					setPedAnimation (player,"WEAPONS","SHP_2H_LIFT",-1,false,false,true,false)

					--giveWeapon(player,43,1)

					setPedWeaponSlot(player,3)

					setElementData(player,"part",true)

					outputChatBox("[Drug-Recolter] Good ! You took the reaper , now you have to harvest the drug that is in front of the house.",player, 2, 253, 161)

				else

					--outputChatBox("",player,200,0,0)

				end

			else

				outputChatBox("[Drug-Recolter] Error ! You already have a reaper !",player, 255, 0, 0)

			end

		end

	end

end



for i,pos in ipairs(jobmarkers) do

	jobmarkers[i] = createMarker(pos[1], pos[2], pos[3],"arrow",0.8,255,255,0,255)

	setElementInterior(jobmarkers[i],0)

	setElementDimension(jobmarkers[i],0)

	addEventHandler("onMarkerHit", jobmarkers[i], onPlayerTakenParts)

end



function onPlayerStartToCreateWeapon(player,matchingDimension)

	if getElementType(player) == "player" then

		if getElementData(player,"worldjob") == true then

			if not getElementData(player,"weapon") then

				if getElementData(player,"part") == true then

					outputChatBox("[Drug-Recolter] You started the drug harvest !Stand By !Pay attention to the police",player, 2, 253, 161)

					setElementFrozen(player,true)

					setPedAnimation(player,"bar", "barserve_bottle",-1,true,false,true,false)

					setElementData(player,"part",false)

					toggleAllControls(player,false)

					setTimer(function()

						for i = 1, #markers do

							if isElementWithinMarker ( player, markers [ i ] ) then

								checkm = true

								break

							end

						end

						if checkm == true then

							if not isElementVisibleTo(centerMarker,player) then

								setElementVisibleTo(centerMarker,player,true)

							end

							setElementFrozen(player,false)

							--setPedAnimation(player,"CARRY","crry_prtial",1,true,true,false)

							setPedAnimation (player,"WEAPONS","SHP_2H_LIFT",-1,false, false, false, false)

							--takeWeapon(player,25)						

							--boxes = createObject( 1271, 0, 0, 0 );

							--exports.bone_attach:attachElementToBone( boxes, player, 4, 0, 0.4, - 0.6, -90, 0, 0 );

							setElementData(player,"weapon",true)

							toggleAllControls(player,true)

							toggleControl(player,"fire",false)

							toggleControl(player,"sprint",false)

							toggleControl(player,"next_weapon",false)

							toggleControl(player,"previous_weapon",false)

							outputChatBox("[Drug-Recolter] You have successfully harvested drugs , take and put the drug in the hut.",player, 2, 253, 161)

						else

							setPedAnimation(player,false)

							toggleAllControls(player,true)

							setElementFrozen(player,false)

							toggleControl(player,"fire",false)

							toggleControl(player,"sprint",false)

							toggleControl(player,"next_weapon",false)

							toggleControl(player,"previous_weapon",false)

							outputChatBox("",player,200,0,0)

						end

					end,10000,1)

				end

			end

		end

	end

end



for i,pos in ipairs(markers) do

	markers[i] = createMarker(pos[1], pos[2], pos[3],"cylinder",0.8,255,0,0,0)

	setElementInterior(markers[i],0)

	setElementDimension(markers[i],0)

	addEventHandler("onMarkerHit", markers[i], onPlayerStartToCreateWeapon)

end



function onPlayerFinishToCreateWeapon(player,matchingDimension)

	if source == centerMarker then

		if getElementType(player) == "player" then

			if getElementData(player,"worldjob") == true then

				if getElementData(player,"weapon") == true then

					local rand = math.random(200,500)

					if isElementVisibleTo(centerMarker,player) then

						setElementVisibleTo(centerMarker,player,false)

					end

					if getElementData(player,"jobmoney") then

						setElementData(player,"jobmoney",getElementData(player,"jobmoney")+rand)

					else

						setElementData(player,"jobmoney",rand)

					end

					setPedAnimation (player,"CARRY","putdwn",-1,false,false,true,false)

					--setTimer(takeWeapon,600,1,player,43)

					

				--	exports.bone_attach:detachElementFromBone(boxes)

					--destroyElement(boxes)

				--	boxes[player] = nil

					takeWeapon(player,43)

					

					setElementData(player,"weapon",false)

					--outputChatBox(" "..rand.."$"..getElementData(player,"jobmoney").."$",player,0,200,0,true)
					payement = 100
					if exports.nx_vip:isPlayerVip(thePlayer) == 3 then
						paymenet = paymenet +(75 * paymenet) / 100
					 end
					-- exports.global:giveItem (player, 34, 1 ) 
					for k,v in ipairs(getElementsByType("player")) do
						if tonumber(getElementData(v,"faction")) == 1 then 
							payement = payement + 25
						end
					end
					

					exports.global:giveDirtyMoney (player, payement ) 

					outputChatBox("[Drug-Recolter] Good job ! You got "..tostring(payement).."$.",player, 2, 253, 161)

				end

			end

		end

	end

end

addEventHandler("onMarkerHit",root,onPlayerFinishToCreateWeapon)



function quitJob(player)

	if player then

		if getElementData(player,"worldjob") == true then

			if isElementVisibleTo(centerMarker,player) then

				setElementVisibleTo(centerMarker,player,false)

			end

			toggleControl(player,"fire",true)

			toggleControl(player,"sprint",true)

			toggleControl(player,"next_weapon",true)

			toggleControl(player,"previous_weapon",true)

			setElementData(player,"worldjob",false)

			setElementData(player,"part",false)

			setElementData(player,"weapon",false)

			setPedAnimation(player,false)

			--takeWeapon(player, 43)

			outputChatBox("[Drug-Recolter] You have completed your job ! See you later !",player, 2, 253, 161)

		end

	end

end

addEvent("onPlayerQuitJob",true)

addEventHandler("onPlayerQuitJob",root,quitJob)







function quitPlayerOnJob()

	if getElementData(source,"worldjob") == true then

		takeWeapon(source,43)

		giveJobMoney(source)

		if isElement(boxes[source]) then

			exports.bone_attach:detachElementFromBone(boxes[source])

			destroyElement(boxes[source])

			boxes[source] = nil

		end

	end

end

addEventHandler("onPlayerQuit",root,quitPlayerOnJob)



function worksJobEnterDoor(player)

	if not isPedInVehicle(player) then

		fadeCamera(player,false,2.0,0,0,0)

		setTimer(setElementPosition,1000,1,player,2575.6145,-1289.7745,1044.1250)

		setTimer(setElementInterior,1000,1,player,2)

		setTimer(setElementDimension,1000,1,player,1)

		setTimer(setCameraTarget,1050,1,player,player)

		setTimer(fadeCamera,1000,1,player,true)

		setTimer(toggleControl,1000,1,player,"enter_exit",true)

	end

end

addEvent("WorksJobEnterDoor",true)

addEventHandler("WorksJobEnterDoor",root,worksJobEnterDoor)



local Sellmark = createMarker(2374.6103515625, -2543.3876953125, 3.4-1,"cylinder",0.8,255,50,0,255)


local Sellmark2 = createMarker(2263.6469726562, -2708.1708984375, 8.6-1,"cylinder",0.8,255,50,0,255)





setTimer ( function (	)

	for _,thePlayer in ipairs ( getElementsByType ( "player" ) ) do

	if isElementWithinMarker ( thePlayer,Sellmark ) then 

	if exports.global:hasItem(thePlayer, 34) then

      exports.global:takeItem(thePlayer, 34)

      exports['global']:giveDirtyMoney(thePlayer, 450)



    end

				end

			end

end,1000,0 )

setTimer ( function (	)

	for _,thePlayer in ipairs ( getElementsByType ( "player" ) ) do

	if isElementWithinMarker ( thePlayer,Sellmark2 ) then 

	if exports.global:hasItem(thePlayer, 38) then

      exports.global:takeItem(thePlayer, 38)

      exports['global']:giveDirtyMoney(thePlayer, 250)



    end

				end

			end

end,1000,0 )









function worksJobExitDoor(player)

	if not isPedInVehicle(player) then

		if getElementData(player,"worldjob") == true then

			outputChatBox("",player,200,0,0)

			return

		end

		fadeCamera(player,false,2.0,0,0,0)

		setTimer(setElementPosition,1000,1,player,-86.2826,-300.8545,2.7646)

		setTimer(setElementInterior,1000,1,player,0)

		setTimer(setElementDimension,1000,1,player,0)

		setTimer(setCameraTarget,1050,1,player,player)

		setTimer(fadeCamera,1000,1,player,true)

		setTimer(toggleControl,1000,1,player,"enter_exit",true)

	end

end

addEvent("WorksJobExitDoor",true)

addEventHandler("WorksJobExitDoor",root,worksJobExitDoor)



--[[function checkStart()

	if getResourceFromName("bone_attach") and getResourceState(getResourceFromName("bone_attach")) == "running" then

	else

		outputChatBox("Ресурс bone_attach не запущен!",root,255,0,0)

		cancelEvent()

	end

end

addEventHandler("onResourceStart",resourceRoot,checkStart)]]