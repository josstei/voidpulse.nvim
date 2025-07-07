local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        -- Mason
        MasonHeader                         = { fg = c.bg0,       bg = c.cyan,     bold = true    },
        MasonHeaderSecondary                = { fg = c.bg0,       bg = c.purple,   bold = true    },
        MasonHighlight                      = { fg = c.cyan                                        },
        MasonHighlightBlock                 = { fg = c.bg0,       bg = c.cyan                     },
        MasonHighlightBlockBold             = { fg = c.bg0,       bg = c.cyan,     bold = true    },
        MasonMuted                          = { fg = c.fg3                                         },
        MasonMutedBlock                     = { fg = c.fg3,       bg = c.bg1                      },
        MasonMutedBlockBold                 = { fg = c.fg3,       bg = c.bg1,      bold = true    },
    })
end

return M