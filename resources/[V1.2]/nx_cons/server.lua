ba = exports.bone_attach

function addBottle(plr)
    local x,y,z = getElementPosition(plr)

    local obj =createObject(1544,x,y,z)
    setElementData(obj,"qt",6)
    setElementData(plr,'nx:cons',obj)
    bindKey(plr,"N","down",cons,plr)
    ba:attachElementToBone (obj, plr, 11, -0.3,0.18, 0, 90, 0, 60)

end
addEvent("nx:addBottle",true)
addEventHandler("nx:addBottle",root,addBottle)

function cons(plr)
    -- local x,y,z = getElementPosition(plr)
    -- local obj =createObject(1544,x,y,z)
    local obj = getElementData(plr,'nx:cons')
if obj then
	triggerEvent("addDrunkness",plr,0.1)
    local qt = getElementData(obj,"qt")

    setElementData(obj,'qt',qt-1)
    setPedAnimation(plr,"VENDING","VEND_Drink2_P",2000,false,false)
    -- outputChatBox("qt: "..tostring(qt),plr)
    if qt == 0 then 
        destroyElement(obj)
        setElementData(plr,"nx:cons",nil)
        unbindKey(plr,"N","down",cons)
    end
end
    -- ba:attachElementToBone (obj, plr, 12, 0.1,0.2, 0.15, 30, 240, 60)
    
end
addCommandHandler("cons",cons)