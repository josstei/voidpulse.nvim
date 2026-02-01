local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    NvimTreeNormal           = { fg = c.fg, bg = p.bg_alt },
    NvimTreeNormalNC         = { fg = c.fg, bg = p.bg_alt },
    NvimTreeWinSeparator     = { fg = c.border, bg = p.bg_alt },
    NvimTreeCursorLine       = { bg = c.cursor_line },
    NvimTreeCursorColumn     = { bg = c.cursor_line },

    NvimTreeRootFolder       = { fg = c.func, bold = true },
    NvimTreeFolderName       = { fg = c.func },
    NvimTreeFolderIcon       = { fg = c.func },
    NvimTreeOpenedFolderName = { fg = c.func, bold = true },
    NvimTreeEmptyFolderName  = { fg = c.comment },
    NvimTreeSymlinkFolderName = { fg = c.info },

    NvimTreeFileName         = { fg = c.fg },
    NvimTreeExecFile         = { fg = c.string, bold = true },
    NvimTreeSpecialFile      = { fg = c.special },
    NvimTreeImageFile        = { fg = c.special },
    NvimTreeSymlink          = { fg = c.info },

    NvimTreeIndentMarker     = { fg = c.border },
    NvimTreeBookmark         = { fg = c.match },

    NvimTreeGitDirty         = { fg = c.git_change },
    NvimTreeGitStaged        = { fg = c.git_add },
    NvimTreeGitMerge         = { fg = c.git_change },
    NvimTreeGitRenamed       = { fg = c.git_change },
    NvimTreeGitNew           = { fg = c.git_add },
    NvimTreeGitDeleted       = { fg = c.git_delete },
    NvimTreeGitIgnored       = { fg = c.comment },

    NvimTreeModifiedFile     = { fg = c.git_change },
  }
end

return M
