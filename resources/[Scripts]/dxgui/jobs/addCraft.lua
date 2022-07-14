local temp = {}

local winAC = Window(0, 0, 800, 600, 'Add Craft')
winAC:on("close",function() showCursor(false) end)
winAC:align('center')
winAC:hide()

local lblJob = Label(16,16,64,24,"ID Job")
lblJob:setParent(winAC)

local txtJob = Input(16,40, 240, 30)
txtJob:setParent(winAC)

local lblName = Label(16,76,92,24,"Craft Name")
lblName:setParent(winAC)

local txtName = Input(16,100, 240, 30)
txtName:setParent(winAC)

local lblType = Label(16,142,92,24,"Craft Type")
lblType:setParent(winAC)

local lstTypes = Gridlist(16,160, 240, 240)
lstTypes:setParent(winAC)
lstTypes:addColumn("ID")
lstTypes:addColumn("Type")
lstTypes:setItemHeight(32)

for k,v in ipairs(exports.jobs:getCraftsType()) do 
    lstTypes:addItem({tostring(k),tostring(v)})
end

local lblNeededID = Label(280,16,96,32,"Needed item ID")
lblNeededID:setParent(winAC)

local txtNeededID = Input(280,40, 240, 30)
txtNeededID:setParent(winAC)

local lblGiveID = Label(280,272,96,32,"Give Item ID")
lblGiveID:setParent(winAC)

local txtGiveID = Input(280,296, 128, 30)
txtGiveID:setParent(winAC)


local lblGiveVal = Label(280,336,96,32,"Give Item Value")
lblGiveVal:setParent(winAC)

local txtGiveVal = Input(280,358, 128, 30)
txtGiveVal:setParent(winAC)



local lblQte = Label(544,16,96,32,"Needed Qantity")
lblQte:setParent(winAC)

local txtQte = Input(544,40, 240, 30)
txtQte:setParent(winAC)

local lstIng = Gridlist(512,160, 240, 240)
lstIng:setParent(winAC)
lstIng:addColumn('ID Item')
lstIng:addColumn('Quantity')


local btnAddItem = Button(655,82,128,48,"Add Ingredients")
btnAddItem:setParent(winAC)


local lblType = Label(512,142,128,32,"Needed Ingredients")
lblType:setParent(winAC)

local btnDelItem = Button(324,150,128,72,"Delete ingredient")
btnDelItem:setParent(winAC)
btnDelItem:on("mousedown",function()
	local index = lstIng:getSelectedItem()
	if index then
			lstIng:removeItem(index)
            table.remove(temp,tonumber(index))
	end

    -- for k,v in ipairs(temp) do 
    --     outputChatBox("k :"..tostring(k))
    --     outputChatBox("v :"..tostring(v))
    -- end 
end)

local img1 = Image(64, 436, 75, 75, ':item-system/images/63.png')
img1:setParent(winAC)

local lblqte1 = Label(92, 516, 72, 32, '50')
lblqte1:setParent(winAC)

local imgP = Image(155, 436, 85, 75, 'img/plus.png')
imgP:setParent(winAC)

local img2 = Image(264, 436, 75, 75, ':item-system/images/63.png')
-- local img2 = Image(64, 436, 75, 75, ':item-system/images/'..tostring(temp[1].NeededID) ..'png')
img2:setParent(winAC)

local lblqte2 = Label(292, 516, 72, 32, '50')
lblqte2:setParent(winAC)

local imgP = Image(337, 436, 85, 75, 'img/plus.png')
imgP:setParent(winAC)

local img3 = Image(438, 436, 75, 75, ':item-system/images/63.png')
-- local img2 = Image(64, 436, 75, 75, ':item-system/images/'..tostring(temp[1].NeededID) ..'png')
img3:setParent(winAC)

local lblqte3 = Label(470, 516, 72, 32, '50')
lblqte3:setParent(winAC)

local imgP = Image(512, 436, 85, 75, 'img/arrow.png')
imgP:setParent(winAC)


local imgF = Image(598, 436, 75, 75, ':item-system/images/63.png')
-- local img2 = Image(64, 436, 75, 75, ':item-system/images/'..tostring(temp[1].NeededID) ..'png')
imgF:setParent(winAC)



local function loadRecipes()
    if temp[1] then 

        img1:load(':item-system/images/'..tostring(temp[1].NeededID) ..'.png')
        lblqte1.value = tostring(temp[1].Qte)
    else 
        img1:unload()
        lblqte1.value = ""
    end 
    if temp[2] then 
        img2:load(':item-system/images/'..tostring(temp[2].NeededID) ..'.png')
        lblqte2.value = tostring(temp[2].Qte)
    else 
        img2:unload()
        lblqte2.value = ""
    end
    if temp[3] then 
        img3:load(':item-system/images/'..tostring(temp[3].NeededID) ..'.png')
        lblqte3.value = tostring(temp[3].Qte)
    else 
        img3:unload()
        lblqte3.value = ""
    end

    -- outputChatBox(toJSON(temp))
