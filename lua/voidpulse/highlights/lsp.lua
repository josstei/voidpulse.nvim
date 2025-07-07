-- LSP and diagnostic highlights
local M = {}

M.setup = function(colors, utils)
  local c = colors.palette
  local hl = utils.highlight_all

  hl({
    -- LSP Diagnostics
    DiagnosticError  = { fg = c.red },
    DiagnosticWarn   = { fg = c.orange },
    DiagnosticInfo   = { fg = c.blue },
    DiagnosticHint   = { fg = c.cyan },
    DiagnosticOk     = { fg = c.green },

    DiagnosticSignError    = { fg = c.red, bg = c.bg0 },
    DiagnosticSignWarn     = { fg = c.orange, bg = c.bg0 },
    DiagnosticSignInfo     = { fg = c.blue, bg = c.bg0 },
    DiagnosticSignHint     = { fg = c.cyan, bg = c.bg0 },
    DiagnosticSignOk       = { fg = c.green, bg = c.bg0 },

    DiagnosticVirtualTextError   = { fg = c.red, bg = c.bg_dark },
    DiagnosticVirtualTextWarn    = { fg = c.orange, bg = c.bg_dark },
    DiagnosticVirtualTextInfo    = { fg = c.blue, bg = c.bg_dark },
    DiagnosticVirtualTextHint    = { fg = c.cyan, bg = c.bg_dark },
    DiagnosticVirtualTextOk      = { fg = c.green, bg = c.bg_dark },

    DiagnosticUnderlineError     = { undercurl = true, sp = c.red },
    DiagnosticUnderlineWarn      = { undercurl = true, sp = c.orange },
    DiagnosticUnderlineInfo      = { undercurl = true, sp = c.blue },
    DiagnosticUnderlineHint      = { undercurl = true, sp = c.cyan },
    DiagnosticUnderlineOk        = { undercurl = true, sp = c.green },

    DiagnosticFloatingError      = { fg = c.red, bg = c.bg_float },
    DiagnosticFloatingWarn       = { fg = c.orange, bg = c.bg_float },
    DiagnosticFloatingInfo       = { fg = c.blue, bg = c.bg_float },
    DiagnosticFloatingHint       = { fg = c.cyan, bg = c.bg_float },
    DiagnosticFloatingOk         = { fg = c.green, bg = c.bg_float },

    -- LSP References
    LspReferenceText       = { bg = c.bg2 },
    LspReferenceRead       = { bg = c.bg2 },
    LspReferenceWrite      = { bg = c.bg2 },

    -- LSP Semantic Tokens
    LspInlayHint           = { fg = c.fg3, bg = c.bg_dark, italic = true },
    LspCodeLens            = { fg = c.fg3, italic = true },
    LspCodeLensSeparator   = { fg = c.fg3 },
  })
end

return M
