local city = "Sofia"
local country = "BG"

local file = io.popen("powershell -ExecutionPolicy Bypass . '%CMDER_ROOT%\\config\\ultimate-git-win-forecast.ps1' " .. city .. " " .. country)
local forecastDataCache = {}
for line in file:lines() do
    forecastDataCache[#forecastDataCache + 1] = line
end
file:close()

function colorful_forecast_filter()
    if #forecastDataCache ~= 3 then
        return
    end

    local currentDegree = (forecastDataCache[1] + forecastDataCache[2]) / 2 .. "° " .. forecastDataCache[3]
    clink.prompt.value = clink.prompt.value .. createColoredSegment("46", "37", " " .. currentDegree)

    return false
end

-- override the built-in filters
clink.prompt.register_filter(colorful_forecast_filter, 68)