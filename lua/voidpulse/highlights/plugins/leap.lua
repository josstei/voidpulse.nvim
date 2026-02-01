local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    LeapMatch         = { fg = c.match, bold = true },
    LeapLabelPrimary  = { fg = p.bg, bg = c.match, bold = true },
    LeapLabelSecondary = { fg = p.bg, bg = c.info, bold = true },
    LeapBackdrop      = { fg = c.comment },
  }
end

return M
