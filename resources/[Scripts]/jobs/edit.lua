--------------------------------------------------
--------------------------------------------------
--												--
--				Script By : Acenox				--
--		 https://discord.gg/Q5qktjYDZb			--
--												--
--------------------------------------------------
--------------------------------------------------

Take_Time = 20000 

Plant_Time1 = 10000 

Plant_Time2 = 30600 

Harvest_Time = 10000 

crafts = {}

craftType={
    [1] = "Food",
    [2] = "Weapons",
    [3] = "General",
    [4] = "Electronics",
    [5] = "Cars",
    [6] = "Tools"

}

cArea = {}

function getCraftsType()
    return craftType

end

function addCrafts(t)
    table.insert(crafts,t)

end


setDevelopmentMode(true)
