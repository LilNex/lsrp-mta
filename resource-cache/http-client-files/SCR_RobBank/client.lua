function creategui()
	felan_label = true
	x , y = guiGetScreenSize()
	hacktime = 300
	label2 = guiCreateLabel(0 , 0 , 200 , 100 , "300 Sanie Vaght Dari!" , false)
	starttimer()
	hackwindow = guiCreateWindow(504, 134, 324, 407, "", false)
	guiWindowSetSizable(hackwindow, false)
 
	edit = guiCreateEdit(9, 30, 233, 70, "", false, hackwindow)
	label = guiCreateLabel(248, 38, 95, 52, "Not Tested", false, hackwindow)
	guiSetFont(label, "clear-normal")
	button0 = guiCreateButton(121, 330, 80, 62, "0", false, hackwindow)
	button1 = guiCreateButton(19, 115, 80, 62, "1", false, hackwindow)
	button2 = guiCreateButton(109, 115, 80, 62, "2", false, hackwindow)
	button3 = guiCreateButton(199, 115, 80, 62, "3", false, hackwindow)
	button4 = guiCreateButton(199, 187, 80, 62, "6", false, hackwindow)
	button5 = guiCreateButton(109, 187, 80, 62, "5", false, hackwindow)
	button6 = guiCreateButton(19, 187, 80, 62, "4", false, hackwindow)
	button7 = guiCreateButton(199, 259, 80, 62, "9", false, hackwindow)
	button8 = guiCreateButton(109, 259, 80, 62, "8", false, hackwindow)
	button9 = guiCreateButton(19, 259, 80, 62, "7", false, hackwindow)
	button10 = guiCreateButton(9, 335, 110, 56, "Hack", false, hackwindow)
	guiSetFont(button10, "clear-normal")
	button11 = guiCreateButton(205, 335, 110, 56, "Cancel", false, hackwindow)
	guiSetFont(button11 , "clear-normal")
	showCursor(true)
	randomint = math.random(1000 , 9999)
	--  randomint = 5000
	setTimer(destroygui , 300000 , 1)
 end
 addEvent("showhack" , true)
 addEventHandler("showhack" , getRootElement() ,creategui)
 
 
 function destroygui()
	destroyElement(label2)
	felan_label = false
	destroyElement(hackwindow)
	showCursor(false)
 end
 addEvent("deshack" , true)
 addEventHandler("deshack" , getRootElement() ,destroygui)
 
 
 
 
 function starthack(button)
 
 
	if source == label then
	   return false
	end
 
 
 
 
	if source == edit then
	   return false
	end
 
 
 
 
	if source == button11 then
	   triggerServerEvent("createhackrob" , getRootElement())
	   destroygui()
	   return "cancel"
	end
 
 
 
 
	if source == button10 then
	   adad_player = guiGetText(edit)
	   adad_player = tonumber(adad_player)
	   if adad_player == randomint then
		  destroygui()
		  triggerServerEvent("movedoor" , getRootElement())
		  triggerServerEvent("createrobmark" , getRootElement())
	   elseif adad_player > randomint then
		  guiSetText(edit , "")
		  guiSetText(label , "Lower !")
	   elseif adad_player < randomint  then
		  guiSetText(edit , "")
		  guiSetText(label , "Higher !")
	   end
	end
 
 
 
 
	nowint = guiGetText(edit)
	sourceint = guiGetText(source)
	if  sourceint ~= "Hack" then
	   if  source ~= label2 then
		if type(nowint) == "string" then
		  guiSetText(edit , ""..nowint..""..sourceint.."")
		end
	   end
	end
 end
 addEventHandler("onClientGUIClick" , getRootElement() , starthack)
 
 function starttimer()
	if hacktime ~= 0 then
	   if felan_label == true then
		  hacktime = hacktime - 1
		  guiSetText(label2 , ""..hacktime.." Sanie Vaght Dari")
		  setTimer(starttimer , 1000 , 1)
	   end
	else
	   felan_label = false
	end
 end