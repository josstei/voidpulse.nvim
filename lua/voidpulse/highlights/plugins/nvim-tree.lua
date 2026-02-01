local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  local bg = config.transparent and p.none or p.bg

  return {
    NvimTreeNormal           = { fg = c.fg, bg = bg },
    NvimTreeNormalNC         = { fg = c.fg, bg = bg },
    NvimTreeWinSeparator     = { fg = c.border, bg = bg },
    NvimTreeEndOfBuffer      = { fg = bg },
    NvimTreeRootFolder       = { fg = c.func, bold = true },
    NvimTreeFolderName       = { fg = c.func },
    NvimTreeFolderIcon       = { fg = c.func },
    NvimTreeOpenedFolderName = { fg = c.func, bold = true },
    NvimTreeEmptyFolderName  = { fg = c.comment },
    NvimTreeSymlink          = { fg = c.info },
    NvimTreeSpecialFile      = { fg = c.special },
    NvimTreeImageFile        = { fg = c.special },
    NvimTreeIndentMarker     = { fg = c.border },

    NvimTreeGitDirty         = { fg = c.git_change },
    NvimTreeGitStaged        = { fg = c.git_add },
    NvimTreeGitMerge         = { fg = c.warning },
    NvimTreeGitRenamed       = { fg = c.git_change },
    NvimTreeGitNew           = { fg = c.git_add },
    NvimTreeGitDeleted       = { fg = c.git_delete },
    NvimTreeGitIgnored       = { fg = c.comment },

    NvimTreeModifiedFile     = { fg = c.git_change },
    NvimTreeOpenedFile       = { fg = c.fg, bold = true },

    NvimTreeBookmark         = { fg = c.special },
    NvimTreeExecFile         = { fg = c.git_add, bold = true },
  }
end

return M
