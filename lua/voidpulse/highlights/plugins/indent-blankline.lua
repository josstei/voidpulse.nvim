local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        IblIndent   = { fg = c.bg2      },
        IblScope    = { fg = c.purple   },
    })
end

return M
