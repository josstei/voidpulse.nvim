local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    NotifyERRORBorder = { fg = c.error },
    NotifyERRORIcon   = { fg = c.error },
    NotifyERRORTitle  = { fg = c.error, bold = true },
    NotifyERRORBody   = { fg = c.fg },

    NotifyWARNBorder  = { fg = c.warning },
    NotifyWARNIcon    = { fg = c.warning },
    NotifyWARNTitle   = { fg = c.warning, bold = true },
    NotifyWARNBody    = { fg = c.fg },

    NotifyINFOBorder  = { fg = c.info },
    NotifyINFOIcon    = { fg = c.info },
    NotifyINFOTitle   = { fg = c.info, bold = true },
    NotifyINFOBody    = { fg = c.fg },

    NotifyDEBUGBorder = { fg = c.comment },
    NotifyDEBUGIcon   = { fg = c.comment },
    NotifyDEBUGTitle  = { fg = c.comment, bold = true },
    NotifyDEBUGBody   = { fg = c.fg },

    NotifyTRACEBorder = { fg = c.hint },
    NotifyTRACEIcon   = { fg = c.hint },
    NotifyTRACETitle  = { fg = c.hint, bold = true },
    NotifyTRACEBody   = { fg = c.fg },

    NotifyBackground  = { bg = p.bg_float },
  }
end

return M
