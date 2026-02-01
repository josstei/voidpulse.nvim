local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    DashboardHeader   = { fg = c.func },
    DashboardCenter   = { fg = c.info },
    DashboardShortCut = { fg = c.keyword },
    DashboardFooter   = { fg = c.comment, italic = true },
    DashboardKey      = { fg = c.match },
    DashboardDesc     = { fg = c.fg },
    DashboardIcon     = { fg = c.func },
  }
end

return M
