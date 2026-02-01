local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    FlashBackdrop = { fg = c.comment },
    FlashLabel    = { fg = p.bg, bg = c.match, bold = true },
    FlashMatch    = { fg = c.match },
    FlashCurrent  = { fg = c.search },
    FlashCursor   = { fg = p.bg, bg = c.cursor },
  }
end

return M
