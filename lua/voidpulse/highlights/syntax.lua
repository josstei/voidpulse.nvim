-- Basic syntax highlighting
local M = {}

M.setup = function(colors, utils)
  local c = colors.palette
  local hl = utils.highlight_all

  hl({
    -- Basic syntax groups
    Constant         = { fg = c.orange },
    Identifier       = { fg = c.cyan },
    Statement        = { fg = c.blue, bold = true },
    PreProc          = { fg = c.magenta },
    Type             = { fg = c.purple },
    Special          = { fg = c.yellow },
    Underlined       = { fg = c.cyan, underline = true },
    Ignore           = { fg = c.fg3 },
    Error            = { fg = c.red, bold = true },
    Todo             = { fg = c.yellow, bg = c.bg1, bold = true },

    -- More specific syntax
    Function         = { fg = c.magenta, bold = true },
    Keyword          = { fg = c.purple, bold = true },
    String           = { fg = c.green },
    Character        = { fg = c.green },
    Number           = { fg = c.pink },
    Float            = { fg = c.pink },
    Boolean          = { fg = c.orange, bold = true },
    Operator         = { fg = c.teal },
    Delimiter        = { fg = c.fg1 },
    SpecialChar      = { fg = c.cyan },
    Tag              = { fg = c.blue },
    SpecialComment   = { fg = c.purple, italic = true },
    Debug            = { fg = c.red },
  })
end

return M
