local M = {}

M.name = "voidpulse"

M.palette = {
  bg           = "#0D1126",
  bg_alt       = "#141A35",
  bg_float     = "#111729",
  bg_dark      = "#09091F",
  bg_highlight = "#222850",
  cursorline   = "#1B2142",

  fg           = "#F8F8FF",
  fg_alt       = "#DCD6FF",
  fg_dim       = "#B5AFFF",
  fg_dark      = "#9B94E6",

  blue         = "#82AAFF",
  cyan         = "#5FFFD3",
  teal         = "#00F5C5",
  green        = "#A4FFB0",
  yellow       = "#FFEA70",
  orange       = "#FFB86C",
  red          = "#FF6C91",
  pink         = "#FF3CCF",
  magenta      = "#C85CFF",
  purple       = "#A97CFF",
  violet       = "#9D7CD8",
  lime         = "#9ECE6A",
  gold         = "#E0AF68",
  crimson      = "#F7768E",
  aqua         = "#73DACA",
  coral        = "#FF9E64",
  lavender     = "#7287FF",

  none         = "NONE",
}

M.semantic = {
  bg           = M.palette.bg,
  fg           = M.palette.fg,

  border       = M.palette.bg_highlight,
  selection    = M.palette.bg_highlight,
  visual       = M.palette.bg_highlight,
  cursor       = M.palette.pink,
  cursor_line  = M.palette.cursorline,
  line_nr      = M.palette.fg_dark,
  line_nr_cur  = M.palette.yellow,

  statusline   = M.palette.bg_alt,
  statusline_fg = M.palette.fg_dim,

  pmenu        = M.palette.bg_float,
  pmenu_sel    = M.palette.bg_highlight,
  pmenu_thumb  = M.palette.fg_dark,

  search       = M.palette.yellow,
  match        = M.palette.orange,

  keyword      = M.palette.purple,
  string       = M.palette.green,
  number       = M.palette.pink,
  boolean      = M.palette.orange,
  constant     = M.palette.orange,
  func         = M.palette.orange,
  type         = M.palette.purple,
  variable     = M.palette.fg,
  parameter    = M.palette.cyan,
  field        = M.palette.fg_alt,
  property     = M.palette.lavender,
  comment      = M.palette.fg_dark,
  operator     = M.palette.teal,
  delimiter    = M.palette.fg_dim,
  special      = M.palette.yellow,
  character    = M.palette.green,
  escape       = M.palette.cyan,
  preproc      = M.palette.magenta,
  include      = M.palette.magenta,
  macro        = M.palette.magenta,
  tag          = M.palette.blue,
  attribute    = M.palette.yellow,

  error        = M.palette.red,
  warning      = M.palette.orange,
  info         = M.palette.cyan,
  hint         = M.palette.fg_dim,

  git_add      = M.palette.green,
  git_change   = M.palette.orange,
  git_delete   = M.palette.red,

  diff_add     = "#1a3a2a",
  diff_change  = "#2a3a1a",
  diff_delete  = "#3a1a2a",
  diff_text    = "#3a4a2a",
}

return M
