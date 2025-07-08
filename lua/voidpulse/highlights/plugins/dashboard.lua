local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        DashboardShortCut = { fg = c.cyan                       },
        DashboardHeader   = { fg = c.purple                     },
        DashboardCenter   = { fg = c.blue                       },
        DashboardFooter   = { fg = c.yellow,    italic = true   },
    })
end

return M
