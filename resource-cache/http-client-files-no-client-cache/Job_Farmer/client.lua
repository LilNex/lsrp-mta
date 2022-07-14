function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW)/2,(screenH - windowH)/2
    guiSetPosition(center_window, x, y, false)
end

jobpick = createPickup(-1060.9208984375,-1194.91796875,129.68144226074,3,1275)
setElementInterior(jobpick,0)
setElementDimension(jobpick,0)

function openJobWindow(source)
	if source == localPlayer and getElementType(source) == "player" then
		local job = getElementData(localPlayer,"worldjob")
		if job == true then
			if getElementData(source,"part") == false then
				if getElementData(source,"weapon") == false then
					guiSetVisible(jobquitwindow,true)
					showCursor(true)
				else
					outputChatBox("[Drug-Recolter] Error you have not finished your job !",player, 255, 0, 0)
				end
			else
				outputChatBox("[Drug-Recolter] Error you have not finished your job !",player, 255, 0, 0)
			end
		elseif job == false then
			guiSetVisible(jobjoinwindow,true)
			showCursor(true)
		end
	end
end
addEventHandler("onClientPickupHit",jobpick,openJobWindow)

jobjoinwindow = guiCreateWindow(0, 0, 394, 387, "Farmer Job | LSRP Copyright 2019", false) 
guiWindowSetMovable(jobjoinwindow,false)
guiWindowSetSizable(jobjoinwindow,false)
guiSetVisible(jobjoinwindow,false)
centerWindow(jobjoinwindow)


msg = guiCreateMemo(-20, 20, 375, 279, "====== Farmer Job by LSRP scripters team ====== \n\n--> How to work ? \n[1] --> You need to take the reaper.\n[2] --> Then find the drugs that is in front of the house.\n[3] --> Then use your reaper to harvest the drugs.\n[4] --> Work fast and pay attention to the police.\n[5] --> When the harvest is completed , then take the drugs on you .\n[6] --> Put them at the hud. \n[7] --> Take your salary and leave the zone . \n\n\nWarning : This work is illegale - You can be arrested ! \n\n\n--> Do you accept this job ?", false, jobjoinwindow)  
guiMemoSetReadOnly(msg, true)    

closejoinwindow = guiCreateButton(32, 358, 319, 19, "Decline Job", false, jobjoinwindow) 
guiSetFont(closejoinwindow,"default-bold-small")
guiSetProperty(closejoinwindow, "NormalTextColour", "FFFD0000")

joinjobbutton = guiCreateButton(32, 316, 319, 19, "Accept Job ", false, jobjoinwindow)
guiSetFont(joinjobbutton,"default-bold-small")
guiSetProperty(joinjobbutton, "NormalTextColour", "FF41FE00")


function closeJoinWindow(button)
	if button == "left" then
		if source == closejoinwindow then
			if guiGetVisible(jobjoinwindow) == true then
				guiSetVisible(jobjoinwindow,false)
				showCursor(false)
			end
		end
	end
end
addEventHandler("onClientGUIClick",closejoinwindow,closeJoinWindow)

function joinJob(button)
	if button == "left" then
		if source == joinjobbutton then
			setElementData(localPlayer,"worldjob",true)
			toggleControl("fire",false)
			toggleControl("sprint",false)
			toggleControl("next_weapon",false)
			toggleControl("previous_weapon",false)
			outputChatBox("[Drug-Recolter] To start you need to take the reaper.", 2, 253, 161)
			guiSetVisible(jobjoinwindow,false)
			showCursor(false)
		end
	end
end
addEventHandler("onClientGUIClick",joinjobbutton,joinJob)

jobquitwindow = guiCreateWindow(496, 252, 392, 135, "Exit Job", false)  
guiWindowSetMovable(jobquitwindow,false)
guiWindowSetSizable(jobquitwindow,false)
guiSetVisible(jobquitwindow,false)
centerWindow(jobquitwindow)

guit = guiCreateMemo(9, 23, 374, 81, "===> Exit the job ? \n--> You well get your salary \n\n[-] Are you sure ?", false, jobquitwindow)  
--quitlabel = guiCreateLabel(0.1,0.325,0.9,0.5,"هل تريد حقا أن تترك الوضيفة؟",true,jobquitwindow)
guiSetFont(quit, "default-bold-small")

closequitwindow = guiCreateButton(266, 109, 116, 16, "No",false,jobquitwindow) 
guiSetFont(closequitwindow, "default-bold-small")
guiSetProperty(closequitwindow, "NormalTextColour", "FF0024FE")

quitjobbutton = guiCreateButton(10, 109, 116, 16, "Yes",false,jobquitwindow) 
guiSetFont(quitjobbutton, "default-bold-small")
guiSetProperty(quitjobbutton, "NormalTextColour", "FF0024FE")

