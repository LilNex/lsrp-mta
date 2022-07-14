--sakht marker hack


function hackmarker()
	hackmark = createMarker(hackx , hacky , hackz ,"cylinder" , 1)
	setElementInterior(hackmark , interiorhack , hackx , hacky , hackz)
	setElementDimension(hackmark , dimensionhack)
 end
 addEvent("createhackrob" , true)
 addEventHandler("createhackrob" , getRootElement() , hackmarker)
 addEventHandler("onResourceStart" , getResourceRootElement() , hackmarker)
 ---------------------------------------------------------
 --sakht dar gav sandogh
 function door()
	door = createObject ( 2634 , darx , dary , darz  )
	setObjectScale(door,1.5,1.5,1.5)
	door2 = createObject ( 2634 , dar2x , dar2y , dar2z  )
	setElementRotation ( door, 180,0,90)
	setElementRotation ( door2, 180,0,0)
	setElementInterior(door , interiordar , darx , dary , darz)
	setElementInterior(door2 , interiordar , dar2x , dar2y , dar2z)
	setElementDimension(door , dimensiondar)
	setElementDimension(door2 , dimensiondar)
 end
 addEventHandler("onResourceStart" , getResourceRootElement() , door)
 -------------------------------------------------------
 --dorost kardan marker haye rob
 function robmarkers()
	robmark1 = createMarker(marker1x , marker1y , marker1z,"cylinder" , 1)
	robmark2 = createMarker(marker2x , marker2y , marker2z,"cylinder" , 1)
	robmark3 = createMarker(marker3x , marker3y , marker3z,"cylinder" , 1)
	robmark4 = createMarker(marker4x , marker4y , marker4z,"cylinder" , 1)
	robmark5 = createMarker(marker5x , marker5y , marker5z,"cylinder" , 1)
	robmark6 = createMarker(marker6x , marker6y , marker6z,"cylinder" , 1)
	setElementInterior(robmark1 , interiormarker , marker1x , marker1y , marker1z)
	setElementDimension(robmark1 , dimensionmarker)
	setElementInterior(robmark2 ,interiormarker , marker2x , marker2y , marker2z)
	setElementDimension(robmark2 , dimensionmarker)
	setElementInterior(robmark3 , interiormarker , marker3x , marker3y , marker3z)
	setElementDimension(robmark3 , dimensionmarker)
	setElementInterior(robmark4 , interiormarker , marker4x , marker4y , marker4z)
	setElementDimension(robmark4 , dimensionmarker)
	setElementInterior(robmark5 , interiormarker , marker5x , marker5y , marker5z)
	setElementDimension(robmark5 , dimensionmarker)
	setElementInterior(robmark6 , interiormarker , marker6x , marker6y , marker6z)
	setElementDimension(robmark6 , dimensionmarker)
	setElementData(robmark1 , "robmark2" , true)
	setElementData(robmark2 , "robmark2" , true)
	setElementData(robmark3 , "robmark2" , true)
	setElementData(robmark4 , "robmark2" , true)
	setElementData(robmark5 , "robmark2" , true)
	setElementData(robmark6 , "robmark2" , true)
	setElementData(robmark1 , "robmark" , math.random(hadaghapoolrob,bishtarinpoolrob))
	setElementData(robmark2 , "robmark" , math.random(hadaghapoolrob,bishtarinpoolrob))
	setElementData(robmark3 , "robmark" , math.random(hadaghapoolrob,bishtarinpoolrob))
	setElementData(robmark4 , "robmark" , math.random(hadaghapoolrob,bishtarinpoolrob))
	setElementData(robmark5 , "robmark" , math.random(hadaghapoolrob,bishtarinpoolrob))
	setElementData(robmark6 , "robmark" , math.random(hadaghapoolrob,bishtarinpoolrob))
 end
 addEvent("createrobmark" , true)
 addEventHandler("createrobmark" , getRootElement() , robmarkers)
 -----------------------------------------------------------------
 --tekoon dadan dar bank
 function movedoor()
	moveObject(door  , 3000,targetdarx , targetdary , targetdarz)
	moveObject(door2  , 3000,targetdar2x , targetdar2y , targetdar2z)
 end
 addEvent("movedoor" , true)
 addEventHandler("movedoor" , getRootElement() , movedoor)
 ------------------------------------
 --az beyn bordan hack
 function deshackmark()
	destroyElement(hackmark)
	annpd()
 end
 -------------------------------------
 ---nabood kardan marker haye rob
 function desmarker()
	destroyElement(hackmark)
	destroyElement(robmark1)
	destroyElement(robmark2)
	destroyElement(robmark3)
	destroyElement(robmark4)
	destroyElement(robmark5)
	destroyElement(robmark6)
 end
 --------------------------------
 ---tedad police ha
 function getdutypds()
	players = getElementsByType("player")
	tedadpd = 0
	for k , player in ipairs(players) do
	   factionid = tonumber(getElementData(player , "faction"))
	   if factionid == 1 or factionid == 74 and tonumber(getElementData(player , "duty")) > 0  then
		  tedadpd = tedadpd + 1
	   end
	end
	return tedadpd
 end
 -----------------------------------------
 --porsidan soal rob
 
 function startrobsoal(markerHit , matchingDimension)
	if markerHit == hackmark then
	   if matchingDimension then
		  tedadpd = getdutypds()
		  if  tedadpd > hadaghaltedadpd then
			 outputChatBox("#FF0000Baraye Rob Zadan Benevisid /bankrob" , source , 255 , 0 , 0 , true)
		  else
			 outputChatBox("#FF0000 You need atleast "..hadaghaltedadpd.." police officers to rob the bank !" , source , 255 , 0 , 0 , true)
		  end
	   end
	end
 end
 addEventHandler("onPlayerMarkerHit" , getRootElement() , startrobsoal)
 
 -------------------------------------------------
 --start kardan rob
 function annpd()
	players = getElementsByType("player")
	for i , player in ipairs(players) do
	   if tonumber(getElementData(player , "faction")) == 1 or tonumber(getElementData(player , "faction")) == 74   then
		  outputChatBox("#ff0000Az Bank Asli Dozdi Shode Ast!" , player , 255 ,255 ,255 , true)
	   end
	end
 end
 
 
 function bankrob(player , command)
	tedadpd = getdutypds()
	if  tedadpd >= hadaghaltedadpd then
	   checkplayer = isElementWithinMarker ( player , hackmark)
	   if not checkplayer == true then
		  outputChatBox("#FF0000 Too far away from the safe" , player , 255 , 0 , 0 , true)
		  return false
	   end
	   triggerClientEvent(player , "showhack" , player)
	   timeresetrob = timeresetrob * 3600
	   timeresetrob = timeresetrob * 1000
	   setTimer(restartResource  , timeresetrob , 1 , getThisResource())
	   deshackmark()
	   annpd()
	end
 end
 addCommandHandler("bankrob" , bankrob)
 
 
 --setrobbing
 function dadanpool(player , marker ,money)
	if player and isPedDead(player) == false then
	   if isElementWithinMarker ( player , marker) then
		  if getElementData(marker , "robmark")  < poolvardashtan then
			 money2 = getElementData(marker , "robmark")
			 exports.global:giveMoney(player , money2)
			 setElementData(marker , "robmark" , 0)
			 setPedAnimation(player)
			 destroyElement(marker)
			 return false
		  end
	   else
		  removeElementData(marker , "robbing")
	   end
	else
	   removeElementData(marker , "robbing")
	end
	if player and isPedDead(player) == false then
	   if getElementData(marker , "robmark")  ~= 0 then
		  if isElementWithinMarker ( player , marker) then
			 setPedAnimation(player , "rob_bank" , "cat_safe_rob" , -1 , true , false , false)
			 exports.global:giveMoney(player , poolvardashtan)
			 setElementData(player , "nowrob", true)
			 setElementData(marker , "robmark" , money - poolvardashtan)
			 newmoney = getElementData(marker , "robmark")
			 setTimer(dadanpool , 2000 , 1 , player , marker , newmoney)
		  else
			 removeElementData(marker , "robbing")
		  end
	   end
	else
	   removeElementData(marker , "robbing")
	end
 end
 
 
 function setrobbing(markerHit , matchingDimension)
	if matchingDimension then
	   if getElementData(markerHit , "robmark2") == true then
		  if not getElementData(markerHit , "robbing") == true then
			 money = getElementData(markerHit , "robmark")
			 if money ~= 0 then
				dadanpool(source ,markerHit ,  money)
				setElementData(markerHit , "robbing" , true)
			 else
				destroyElement(markerHit)
			 end
		  else
			 outputChatBox("#ff0000Az In Ja Dare Dozdi Mishe!" , source , 255 , 255 , 255 ,true)
		  end
	   end
	end
 end
 addEventHandler("onPlayerMarkerHit" , getRootElement() , setrobbing)
 
 
 function removerob(leaveElement, matchingDimension)
	if getElementData(source , "robbing") == true then
	   if matchingDimension then
		  setTimer(removeElementData , 2000 , 1 , leaveElement , "nowrob")
		  removeElementData(source , "robbing")
	   end
	end
 end
 --end
 addEventHandler("onMarkerLeave" , getRootElement() , removerob)