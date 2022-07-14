function getJobTitleFromID(jobID)
	if (tonumber(jobID)==1) then
		return "Delivery Driver"
	elseif (tonumber(jobID)==2) then
		return "Taxi Driver"
	elseif  (tonumber(jobID)==3) then
		return "Bus Driver"
	elseif (tonumber(jobID)==4) then
		return "City Maintenance"
	elseif (tonumber(jobID)==5) then
		return "Mechanic"
	elseif (tonumber(jobID)==6) then
		return "Locksmith"
	elseif (tonumber(jobID)==7) then
		return "Long Haul Truck Driver"
	elseif (tonumber(jobID)==11) then
		return "Barman"
	elseif (tonumber(jobID)==12) then
		return "Ammunation"
	elseif (tonumber(jobID)==13) then
		return "Electronics"
	elseif (tonumber(jobID)==14) then
		return "Tools"
	else
		return "Unemployed"
	end
end