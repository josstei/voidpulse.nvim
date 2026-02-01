local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    TelescopeNormal         = { fg = c.fg, bg = p.bg_float },
    TelescopeBorder         = { fg = c.border, bg = p.bg_float },
    TelescopeTitle          = { fg = c.func, bold = true },

    TelescopePromptNormal   = { fg = c.fg, bg = p.bg_highlight },
    TelescopePromptBorder   = { fg = c.border, bg = p.bg_highlight },
    TelescopePromptTitle    = { fg = c.func, bg = p.bg_highlight, bold = true },
    TelescopePromptPrefix   = { fg = c.cursor },
    TelescopePromptCounter  = { fg = c.comment },

    TelescopeResultsNormal  = { fg = c.fg, bg = p.bg_float },
    TelescopeResultsBorder  = { fg = c.border, bg = p.bg_float },
    TelescopeResultsTitle   = { fg = c.func, bold = true },

    TelescopePreviewNormal  = { fg = c.fg, bg = p.bg },
    TelescopePreviewBorder  = { fg = c.border, bg = p.bg },
    TelescopePreviewTitle   = { fg = c.func, bold = true },

    TelescopeSelection      = { fg = c.fg, bg = c.selection, bold = true },
    TelescopeSelectionCaret = { fg = c.cursor, bg = c.selection },
    TelescopeMultiSelection = { fg = c.special, bg = c.selection },
    TelescopeMultiIcon      = { fg = c.special },

    TelescopeMatching       = { fg = c.match, bold = true },
  }
end

return M
