local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    MasonHeader                    = { fg = p.bg, bg = c.func, bold = true },
    MasonHeaderSecondary           = { fg = p.bg, bg = c.info, bold = true },
    MasonHighlight                 = { fg = c.info },
    MasonHighlightBlock            = { fg = p.bg, bg = c.info },
    MasonHighlightBlockBold        = { fg = p.bg, bg = c.info, bold = true },
    MasonHighlightSecondary        = { fg = c.match },
    MasonHighlightBlockSecondary   = { fg = p.bg, bg = c.match },
    MasonHighlightBlockBoldSecondary = { fg = p.bg, bg = c.match, bold = true },
    MasonMuted                     = { fg = c.comment },
    MasonMutedBlock                = { fg = c.comment, bg = p.bg_alt },
    MasonError                     = { fg = c.error },
    MasonWarning                   = { fg = c.warning },
  }
end

return M
