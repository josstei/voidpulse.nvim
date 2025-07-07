local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        -- Completion (nvim-cmp)
        CmpItemAbbrDeprecated               = { fg = c.fg3,        strikethrough = true            },
        CmpItemAbbrMatch                    = { fg = c.yellow,     bold = true                     },
        CmpItemAbbrMatchFuzzy               = { fg = c.yellow                                      },
        CmpItemKindDefault                  = { fg = c.fg2                                         },
        CmpItemMenu                         = { fg = c.fg2                                         },
        CmpItemKindKeyword                  = { fg = c.purple                                      },
        CmpItemKindVariable                 = { fg = c.cyan                                        },
        CmpItemKindConstant                 = { fg = c.orange                                      },
        CmpItemKindReference                = { fg = c.cyan                                        },
        CmpItemKindValue                    = { fg = c.orange                                      },
        CmpItemKindFunction                 = { fg = c.magenta                                     },
        CmpItemKindMethod                   = { fg = c.magenta                                     },
        CmpItemKindConstructor              = { fg = c.blue                                        },
        CmpItemKindClass                    = { fg = c.purple                                      },
        CmpItemKindInterface                = { fg = c.purple                                      },
        CmpItemKindStruct                   = { fg = c.purple                                      },
        CmpItemKindEvent                    = { fg = c.yellow                                      },
        CmpItemKindEnum                     = { fg = c.purple                                      },
        CmpItemKindUnit                     = { fg = c.orange                                      },
        CmpItemKindModule                   = { fg = c.blue                                        },
        CmpItemKindProperty                 = { fg = c.cyan                                        },
        CmpItemKindField                    = { fg = c.cyan                                        },
        CmpItemKindTypeParameter            = { fg = c.purple                                      },
        CmpItemKindEnumMember               = { fg = c.orange                                      },
        CmpItemKindOperator                 = { fg = c.teal                                        },
        CmpItemKindSnippet                  = { fg = c.green                                       },
        CmpItemKindText                     = { fg = c.fg1                                         },
        CmpItemKindFile                     = { fg = c.blue                                        },
        CmpItemKindFolder                   = { fg = c.blue                                        },
    })
end

return M