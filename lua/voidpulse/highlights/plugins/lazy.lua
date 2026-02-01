local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    LazyH1           = { fg = p.bg, bg = c.func, bold = true },
    LazyH2           = { fg = c.func, bold = true },
    LazyButton       = { fg = c.fg, bg = p.bg_alt },
    LazyButtonActive = { fg = c.fg, bg = c.selection, bold = true },
    LazyComment      = { fg = c.comment },
    LazyCommit       = { fg = c.info },
    LazyCommitIssue  = { fg = c.match },
    LazyCommitType   = { fg = c.keyword },
    LazyDimmed       = { fg = c.comment },
    LazyDir          = { fg = c.info },
    LazyLocal        = { fg = c.warning },
    LazyNoCond       = { fg = c.error },
    LazyNormal       = { fg = c.fg, bg = p.bg_float },
    LazyProgressDone = { fg = c.git_add },
    LazyProgressTodo = { fg = c.comment },
    LazyProp         = { fg = c.property },
    LazyReasonCmd    = { fg = c.keyword },
    LazyReasonEvent  = { fg = c.special },
    LazyReasonFt     = { fg = c.type },
    LazyReasonImport = { fg = c.include },
    LazyReasonKeys   = { fg = c.func },
    LazyReasonPlugin = { fg = c.info },
    LazyReasonRuntime = { fg = c.warning },
    LazyReasonSource = { fg = c.string },
    LazyReasonStart  = { fg = c.git_add },
    LazySpecial      = { fg = c.special },
    LazyTaskError    = { fg = c.error },
    LazyTaskOutput   = { fg = c.fg },
    LazyUrl          = { fg = c.info, underline = true },
    LazyValue        = { fg = c.string },
  }
end

return M
