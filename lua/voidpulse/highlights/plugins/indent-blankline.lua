local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    IblIndent    = { fg = p.bg_highlight },
    IblWhitespace = { fg = p.bg_highlight },
    IblScope     = { fg = c.border },
    IndentBlanklineChar = { fg = p.bg_highlight },
    IndentBlanklineSpaceChar = { fg = p.bg_highlight },
    IndentBlanklineSpaceCharBlankline = { fg = p.bg_highlight },
    IndentBlanklineContextChar = { fg = c.border },
    IndentBlanklineContextStart = { sp = c.border, underline = true },
  }
end

return M
