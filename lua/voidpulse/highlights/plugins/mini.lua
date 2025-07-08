local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        MiniCursorword             = { bg = c.bg2                                        },
        MiniCursorwordCurrent      = { bg = c.bg2                                        },
        MiniIndentscopeSymbol      = { fg = c.purple                                     },
        MiniJump                   = { fg = c.bg0,       bg = c.cyan,     bold = true    },
        MiniJump2dSpot             = { fg = c.bg0,       bg = c.cyan,     bold = true    },
        MiniStarterCurrent         = { fg = c.cyan                                       },
        MiniStarterFooter          = { fg = c.yellow,    italic = true                   },
        MiniStarterHeader          = { fg = c.purple                                     },
        MiniStarterInactive        = { fg = c.fg3                                        },
        MiniStarterItem            = { fg = c.fg1                                        },
        MiniStarterItemBullet      = { fg = c.cyan                                       },
        MiniStarterItemPrefix      = { fg = c.yellow                                     },
        MiniStarterSection         = { fg = c.blue                                       },
        MiniStarterQuery           = { fg = c.green                                      },
        MiniStatuslineDevinfo      = { fg = c.fg2,       bg = c.bg2                      },
        MiniStatuslineFileinfo     = { fg = c.fg2,       bg = c.bg2                      },
        MiniStatuslineFilename     = { fg = c.fg1,       bg = c.bg1                      },
        MiniStatuslineInactive     = { fg = c.fg3,       bg = c.bg1                      },
        MiniStatuslineModeCommand  = { fg = c.bg0,       bg = c.yellow,   bold = true    },
        MiniStatuslineModeInsert   = { fg = c.bg0,       bg = c.green,    bold = true    },
        MiniStatuslineModeNormal   = { fg = c.bg0,       bg = c.blue,     bold = true    },
        MiniStatuslineModeOther    = { fg = c.bg0,       bg = c.cyan,     bold = true    },
        MiniStatuslineModeReplace  = { fg = c.bg0,       bg = c.red,      bold = true    },
        MiniStatuslineModeVisual   = { fg = c.bg0,       bg = c.purple,   bold = true    },
        MiniSurround               = { fg = c.bg0,       bg = c.orange                   },
        MiniTablineCurrent         = { fg = c.fg0,       bg = c.bg2,      bold = true    },
        MiniTablineFill            = { bg = c.bg1                                        },
        MiniTablineHidden          = { fg = c.fg2,       bg = c.bg1                      },
        MiniTablineModifiedCurrent = { fg = c.orange,    bg = c.bg2                      },
        MiniTablineModifiedHidden  = { fg = c.orange,    bg = c.bg1                      },
        MiniTablineModifiedVisible = { fg = c.orange,    bg = c.bg1                      },
        MiniTablineTabpagesection  = { fg = c.bg0,       bg = c.purple,   bold = true    },
        MiniTablineVisible         = { fg = c.fg1,       bg = c.bg1                      },
        MiniTestEmphasis           = { bold = true                                       },
        MiniTestFail               = { fg = c.red,       bold = true                     },
        MiniTestPass               = { fg = c.green,     bold = true                     },
        MiniTrailspace             = { bg = c.red                                        },
    })
end

return M
