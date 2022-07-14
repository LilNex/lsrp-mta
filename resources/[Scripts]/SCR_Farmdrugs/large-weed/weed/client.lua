weedID = 826 -- object id for weed
weedGrowTime = 300000 -- milliseconds
weedHealthAmount = 10 -- health amount if smoking the weed
weedCash = 10 -- cash if selling the weed
seedCash = 8 -- weed seed price
weedArea = createRadarArea(-50.442802,-108.432037,130.955353,134.419464,0,153,0,50) -- weed planting area
weeds = { } -- weed objects table
weedReady = { } -- weed ready table
weedCol = { } -- weed collision circles table
weedPlants = "" -- players weed slots which contain weed (dont edit this!)
playerWeed = 0 -- player's weed at start
playerSeeds = 1 -- player's weed seeds at start
-- These are not relevant settings, but the default ones. There is the function which calls the server for the right settings.

addEvent("weed.onSend",true)
addEventHandler("weed.onSend",getRootElement(),function(a,b,c,d,e,f,g) if type(a) == "number" then weedID = a end if type(b) == "number" then weedGrowTime = b end if type(c) == "number" then weedHealthAmount = c end if type(d) == "number" then weedCash = d end if type(e) == "number" then seedCash = e end if type(f) == "number" then playerSeeds = f end if type(g) == "number" then playerWeed = g end addCommandHandler("weed",weedCommands) end)
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),function() triggerServerEvent("weed.onRequest",localPlayer) end)
function weedCommands(cmd,subcmd,id)
    if not id and subcmd ~= "plants" then outputChatBox("Please specify a slot, or specify amount of weed!",255,0,0) return end
    if subcmd == "plant" then
        if not weeds[id] then
            local x,y,z = getElementPosition(localPlayer)
            if isInsideRadarArea(weedArea,x,y) and isPedOnGround(localPlayer) and not isPedInVehicle(localPlayer) then
                if playerSeeds < 1 then outputChatBox("Not enough seeds!",255,0,0) return end
                weeds[id] = createObject(weedID,x,y,z-2)
                weedPlants = weedPlants..id..", "
                weedCol[id] = createColCircle(x,y,10)
                playerSeeds = playerSeeds - 1
                moveObject(weeds[id],weedGrowTime,x,y,z,0,0,0,"InOutQuad")
                setTimer(function(idd)weedReady[idd] = true end,weedGrowTime,1,id)
                outputChatBox("Successful plant! Wait till its ready for harvesting. Your seeds: "..playerSeeds,0,255,0)
            else
                outputChatBox("Please go in the planting area, exit your vehicle and stay on the ground to plant.",255,0,0)
            end
        else
            outputChatBox("This weed slot is alerady in use! Choose another slot!",255,0,0)
        end
    elseif subcmd == "harvest" then
        if weeds[id] then
            local x,y,z = getElementPosition(localPlayer)
            local x2,y2,z2 = getElementPosition(weeds[id])
            if isElementWithinColShape(localPlayer,weedCol[id]) and weedReady[id] then
                destroyElement(weedCol[id])
                destroyElement(weeds[id])
                weedReady[id] = nil
                weeds[id] = nil
                weedCol[id] = nil
                weedPlants = weedPlants:gsub(id..", ","")
                playerWeed = playerWeed + 1
                outputChatBox("Successful harvest! Your have "..playerWeed.." grams of weed.",0,255,0)
            else
                outputChatBox("Wait till the weed is ready for harvesting, and stay close to it!",255,0,0)
            end
        else
            outputChatBox("No weed in this slot!",255,0,0)
        end
    elseif subcmd == "highlight" then
        if weeds[id] then
            local x,y,z = getElementPosition(weeds[id])
            local blip = createBlip(x,y,z,41,1,0,153,0,153)
            setTimer(destroyElement,10000,1,blip)
        end
    elseif subcmd == "plants" then
        if weedPlants == "" or weedPlants == " " then 
            outputChatBox("You have no plants.",0,255,0)
            weedPlants = ""
        else
            outputChatBox("Your weed plants' slots: " ..weedPlants,0,255,0)
        end
    elseif subcmd == "sell" then
        id = tonumber(id)
        if id <= playerWeed then
            playerWeed = playerWeed - id
            outputChatBox("You sold "..id.. " grams of weed. You now have "..playerWeed.." grams.",0,255,0)
            givePlayerMoney(id*weedCash)
        else
            outputChatBox("Not enough weed!",255,0,0)
        end
    elseif subcmd == "buy" then
        id = tonumber(id)
        if id*8 <= getPlayerMoney() then
            playerSeeds = playerSeeds + id
            outputChatBox("You bought "..id.." seeds. You now have "..playerSeeds..".",0,255,0)
            takePlayerMoney(id*seedCash)
        else
            outputChatBox("Not enough money!",255,0,0)
        end
    elseif subcmd == "smoke" then
        id = tonumber(id)
        if id <= playerWeed then
            setElementHealth(localPlayer,getElementHealth(localPlayer)+10*id)
            playerWeed = playerWeed - id
            outputChatBox("You smoked "..id.." grams of weed. Your health has been refilled. You have "..playerWeed.." grams of weed.",0,255,0)
        else
            outputChatBox("Not enough weed!")
        end
    end
end