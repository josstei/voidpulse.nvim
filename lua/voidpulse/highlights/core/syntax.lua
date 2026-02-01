local M = {}

function M.setup(colors, config)
  local c = colors.semantic

  return {
    Comment        = { link = "VoidpulseComment" },
    Constant       = { link = "VoidpulseConstant" },
    String         = { link = "VoidpulseString" },
    Character      = { link = "VoidpulseCharacter" },
    Number         = { link = "VoidpulseNumber" },
    Boolean        = { link = "VoidpulseBoolean" },
    Float          = { link = "VoidpulseNumber" },

    Identifier     = { link = "VoidpulseVariable" },
    Function       = { link = "VoidpulseFunction" },

    Statement      = { link = "VoidpulseKeyword" },
    Conditional    = { link = "VoidpulseKeyword" },
    Repeat         = { link = "VoidpulseKeyword" },
    Label          = { link = "VoidpulseKeyword" },
    Operator       = { link = "VoidpulseOperator" },
    Keyword        = { link = "VoidpulseKeyword" },
    Exception      = { link = "VoidpulseKeyword" },

    PreProc        = { link = "VoidpulsePreproc" },
    Include        = { link = "VoidpulseInclude" },
    Define         = { link = "VoidpulsePreproc" },
    Macro          = { link = "VoidpulseMacro" },
    PreCondit      = { link = "VoidpulsePreproc" },

    Type           = { link = "VoidpulseType" },
    StorageClass   = { link = "VoidpulseKeyword" },
    Structure      = { link = "VoidpulseType" },
    Typedef        = { link = "VoidpulseType" },

    Special        = { link = "VoidpulseSpecial" },
    SpecialChar    = { link = "VoidpulseStringEscape" },
    Tag            = { link = "VoidpulseTag" },
    Delimiter      = { link = "VoidpulseDelimiter" },
    SpecialComment = { fg = c.special, italic = true },
    Debug          = { fg = c.error },

    Underlined     = { fg = c.info, underline = true },
    Ignore         = { fg = c.comment },
    Error          = { link = "VoidpulseError" },
    Todo           = { link = "VoidpulseTodo" },

    Added          = { link = "VoidpulseAdded" },
    Changed        = { link = "VoidpulseChanged" },
    Removed        = { link = "VoidpulseRemoved" },
  }
end

return M
