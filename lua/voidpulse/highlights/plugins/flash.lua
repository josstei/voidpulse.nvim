local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        FlashBackdrop   = { fg      = c.fg3                                     },
        FlashMatch      = { fg      = c.bg0,    bg = c.cyan,     bold = true    },
        FlashCurrent    = { fg      = c.bg0,    bg = c.orange,   bold = true    },
        FlashLabel      = { fg      = c.bg0,    bg = c.magenta,  bold = true    },
        FlashPrompt     = { fg      = c.cyan                                    },
        FlashPromptIcon = { fg      = c.cyan                                    },
        FlashCursor     = { reverse = true                                      },
    })
end

return M
