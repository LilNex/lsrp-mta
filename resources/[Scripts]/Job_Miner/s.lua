local iMoney = 75;



function DeleteBox( pElement )

	local pObject 		= getElementData( pElement, "Job.Porter.Box" );

		

	if pObject and isElement( pObject ) then

		destroyElement( pObject );

		

		setElementData( pElement, "Job.Porter.Box", nil );

		

		toggleControl( pElement, "jump", true );

		toggleControl( pElement, "fire", true );

	end

end



addEventHandler( "onPlayerQuit", root,

	function()

		DeleteBox( source );

	end

);



addEventHandler( "onResourceStart", resourceRoot,

	function()

		--loadMapFile( "sfj.map" );

		

		

		setElementFrozen( pVehicleJob, true );

		setVehicleDamageProof( pVehicleJob, true );

		local pPickupStartJob = createPickup( 1268.60546875, -1271.7626953125, 13.54647731781, 3, 1275, 1, 1 );

		

		addEventHandler( "onPickupHit", pPickupStartJob,

			function( pPlayer )

				local Data = fromJSON( getAccountData( getPlayerAccount( pPlayer ), "Job.Porter" ) );

				

				if not Data or Data.bState == false then

					setAccountData( getPlayerAccount( pPlayer ), "Job.Porter", toJSON( { skin = getElementModel( pPlayer ), bState = true } ) );

					setElementModel( pPlayer, 260 );

					

					outputChatBox( "You Have Take The Job !", pPlayer, 255, 255, 0 );

				elseif Data and Data.bState == true then

					if getElementData( pPlayer, "Job.Porter.Box" ) then

						outputChatBox( "يجب عليك ان تكمل العمل", pPlayer, 255, 255, 0 );

						return;

					end

				

					local iSkinID = Data.skin;

					

					setElementModel( pPlayer, iSkinID );

					

					setAccountData( getPlayerAccount( pPlayer ), "Job.Porter", toJSON( { skin = nil, bState = false } ) );

					

					outputChatBox( "لقد تركت الوظيفة", pPlayer, 255, 255, 0 );

				end

			end

		);

		--начинает действие

		local pMarkerGetBox = createMarker( 1228.0556640625, -1244.0068359375, 18.440258026123, "cylinder", 1.5, 255, 0, 0 );

		local fX, fY, fZ = getElementPosition( pMarkerGetBox ); 

		local pColShapeGetBox = createColSphere( fX, fY, fZ, 2 );

		

		addEventHandler( "onColShapeHit", pColShapeGetBox,

			function( pElement )

				local pObject = getElementData( pElement, "Job.Porter.Box" );

				if getElementType( pElement ) == "player" and ( not pObject or not isElement( pObject ) ) then

					local Data = fromJSON( getAccountData( getPlayerAccount( pElement ), "Job.Porter" ) );

					

					if Data and Data.bState == true then

						

					--2969

						

						setElementFrozen(pElement, true)

						

						setPedAnimation( pElement, "CARRY", "liftup", 1.0, false );

						

						setTimer( 

							function( pElement, pColShape )

								setPedAnimation( pElement, nil );

								setPedAnimation( pElement, "CARRY", "crry_prtial", 4.1, true, true, true );

								setElementFrozen(pElement, false)

								

								local fX, fY, fZ = getElementPosition( pColShape );

								local pObject = createObject( 905, fX, fY, fZ );

						

								exports.bone_attach:attachElementToBone( pObject, pElement, 4, 0, 0.4, - 0.6, -90, 0, 0 );

								

								setElementData( pElement, "Job.Porter.Box", pObject );

								

								toggleControl( pElement, "jump", false );

								toggleControl( pElement, "fire", false );

							end,

						1000,

						1, pElement, source );

						

						

					end

				end

			end

		);

		--заканчивает действие

		local pMarkerDropBox = createMarker( 1275.9599609375, -1265.5927734375, 12.530091285706, "cylinder", 1.5, 255, 255, 255 );



		local fX, fY, fZ = getElementPosition( pMarkerDropBox ); 

		local pColShapeDropBox = createColSphere( fX, fY, fZ, 2 );



		

		addEventHandler( "onColShapeHit", pColShapeDropBox,

			function( pElement )

				if getElementType( pElement ) == "player" and getElementData( pElement, "Job.Porter.Box" ) then

					setElementFrozen(pElement, true)



					setPedAnimation( pElement, "CARRY", "putdwn", 1.0, false, false, false, true );

					

					setTimer( 

						function( pElement )

							setElementFrozen(pElement, false)
						 	iMoney = 75;



							DeleteBox( pElement );
							if exports.nx_vip:isPlayerVip(thePlayer) == 3 then
								iMoney = iMoney +(75 * iMoney) / 100
							 end

							

							exports.global:giveMoney( pElement, iMoney );

							

							setPedAnimation( pElement, "CARRY", "liftup", 0.0, false, false, false, false );

						end,

					1200,

					1, pElement );

				end

			end

		);

		

		addEventHandler( "onPlayerWasted", root,

			function()

				DeleteBox( source );

			end

		);

	end

);