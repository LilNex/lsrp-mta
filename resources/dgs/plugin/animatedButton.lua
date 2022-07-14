function dgsCreateanimatingButton(x,y,w,h,text,relative,parent)
    relative = relative and true or false
    local customRenderer = DGS:dgsCreateCustomRenderer([[
        local image = dgsGetProperty(self,"dgsElement")
        local animating = dgsGetProperty(image,"animating")
        local isEntered = dgsGetProperty(image,"isEntered") and 1 or -1
        dxDrawImage(posX,posY,width,height,texture,rotation,rotationCenterOffsetX,rotationCenterOffsetY,color,postGUI)
        local centerX = posX+width/2
        animating = math.max(math.min(animating+isEntered*0.02,1),0) --Canculate animating by "isEntered"
        if anima ~= 0 then
            local animatingX = animating*width/2 --Canculate the position
            dxDrawLine(centerX-animatingX,posY,centerX+animatingX,posY,tocolor(255,255,255,255),2,postGUI)
        end
        dgsSetProperty(image,"animating",animating) --Update animating
    ]])
    local ab = dgsCreateImage(x,y,w,h,customRenderer,false,parent)
    dgsSetProperty(ab,"animating",0)
    dgsSetProperty(ab,"CR",customRenderer) --Reference
    dgsSetProperty(customRenderer,"dgsElement",ab) --Reference
    dgsAttachToAutoDestroy(customRenderer,image) --The custom renderer will be destroyed when the image destroys
    addEventHandler("onDgsMouseEnter",ab,function()
        dgsSetProperty(ab,"isEntered",true)
    end)
    addEventHandler("onDgsMouseLeave",ab,function()
        dgsSetProperty(ab,"isEntered",false)
    end)
    triggerEvent("onDgsPluginCreate",ab,sourceResource)
    return ab
end