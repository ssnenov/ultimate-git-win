local secondsBetweenUpdate = 60

local function getUnreadCount()
    local file = io.popen("powershell -ExecutionPolicy Bypass . '%CMDER_ROOT%\\config\\ultimate-git-win-outlook.ps1'")
    for line in file:lines() do
        file:close()
        return line
    end
end

local cacheCount
local lastUpdate
function colorful_forecast_filter()
    if cacheCount == nil or (os.clock() - lastUpdate >= secondsBetweenUpdate) then
        cacheCount =  getUnreadCount()
        lastUpdate = os.clock()
    end

    if tonumber(cacheCount) > 0 then
        clink.prompt.value = clink.prompt.value .. createColoredSegment(terminalBackground.RED, "37", " Inbox - " .. cacheCount)
    end

    return false
end

-- override the built-in filters
clink.prompt.register_filter(colorful_forecast_filter, 67)
