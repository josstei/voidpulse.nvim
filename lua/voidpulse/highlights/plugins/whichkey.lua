local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    WhichKey          = { fg = c.func },
    WhichKeyGroup     = { fg = c.keyword },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyDesc      = { fg = c.fg },
    WhichKeyValue     = { fg = c.comment },
    WhichKeyFloat     = { bg = p.bg_float },
    WhichKeyBorder    = { fg = c.border, bg = p.bg_float },
  }
end

return M
