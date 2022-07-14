function getCraftsByIDJob(idJob)
    outputChatBox("start func")
    triggerServerEvent("crafts:updateID",root,idJob)
    outputChatBox(toJSON(crafts))
    return crafts[idJob]
end 
