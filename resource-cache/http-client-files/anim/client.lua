local animTable = {

	ifp = {},

	anims = {
		"switch",
		"crswit",
	}

}

addEventHandler("onClientResourceStart", resourceRoot,
	function()

		animTable.ifp["block"] = "weapc"
		animTable.ifp["ifp"] = engineLoadIFP("weapc.ifp", animTable.ifp["block"])

		for _, v in ipairs(animTable.anims) do
			engineReplaceAnimation(localPlayer, "weapc", v, animTable.ifp["block"], v)
		end

	end
)
function isElementMoving (theElement )
	if isElement ( theElement ) then                                   -- First check if the given argument is an element
	   return Vector3( getElementVelocity( theElement ) ).length ~= 0
	end
	return false
 end
function switchAnim(prevID, newID)
if not isElementMoving(localPlayer) then
	setPedAnimation(localPlayer,"WEAPC","switch",1500,false,true,false,false)

	setTimer(function()
		setPedAnimation(localPlayer,false)
	end,1350,1)
end
end

addEventHandler("onClientPlayerWeaponSwitch", localPlayer, switchAnim)

