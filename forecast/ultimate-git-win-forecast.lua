local city = "Sofia"
local country = "BG"
local useCelsius = "$True"
local secondsBetweenUpdate = 14400 -- 4h

local lastUpdate
local forecastDataCache
local function getForecast()
	if forecastDataCache == nil or (os.clock() - lastUpdate >= secondsBetweenUpdate) then	
		forecastDataCache = {}
		local file = io.popen("powershell -ExecutionPolicy Bypass . '%CMDER_ROOT%\\config\\ultimate-git-win-forecast.ps1' " .. city .. " " .. country .. " " .. useCelsius)
		for line in file:lines() do
			forecastDataCache[#forecastDataCache + 1] = line
		end
		
		file:close()
		lastUpdate = os.clock()
	end
	
	return forecastDataCache
end

function colorful_forecast_filter()
	local forecast = getForecast();
    local currentDegree = forecast[1] .. "° " .. forecast[2]
    clink.prompt.value = clink.prompt.value .. createColoredSegment("46", "37", " " .. currentDegree)

    return false
end

-- override the built-in filters
clink.prompt.register_filter(colorful_forecast_filter, 68)
