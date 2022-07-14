function stopanim(player)
    setPedAnimation(player)
    toggleControl (player,"jump", true)
    toggleControl (player,"sprint", true)
    toggleControl (player,"crouch", true)
end

addEvent("stopanim", true)
addEventHandler("stopanim",root, stopanim)

