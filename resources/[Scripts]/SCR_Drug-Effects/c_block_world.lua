--
-- c_block_world.lua
--

local shaderList = {}
local colorizeOff = false

addEventHandler( "onClientResourceStart", resourceRoot,
	function()

		-- Version check
		if getVersion ().sortable < "1.1.0" then
			outputChatBox( "Resource is not compatible with this client." )
			return
		end

		
	end
)


----------------------------------------------------------------
-- Do change
----------------------------------------------------------------
function colorize()
	colorizeOff = not colorizeOff
	for _,shader in ipairs(shaderList) do
		local r,g,b = 0,0,0
		while r+g+b < 2 do
			r,g,b = math.random(0.25,1.25),math.random(0.25,1.25),math.random(0.25,1.25)
		end
		if colorizeOff then
			r,g,b = 1,1,1
		end
		dxSetShaderValue ( shader, "COLORIZE", r,g,b )
	end
end
function x()
	triggerEvent("drg:enableMeth",localPlayer)
	colorize()
	setTimer(function()
		triggerEvent("drg:disableMeth",localPlayer)
	end,300000,1)
end 

-- bindKey("k", "down", x )
addEvent('drg:meth',true)
addEventHandler('drg:meth',root,x)

addEvent("drg:enableMeth",true)
addEventHandler("drg:enableMeth",root,function()
	colorizeOff = true 
	-- Create shader to test for any errors
	local testShader, tec = dxCreateShader ( "block_world.fx" )

	if not testShader then
		outputChatBox( "Could not create drug shader. Please use debugscript 3 and contact an admin" )
	else
		-- outputChatBox( "Using technique " .. tec )

		-- Create 26 shaders and apply each one to some world textures
		for c=65,96 do
			local clone = dxCreateShader ( "block_world.fx" )
			engineApplyShaderToWorldTexture ( clone, string.format( "%c*", c + 32 )  )
			engineRemoveShaderFromWorldTexture ( clone, "tx*" )	-- Skip doing the grass
			shaderList[#shaderList+1] = clone
		end

		-- Initial colors
		colorize()

		-- outputChatBox( "Press 'k' to colorize" )
	end
	colorize()

end)
addEvent("drg:disableMeth",true)
addEventHandler("drg:disableMeth",root,function()
	colorizeOff = false 
	for k,v in pairs(shaderList) do 
		destroyElement(shaderList[k])
		shaderList[k] = nil 
	end 
	colorize()

end)