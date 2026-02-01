local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    GitSignsAdd             = { fg = c.git_add },
    GitSignsChange          = { fg = c.git_change },
    GitSignsDelete          = { fg = c.git_delete },
    GitSignsChangedelete    = { fg = c.git_change },
    GitSignsTopdelete       = { fg = c.git_delete },
    GitSignsUntracked       = { fg = c.git_add },

    GitSignsAddNr           = { fg = c.git_add },
    GitSignsChangeNr        = { fg = c.git_change },
    GitSignsDeleteNr        = { fg = c.git_delete },

    GitSignsAddLn           = { bg = c.diff_add },
    GitSignsChangeLn        = { bg = c.diff_change },
    GitSignsDeleteLn        = { bg = c.diff_delete },

    GitSignsAddPreview      = { fg = c.git_add },
    GitSignsDeletePreview   = { fg = c.git_delete },

    GitSignsCurrentLineBlame = { fg = c.comment },

    GitSignsAddInline       = { bg = c.diff_add },
    GitSignsChangeInline    = { bg = c.diff_change },
    GitSignsDeleteInline    = { bg = c.diff_delete },
  }
end

return M
