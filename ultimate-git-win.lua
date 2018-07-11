arrowSymbol = ""

terminalBackground = {}
terminalBackground.BLACK   = 40
terminalBackground.RED     = 41
terminalBackground.GREEN   = 42
terminalBackground.YELLOW  = 43
terminalBackground.BLUE    = 44
terminalBackground.MAGENTA = 45
terminalBackground.CYAN    = 46
terminalBackground.WHITE   = 47
terminalBackground.DEFAULT = 49

terminalForeground = {}
terminalForeground.BLACK   = 40
terminalForeground.RED     = 41
terminalForeground.GREEN   = 42
terminalForeground.YELLOW  = 43
terminalForeground.BLUE    = 44
terminalForeground.MAGENTA = 45
terminalForeground.CYAN    = 46
terminalForeground.WHITE   = 47
terminalForeground.DEFAULT = 49

-- colors example https://gist.github.com/mlocati/fdabcaeb8071d5c75a2d51712db24011
function createColoredSegment(background, foreground, text)
    local open = background .. "m" .. arrowSymbol
    local textColorization = "\x1b[" .. foreground .. ";" .. background .. "m"
    local close = " \x1b[" .. background - 10 .. ";"

    -- {background}m>\x1b[37;{background}m{TEXT}\x1b[{background-10};
    return open .. textColorization .. text .. close
end