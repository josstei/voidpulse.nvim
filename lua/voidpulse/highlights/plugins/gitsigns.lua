local M = {}

function M.setup(colors, config)
  local c = colors.semantic

  return {
    GitSignsAdd              = { fg = c.git_add },
    GitSignsChange           = { fg = c.git_change },
    GitSignsDelete           = { fg = c.git_delete },
    GitSignsAddNr            = { fg = c.git_add },
    GitSignsChangeNr         = { fg = c.git_change },
    GitSignsDeleteNr         = { fg = c.git_delete },
    GitSignsAddLn            = { bg = c.diff_add },
    GitSignsChangeLn         = { bg = c.diff_change },
    GitSignsDeleteLn         = { bg = c.diff_delete },
    GitSignsAddInline        = { bg = c.diff_add },
    GitSignsChangeInline     = { bg = c.diff_change },
    GitSignsDeleteInline     = { bg = c.diff_delete },
    GitSignsAddLnInline      = { bg = c.diff_add },
    GitSignsChangeLnInline   = { bg = c.diff_change },
    GitSignsDeleteLnInline   = { bg = c.diff_delete },
    GitSignsAddPreview       = { fg = c.git_add },
    GitSignsDeletePreview    = { fg = c.git_delete },
    GitSignsCurrentLineBlame = { fg = c.comment, italic = true },
    GitSignsAddVirtLn        = { fg = c.git_add },
    GitSignsChangeVirtLn     = { fg = c.git_change },
    GitSignsDeleteVirtLn     = { fg = c.git_delete },
  }
end

return M
