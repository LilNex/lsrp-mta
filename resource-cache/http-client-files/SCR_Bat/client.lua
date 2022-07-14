players = {}
canHit = false
once = true
handler = false
bind = false
function bbat_hit()
x1, y1, z1 = getElementPosition (localPlayer)
if getPedOccupiedVehicle (localPlayer)~= false then 
if getVehicleType(getPedOccupiedVehicle(localPlayer))== "Bike" then
if getPedWeapon(localPlayer)==5 or getPedWeapon(localPlayer)==6 or getPedWeapon(localPlayer)==3 or getPedWeapon(localPlayer)==2 or getPedWeapon(localPlayer)==7 then
if bind == false then
 bindKey ( "mouse1", "down", bbat_anim )
bind = true
end
 else
 unbindKey ("mouse1", "down", bbat_anim )
 bind = false
end
else
unbindKey ("mouse1", "down", bbat_anim )
 bind = false
end
else
unbindKey ("mouse1", "down", bbat_anim )
 bind = false
end
if getPedOccupiedVehicle (localPlayer)== false then
end 
end
addEventHandler("onClientRender", root, bbat_hit)  

function set_slot()
if getPedOccupiedVehicle (localPlayer)~= false then 
if getVehicleType(getPedOccupiedVehicle(localPlayer))== "Bike" then
if handler == false then
addEventHandler("onClientKey", root, changeWeap1)
handler = true
end
end
else
removeEventHandler("onClientKey", root, changeWeap1)
handler = false
end
end
addEventHandler("onClientRender", root, set_slot)  

function changeWeap1(button,press)
if press then
if getPedWeaponSlot( localPlayer)== 0 then
if getPedWeapon(localPlayer,1)==5 or getPedWeapon(localPlayer,1)==6 or getPedWeapon(localPlayer,1)==3 or getPedWeapon(localPlayer,1)==2 or getPedWeapon(localPlayer,1)==7 then
if button == "mouse_wheel_up" then
setPedWeaponSlot( localPlayer, 1 )
end
end
if getPedWeapon(localPlayer,4)==28 or getPedWeapon(localPlayer,4)==29 or getPedWeapon(localPlayer,4)==32 then
if button == "mouse_wheel_down" then
setPedWeaponSlot( localPlayer, 4 )
end
end
elseif getPedWeaponSlot( localPlayer)== 1 then
if getPedWeapon(localPlayer,4)==28 or getPedWeapon(localPlayer,4)==29 or getPedWeapon(localPlayer,4)==32 then
if (button) == "mouse_wheel_up" then
setPedWeaponSlot( localPlayer, 4 )
end
else
end

if (button) == "mouse_wheel_down" then
setPedWeaponSlot( localPlayer, 0 )
end
elseif getPedWeaponSlot( localPlayer)== 4 then
if getPedWeapon(localPlayer,1)==5 or getPedWeapon(localPlayer,1)==6 or getPedWeapon(localPlayer,1)==3 or getPedWeapon(localPlayer,1)==2 or getPedWeapon(localPlayer,1)==7 then
if (button) == "mouse_wheel_down" then
setPedWeaponSlot( localPlayer, 1 )
end
else

end
if (button) == "mouse_wheel_up" then
setPedWeaponSlot( localPlayer, 0 )
end

else
if (button) == "mouse_wheel_down" or (button) == "mouse_wheel_up" then
setPedWeaponSlot( localPlayer, 0)
end
end

end
end
function bbat_anim()
block, animation = getPedAnimation(localPlayer)
if not block and not animation and canHit == false then
triggerServerEvent("bbatAnim", resourceRoot, localPlayer)
canHit = true
setTimer ( canHitfalse, 100, 1)
createLine() 
end
end

function canHitfalse() 
canHit = false
end
function createLine() 

players = nil
players = getElementsByType( "ped" )
for i,thePlayer in ipairs(players) do
x2, y2, z2 = getElementPosition (thePlayer)
playerRotX,playerRotY,playerRotZ = getElementRotation(localPlayer)

--dxDrawLine3D(x1,y1,z1,x2,y2,z2)
if getPedOccupiedVehicle (thePlayer)== false then 
if getDistanceBetweenPoints3D(x1,y1,z1,x2,y2,z2) < 2 then
if canHit == true then
if x1>x2 and y1>y2 then
triggerServerEvent("bbatHitting", resourceRoot, thePlayer,localPlayer,315)
end
if x1<x2 and y1>y2 then
triggerServerEvent("bbatHitting", resourceRoot, thePlayer,localPlayer,45)
end
if x1<x2 and y1<y2 then
triggerServerEvent("bbatHitting", resourceRoot, thePlayer,localPlayer,135)
end
if x1>x2 and y1<y2 then
triggerServerEvent("bbatHitting", resourceRoot, thePlayer,localPlayer,225)
end
end
end
end
end
end
