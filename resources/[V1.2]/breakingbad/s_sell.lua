local x,y,z = 2604.236328125, -1348.9228515625, 35.691131591797
-- local rx,ry,rz = 0,0,188

createPed(200,x,y,z,188)
mrk =  createMarker(x,y-1,z-0.75,"cylinder",1)

function calculPrice(quality)
    return (quality *4000) / 100

end 

addEventHandler("onMarkerHit",mrk,function(hitE)
    local inv = exports['item-system']:getItems(hitE)
    for k, v in pairs(inv) do
        if v[1] == 555 then 
            outputChatBox("1 Meth ("..tostring(v[2]).."%) | Price : "..tostring(calculPrice(v[2])),hitE,100,100,100)
        end
    end 
    outputChatBox("Type /sellmeth to sell all what you have on you.")


end )
addCommandHandler("sellmeth",function(plr,cmd)
    if isElementWithinMarker(plr,mrk) then 
        local inv = exports['item-system']:getItems(plr)
        for k, v in pairs(inv) do
            if v[1] == 555 then 
                exports.global:giveDirtyMoney(plr,calculPrice(v[2]))
                exports.global:takeItem(plr,v[1],v[2])


            end
        end 
    end

end)