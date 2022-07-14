
local temp = {}
local g = {}
local win = Window(0, 0, 800, 600, 'Craft')
win:on("close",function()
    setElementFrozen(localPlayer,false)
    showCursor(false) end)
win:align('center')


-- local lblJob = Label(16,16,64,24,"ID Job")
-- lblJob:setParent(win)

-- local txtJob = Input(16,40, 240, 30)
-- txtJob:setParent(win)

-- local lblName = Label(16,76,92,24,"Craft Name")
-- lblName:setParent(win)

-- local txtName = Input(16,100, 240, 30)
-- txtName:setParent(win)

local lblType = Label(16,142,92,24,"Crafts")
lblType:setParent(win)

local lstTypes = Gridlist(16,160, 240, 240)
lstTypes:setParent(win)
lstTypes:addColumn("ID")
lstTypes:addColumn("Name")
lstTypes:setItemHeight(32)

-- for k,v in ipairs(exports.jobs:getCraftsByIDJob(1)) do 
--     lstTypes:addItem({tostring(k),tostring(v)})
-- end

-- local lblNeededID = Label(280,16,96,32,"Needed item ID")
-- lblNeededID:setParent(win)

-- local txtNeededID = Input(280,40, 240, 30)
-- txtNeededID:setParent(win)

-- local lblGiveID = Label(280,272,96,32,"Give Item ID")
-- lblGiveID:setParent(win)

-- local txtGiveID = Input(280,296, 128, 30)
-- txtGiveID:setParent(win)


local lblGiveVal = Label(632, 516, 72, 32,"")
lblGiveVal:setParent(win)

-- local txtGiveVal = Input(280,358, 128, 30)
-- txtGiveVal:setParent(win)



-- local lblQte = Label(544,16,96,32,"Needed Qantity")
-- lblQte:setParent(win)

-- local txtQte = Input(544,40, 240, 30)
-- txtQte:setParent(win)

local lstIng = Gridlist(512,160, 240, 240)
lstIng:setParent(win)
lstIng:addColumn("Item's name")
lstIng:addColumn('Quantity')


-- local btnAddItem = Button(655,82,128,48,"Add Ingredients")
-- btnAddItem:setParent(win)
-- btnAddItem:on("mouseup",function() 
--     if not tonumber(txtNeededID.value) then 
--         return 

--     end
--     if not tonumber(txtQte.value) then 
--         txtQte.value = 1
--     end
--     if #temp < 3 then
--         t = {}
--         t.NeededID = tonumber(txtNeededID.value)
--         t.Qte = tonumber(txtQte.value)
--         table.insert(temp,t)
--         lstIng:addItem({t.NeededID,t.Qte})
--     else 
--         outputChatBox("You cannot add more than 3 ingredients",230,20,20)
--     end
--     loadRecipes()


-- end)

local lblType = Label(512,142,128,32,"Needed Ingredients")
lblType:setParent(win)

-- local btnDelItem = Button(324,150,128,72,"Delete ingredient")
-- btnDelItem:setParent(win)
-- btnDelItem:on("mousedown",function()
-- 	local index = lstIng:getSelectedItem()
-- 	if index then
-- 			lstIng:removeItem(index)
--             table.remove(temp,tonumber(index))
-- 	end

--     for k,v in ipairs(temp) do 
--         outputChatBox("k :"..tostring(k))
--         outputChatBox("v :"..tostring(v))
--     end 
-- end)

local img1 = Image(64, 436, 75, 75, ':item-system/images/63.png')
img1:unload()
img1:setParent(win)

local lblqte1 = Label(92, 516, 72, 32, '50')
lblqte1.value = ""
lblqte1:setParent(win)

local imgP = Image(155, 436, 85, 75, 'img/plus.png')
imgP:setParent(win)

local img2 = Image(264, 436, 75, 75, ':item-system/images/63.png')
img2:unload()
-- local img2 = Image(64, 436, 75, 75, ':item-system/images/'..tostring(temp[1].NeededID) ..'png')
img2:setParent(win)

local lblqte2 = Label(292, 516, 72, 32, '50')
lblqte2.value = ""
lblqte2:setParent(win)

local imgP = Image(337, 436, 85, 75, 'img/plus.png')
imgP:setParent(win)

local img3 = Image(438, 436, 75, 75, ':item-system/images/63.png')
img3:unload()
-- local img2 = Image(64, 436, 75, 75, ':item-system/images/'..tostring(temp[1].NeededID) ..'png')
img3:setParent(win)

local lblqte3 = Label(470, 516, 72, 32, '50')
lblqte3.value = ""
lblqte3:setParent(win)

