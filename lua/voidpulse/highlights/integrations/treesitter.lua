local M = {}

function M.setup(colors, config)
  return {
    ["@variable"]                    = { link = "VoidpulseVariable" },
    ["@variable.builtin"]            = { link = "VoidpulseVariableBuiltin" },
    ["@variable.parameter"]          = { link = "VoidpulseParameter" },
    ["@variable.member"]             = { link = "VoidpulseField" },

    ["@constant"]                    = { link = "VoidpulseConstant" },
    ["@constant.builtin"]            = { link = "VoidpulseConstant" },
    ["@constant.macro"]              = { link = "VoidpulseMacro" },

    ["@module"]                      = { link = "VoidpulseType" },
    ["@label"]                       = { link = "VoidpulseSpecial" },

    ["@string"]                      = { link = "VoidpulseString" },
    ["@string.documentation"]        = { link = "VoidpulseComment" },
    ["@string.regexp"]               = { link = "VoidpulseSpecial" },
    ["@string.escape"]               = { link = "VoidpulseStringEscape" },
    ["@string.special"]              = { link = "VoidpulseSpecial" },
    ["@string.special.symbol"]       = { link = "VoidpulseConstant" },
    ["@string.special.url"]          = { link = "VoidpulseMarkupLink" },

    ["@character"]                   = { link = "VoidpulseCharacter" },
    ["@character.special"]           = { link = "VoidpulseStringEscape" },

    ["@number"]                      = { link = "VoidpulseNumber" },
    ["@number.float"]                = { link = "VoidpulseNumber" },
    ["@boolean"]                     = { link = "VoidpulseBoolean" },

    ["@type"]                        = { link = "VoidpulseType" },
    ["@type.builtin"]                = { link = "VoidpulseType" },
    ["@type.definition"]             = { link = "VoidpulseType" },
    ["@type.qualifier"]              = { link = "VoidpulseKeyword" },

    ["@attribute"]                   = { link = "VoidpulseAttribute" },
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
    ["@keyword.storage"]             = { link = "VoidpulseKeyword" },
    ["@keyword.repeat"]              = { link = "VoidpulseKeyword" },
    ["@keyword.return"]              = { link = "VoidpulseKeyword" },
    ["@keyword.debug"]               = { link = "VoidpulseSpecial" },
    ["@keyword.exception"]           = { link = "VoidpulseKeyword" },
    ["@keyword.conditional"]         = { link = "VoidpulseKeyword" },
    ["@keyword.conditional.ternary"] = { link = "VoidpulseOperator" },
    ["@keyword.modifier"]            = { link = "VoidpulseKeyword" },
    ["@keyword.type"]                = { link = "VoidpulseKeyword" },
    ["@keyword.directive"]           = { link = "VoidpulsePreproc" },
    ["@keyword.directive.define"]    = { link = "VoidpulsePreproc" },

    ["@punctuation.delimiter"]       = { link = "VoidpulseDelimiter" },
    ["@punctuation.bracket"]         = { link = "VoidpulseDelimiter" },
    ["@punctuation.special"]         = { link = "VoidpulseSpecial" },

    ["@comment"]                     = { link = "VoidpulseComment" },
    ["@comment.documentation"]       = { link = "VoidpulseComment" },
    ["@comment.error"]               = { link = "VoidpulseError" },
    ["@comment.warning"]             = { link = "VoidpulseWarning" },
    ["@comment.todo"]                = { link = "VoidpulseTodo" },
    ["@comment.note"]                = { link = "VoidpulseHint" },

    ["@markup.strong"]               = { link = "VoidpulseMarkupBold" },
    ["@markup.italic"]               = { link = "VoidpulseMarkupItalic" },
    ["@markup.strikethrough"]        = { strikethrough = true },
    ["@markup.underline"]            = { underline = true },
    ["@markup.heading"]              = { link = "VoidpulseMarkupHeading" },
    ["@markup.quote"]                = { link = "VoidpulseComment" },
    ["@markup.math"]                 = { link = "VoidpulseNumber" },
    ["@markup.link"]                 = { link = "VoidpulseMarkupLink" },
    ["@markup.link.label"]           = { link = "VoidpulseMarkupLink" },
    ["@markup.link.url"]             = { link = "VoidpulseMarkupLink" },
    ["@markup.raw"]                  = { link = "VoidpulseMarkupCode" },
    ["@markup.raw.block"]            = { link = "VoidpulseMarkupCode" },
    ["@markup.list"]                 = { link = "VoidpulseMarkupList" },
    ["@markup.list.checked"]         = { link = "VoidpulseAdded" },
    ["@markup.list.unchecked"]       = { link = "VoidpulseComment" },

    ["@diff.plus"]                   = { link = "VoidpulseAdded" },
    ["@diff.minus"]                  = { link = "VoidpulseRemoved" },
    ["@diff.delta"]                  = { link = "VoidpulseChanged" },

    ["@tag"]                         = { link = "VoidpulseTag" },
    ["@tag.attribute"]               = { link = "VoidpulseAttribute" },
    ["@tag.delimiter"]               = { link = "VoidpulseDelimiter" },
  }
end

return M
