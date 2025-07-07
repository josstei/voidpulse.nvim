local M = {}

M.setup = function(colors, utils)
  local c = colors.palette
  local hl = utils.highlight_all

  hl({
    -- Variables
    ['@variable']              = { fg = c.fg0 },
    ['@variable.builtin']      = { fg = c.cyan, italic = true },
    ['@variable.parameter']    = { fg = c.teal },
    ['@variable.member']       = { fg = c.cyan },

    -- Constants
    ['@constant']              = { fg = c.orange },
    ['@constant.builtin']      = { fg = c.orange, bold = true },
    ['@constant.macro']        = { fg = c.magenta },

    -- Modules and labels
    ['@module']                = { fg = c.blue },
    ['@module.builtin']        = { fg = c.blue, italic = true },
    ['@label']                 = { fg = c.purple },

    -- Strings
    ['@string']                = { fg = c.green },
    ['@string.documentation']  = { fg = c.lime, italic = true },
    ['@string.regexp']         = { fg = c.cyan },
    ['@string.escape']         = { fg = c.yellow },
    ['@string.special']        = { fg = c.yellow },
    ['@string.special.symbol'] = { fg = c.cyan },
    ['@string.special.url']    = { fg = c.cyan, underline = true },
    ['@string.special.path']   = { fg = c.green },

    -- Characters and numbers
    ['@character']             = { fg = c.green },
    ['@character.special']     = { fg = c.yellow },
    ['@boolean']               = { fg = c.orange, bold = true },
    ['@number']                = { fg = c.pink },
    ['@number.float']          = { fg = c.pink },

    -- Types
    ['@type']                  = { fg = c.purple },
    ['@type.builtin']          = { fg = c.blue, italic = true },
    ['@type.definition']       = { fg = c.purple, bold = true },
    ['@attribute']             = { fg = c.yellow },
    ['@property']              = { fg = c.cyan },

    -- Functions
    ['@function']              = { fg = c.magenta, bold = true },
    ['@function.builtin']      = { fg = c.magenta, italic = true },
    ['@function.call']         = { fg = c.magenta },
    ['@function.macro']        = { fg = c.blue },
    ['@function.method']       = { fg = c.magenta },
    ['@function.method.call']  = { fg = c.magenta },
    ['@constructor']           = { fg = c.blue },

    -- Keywords and operators
    ['@operator']              = { fg = c.teal },
    ['@keyword']               = { fg = c.purple, bold = true },
    ['@keyword.coroutine']     = { fg = c.magenta, bold = true },
    ['@keyword.function']      = { fg = c.purple, bold = true },
    ['@keyword.operator']      = { fg = c.purple },
    ['@keyword.import']        = { fg = c.blue, bold = true },
    ['@keyword.type']          = { fg = c.blue },
    ['@keyword.modifier']      = { fg = c.purple },
    ['@keyword.repeat']        = { fg = c.purple, bold = true },
    ['@keyword.return']        = { fg = c.red, bold = true },
    ['@keyword.debug']         = { fg = c.red },
    ['@keyword.exception']     = { fg = c.red, bold = true },
    ['@keyword.conditional']   = { fg = c.purple, bold = true },
    ['@keyword.conditional.ternary'] = { fg = c.teal },
    ['@keyword.directive']     = { fg = c.magenta },
    ['@keyword.directive.define'] = { fg = c.magenta },

    -- Punctuation
    ['@punctuation.delimiter'] = { fg = c.fg1 },
    ['@punctuation.bracket']   = { fg = c.fg1 },
    ['@punctuation.special']   = { fg = c.yellow },

    -- Comments
    ['@comment']               = { fg = c.fg2, italic = true },
    ['@comment.documentation'] = { fg = c.purple, italic = true },
    ['@comment.error']         = { fg = c.red, bold = true },
    ['@comment.warning']       = { fg = c.orange, bold = true },
    ['@comment.todo']          = { fg = c.yellow, bg = c.bg1, bold = true },
    ['@comment.note']          = { fg = c.blue, bold = true },

    -- Markup
    ['@markup.strong']         = { bold = true },
    ['@markup.italic']         = { italic = true },
    ['@markup.strikethrough']  = { strikethrough = true },
    ['@markup.underline']      = { underline = true },
    ['@markup.heading']        = { fg = c.blue, bold = true },
    ['@markup.heading.1']      = { fg = c.magenta, bold = true },
    ['@markup.heading.2']      = { fg = c.purple, bold = true },
    ['@markup.heading.3']      = { fg = c.blue, bold = true },
    ['@markup.heading.4']      = { fg = c.cyan, bold = true },
    ['@markup.heading.5']      = { fg = c.green, bold = true },
    ['@markup.heading.6']      = { fg = c.yellow, bold = true },
    ['@markup.quote']          = { fg = c.fg2, italic = true },
    ['@markup.math']           = { fg = c.pink },
    ['@markup.link']           = { fg = c.cyan, underline = true },
    ['@markup.link.label']     = { fg = c.blue },
    ['@markup.link.url']       = { fg = c.cyan, underline = true },
    ['@markup.raw']            = { fg = c.green },
    ['@markup.raw.block']      = { fg = c.green },
    ['@markup.list']           = { fg = c.purple },
    ['@markup.list.checked']   = { fg = c.green },
    ['@markup.list.unchecked'] = { fg = c.fg2 },

    -- Tags
    ['@tag']                   = { fg = c.blue },
    ['@tag.builtin']           = { fg = c.blue, italic = true },
    ['@tag.attribute']         = { fg = c.cyan },
    ['@tag.delimiter']         = { fg = c.fg1 },

    -- Diff
    ['@diff.plus']             = { fg = c.green },
    ['@diff.minus']            = { fg = c.red },
    ['@diff.delta']            = { fg = c.blue },

    -- Legacy compatibility
    ['@parameter']             = { link = '@variable.parameter' },
    ['@field']                 = { link = '@property' },
    ['@namespace']             = { link = '@module' },
    ['@text']                  = { fg = c.fg0 },
    ['@text.strong']           = { link = '@markup.strong' },
    ['@text.emphasis']         = { link = '@markup.italic' },
    ['@text.underline']        = { link = '@markup.underline' },
    ['@text.strike']           = { link = '@markup.strikethrough' },
    ['@text.title']            = { link = '@markup.heading' },
    ['@text.literal']          = { link = '@markup.raw' },
    ['@text.uri']              = { link = '@markup.link.url' },
    ['@text.math']             = { link = '@markup.math' },
    ['@text.reference']        = { link = '@markup.link' },
    ['@text.environment']      = { link = '@markup.raw.block' },
    ['@text.environment.name'] = { link = '@type' },
    ['@text.note']             = { link = '@comment.note' },
    ['@text.warning']          = { link = '@comment.warning' },
    ['@text.danger']           = { link = '@comment.error' },
    ['@text.todo']             = { link = '@comment.todo' },
  })
end

return M