function closeQuitWindow(button)
	if button == "left" then
		if source == closequitwindow then
			if guiGetVisible(jobquitwindow) == true then
				guiSetVisible(jobquitwindow,false)
				showCursor(false)
			end
		end
	end
end
addEventHandler("onClientGUIClick",closequitwindow,closeQuitWindow)

function quitJob(button)
	if button == "left" then
		if source == quitjobbutton then
			if getElementData(localPlayer,"worldjob") == true then
				triggerServerEvent("onPlayerQuitJob",localPlayer,localPlayer)
				triggerServerEvent("giveJobMoney",localPlayer,localPlayer)
				guiSetVisible(jobquitwindow,false)
				showCursor(false)
			else
				outputChatBox("",200,0,0)
			end
		end
	end
end
addEventHandler("onClientGUIClick",quitjobbutton,quitJob)

cashpick = createPickup(-1063.9208984375,-114.91796875,29.68144226074,3,1274)
setElementInterior(cashpick,0)
setElementDimension(cashpick,0)

cashwindow = guiCreateWindow(0,0,0.2,0.20,"Зарплата",true)
guiWindowSetMovable(cashwindow,false)
guiWindowSetSizable(cashwindow,false)
guiSetVisible(cashwindow,false)
centerWindow(cashwindow)

cashlabel = guiCreateLabel(0.07,0.15,1,1,"",true,cashwindow)
guiSetFont(cashlabel, "default-bold-small")

takecashwindow = guiCreateButton(0.05,0.77,0.35,0.17,"الحصول على",true,cashwindow)
guiSetFont(takecashwindow, "default-bold-small")

closecashwindow = guiCreateButton(0.6,0.77,0.35,0.17,"إلغاء",true,cashwindow)
guiSetFont(closecashwindow, "default-bold-small")

function openCashWindow(source)
	if source == localPlayer and getElementType(source) == "player" then
		if getElementData(source,"worldjob") == true then
			if getElementData(source,"jobmoney") >= 20 then
				if guiGetVisible(cashwindow) == false then
					guiSetText ( cashlabel,"لقد ربحت: "..getElementData(localPlayer,"jobmoney").."$")
					guiSetVisible(cashwindow,true)
					showCursor(true)
				end
			else
				outputChatBox("هل لم تكسب أي شيء",200,0,0)
			end
		else
			outputChatBox("كنت لا تعمل هنا.",200,0,0)
		end
	end
end
addEventHandler("onClientPickupHit",cashpick,openCashWindow)

function closeCashWindow(button)
	if button == "left" then
		if source == closecashwindow then
			if guiGetVisible(cashwindow) == true then
				guiSetVisible(cashwindow,false)
				showCursor(false)
			end
		end
	end
end
addEventHandler("onClientGUIClick",closecashwindow,closeCashWindow)

function giveMeCash(button)
	if button == "left" then
		if source == takecashwindow then
			triggerServerEvent("giveJobMoney",localPlayer,localPlayer)
			guiSetVisible(cashwindow,false)
			showCursor(false)
		end
	end
end
addEventHandler("onClientPickupHit",Works_Job_Exit,onClientHitExitWorksJobPickup)



function WorksJobExitDoor()
	triggerServerEvent("WorksJobExitDoor",localPlayer,localPlayer)
end

function renderJobName()
	if isElement(Works_Job_Enter) then
		local cx,cy,cz = getCameraMatrix()
		local px,py,pz = getElementPosition(Works_Job_Enter)
		local distance = getDistanceBetweenPoints3D(cx,cy,cz,px,py,pz)
		local posx,posy = getScreenFromWorldPosition(px,py,pz+0.025*distance+0.40)
		if posx and distance <= 15 then
			dxDrawBorderedText("|Yassine Hamri|المدخل للوظيفه",posx-(0.5),posy-(20),posx-(0.5),posy-(20),tocolor(255,175,0,255),1,1,"default-bold","center","top",false,false,false)
		end
	end
end
addEventHandler("onClientHUDRender",root,renderJobName)



function dxDrawBorderedText(text,left,top,right,bottom,color,scale,outlinesize,font,alignX,alignY,clip,wordBreak,postGUI,colorCoded)
	local outlinesize = math.min(scale,outlinesize)
	if outlinesize > 0 then
		for offsetX=-outlinesize,outlinesize,outlinesize do
			for offsetY=-outlinesize,outlinesize,outlinesize do
				if not (offsetX == 0 and offsetY == 0) then
					dxDrawText(text:gsub("#%x%x%x%x%x%x",""), left+offsetX, top+offsetY, right+offsetX, bottom+offsetY, tocolor(0, 0, 0, 255), scale, font, alignX, alignY, clip, wordBreak, postGUI)
				end
			end
		end
	end
	dxDrawText(text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded)
end