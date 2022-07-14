addEventHandler('onResourceStop', resourceRoot, function()
    setRainLevel(1)
    setWeather(16)
end)

--- idő beállítása
local months = {
	[0] = 4, -- Január
	[1] = 4, -- Február
	[2] = 4, -- Március
	[3] = 3, -- Április
	[4] = 3, -- Május
	[5] = 2, -- Június
	[6] = 1, -- Július
	[7] = 1, -- Augusztus
	[8] = 0, -- Szeptember
	[9] = 3, -- Október
	[10] = 3, -- November
	[11] = 4, -- December
}

local month = getRealTime().month
local monthday = getRealTime().monthday
local idoeltolodas = months[month]

if month == 7 and monthday == 21 then
	idoeltolodas = 1
end

function getTimeZoneMinus()
	return idoeltolodas
end

local winterTime = false
local winterTimes = {
	[0] = 22,
	[1] = 22,
	[2] = 22,
	[3] = 22,
	[4] = 22,
	[5] = 22,
	[6] = 22,
	[7] = 5,
	[8] = 7,
	[9] = 9,
	[10] = 10,
	[11] = 11,
	[12] = 12,
	[13] = 13,
	[14] = 14,
	[15] = 15,
	[16] = 20,
	[17] = 21,
	[18] = 22,
	[19] = 22,
	[20] = 22,
	[21] = 22,
	[22] = 22,
	[23] = 22,
}

-- valós idő
local nt = nil
function updateTime()
	local realtime = getRealTime()
	local hour = realtime.hour
	if winterTime then
		hour = winterTimes[hour]
	else
		hour = hour + idoeltolodas
		if hour >= 24 then
			hour = hour - 24
		elseif hour < 0 then
			hour = hour + 24
		end
	end

	minute = realtime.minute

	setTime(hour, minute)
	
	outputDebugString("GameTime: "..hour..":"..minute,0)
	
	nextupdate = (60-realtime.second) * 1000
	setMinuteDuration(nextupdate)
	
    if isTimer(nt) then
        killTimer(nt)
    end
	nt = setTimer(setMinuteDuration, nextupdate + 5, 1, 60000)
end

--- valós időjárás
local weatherIDs = {
	["Haze"] = math.random(12,15),
	["Mostly Cloudy"] = 2,
	["Clear"] = 10,
	["Cloudy"] = math.random(0,7),
	["Flurries"] = 32,
	["Fog"] = math.random(0,7),
	["Mostly Sunny"] = math.random(0,7),
	["Partly Cloudy"] = math.random(0,7),
	["Partly Sunny"] = math.random(0,7),
	["Freezing Rain"] = 2,
	["Rain"] = 2,
	["Sleet"] = 2,
	-- ["Snow"] = 31,
	["Sunny"] = 11,
	["Thunderstorms"] = 8,
	["Thunderstorm"] = 8,
	["Unknown"] = 0,
	["Overcast"] = 7,
	["Scattered Clouds"] = 7,
	["Light Snow"] = 4,
}

local weatherNames = {
	["Haze"] = "Ködös",
	["Mostly Cloudy"] = "Többnyire felhős",
	["Clear"] = "Tiszta",
	["Cloudy"] = "Felhős",
	["Flurries"] = "Havas",
	["Fog"] = "Ködös",
	["Mostly Sunny"] = "Túlnyomóan napos",
	["Partly Cloudy"] = "Részben felhős",
	["Partly Sunny"] = "Részben napos",
	["Freezing Rain"] = "Ónos esős",
	["Rain"] = "Esős",
	["Sleet"] = "Havas esős",
	["Snow"] = "Havas",
	["Sunny"] = "Napos",
	["Thunderstorms"] = "Zivataros",
	["Thunderstorm"] = "Zivataros",
	["Unknown"] = "Ismeretlen",
	["Overcast"] = "Felhős",
	["Scattered Clouds"] = "Szétszórtan felhős",
	["Light Snow"] = "Enyhén havas",
}

function fetchWeather()
	updateTime()
	setRainLevel(0)
	fetchRemote("http://api.wunderground.com/api/e6473f36641a2320/conditions/q/IA/Szombathely.json", function(data)
		local isFlooding = false
		local new = fromJSON(data)
		local temp = tonumber(new["current_observation"]["temp_c"])
		local weather = tostring(new["current_observation"]["weather"]) or "Overcast"
		if isFlooding then
			weather = "Thunderstorm"
		end
		
		if not weatherNames[weather] then
			outputDebugString("ismeretlen időjárás: "..weather)
			weather = "Cloudy"
		end
		

		
		if not isFlooding then
			if weatherIDs[weather] then
				setWeather(weatherIDs[weather])
			else
				setWeather(0)
			end
		end
	end, nil, true )
end
setTimer(fetchWeather, 60000*30, 0)
fetchWeather()