

local screenX, screenY = guiGetScreenSize()
local x, y = 1366, 768
local relX, relY = screenX/x, screenY/y
local panelX, panelY, panelWidth, rowHeight = 32*relX, (32*relY)+164, 325*relX, 30*relY
local chaletlondon = dxCreateFont("fonts/chaletlondon.ttf", 24*relY, false, "antialiased")
local signpainter = dxCreateFont("fonts/signpainter.ttf", 24*relY, false, "antialiased")

addEvent("NativeUI.onTabEnter", true)

addEvent("NativeUI.onCheckChange", true)

addEvent("NativeUI.onTabChange", true)

addEvent("NativeUI.onWindowClose", true)

addEvent("NativeUI.onSelectChange", true)

addEvent("NativeUI.onButtonEnter", true)

addEvent("NativeUI.onCheckEnter", true)

addEvent("NativeUI.onSelectEnter", true)



local currentUse = 1

local windows = {
 --[[  {
      title = "Title";
      title_image = "NORMALE.png";
      title_2 = "Title 2";
      isVisible = true;
      useBackSpace = true;
      Tabs = {
         -- evnt or false or true ( check bool)
      --  {"type","text","event",currentUse,{useses Tab}}
      {"select","Tab 1","",1,{"Ali", "Othamne"}}


      };
  };--]]
  
};


