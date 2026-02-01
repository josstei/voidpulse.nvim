local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    NoiceCmdline          = { fg = c.fg },
    NoiceCmdlineIcon      = { fg = c.func },
    NoiceCmdlineIconSearch = { fg = c.search },
    NoiceCmdlinePopup     = { fg = c.fg, bg = p.bg_float },
    NoiceCmdlinePopupBorder = { fg = c.border, bg = p.bg_float },
    NoiceCmdlinePopupTitle = { fg = c.func },
    NoiceConfirm          = { fg = c.fg, bg = p.bg_float },
    NoiceConfirmBorder    = { fg = c.border, bg = p.bg_float },
    NoiceFormatConfirm    = { fg = c.info },
    NoiceFormatConfirmDefault = { fg = p.bg, bg = c.func, bold = true },
    NoiceLspProgressClient = { fg = c.info },
    NoiceLspProgressSpinner = { fg = c.func },
    NoiceLspProgressTitle = { fg = c.keyword },
    NoiceMini             = { fg = c.fg, bg = p.bg_float },
    NoicePopup            = { fg = c.fg, bg = p.bg_float },
    NoicePopupBorder      = { fg = c.border, bg = p.bg_float },
    NoicePopupmenu        = { fg = c.fg, bg = p.bg_float },
    NoicePopupmenuBorder  = { fg = c.border, bg = p.bg_float },
    NoicePopupmenuMatch   = { fg = c.match, bold = true },
    NoicePopupmenuSelected = { bg = c.selection },
    NoiceScrollbar        = { bg = p.bg_highlight },
    NoiceScrollbarThumb   = { bg = c.comment },
    NoiceSplit            = { fg = c.fg, bg = p.bg_float },
    NoiceSplitBorder      = { fg = c.border, bg = p.bg_float },
    NoiceVirtualText      = { fg = c.comment, italic = true },
  }
end

return M
