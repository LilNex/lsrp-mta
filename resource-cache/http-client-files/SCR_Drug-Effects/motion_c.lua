local w, h = guiGetScreenSize( );
local x1, y1, z1 = getCameraMatrix()
local sx1, sy1 = getScreenFromWorldPosition(x1, y1, z1)
local enable = false;
local lvlshake = 0
local Gmultiplier = 0
local sCam = 0
function findRotation(x1,y1,x2,y2)
 
  local t = -math.deg(math.atan2(x2-x1,y2-y1))
  if t < 0 then t = t + 360 end;
  return t;
 
end

function renderEffect( )	
	local x2, y2, z2 = getCameraMatrix()
	
	local d = getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2);
	
	sx2, sy2 = w/2, h/2
	
	local dx = x1 - x2
	local dy = y1 - y2
	local dz = z1 - z2
	
	if getPedOccupiedVehicle(getLocalPlayer()) then
		multiplier = Gmultiplier * 1
	else
		multiplier = Gmultiplier * 1.0056
	end
	
	dxSetShaderValue( screenShader, "BlurAmount", d*multiplier );
	dxSetShaderValue( screenShader, "Angle", findRotation(dx, dx, dx, dz)) -- Fail code, but gives a nice effect
	
	dxSetRenderTarget();
	dxUpdateScreenSource( screenSrc );
	dxDrawImage( 0, 0, w, h, screenShader );
	
	x1, y1, z1 =  getCameraMatrix()
end
		
function enableBlackWhite( )
	-- lvlshake = lvlshake +5
	enable =  true;
	if enable then
		
		screenShader = dxCreateShader( "motion.fx" );

		screenSrc = dxCreateScreenSource( w, h );
		if screenShader and screenSrc then

			lvlshake = getElementData(source, "alcohollevel")
			-- outputChatBox("al level "..tostring(lvlshake))

			dxSetShaderValue( screenShader, "ScreenTexture", screenSrc );
			-- lvlshake = lvlshake + 30
			setCameraShakeLevel( lvlshake /0.02 )
			addEventHandler( "onClientHUDRender", getRootElement( ), renderEffect );
			enable = false

		end
	-- setTimer ( function()
	
	-- removeEventHandler( "onClientHUDRender", getRootElement( ), renderEffect );
	-- end, 5000, 1 )
	
	end
end


--ALCOHOL EFFECT
setTimer ( function()
	if enable then

	lvlshake = getElementData(localPlayer, "alcohollevel") 
 	 if lvlshake > 0 then
		sCam = lvlshake / 0.02
		-- outputChatBox("sCam : "..tostring(sCam),localPlayer)
		Gmultiplier = lvlshake / 1000
		setCameraShakeLevel( sCam )
		triggerServerEvent("stableDrunk",localPlayer)
		triggerEvent("enableBloom", localPlayer)

	if sCam <= 7 and sCam ~= 0 then

		destroyElement( screenShader );
		destroyElement( screenSrc );

		sCam = 0
		setCameraShakeLevel( 1 )
		enable = false
		triggerEvent("disableBloom", localPlayer)

		screenShader, screenSrc = nil, nil;
		removeEventHandler( "onClientHUDRender", getRootElement( ), renderEffect );

	end
  end
end
	end, 40000, 0 )
addEvent("drogue")
-- addEvent("drogue"),enableBlackWhite)
bindKey("N","down",function()
end)

addEvent("alcoholEffect")
addEventHandler("alcoholEffect", localPlayer, enableBlackWhite)
addEventHandler("alcoholEffect", localPlayer, function()
enable = true
end)
addEvent("effetAccident",true)
-- addEventHandler("effetAccident",localPlayer,
-- bindKey("N","down",

-- function()

-- 	triggerEvent("enableBloom",localPlayer)
-- end)