function render ()
    for _, window in pairs(windows) do 
        if window then 
        if window.isVisible then 
    dxDrawImage(panelX, panelY, panelWidth, 80*relY,"images/"..window.title_image or "images/NORMALE.png")
	dxDrawText(window.title,panelX+10*relX, panelY, panelWidth+panelX-10*relX, 80*relY+panelY, tocolor(255, 255, 255, 255), 1.5, signpainter, "center", "center")
    dxDrawRectangle(panelX, panelY+80*relY, panelWidth, rowHeight, tocolor(10, 10, 10, 255))
    
   -- dxDrawRectangle(panelX, panelY, panelWidth, notificationData["height"], tocolor(0, 0, 0, 210))

    dxDrawText(utf8.upper(window.title_2), panelX+10*relX, panelY+80*relY, panelWidth+panelX+10*relX, rowHeight+panelY+80*relY, tocolor(53, 76, 115, 255), 0.5, chaletlondon, "left", "center")
	dxDrawText(""..currentUse.."/"..#window.Tabs.."", panelX+10*relX, panelY+80*relY, panelWidth+panelX-10*relX, rowHeight+panelY+80*relY, tocolor(53, 76, 115, 255), 0.5, chaletlondon, "right", "center")

    currentY = panelY+80*relY+rowHeight
    --dxDrawRectangle(panelX, currentY+33*relY, panelWidth, rowHeight, tocolor(0, 0, 0, 210))
	--dxDrawImage(panelX, currentY+33*relY, panelWidth, rowHeight, "images/menunav.png")
   
    for k, v in ipairs(window.Tabs) do
        bgColor = tocolor(0, 0, 0, 210)
        textColor = tocolor(255, 255, 255, 220)
        if (k ~= currentUse) then
            bgColor = tocolor(0, 0, 0, 210)
            textColor = tocolor(255, 255, 255, 220)
        else
            bgColor = tocolor(255, 255, 255, 255)
            textColor = tocolor(0, 0, 0, 255)
        end
        dxDrawRectangle(panelX, currentY+(rowHeight*(k-1)), panelWidth, rowHeight, bgColor)
        dxDrawText(v[2], panelX+10*relX, currentY+(rowHeight*(k-1)), panelWidth+panelX+10*relX, rowHeight+currentY+(rowHeight*(k-1)), textColor, 0.45, chaletlondon, "left", "center")
        local state = ""
        if (v[1] == "check") then
        textColor = tocolor(255, 255, 255, 255)
        if (k ~= currentUse) then
            textColor = tocolor(255, 255, 255, 255)
        else
            textColor = tocolor(0, 0, 0, 255)
        end
        if (v[3]) then
            state = "▣"
        else
            state = "□"
        end
        dxDrawText(state, panelX+10*relX, currentY+(rowHeight*(k-1)), panelWidth-20*relX+panelX+10*relX, rowHeight+currentY+(rowHeight*(k-1)), textColor, 1.0, chaletlondon, "right", "center")
       -- dxDrawText("□", panelX+13*relX, currentY+(rowHeight*(k-1)), panelWidth-20*relX+panelX+10*relX, rowHeight+currentY+(rowHeight*(k-1)), textColor, 1.0, chaletlondon, "right", "center")
    elseif (v[1] == "select") then 
        local currentUseText = v[5][v[4]] or ""
        if currentUseText then 
            dxDrawText("< "..currentUseText.." >", panelX+10*relX, currentY+(rowHeight*(k-1)), panelWidth-20*relX+panelX+10*relX, rowHeight+currentY+(rowHeight*(k-1)), textColor, 0.55, chaletlondon, "right", "center")
        end
    end
    
end

end
end 
end 
end 

addEventHandler("onClientRender", root, render)



function key (key, state)
    for _, window in pairs(windows) do 
	if (window.isVisible) then
		if (state) then
		 local v = window.Tabs[currentUse]
			if (v) then
				
				if (v[1] == "button") then
                    if (key == "enter") then
                        playSound("sounds/menunavigate.mp3")
                        enterFunction()
                        triggerEvent("NativeUI.onTabEnter",localPlayer,currentUse, window.Tabs[currentUse][3])
                        if string.len(window.Tabs[currentUse][3]) >= 1 then 
                            triggerEvent(window.Tabs[currentUse][3],localPlayer,currentUse, window.Tabs)
                        end
					end
				elseif (v[1] == "check") then
                    if (key == "enter") then
                        playSound("sounds/buttonpressed.mp3")
                        enterFunction()
                        triggerEvent("NativeUI.onCheckChange",localPlayer,currentUse, window.Tabs[currentUse][3])
					end
				end
			end

			if (key == "arrow_d") then
				if (currentUse < #window.Tabs) then
                    currentUse = currentUse + 1
                    triggerEvent("NativeUI.onTabChange",localPlayer,currentUse, window.Tabs[currentUse][3])
				else
                    currentUse = 1
                    triggerEvent("NativeUI.onTabChange",localPlayer,currentUse, window.Tabs[currentUse][3])
				end
				playSound("sounds/menunavigate.mp3")
			elseif (key == "arrow_u") then
				if (currentUse > 1) then
                    currentUse = currentUse - 1
                    triggerEvent("NativeUI.onTabChange",localPlayer,currentUse, window.Tabs[currentUse][3])
				else
                    currentUse = #window.Tabs
                    triggerEvent("NativeUI.onTabChange",localPlayer,currentUse, window.Tabs[currentUse][3])
				end
				playSound("sounds/menunavigate.mp3")
			elseif (key == "backspace") then
				--v = window.Tabs[currentUse]
                --if (v[1] ~= "input") then
                    
                    playSound("sounds/menuenter.mp3")
                    if window.useBackSpace then 
                        triggerEvent("NativeUI.onWindowClose",localPlayer,window)
                        window.isVisible = false
                    -- DeletePool(_)
                    end 
                    
            --	end
            
                elseif(key == "arrow_l") then
                    if  v[1] == "select" then 
                   
                    if (v[4] > 1) then
                        v[4] = v[4] - 1
                        playSound("sounds/menunavigate.mp3")
                        triggerEvent("NativeUI.onSelectChange",localPlayer,window, window.Tabs[currentUse][5][window.Tabs[currentUse][4]])
                    else
                        v[4] = #v[5]
                        playSound("sounds/menunavigate.mp3")
                        triggerEvent("NativeUI.onSelectChange",localPlayer,window, window.Tabs[currentUse][5][window.Tabs[currentUse][4]])
                    end
                end
                elseif (key == "arrow_r") then 
                   if  v[1] == "select" then 
                   
                    if (v[4] < #v[5]) then
                    v[4] = v[4] + 1
                    playSound("sounds/menunavigate.mp3")
                    triggerEvent("NativeUI.onSelectChange",localPlayer,window, window.Tabs[currentUse][5][window.Tabs[currentUse][4]])
				else
                    v[4] = 1
                    playSound("sounds/menunavigate.mp3")
                    triggerEvent("NativeUI.onSelectChange",localPlayer,window, window.Tabs[currentUse][5][window.Tabs[currentUse][4]])
                end
            end
				--playSound("sounds/menunavigate.mp3")

			end
		end
	end
end
end 
addEventHandler("onClientKey", root, key)





addEventHandler("onClientKey", getRootElement(), function(btn, state)
    for _, window in pairs(windows) do  
    if  window.isVisible then 
    if btn == "arrow_d" and state == true then
        cancelEvent()
    end
    if btn == "arrow_u" and state == true then
        cancelEvent()
    end
    if btn == "arrow_r" and state == true then
        cancelEvent()
    end
    if btn == "arrow_l" and state == true then
        cancelEvent()
    end
    if btn == "enter" and state == true then
        cancelEvent()
    end
end
end 
end)





function CreatePool(_title,_stitle,_image,useBackSpace)
    -- currentUse = 0
    if not _title then return outputDebugString("unable to get menu title") end 
    local id = 0 
     _image = _image or "NORMALE.png"
     _stitle = _stitle or ""
     if useBackSpace == false then 
     _useBackSpace = false

     else 
        _useBackSpace = true

     end 

     currentUse = currentUse + 1 
    id = tonumber(currentUse)

     table.insert(windows,id,{

      title = _title;
      title_image = _image;
      title_2 = _stitle;
      isVisible = true;
      useBackSpace = _useBackSpace;
      Tabs = {};


     }
    )
    

    for _, window in ipairs(windows) do 
        if window.title == _title and window.title_image == _image and window.title_2 == _stitle and window.isVisible == true and window.useBackSpace == window._useBackSpace and window.Tabs == {} then 
            outputChatBox("SSSSSSSS",255,0,0)
            id = _ 
        end
    end

  return tonumber(id)

end


function setVisible(windowID,bool)
    windows[tonumber(windowID)].isVisible = bool
end


function addTab(windowID,tabType, tabText,tabEvent,selectTable)
    local w = windows[tonumber(windowID)].Tabs
    if w then 
        table.insert( w,{tabType, tabText, tabEvent,1,selectTable} )
    end
end




function DeletePool (id)
     windows[id] = nil 
end

function ChangeTabName(wind,id,str)
    windows[tonumber(wind)].Tabs[tonumber(id)][2] = str

end
    
function DeleteTab (wind,id)
    return table.remove(windows[tonumber(wind)].Tabs[tonumber(id)])
end


function GetShowingPools()
    local tableOBJ = {}
 for _, wind in ipairs(windows) do 
    if wind.isVisible then 
        table.insert(tableOBJ, wind)
    end
 end
   return tableOBJ
end

function getWindow(id)
    for _, wind in ipairs(windows) do 
        
        if _ == tonumber(id) then 
            outputChatBox("tery")
            return wind           
        end
     end
end 

function GetMenuID(_wind)
   local id
    for _, wind in ipairs(windows) do 
        if wind == _wind or wind.title == _wind then 
            id = _ 
        end
    end
   return id
end





function GetCurrentTab()

    return currentUse

end




function GetCurrentSelect(window,tab)

    return windows[tonumber(window)].Tabs[tonumber(tab)][4]

end




function enterFunction ()
	--if not cursorUsed then cursorUsed = false end
	for _ , window in ipairs(windows) do 
	v = window.Tabs[currentUse]
	if (v[1] == "button") then
		triggerEvent("NativeUI.onButtonEnter", localPlayer,window,v)
	elseif (v[1] == "check") then
		
            v[3] = not v[3]
            triggerEvent("NativeUI.onCheckEnter", localPlayer,window,v)
            
    elseif (v[1] == "select") then 
        triggerEvent("NativeUI.onSelectEnter", localPlayer,window,v)
    end
	end
end