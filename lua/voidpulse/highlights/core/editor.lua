local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  local bg = config.transparent and p.none or p.bg
  local bg_nc = config.dim_inactive and p.bg_dark or bg

  return {
    Normal       = { fg = c.fg, bg = bg },
    NormalFloat  = { fg = c.fg, bg = p.bg_float },
    NormalNC     = { fg = c.fg, bg = bg_nc },
    FloatBorder  = { fg = c.border, bg = p.bg_float },
    FloatTitle   = { fg = c.func, bg = p.bg_float, bold = true },

    Cursor       = { fg = p.bg, bg = c.cursor },
    lCursor      = { link = "Cursor" },
    CursorIM     = { link = "Cursor" },
    CursorLine   = { bg = c.cursor_line },
    CursorColumn = { bg = c.cursor_line },
    TermCursor   = { fg = p.bg, bg = c.cursor },
    TermCursorNC = { fg = p.bg, bg = c.border },

    LineNr       = { fg = c.line_nr },
    CursorLineNr = { fg = c.line_nr_cur, bold = true },
    SignColumn   = { fg = c.line_nr, bg = bg },
    FoldColumn   = { fg = c.border, bg = bg },
    Folded       = { fg = c.comment, bg = p.bg_alt },

    ColorColumn  = { bg = p.bg_dark },
    VertSplit    = { fg = c.border },
    WinSeparator = { fg = c.border },

    StatusLine   = { fg = c.statusline_fg, bg = c.statusline },
    StatusLineNC = { fg = c.comment, bg = p.bg_dark },
    WinBar       = { fg = c.fg, bg = bg, bold = true },
    WinBarNC     = { fg = c.comment, bg = bg_nc },

    TabLine      = { fg = c.comment, bg = p.bg_alt },
    TabLineFill  = { bg = p.bg_dark },
    TabLineSel   = { fg = c.fg, bg = bg, bold = true },

    Pmenu        = { fg = c.fg, bg = c.pmenu },
    PmenuSel     = { fg = c.fg, bg = c.pmenu_sel, bold = true },
    PmenuSbar    = { bg = c.pmenu },
    PmenuThumb   = { bg = c.pmenu_thumb },
    PmenuKind    = { fg = p.blue, bg = c.pmenu },
    PmenuKindSel = { fg = p.blue, bg = c.pmenu_sel },
    PmenuExtra   = { fg = c.comment, bg = c.pmenu },
    PmenuExtraSel = { fg = c.comment, bg = c.pmenu_sel },

    WildMenu     = { fg = c.fg, bg = c.pmenu_sel, bold = true },

    Visual       = { bg = c.visual },
    VisualNOS    = { bg = c.visual },

    Search       = { fg = p.bg, bg = c.search },
    IncSearch    = { fg = p.bg, bg = c.match },
    CurSearch    = { link = "IncSearch" },
    Substitute   = { fg = p.bg, bg = c.match },

    MatchParen   = { fg = c.match, bold = true, underline = true },

    NonText      = { fg = c.border },
    SpecialKey   = { fg = c.border },
    Whitespace   = { fg = c.border },
    EndOfBuffer  = { fg = c.border },

    Directory    = { fg = c.func },
    Title        = { fg = c.func, bold = true },
    Question     = { fg = c.info },
    MoreMsg      = { fg = c.info },
    ModeMsg      = { fg = c.fg, bold = true },
    ErrorMsg     = { fg = c.error },
    WarningMsg   = { fg = c.warning },

    DiffAdd      = { bg = c.diff_add },
    DiffChange   = { bg = c.diff_change },
    DiffDelete   = { bg = c.diff_delete },
    DiffText     = { bg = c.diff_text },

    SpellBad     = { sp = c.error, undercurl = true },
    SpellCap     = { sp = c.warning, undercurl = true },
    SpellLocal   = { sp = c.info, undercurl = true },
    SpellRare    = { sp = c.hint, undercurl = true },

    QuickFixLine = { bg = c.visual, bold = true },
    qfFileName   = { fg = c.func },
    qfLineNr     = { fg = c.line_nr },

    Conceal      = { fg = c.comment },
    CursorLineFold = { fg = c.border, bg = c.cursor_line },
    CursorLineSign = { bg = c.cursor_line },
  }
end

return M
