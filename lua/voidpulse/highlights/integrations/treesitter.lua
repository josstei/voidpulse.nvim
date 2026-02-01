local M = {}

function M.setup(colors, config)
  local c = colors.semantic

  return {
    ["@variable"]                    = { link = "VoidpulseVariable" },
    ["@variable.builtin"]            = { link = "VoidpulseVariableBuiltin" },
    ["@variable.parameter"]          = { link = "VoidpulseParameter" },
    ["@variable.parameter.builtin"]  = { link = "VoidpulseParameter" },
    ["@variable.member"]             = { link = "VoidpulseField" },

    ["@constant"]                    = { link = "VoidpulseConstant" },
    ["@constant.builtin"]            = { link = "VoidpulseConstant" },
    ["@constant.macro"]              = { link = "VoidpulseMacro" },

    ["@module"]                      = { fg = c.fg },
    ["@module.builtin"]              = { link = "VoidpulseVariableBuiltin" },
    ["@label"]                       = { link = "VoidpulseKeyword" },

    ["@string"]                      = { link = "VoidpulseString" },
    ["@string.documentation"]        = { link = "VoidpulseString" },
    ["@string.regexp"]               = { fg = c.match },
    ["@string.escape"]               = { link = "VoidpulseStringEscape" },
    ["@string.special"]              = { link = "VoidpulseSpecial" },
    ["@string.special.symbol"]       = { link = "VoidpulseSpecial" },
    ["@string.special.url"]          = { link = "VoidpulseMarkupLink" },
    ["@string.special.path"]         = { link = "VoidpulseString" },

    ["@character"]                   = { link = "VoidpulseCharacter" },
    ["@character.special"]           = { link = "VoidpulseStringEscape" },

    ["@boolean"]                     = { link = "VoidpulseBoolean" },
    ["@number"]                      = { link = "VoidpulseNumber" },
    ["@number.float"]                = { link = "VoidpulseNumber" },

    ["@type"]                        = { link = "VoidpulseType" },
    ["@type.builtin"]                = { link = "VoidpulseType" },
    ["@type.definition"]             = { link = "VoidpulseType" },

    ["@attribute"]                   = { link = "VoidpulseAttribute" },
    ["@attribute.builtin"]           = { link = "VoidpulseAttribute" },
    ["@property"]                    = { link = "VoidpulseProperty" },

    ["@function"]                    = { link = "VoidpulseFunction" },
    ["@function.builtin"]            = { link = "VoidpulseFunction" },
    ["@function.call"]               = { link = "VoidpulseFunction" },
    ["@function.macro"]              = { link = "VoidpulseMacro" },
    ["@function.method"]             = { link = "VoidpulseFunction" },
    ["@function.method.call"]        = { link = "VoidpulseFunction" },

    ["@constructor"]                 = { link = "VoidpulseConstructor" },

    ["@operator"]                    = { link = "VoidpulseOperator" },

    ["@keyword"]                     = { link = "VoidpulseKeyword" },
    ["@keyword.coroutine"]           = { link = "VoidpulseKeyword" },
    ["@keyword.function"]            = { link = "VoidpulseKeyword" },
    ["@keyword.operator"]            = { link = "VoidpulseOperator" },
    ["@keyword.import"]              = { link = "VoidpulseInclude" },
    ["@keyword.type"]                = { link = "VoidpulseKeyword" },
    ["@keyword.modifier"]            = { link = "VoidpulseKeyword" },
    ["@keyword.repeat"]              = { link = "VoidpulseKeyword" },
    ["@keyword.return"]              = { link = "VoidpulseKeyword" },
    ["@keyword.debug"]               = { fg = c.error },
    ["@keyword.exception"]           = { link = "VoidpulseKeyword" },
    ["@keyword.conditional"]         = { link = "VoidpulseKeyword" },
    ["@keyword.conditional.ternary"] = { link = "VoidpulseOperator" },
    ["@keyword.directive"]           = { link = "VoidpulsePreproc" },
    ["@keyword.directive.define"]    = { link = "VoidpulsePreproc" },

    ["@punctuation.delimiter"]       = { link = "VoidpulseDelimiter" },
    ["@punctuation.bracket"]         = { link = "VoidpulseDelimiter" },
    ["@punctuation.special"]         = { link = "VoidpulseSpecial" },

    ["@comment"]                     = { link = "VoidpulseComment" },
    ["@comment.documentation"]       = { link = "VoidpulseComment" },
    ["@comment.error"]               = { fg = c.error, bold = true },
    ["@comment.warning"]             = { fg = c.warning, bold = true },
    ["@comment.todo"]                = { link = "VoidpulseTodo" },
    ["@comment.note"]                = { fg = c.info, bold = true },

    ["@markup.strong"]               = { link = "VoidpulseMarkupBold" },
    ["@markup.italic"]               = { link = "VoidpulseMarkupItalic" },
    ["@markup.strikethrough"]        = { strikethrough = true },
    ["@markup.underline"]            = { underline = true },

    ["@markup.heading"]              = { link = "VoidpulseMarkupHeading" },
    ["@markup.heading.1"]            = { fg = c.func, bold = true },
    ["@markup.heading.2"]            = { fg = c.func, bold = true },
    ["@markup.heading.3"]            = { fg = c.func, bold = true },
    ["@markup.heading.4"]            = { fg = c.func, bold = true },
    ["@markup.heading.5"]            = { fg = c.func, bold = true },
    ["@markup.heading.6"]            = { fg = c.func, bold = true },

    ["@markup.quote"]                = { fg = c.comment, italic = true },
    ["@markup.math"]                 = { fg = c.number },

    ["@markup.link"]                 = { link = "VoidpulseMarkupLink" },
    ["@markup.link.label"]           = { link = "VoidpulseMarkupLink" },
    ["@markup.link.url"]             = { fg = c.info, underline = true },

    ["@markup.raw"]                  = { link = "VoidpulseMarkupCode" },
    ["@markup.raw.block"]            = { link = "VoidpulseMarkupCode" },

    ["@markup.list"]                 = { link = "VoidpulseMarkupList" },
    ["@markup.list.checked"]         = { fg = c.git_add },
    ["@markup.list.unchecked"]       = { fg = c.comment },

    ["@diff.plus"]                   = { link = "VoidpulseAdded" },
    ["@diff.minus"]                  = { link = "VoidpulseRemoved" },
    ["@diff.delta"]                  = { link = "VoidpulseChanged" },

    ["@tag"]                         = { link = "VoidpulseTag" },
    ["@tag.attribute"]               = { link = "VoidpulseAttribute" },
    ["@tag.delimiter"]               = { link = "VoidpulseDelimiter" },
  }
end

return M
