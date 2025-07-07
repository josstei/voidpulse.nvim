local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        -- Notify
        NotifyERRORBorder                   = { fg = c.red                                         },
        NotifyWARNBorder                    = { fg = c.orange                                      },
        NotifyINFOBorder                    = { fg = c.blue                                        },
        NotifyDEBUGBorder                   = { fg = c.fg3                                         },
        NotifyTRACEBorder                   = { fg = c.purple                                      },
        NotifyERRORIcon                     = { fg = c.red                                         },
        NotifyWARNIcon                      = { fg = c.orange                                      },
        NotifyINFOIcon                      = { fg = c.blue                                        },
        NotifyDEBUGIcon                     = { fg = c.fg3                                         },
        NotifyTRACEIcon                     = { fg = c.purple                                      },
        NotifyERRORTitle                    = { fg = c.red                                         },
        NotifyWARNTitle                     = { fg = c.orange                                      },
        NotifyINFOTitle                     = { fg = c.blue                                        },
        NotifyDEBUGTitle                    = { fg = c.fg3                                         },
        NotifyTRACETitle                    = { fg = c.purple                                      },
    })
end

return M