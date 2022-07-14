 -- _    _           _ _____  
-- | |  | |         | |  __ \ 
 --| |  | |_ __   __| | |__) |
 --| |  | | '_ \ / _` |  _  / 
 --| |__| | | | | (_| | | \ \ 
  --\____/|_| |_|\__,_|_|  \_\ 
DGS = exports.dgs
function replaceModel()
TXD = engineLoadTXD ( "large-weed/test.txd" )
engineImportTXD ( TXD, 2901 )
DFF = engineLoadDFF( "large-weed/test.dff", 0 ) 
engineReplaceModel( DFF, 2901 ) 
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)
local myFont = dxCreateFont(':account/button/myfont.ttf', 10, false, 'proof')
local myButton = dxCreateFont(':account/button/mybutton.ttf', 10, false, 'proof')
local myButton2 = dxCreateFont('font/fontawesome.ttf', 10, false, 'proof')
local myText = dxCreateFont(':account/button/mytext.ttf', 10, false, 'proof')
function clickPot(button, state, absX, absY, wx, wy, wz, element)
	if getElementData(getLocalPlayer(), "exclusiveGUI") then
		return
	end
	if element and getElementType( element ) == "object" and button == "right" and state == "down" and getElementModel(element) == 2203 then
		weed = getElementData(element, "id")
		local x, y, z = getElementPosition(localPlayer)			
		if getDistanceBetweenPoints3D(x, y, z, wx, wy, wz) <= 3 then
        ax = absX
		ay = absY
		weed = getElementData(element, "id")
			WeedRightClick = DGS:dgsCreateWindow(ax,ay,170,180,"Cannabis #ID: " .. weed .. "",false,true,false,":account/button/button.png",tocolor(255, 80, 80),false,false,false)
			DGS:dgsWindowSetSizable ( WeedRightClick, false )
			WeedProgress = DGS:dgsCreateProgressBar(0.05,0.13,0.9,0.14,true,WeedRightClick)
			GrowProgress = DGS:dgsCreateProgressBar(0.05,0.38,0.9,0.14,true,WeedRightClick)
			TimeProgress = DGS:dgsCreateProgressBar(0.05,0.61,0.9,0.14,true,WeedRightClick)
			WeedWaterLabel = DGS:dgsCreateLabel(0.25,0.06,0.08,0.08,"Water #FF5050 Level: ",true,WeedRightClick)
			WeedGrowLabel = DGS:dgsCreateLabel(0.26,0.29,0.08,0.08,"Grow #FF5050 Level: ",true,WeedRightClick)
			TimeGrowLabel = DGS:dgsCreateLabel(0.26,0.54,0.08,0.08,"Time #FF5050 Left: ",true,WeedRightClick)
			if getElementData(element, "growlevel") < 100 then
			local notready = DGS:dgsCreateLabel(0.26,0.78,0.08,0.08,"#FF5050 Not Ready Yet!",true,WeedRightClick)
			exports.under_info:showBox("Not ready Yet, comeback once done, it takes longer.", "info", 5000)
			DGS:dgsSetProperty(notready,"colorcoded",true)
			DGS:dgsSetFont(notready, myText)
	DGS:dgsLabelSetVerticalAlign ( notready, "bottom" )
	DGS:dgsLabelSetHorizontalAlign ( notready, "left" )
			end
			if getElementData(element, "growlevel") >= 100 then
			local ready = DGS:dgsCreateLabel(0.26,0.78,0.08,0.08,"#33cc33 Ready to Cut!",true,WeedRightClick)
			exports.under_info:showBox("Click the pot using the left mouse button to cut cannabis!", "info", 5000)
				DGS:dgsSetProperty(ready,"colorcoded",true)
			DGS:dgsSetFont(ready, myText)
	DGS:dgsLabelSetVerticalAlign ( ready, "bottom" )
	DGS:dgsLabelSetHorizontalAlign ( ready, "left" )
			end
		   -- DGS:dgsSetProperty(WeedButton,"relative",true)
			DGS:dgsSetProperty(TimeGrowLabel,"colorcoded",true)
			DGS:dgsSetProperty(WeedWaterLabel,"colorcoded",true)
			DGS:dgsSetProperty(WeedGrowLabel,"colorcoded",true)
	DGS:dgsSetFont(WeedWaterLabel, myText)
	DGS:dgsLabelSetVerticalAlign ( WeedWaterLabel, "bottom" )
	DGS:dgsLabelSetHorizontalAlign ( WeedWaterLabel, "left" )
	DGS:dgsSetFont(WeedGrowLabel, myText)
	DGS:dgsLabelSetVerticalAlign ( WeedGrowLabel, "bottom" )
	DGS:dgsLabelSetHorizontalAlign ( WeedGrowLabel, "left" )
	DGS:dgsSetFont(TimeGrowLabel, myText)
	DGS:dgsLabelSetVerticalAlign ( TimeGrowLabel, "bottom" )
	DGS:dgsLabelSetHorizontalAlign ( TimeGrowLabel, "left" )
	      GrowLevel = getElementData(element, "growlevel")
	      WaterLevel = getElementData(element, "waterlevel")
	      TimeLeft = getElementData(element, "time")	  
			DGS:dgsSetProperty(WeedProgress,"bgColor",tocolor(0, 0, 0,50))
			DGS:dgsSetProperty(WeedProgress,"indicatorColor",tocolor(0, 107, 254))
			DGS:dgsProgressBarSetProgress(GrowProgress,GrowLevel)
			DGS:dgsSetProperty(TimeProgress,"bgColor",tocolor(0, 0, 0,50))
			DGS:dgsSetProperty(TimeProgress,"indicatorColor",tocolor(255, 191, 0))
			DGS:dgsProgressBarSetProgress(TimeProgress,TimeLeft)
			DGS:dgsSetProperty(GrowProgress,"bgColor",tocolor(0, 0, 0,50))
			DGS:dgsSetProperty(GrowProgress,"indicatorColor",tocolor(102, 255, 51))
			DGS:dgsProgressBarSetProgress(WeedProgress,WaterLevel)
			DGS:dgsSetFont(WeedRightClick, myFont)
		end	
		end
	if element and getElementType( element ) == "object" and button == "left" and state == "down" and getElementModel(element) == 2203 then
    if getElementData(element, "growlevel") == 100 or getElementData(element, "growlevel") > 100 then
	local id = getElementData(element,"id")
	triggerServerEvent("onGrow",localPlayer)
	triggerServerEvent("delpot",localPlayer,element,id)
	exports.under_info:showBox("You've cut the cannabis and got the pot back.","info",5000)
end
end
end
addEventHandler("onClientClick", getRootElement(), clickPot, true)
