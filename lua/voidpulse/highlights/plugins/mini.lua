local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    MiniCursorword        = { bg = c.selection },
    MiniCursorwordCurrent = { bg = c.selection },

    MiniIndentscopeSymbol = { fg = c.border },
    MiniIndentscopePrefix = { nocombine = true },

    MiniJump              = { fg = p.bg, bg = c.match, bold = true },
    MiniJump2dSpot        = { fg = c.match, bold = true },
    MiniJump2dSpotAhead   = { fg = c.info },
    MiniJump2dSpotUnique  = { fg = c.special },

    MiniStatuslineDevinfo     = { fg = c.fg, bg = p.bg_highlight },
    MiniStatuslineFileinfo    = { fg = c.fg, bg = p.bg_highlight },
    MiniStatuslineFilename    = { fg = c.fg, bg = p.bg_alt },
    MiniStatuslineInactive    = { fg = c.comment, bg = p.bg_dark },
    MiniStatuslineModeCommand = { fg = p.bg, bg = c.match, bold = true },
    MiniStatuslineModeInsert  = { fg = p.bg, bg = c.string, bold = true },
    MiniStatuslineModeNormal  = { fg = p.bg, bg = c.func, bold = true },
    MiniStatuslineModeOther   = { fg = p.bg, bg = c.special, bold = true },
    MiniStatuslineModeReplace = { fg = p.bg, bg = c.error, bold = true },
    MiniStatuslineModeVisual  = { fg = p.bg, bg = c.keyword, bold = true },

    MiniSurround          = { fg = p.bg, bg = c.match },

    MiniTablineCurrent    = { fg = c.fg, bg = p.bg, bold = true },
    MiniTablineFill       = { bg = p.bg_dark },
    MiniTablineHidden     = { fg = c.comment, bg = p.bg_alt },
    MiniTablineModifiedCurrent = { fg = c.git_change, bg = p.bg, bold = true },
    MiniTablineModifiedHidden = { fg = c.git_change, bg = p.bg_alt },
    MiniTablineModifiedVisible = { fg = c.git_change, bg = p.bg_alt },
    MiniTablineTabpagesection = { fg = c.fg, bg = p.bg_highlight },
    MiniTablineVisible    = { fg = c.fg, bg = p.bg_alt },

    MiniTrailspace        = { bg = c.error },

    MiniAnimateCursor     = { reverse = true },
    MiniAnimateNormalFloat = { link = "NormalFloat" },

    MiniFilesNormal       = { fg = c.fg, bg = p.bg_float },
    MiniFilesBorder       = { fg = c.border, bg = p.bg_float },
    MiniFilesCursorLine   = { bg = c.cursor_line },
    MiniFilesDirectory    = { fg = c.func },
    MiniFilesFile         = { fg = c.fg },
    MiniFilesTitle        = { fg = c.func, bold = true },
    MiniFilesTitleFocused = { fg = c.match, bold = true },

    MiniPickBorder        = { fg = c.border, bg = p.bg_float },
    MiniPickBorderBusy    = { fg = c.warning, bg = p.bg_float },
    MiniPickBorderText    = { fg = c.func, bg = p.bg_float },
    MiniPickHeader        = { fg = c.info },
    MiniPickIconDirectory = { fg = c.func },
    MiniPickIconFile      = { fg = c.fg },
    MiniPickMatchCurrent  = { bg = c.selection },
    MiniPickMatchMarked   = { fg = c.match, bold = true },
    MiniPickMatchRanges   = { fg = c.match },
    MiniPickNormal        = { fg = c.fg, bg = p.bg_float },
    MiniPickPreviewLine   = { bg = c.selection },
    MiniPickPreviewRegion = { bg = c.selection },
    MiniPickPrompt        = { fg = c.func, bg = p.bg_float },
  }
end

return M
