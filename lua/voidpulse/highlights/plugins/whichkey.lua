local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        WhichKey          = { fg = c.cyan,  bold = true },
        WhichKeyGroup     = { fg = c.purple             },
        WhichKeyDesc      = { fg = c.fg1                },
        WhichKeySeperator = { fg = c.fg2                },
        WhichKeyFloat     = { bg = c.bg_float           },
        WhichKeyValue     = { fg = c.green              },
    })
end

return M
