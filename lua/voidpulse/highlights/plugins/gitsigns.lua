local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        GitSignsAdd      = { fg = c.green,  bg = c.bg0  },
        GitSignsChange   = { fg = c.blue,   bg = c.bg0  },
        GitSignsDelete   = { fg = c.red,    bg = c.bg0  },
        GitSignsAddNr    = { fg = c.green               },
        GitSignsChangeNr = { fg = c.blue                },
        GitSignsDeleteNr = { fg = c.red                 },
        GitSignsAddLn    = { bg = c.bg_dark             },
        GitSignsChangeLn = { bg = c.bg_dark             },
        GitSignsDeleteLn = { bg = c.bg_dark             },
    })
end

return M
