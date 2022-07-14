
addEvent("LSRP_Wis", true) 
addEventHandler("LSRP_Wis", root, 
    function(cx, cy, cz)
        local sound = playSound3D('sfx/whistling.mp3', cx, cy, cz) 
        setSoundMaxDistance(sound, 95) 
        setSoundSpeed(sound, 1.4) 
    end 
)