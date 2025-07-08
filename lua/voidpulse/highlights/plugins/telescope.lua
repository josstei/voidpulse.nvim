local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        TelescopeBorder         = { fg = c.border,  bg = c.bg_float                 },
        TelescopeNormal         = { fg = c.fg0,     bg = c.bg_float                 },
        TelescopeSelection      = { fg = c.fg0,     bg = c.bg3,      bold = true    },
        TelescopeSelectionCaret = { fg = c.cyan                                     },
        TelescopeMultiSelection = { fg = c.purple                                   },
        TelescopeMultiIcon      = { fg = c.cyan                                     },
        TelescopeMatching       = { fg = c.yellow,  bold = true                     },
        TelescopePromptPrefix   = { fg = c.blue                                     },
        TelescopePromptNormal   = { fg = c.fg0,     bg = c.bg_float                 },
        TelescopePromptBorder   = { fg = c.border,  bg = c.bg_float                 },
        TelescopePromptTitle    = { fg = c.magenta, bold = true                     },
        TelescopePreviewTitle   = { fg = c.green,   bold = true                     },
        TelescopeResultsTitle   = { fg = c.cyan,    bold = true                     },
        TelescopePromptCounter  = { fg = c.fg2                                      },
    })
end

return M
