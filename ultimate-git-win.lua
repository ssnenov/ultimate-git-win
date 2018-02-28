arrowSymbol = ""

-- colors example https://gist.github.com/mlocati/fdabcaeb8071d5c75a2d51712db24011
function createColoredSegment(background, foreground, text)
    local open = background .. "m" .. arrowSymbol
    local textColorization = "\x1b[" .. foreground .. ";" .. background .. "m"
    local close = " \x1b[" .. background - 10 .. ";"

    -- {background}m>\x1b[37;{background}m{TEXT}\x1b[{background-10};
    return open .. textColorization .. text .. close
end