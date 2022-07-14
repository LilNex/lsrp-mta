-->>SCRIPT BY JIMMY<<<

createBlip(1266.359375, -1256.0579833984, 17.789999008179, 11, 2, 255, 0, 0, 255, 0, 300)

local aInfos =
{
	-- x, y, z, text, [ color (формат rgba), distance, scale, font ] -- [ ] - необязательно
	{ vecPos = { -2182, -223, 36  }, sText = "Job: Carregador", iColor = tocolor( 255, 255, 255, 255 ), fDistance = 45, fScale = 1.02, sFont = "default" };
	
};

function Render()
	for _, Data in pairs( aInfos ) do
		local fPosX, fPosY, fPosZ		= getElementPosition( localPlayer );
		local fDataX, fDataY, fDataZ 	= unpack( Data.vecPos );
		local fDistanceBetweenPoints	= getDistanceBetweenPoints3D ( fPosX, fPosY, fPosZ,fDataX, fDataY, fDataZ );
		local fInputDistance			= Data.fDistance or 45;
		if fDistanceBetweenPoints < fInputDistance then
			local fCameraX, fCameraY, fCameraZ 	= getCameraMatrix();
			local fWorldPosX, fWorldPosY 		= getScreenFromWorldPosition( fDataX, fDataY, fDataZ + 1, fInputDistance );
			local bHit  						= processLineOfSight( fCameraX, fCameraY, fCameraZ, fDataX, fDataY, fDataZ, true, false, false, true, false, false, false, false );
			if not bHit then
				if fWorldPosX and fWorldPosY then
					dxDrawText( 
						Data.sText,
						fWorldPosX,
						fWorldPosY,
						fWorldPosX,
						fWorldPosY,
						Data.iColor,
						Data.fScale,
						Data.sFont
					);
				end	
			end	
		end
	end
end
addEventHandler( "onClientRender", root, Render );