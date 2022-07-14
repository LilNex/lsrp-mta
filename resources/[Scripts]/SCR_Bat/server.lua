players = {}
players2 = {}
function bbatAnimHandler (player)
setPedAnimation( player, "BASEBALL", "BAT_PART",-1,false,false,true,false)
end
addEvent( "bbatAnim", true )
addEventHandler( "bbatAnim", resourceRoot, bbatAnimHandler)		

	
function bbatHitHandler (hitPlayer,player,playerRotZ)
speedx, speedy, speedz = getElementVelocity ( getPedOccupiedVehicle(player) )
actualspeed = ((speedx^2 + speedy^2 + speedz^2)^(0.5) )*180
setElementRotation ( hitPlayer, 0 , 0, playerRotZ,"default",true)
setPedAnimation( hitPlayer, "BASEBALL", "Bat_Hit_3",-1,false,true,true,false)
if actualspeed < 30 then 
hit = 10
else
hit = math.floor(actualspeed/3)
end
if ( hit > getElementHealth ( hitPlayer ) ) then setTimer ( killPed, 50, 1, hitPlayer )
else setElementHealth ( hitPlayer, getElementHealth ( hitPlayer ) - hit )
end
end

addEvent( "bbatHitting", true )
addEventHandler( "bbatHitting", resourceRoot, bbatHitHandler)
