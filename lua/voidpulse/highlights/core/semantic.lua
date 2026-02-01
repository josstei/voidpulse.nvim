local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local styles = config.styles

  return {
    VoidpulseVariable        = vim.tbl_extend("force", { fg = c.variable }, styles.variables),
    VoidpulseVariableBuiltin = { fg = c.special },
    VoidpulseParameter       = { fg = c.parameter },
    VoidpulseField           = { fg = c.field },
    VoidpulseProperty        = { link = "VoidpulseField" },
    VoidpulseConstant        = { fg = c.constant },

    VoidpulseFunction        = vim.tbl_extend("force", { fg = c.func }, styles.functions),
    VoidpulseMacro           = { fg = c.macro },
    VoidpulseConstructor     = { fg = c.type },

    VoidpulseType            = vim.tbl_extend("force", { fg = c.type }, styles.types),
    VoidpulseAttribute       = { fg = c.attribute },

    VoidpulseKeyword         = vim.tbl_extend("force", { fg = c.keyword }, styles.keywords),
    VoidpulseOperator        = { fg = c.operator },
    VoidpulsePreproc         = { fg = c.preproc },
    VoidpulseInclude         = { fg = c.include },

    VoidpulseString          = vim.tbl_extend("force", { fg = c.string }, styles.strings),
    VoidpulseStringEscape    = { fg = c.escape },
    VoidpulseNumber          = { fg = c.number },
    VoidpulseBoolean         = { fg = c.boolean },
    VoidpulseCharacter       = { fg = c.character },

    VoidpulseDelimiter       = { fg = c.delimiter },
    VoidpulseSpecial         = { fg = c.special },
    VoidpulseTag             = { fg = c.tag },

    VoidpulseComment         = vim.tbl_extend("force", { fg = c.comment }, styles.comments),
    VoidpulseTodo            = { fg = c.info, bold = true },

    VoidpulseError           = { fg = c.error },
    VoidpulseWarning         = { fg = c.warning },
    VoidpulseInfo            = { fg = c.info },
    VoidpulseHint            = { fg = c.hint },

    VoidpulseAdded           = { fg = c.git_add },
    VoidpulseChanged         = { fg = c.git_change },
    VoidpulseRemoved         = { fg = c.git_delete },

    VoidpulseMarkupHeading   = { fg = c.func, bold = true },
    VoidpulseMarkupBold      = { bold = true },
    VoidpulseMarkupItalic    = { italic = true },
    VoidpulseMarkupLink      = { fg = c.info, underline = true },
    VoidpulseMarkupCode      = { fg = c.string },
    VoidpulseMarkupList      = { fg = c.special },
  }
end

return M
