local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    TelescopeNormal         = { fg = c.fg, bg = p.bg_float },
    TelescopeBorder         = { fg = c.border, bg = p.bg_float },
    TelescopePromptNormal   = { fg = c.fg, bg = p.bg_alt },
    TelescopePromptBorder   = { fg = c.border, bg = p.bg_alt },
    TelescopePromptTitle    = { fg = p.bg, bg = c.func, bold = true },
    TelescopePreviewTitle   = { fg = p.bg, bg = c.info, bold = true },
    TelescopeResultsTitle   = { fg = p.bg, bg = c.string, bold = true },
    TelescopeSelection      = { bg = c.selection, bold = true },
    TelescopeSelectionCaret = { fg = c.match },
    TelescopeMultiSelection = { bg = c.selection },
    TelescopeMultiIcon      = { fg = c.info },
    TelescopeMatching       = { fg = c.match, bold = true },
    TelescopePromptPrefix   = { fg = c.func },
    TelescopePromptCounter  = { fg = c.comment },
  }
end

return M
