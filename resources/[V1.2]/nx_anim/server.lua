
addEvent("nxAnim",true)
addEventHandler("nxAnim",root,function(anim1,anim2)
    setPedAnimation(source,anim1,anim2)
end)
addEvent("sAnim",true)
addEventHandler("sAnim",root,function()
    setPedAnimation(source,false)
end)