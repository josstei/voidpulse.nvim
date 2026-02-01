local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    DiagnosticError            = { fg = c.error },
    DiagnosticWarn             = { fg = c.warning },
    DiagnosticInfo             = { fg = c.info },
    DiagnosticHint             = { fg = c.hint },
    DiagnosticOk               = { fg = c.git_add },

    DiagnosticSignError        = { fg = c.error },
    DiagnosticSignWarn         = { fg = c.warning },
    DiagnosticSignInfo         = { fg = c.info },
    DiagnosticSignHint         = { fg = c.hint },
    DiagnosticSignOk           = { fg = c.git_add },

    DiagnosticVirtualTextError = { fg = c.error, bg = p.bg_alt },
    DiagnosticVirtualTextWarn  = { fg = c.warning, bg = p.bg_alt },
    DiagnosticVirtualTextInfo  = { fg = c.info, bg = p.bg_alt },
    DiagnosticVirtualTextHint  = { fg = c.hint, bg = p.bg_alt },
    DiagnosticVirtualTextOk    = { fg = c.git_add, bg = p.bg_alt },

    DiagnosticUnderlineError   = { sp = c.error, undercurl = true },
    DiagnosticUnderlineWarn    = { sp = c.warning, undercurl = true },
    DiagnosticUnderlineInfo    = { sp = c.info, undercurl = true },
    DiagnosticUnderlineHint    = { sp = c.hint, undercurl = true },
    DiagnosticUnderlineOk      = { sp = c.git_add, undercurl = true },

    DiagnosticFloatingError    = { fg = c.error },
    DiagnosticFloatingWarn     = { fg = c.warning },
    DiagnosticFloatingInfo     = { fg = c.info },
    DiagnosticFloatingHint     = { fg = c.hint },
    DiagnosticFloatingOk       = { fg = c.git_add },

    DiagnosticDeprecated       = { strikethrough = true },
    DiagnosticUnnecessary      = { fg = c.comment },

    LspReferenceText           = { bg = c.selection },
    LspReferenceRead           = { bg = c.selection },
    LspReferenceWrite          = { bg = c.selection },

    LspSignatureActiveParameter = { fg = c.func, bold = true },

    LspInlayHint               = { fg = c.comment, bg = p.bg_alt },

    LspCodeLens                = { fg = c.comment },
    LspCodeLensSeparator       = { fg = c.border },

    LspInfoBorder              = { fg = c.border },

    ["@lsp.type.class"]         = { fg = c.type },
    ["@lsp.type.comment"]       = { link = "@comment" },
    ["@lsp.type.decorator"]     = { fg = c.attribute },
    ["@lsp.type.enum"]          = { fg = c.type },
    ["@lsp.type.enumMember"]    = { fg = c.constant },
    ["@lsp.type.function"]      = { link = "@function" },
    ["@lsp.type.interface"]     = { fg = c.type },
    ["@lsp.type.keyword"]       = { link = "@keyword" },
    ["@lsp.type.macro"]         = { fg = c.macro },
    ["@lsp.type.method"]        = { link = "@function.method" },
    ["@lsp.type.namespace"]     = { fg = c.type },
    ["@lsp.type.number"]        = { link = "@number" },
    ["@lsp.type.operator"]      = { link = "@operator" },
    ["@lsp.type.parameter"]     = { fg = c.parameter },
    ["@lsp.type.property"]      = { fg = c.property },
    ["@lsp.type.string"]        = { link = "@string" },
    ["@lsp.type.struct"]        = { fg = c.type },
    ["@lsp.type.type"]          = { link = "@type" },
    ["@lsp.type.typeParameter"] = { fg = c.type },
    ["@lsp.type.variable"]      = { link = "@variable" },

    ["@lsp.mod.deprecated"]     = { strikethrough = true },
    ["@lsp.mod.readonly"]       = { italic = true },
    ["@lsp.mod.defaultLibrary"] = { link = "@variable.builtin" },
  }
end

return M
