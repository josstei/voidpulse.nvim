local M = {}

function M.setup(colors, config)
  local c = colors.semantic

  return {
    DiagnosticError            = { fg = c.error },
    DiagnosticWarn             = { fg = c.warning },
    DiagnosticInfo             = { fg = c.info },
    DiagnosticHint             = { fg = c.hint },
    DiagnosticOk               = { fg = c.git_add },

    DiagnosticVirtualTextError = { fg = c.error, italic = true },
    DiagnosticVirtualTextWarn  = { fg = c.warning, italic = true },
    DiagnosticVirtualTextInfo  = { fg = c.info, italic = true },
    DiagnosticVirtualTextHint  = { fg = c.hint, italic = true },
    DiagnosticVirtualTextOk    = { fg = c.git_add, italic = true },

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

    DiagnosticSignError        = { fg = c.error },
    DiagnosticSignWarn         = { fg = c.warning },
    DiagnosticSignInfo         = { fg = c.info },
    DiagnosticSignHint         = { fg = c.hint },
    DiagnosticSignOk           = { fg = c.git_add },

    LspReferenceText           = { bg = c.selection },
    LspReferenceRead           = { bg = c.selection },
    LspReferenceWrite          = { bg = c.selection },

    LspSignatureActiveParameter = { fg = c.match, bold = true },

    LspCodeLens                = { fg = c.comment },
    LspCodeLensSeparator       = { fg = c.border },

    LspInlayHint               = { fg = c.comment, italic = true },

    ["@lsp.type.class"]         = { link = "VoidpulseType" },
    ["@lsp.type.comment"]       = { link = "VoidpulseComment" },
    ["@lsp.type.decorator"]     = { link = "VoidpulseAttribute" },
    ["@lsp.type.enum"]          = { link = "VoidpulseType" },
    ["@lsp.type.enumMember"]    = { link = "VoidpulseConstant" },
    ["@lsp.type.function"]      = { link = "VoidpulseFunction" },
    ["@lsp.type.interface"]     = { link = "VoidpulseType" },
    ["@lsp.type.keyword"]       = { link = "VoidpulseKeyword" },
    ["@lsp.type.macro"]         = { link = "VoidpulseMacro" },
    ["@lsp.type.method"]        = { link = "VoidpulseFunction" },
    ["@lsp.type.namespace"]     = { fg = c.fg },
    ["@lsp.type.number"]        = { link = "VoidpulseNumber" },
    ["@lsp.type.operator"]      = { link = "VoidpulseOperator" },
    ["@lsp.type.parameter"]     = { link = "VoidpulseParameter" },
    ["@lsp.type.property"]      = { link = "VoidpulseProperty" },
    ["@lsp.type.string"]        = { link = "VoidpulseString" },
    ["@lsp.type.struct"]        = { link = "VoidpulseType" },
    ["@lsp.type.type"]          = { link = "VoidpulseType" },
    ["@lsp.type.typeParameter"] = { link = "VoidpulseType" },
    ["@lsp.type.variable"]      = { link = "VoidpulseVariable" },

    ["@lsp.mod.deprecated"]     = { strikethrough = true },
    ["@lsp.mod.readonly"]       = { link = "VoidpulseConstant" },
    ["@lsp.mod.defaultLibrary"] = { link = "VoidpulseVariableBuiltin" },
  }
end

return M
