local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    CmpItemAbbr              = { fg = c.fg },
    CmpItemAbbrDeprecated    = { fg = c.comment, strikethrough = true },
    CmpItemAbbrMatch         = { fg = c.match, bold = true },
    CmpItemAbbrMatchFuzzy    = { fg = c.match, bold = true },
    CmpItemKind              = { fg = c.special },
    CmpItemMenu              = { fg = c.comment },

    CmpItemKindText          = { fg = c.fg },
    CmpItemKindMethod        = { fg = c.func },
    CmpItemKindFunction      = { fg = c.func },
    CmpItemKindConstructor   = { fg = c.type },
    CmpItemKindField         = { fg = c.field },
    CmpItemKindVariable      = { fg = c.variable },
    CmpItemKindClass         = { fg = c.type },
    CmpItemKindInterface     = { fg = c.type },
    CmpItemKindModule        = { fg = c.keyword },
    CmpItemKindProperty      = { fg = c.property },
    CmpItemKindUnit          = { fg = c.number },
    CmpItemKindValue         = { fg = c.constant },
    CmpItemKindEnum          = { fg = c.type },
    CmpItemKindKeyword       = { fg = c.keyword },
    CmpItemKindSnippet       = { fg = c.special },
    CmpItemKindColor         = { fg = c.special },
    CmpItemKindFile          = { fg = c.info },
    CmpItemKindReference     = { fg = c.info },
    CmpItemKindFolder        = { fg = c.info },
    CmpItemKindEnumMember    = { fg = c.constant },
    CmpItemKindConstant      = { fg = c.constant },
    CmpItemKindStruct        = { fg = c.type },
    CmpItemKindEvent         = { fg = c.special },
    CmpItemKindOperator      = { fg = c.operator },
    CmpItemKindTypeParameter = { fg = c.type },

    CmpDocumentation         = { fg = c.fg, bg = p.bg_float },
    CmpDocumentationBorder   = { fg = c.border, bg = p.bg_float },
  }
end

return M
