local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        -- Noice
        NoiceCompletionItemKindDefault      = { fg = c.fg3                                         },
        NoiceCompletionItemMenu             = { fg = c.fg3                                         },
        NoiceCmdlineIcon                    = { fg = c.cyan                                        },
        NoiceCmdlineIconInput               = { fg = c.yellow                                      },
        NoiceCmdlineIconLua                 = { fg = c.blue                                        },
        NoiceCmdlinePopup                   = { fg = c.fg0,       bg = c.bg_float                 },
        NoiceCmdlinePopupBorder             = { fg = c.border,    bg = c.bg_float                 },
        NoiceCmdlinePopupTitle              = { fg = c.purple,    bold = true                     },
        NoiceConfirm                        = { fg = c.fg0,       bg = c.bg_float                 },
        NoiceConfirmBorder                  = { fg = c.border,    bg = c.bg_float                 },
    })
end

return M