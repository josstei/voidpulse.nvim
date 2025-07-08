local M = {}

M.setup = function(colors, utils)
    local c  = colors.palette
    local hl = utils.highlight_all

    hl({
        LazyProgressTodo    = { fg = c.fg3      },
        LazyProgressDone    = { fg = c.green    },
        LazyCommit          = { fg = c.yellow   },
        LazyCommitType      = { fg = c.purple   },
        LazyReasonStart     = { fg = c.blue     },
        LazyReasonPlugin    = { fg = c.cyan     },
        LazyReasonEvent     = { fg = c.orange   },
        LazyReasonKeys      = { fg = c.green    },
        LazyReasonImport    = { fg = c.magenta  },
        LazyReasonSource    = { fg = c.red      },
        LazyReasonRuntime   = { fg = c.purple   },
        LazyReasonCmd       = { fg = c.yellow   },
        LazyReasonFt        = { fg = c.cyan     },
        LazyOperationNot    = { fg = c.red      },
    })
end

return M