local imgP = Image(512, 436, 85, 75, 'img/arrow.png')
imgP:setParent(win)


local imgF = Image(598, 436, 75, 75, ':item-system/images/63.png')
imgF:unload()
-- local img2 = Image(64, 436, 75, 75, ':item-system/images/'..tostring(temp[1].NeededID) ..'png')
imgF:setParent(win)

-- txtGiveID:on('click',function()
--     loadRecipes()
--     imgF:load(":item-system/images/"..tostring(txtGiveID.value)..".png")
-- end)

-- local function loadRecipes()
--     if temp[1] then 
--         img1:load(':item-system/images/'..tostring(temp[1].NeededID) ..'.png')
--         lblqte1.value = tostring(temp[1].Qte)
--     end 
--     if temp[2] then 
--         img2:load(':item-system/images/'..tostring(temp[2].NeededID) ..'.png')
--         lblqte2.value = tostring(temp[2].Qte)
--     end 
--     if temp[3] then 
--         img3:load(':item-system/images/'..tostring(temp[3].NeededID) ..'.png')
--         lblqte3.value = tostring(temp[3].Qte)
--     end 

--     outputChatBox(toJSON(temp))
-- end

local btnAddCraft = Button(655,512,128,48,"Craft")
btnAddCraft:setParent(win)
btnAddCraft:on("mouseup",function() 
    local index = lstTypes:getSelectedItem()
    local i = lstTypes:getItemValue(index,1)
    local id = tonumber(i.value)
    -- outputChatBox("craft start")
    -- outputChatBox("craft selected : "..tostring(g[id].Needs[1].NeededID))
    Alert("Confirm that",function()
        triggerServerEvent("crafts:craftItem",localPlayer,g[id])
    end )

end)

-- local btnR = Button(16,512,64,48,"Reset")
-- btnR:setParent(win)
-- btnR:on("mouseup",function() 


-- end)

win:hide()

-- outputChatBox("test")

addEvent("crafts:openGUI",true)
addEventHandler("crafts:openGUI",root,function(crafts)
    setElementFrozen(localPlayer,true)
    g = crafts
    -- outputChatBox("c : "..#crafts)
    lstTypes:clear()
    for k,v in pairs(crafts) do 
        lstTypes:addItem({tostring(v.id),tostring(v.name)})
        -- outputChatBox("od : "..v.id)
        -- outputChatBox('yy '..tostring(toJSON(v)))

    end
    lstTypes:on("mouseup",function()
        local index = lstTypes:getSelectedItem()
        -- outputChatBox("ind ! "..index)
        local i = lstTypes:getItemValue(index,1)
        -- outputChatBox("i : "..toJSON(i))

        local id = tonumber(i.value)

        lstIng:clear()
        -- lstIng:addItem({"crafts[id].Needs[k].NeededId", "crafts[id].Needs[k].Qte"})

        -- outputChatBox(toJSON(crafts[id].Needs))
        for k,v in pairs(crafts[id].Needs) do 
            lstIng:addItem({exports["item-system"]:getItemName(crafts[id].Needs[k].NeededID), crafts[id].Needs[k].Qte})
        end


        if crafts[id].Needs[1] then 
            img1:load(':item-system/images/'..tostring(crafts[id].Needs[1].NeededID) ..'.png')
            lblqte1.value = tostring(crafts[id].Needs[1].Qte)
        else 
            img1:unload()
            lblqte1.value = ""
        end
        if crafts[id].Needs[2] then 
            img2:load(':item-system/images/'..tostring(crafts[id].Needs[2].NeededID) ..'.png')
            lblqte2.value = tostring(crafts[id].Needs[2].Qte)
        else 
            img2:unload()
            lblqte2.value = ""
        end
        if crafts[id].Needs[3] then 
            img3:load(':item-system/images/'..tostring(crafts[id].Needs[3].NeededID) ..'.png')
            lblqte3.value = tostring(crafts[id].Needs[3].Qte)
        else 
            img3:unload()
            lblqte3.value = ""
        end
        if crafts[id].giveItemID then 
            if crafts[id].type == 2 then 
                imgF:load(':item-system/images/-'..tostring(crafts[id].giveItemValue) ..'.png')
                lblGiveVal.value = tostring(crafts[id].giveItemValue)
            else 
                imgF:load(':item-system/images/'..tostring(crafts[id].giveItemID) ..'.png')
                lblGiveVal.value = tostring(crafts[id].giveItemValue)
            end
        end
 
        


    end )
    win:show()
end)

-- addCommandHandler("opencraft",function()
--     triggerEvent("crafts:openGUI",root)
--     -- win:show()
-- end)