----------------------------------
--MADE BY: S1lvador
--RE-DISTRIBUTE IS NOT ALLOWED
----------------------------------



local screen = dxCreateScreenSource ( 340, 380 );
local sWidth,sHeight = guiGetScreenSize()


function daPic()
    dxUpdateScreenSource(screen);
    
    addEventHandler("onClientRender", root, showSpeedPic)
    
    setTimer(removeDaAnnoyingThingy, 5500, 1);
end

addEvent("showPicture", true)
addEventHandler("showPicture", getLocalPlayer(), daPic)

function showSpeedPic()
	       
    -- exports.global:takeMoney(source, 75)
    rect =  dxDrawRectangle(20.0,209.0,295.0,255.0,tocolor(0,0,0,140),false)
    dxDrawImage( 28.0,217.0,279.0,238.0, screen)
end

function removeDaAnnoyingThingy()
    removeEventHandler("onClientRender", root, showSpeedPic)
end