end

------------------------------------------------------------HANDLERS ------------------------------------------------------

txtGiveID:on('click',function()
    loadRecipes()
    -- if crafts[id].giveItemID then 
            local index = lstTypes:getSelectedItem()

            if tonumber(index) == 2 then 
                -- outputChatBox("index : "..tostring(index))
                imgF:load(':item-system/images/-'..tostring(txtGiveVal.value) ..'.png')
                -- lblGiveVal.value = tostring(crafts[id].giveItemValue)
            else 
                imgF:load(":item-system/images/"..tostring(txtGiveID.value)..".png")
                -- lblGiveVal.value = tostring(crafts[id].giveItemValue)
            end
    -- end
end)

btnAddItem:on("mouseup",function() 
    outputChatBox("adding ing")
    if not tonumber(txtNeededID.value) then 
        return 

    end
    if not tonumber(txtQte.value) then 
        txtQte.value = 1
    end
    if #temp < 3 then
        t = {}
        t.NeededID = tonumber(txtNeededID.value)
        t.Qte = tonumber(txtQte.value)
        table.insert(temp,t)
        lstIng:addItem({t.NeededID,t.Qte})
        loadRecipes()

    else 
        outputChatBox("You cannot add more than 3 ingredients",230,20,20)
    end


end)

local btnAddCraft = Button(655,512,128,48,"Add Craft")
btnAddCraft:setParent(winAC)
btnAddCraft:on("mouseup",function() 
    if not tonumber(txtNeededID.value) or not tonumber(txtJob.value)  then 
        outputChatBox("return")
        return 

    end

    if not tonumber(txtQte.value) then 
        txtQte.value = 1
    end

    craft = {}
    craft.idJob = tonumber(txtJob.value)
    craft.name = tostring(txtName.value)
    craft.Needs = temp
    craft.giveItemID = tonumber(txtGiveID.value)
    craft.giveItemValue = tonumber(txtGiveVal.value)
    craft.Type = tonumber(lstTypes:getSelectedItem())
    triggerServerEvent("jobs:addCraft",root,craft)

    Alert("Confirm that",function()
    end )

end)

local btnR = Button(16,512,64,48,"Reset")
btnR:setParent(winAC)
btnR:on("mouseup",function() 


end)

winAC:hide()

addEvent("crafts:addOpenGUI",true)
addEventHandler("crafts:addOpenGUI",root,function(crafts)
    -- g = crafts
    -- outputChatBox("c : "..#crafts)
    -- for k,v in pairs(crafts) do 
    --     lstTypes:addItem({tostring(v.id),tostring(v.name)})
    --     outputChatBox("od : "..v.id)
    --     -- outputChatBox('yy '..tostring(toJSON(v)))

    -- end
    -- lstTypes:on("mouseup",function()
    --     local index = lstTypes:getSelectedItem()
    --     -- outputChatBox("ind ! "..index)
    --     local i = lstTypes:getItemValue(index,1)
    --     -- outputChatBox("i : "..toJSON(i))

    --     local id = tonumber(i.value)

    --     if crafts[id].Needs[1] then 
    --         img1:load(':item-system/images/'..tostring(crafts[id].Needs[1].NeededID) ..'.png')
    --         lblqte1.value = tostring(crafts[id].Needs[1].Qte)
    --     else 
    --         img1:unload()
    --         lblqte1.value = ""
    --     end
    --     if crafts[id].Needs[2] then 
    --         img2:load(':item-system/images/'..tostring(crafts[id].Needs[2].NeededID) ..'.png')
    --         lblqte2.value = tostring(crafts[id].Needs[2].Qte)
    --     else 
    --         img2:unload()
    --         lblqte2.value = ""
    --     end
    --     if crafts[id].Needs[3] then 
    --         img3:load(':item-system/images/'..tostring(crafts[id].Needs[3].NeededID) ..'.png')
    --         lblqte3.value = tostring(crafts[id].Needs[3].Qte)
    --     else 
    --         img3:unload()
    --         lblqte3.value = ""
    --     end
    --     if crafts[id].giveItemID then 
    --         imgF:load(':item-system/images/'..tostring(crafts[id].giveItemID) ..'.png')
    --         lblGiveVal.value = tostring(crafts[id].giveItemValue)
    --     end
 
    --     lstIng:clear()
    --     -- lstIng:addItem({"crafts[id].Needs[k].NeededId", "crafts[id].Needs[k].Qte"})

    --     outputChatBox(toJSON(crafts[id].Needs))
    --     for k,v in pairs(crafts[id].Needs) do 
    --         lstIng:addItem({exports["item-system"]:getItemName(crafts[id].Needs[k].NeededID), crafts[id].Needs[k].Qte})
    --     end


    -- end )
    winAC:show()
end)

-- addCommandHandler("addcraft",function()
--     triggerEvent("crafts:addOpenGUI",root)
-- end)