local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    CmpItemAbbr              = { fg = c.fg },
    CmpItemAbbrDeprecated    = { fg = c.comment, strikethrough = true },
    CmpItemAbbrMatch         = { fg = c.match, bold = true },
    CmpItemAbbrMatchFuzzy    = { fg = c.match, bold = true },
    CmpItemMenu              = { fg = c.comment },

    CmpItemKindText          = { fg = c.fg },
    CmpItemKindMethod        = { fg = c.func },
    CmpItemKindFunction      = { fg = c.func },
    CmpItemKindConstructor   = { fg = c.type },
    CmpItemKindField         = { fg = c.field },
    CmpItemKindVariable      = { fg = c.variable },
    CmpItemKindClass         = { fg = c.type },
    CmpItemKindInterface     = { fg = c.type },
    CmpItemKindModule        = { fg = c.type },
    CmpItemKindProperty      = { fg = c.property },
    CmpItemKindUnit          = { fg = c.number },
    CmpItemKindValue         = { fg = c.constant },
    CmpItemKindEnum          = { fg = c.type },
    CmpItemKindKeyword       = { fg = c.keyword },
    CmpItemKindSnippet       = { fg = c.special },
    CmpItemKindColor         = { fg = c.special },
    CmpItemKindFile          = { fg = c.fg },
    CmpItemKindReference     = { fg = c.info },
    CmpItemKindFolder        = { fg = c.func },
    CmpItemKindEnumMember    = { fg = c.constant },
    CmpItemKindConstant      = { fg = c.constant },
    CmpItemKindStruct        = { fg = c.type },
    CmpItemKindEvent         = { fg = c.special },
    CmpItemKindOperator      = { fg = c.operator },
    CmpItemKindTypeParameter = { fg = c.type },
  }
end

return M
