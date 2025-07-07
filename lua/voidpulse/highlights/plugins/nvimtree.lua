local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        -- NvimTree
        NvimTreeNormal                      = { fg = c.fg1,        bg = c.bg_dark                  },
        NvimTreeRootFolder                  = { fg = c.purple,     bold = true                     },
        NvimTreeGitDirty                    = { fg = c.yellow                                      },
        NvimTreeGitNew                      = { fg = c.green                                       },
        NvimTreeGitDeleted                  = { fg = c.red                                         },
        NvimTreeSpecialFile                 = { fg = c.yellow,     underline = true                },
        NvimTreeIndentMarker                = { fg = c.fg3                                         },
        NvimTreeImageFile                   = { fg = c.purple                                      },
        NvimTreeSymlink                     = { fg = c.cyan                                        },
        NvimTreeFolderName                  = { fg = c.blue                                        },
        NvimTreeFolderIcon                  = { fg = c.blue                                        },
        NvimTreeOpenedFolderName            = { fg = c.blue,       bold = true                     },
    })
end

return M