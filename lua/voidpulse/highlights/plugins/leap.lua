local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        LeapMatch          = { fg = c.bg1,  bg = c.cyan,     bold = true    },
        LeapLabelPrimary   = { fg = c.bg1,  bg = c.magenta,  bold = true    },
        LeapLabelSecondary = { fg = c.bg0,  bg = c.blue,     bold = true    },
        LeapBackdrop       = { fg = c.fg3                                   },
    })
end

return M
