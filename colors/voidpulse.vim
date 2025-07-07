if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "voidpulse"

if has('termguicolors')
    set termguicolors
endif

if has('nvim') && luaeval('pcall(require, "voidpulse")')
    lua require("voidpulse").setup()
else
    let s:colors = {}
    let s:colors.bg0      = "#0D1126"
    let s:colors.bg1      = "#141A35"
    let s:colors.bg2      = "#1B2142"
    let s:colors.bg3      = "#222850"
    let s:colors.bg4      = "#2A305E"
    let s:colors.bg_dark  = "#09091F"
    let s:colors.bg_float = "#111729"
  
    let s:colors.fg0      = "#F8F8FF"
    let s:colors.fg1      = "#DCD6FF"
    let s:colors.fg2      = "#B5AFFF"
    let s:colors.fg3      = "#9B94E6"
  
    let s:colors.blue     = "#82AAFF"
    let s:colors.cyan     = "#5FFFD3"
    let s:colors.teal     = "#00F5C5"
    let s:colors.green    = "#A4FFB0"
    let s:colors.yellow   = "#FFEA70"
    let s:colors.orange   = "#FFB86C"
    let s:colors.red      = "#FF6C91"
    let s:colors.pink     = "#FF3CCF"
    let s:colors.magenta  = "#C85CFF"
    let s:colors.purple   = "#A97CFF"
    let s:colors.violet   = "#9D7CD8"
    let s:colors.lime     = "#9ECE6A"
    let s:colors.gold     = "#E0AF68"
    let s:colors.crimson  = "#F7768E"
    let s:colors.aqua     = "#73DACA"
    let s:colors.coral    = "#FF9E64"
    let s:colors.border   = "#2A305E"
  
    function! s:hi(group, ...)
        let l:cmd = 'highlight ' . a:group
        if len(a:000) >= 1 && !empty(a:1) | let l:cmd .= ' guifg='  . a:1 | endif
        if len(a:000) >= 2 && !empty(a:2) | let l:cmd .= ' guibg='  . a:2 | endif
        if len(a:000) >= 3 && !empty(a:3) | let l:cmd .= ' gui='    . a:3 | endif
        if len(a:000) >= 4 && !empty(a:4) | let l:cmd .= ' guisp='  . a:4 | endif
        execute l:cmd
    endfunction
  
    call s:hi('Normal',           s:colors.fg0, s:colors.bg0)
    call s:hi('NormalFloat',      s:colors.fg0, s:colors.bg_float)
    call s:hi('Comment',          s:colors.fg2, '', 'italic')
    call s:hi('Constant',         s:colors.orange)
    call s:hi('Identifier',       s:colors.cyan)
    call s:hi('Statement',        s:colors.blue, '', 'bold')
    call s:hi('PreProc',          s:colors.magenta)
    call s:hi('Type',             s:colors.purple)
    call s:hi('Special',          s:colors.yellow)
    call s:hi('Underlined',       s:colors.cyan, '', 'underline')
    call s:hi('Error',            s:colors.red, '', 'bold')
    call s:hi('Todo',             s:colors.yellow, s:colors.bg1, 'bold')
  
    call s:hi('Cursor',           s:colors.bg0, s:colors.fg0)
    call s:hi('CursorLine',       '', s:colors.bg1)
    call s:hi('CursorLineNr',     s:colors.yellow, '', 'bold')
    call s:hi('LineNr',           s:colors.fg2)
    call s:hi('Visual',           '', s:colors.bg3)
  
    call s:hi('Search',           s:colors.bg0, s:colors.yellow)
    call s:hi('IncSearch',        s:colors.bg0, s:colors.orange)
    call s:hi('MatchParen',       s:colors.cyan, s:colors.bg3, 'bold')
  
    call s:hi('StatusLine',       s:colors.fg0, s:colors.bg2, 'bold')
    call s:hi('StatusLineNC',     s:colors.fg2, s:colors.bg1)
    call s:hi('VertSplit',        s:colors.border)
    call s:hi('Folded',           s:colors.fg2, s:colors.bg1, 'italic')
    call s:hi('FoldColumn',       s:colors.fg2, s:colors.bg0)
    call s:hi('SignColumn',       s:colors.fg2, s:colors.bg0)
  
    call s:hi('Pmenu',            s:colors.fg1, s:colors.bg_float)
    call s:hi('PmenuSel',         s:colors.fg0, s:colors.bg3, 'bold')
    call s:hi('PmenuSbar',        '', s:colors.bg2)
    call s:hi('PmenuThumb',       '', s:colors.border)
  
    call s:hi('ErrorMsg',         s:colors.red, '', 'bold')
    call s:hi('WarningMsg',       s:colors.orange, '', 'bold')
    call s:hi('ModeMsg',          s:colors.green, '', 'bold')
    call s:hi('Question',         s:colors.cyan, '', 'bold')
    call s:hi('Title',            s:colors.magenta, '', 'bold')
  
    call s:hi('DiffAdd',          s:colors.green, s:colors.bg1)
    call s:hi('DiffDelete',       s:colors.red, s:colors.bg1)
    call s:hi('DiffChange',       s:colors.blue, s:colors.bg1)
    call s:hi('DiffText',         s:colors.yellow, s:colors.bg2, 'bold')
  
    call s:hi('Function',         s:colors.magenta, '', 'bold')
    call s:hi('Keyword',          s:colors.purple, '', 'bold')
    call s:hi('String',           s:colors.green)
    call s:hi('Character',        s:colors.green)
    call s:hi('Number',           s:colors.pink)
    call s:hi('Float',            s:colors.pink)
    call s:hi('Boolean',          s:colors.orange, '', 'bold')
    call s:hi('Operator',         s:colors.teal)
    call s:hi('Delimiter',        s:colors.fg1)
    call s:hi('SpecialChar',      s:colors.cyan)
    call s:hi('Tag',              s:colors.blue)
    call s:hi('SpecialComment',   s:colors.purple, '', 'italic')
    call s:hi('Debug',            s:colors.red)
  
    call s:hi('SpellBad',         '', '', 'undercurl', s:colors.red)
    call s:hi('SpellCap',         '', '', 'undercurl', s:colors.blue)
    call s:hi('SpellLocal',       '', '', 'undercurl', s:colors.cyan)
    call s:hi('SpellRare',        '', '', 'undercurl', s:colors.purple)
  
    call s:hi('Directory',        s:colors.blue, '', 'bold')
  
    if exists('*term_setansicolors')
        let g:terminal_ansi_colors = [
                \ s:colors.bg0,      s:colors.red,     s:colors.green,   s:colors.yellow,
                \ s:colors.blue,     s:colors.magenta, s:colors.cyan,    s:colors.fg0,
                \ s:colors.fg2,      s:colors.red,     s:colors.green,   s:colors.yellow,
                \ s:colors.blue,     s:colors.magenta, s:colors.cyan,    s:colors.fg0
                \ ]
    endif
  
    unlet s:colors
    delfunction s:hi
endif
