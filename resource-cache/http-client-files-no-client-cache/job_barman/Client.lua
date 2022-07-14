

function enterVehicle ( player, seat, jacked )
if player == localPlayer then 
   local id = getElementModel ( source )
	if id == 500 then 
	if seat == 0 then 
		if getElementData(player, "job") ~= 11 then  
			--cancelEvent()
			setVehicleLocked ( source, true )			
			exports["KSA-Notifications"]:show_box("هذه السيارة فقط للوظائف الحكومية")
		else 
		setVehicleLocked ( source, false ) 
				

			end 
		end 
end
end
end
addEventHandler ( "onClientVehicleStartEnter", getRootElement(), enterVehicle )

