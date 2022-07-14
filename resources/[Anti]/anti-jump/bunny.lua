local wasSprinting
local function antiBunnyHopping()
    local moveState = getPedMoveState(localPlayer)
    if moveState == "sprint" then
        -- The player is sprinting
        wasSprinting = true
        return
    elseif wasSprinting and moveState == "jump" then
        -- The player was sprinting and now jumps. Don't let him do that by applying an animation
        -- (Delaying the animation a bit seems necessary to achieve the effect we want)
        setTimer(setPedAnimation, 50, 1, localPlayer, "ped", "FALL_collapse", -1, false, true, false, false)
    end
    -- If we get here, the player is not sprinting, so take that into account or the next frame and remove animations if we should
    wasSprinting = nil
end
addEventHandler("onClientPreRender", root, antiBunnyHopping)