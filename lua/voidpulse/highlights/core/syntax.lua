local M = {}

function M.setup(colors, config)
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
    Label          = { link = "VoidpulseSpecial" },
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
    SpecialChar    = { link = "VoidpulseSpecial" },
    Tag            = { link = "VoidpulseTag" },
    Delimiter      = { link = "VoidpulseDelimiter" },
    SpecialComment = { link = "VoidpulseComment" },
    Debug          = { link = "VoidpulseSpecial" },

    Underlined     = { underline = true },
    Ignore         = { link = "VoidpulseComment" },
    Error          = { link = "VoidpulseError" },
    Todo           = { link = "VoidpulseTodo" },

    Added          = { link = "VoidpulseAdded" },
    Changed        = { link = "VoidpulseChanged" },
    Removed        = { link = "VoidpulseRemoved" },
  }
end

return M
