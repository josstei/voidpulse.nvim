# Nami Architecture Refactor Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Restructure voidpulse.nvim to mirror nami.nvim's architecture with centralized state, two-tier palette system, and plugin registration API.

**Architecture:** Registry-based state management with config, loader, and palette modules. Highlights reorganized into core/, integrations/, and plugins/ subdirectories. All highlight modules return tables instead of applying directly.

**Tech Stack:** Lua, Neovim API (nvim_set_hl)

---

### Task 1: Create Registry Module

**Files:**
- Create: `lua/voidpulse/registry.lua`

**Step 1: Create the registry module with centralized state**

```lua
local M = {}

local state = {
  config = nil,
  active_palette_name = nil,
  palettes = {},
  plugins = {},
  applied = false,
}

local function deep_copy(value)
  if value == nil then
    return nil
  end
  return vim.deepcopy(value)
end

function M.set_config(config)
  state.config = config
end

function M.get_config()
  return deep_copy(state.config)
end

function M.register_palette(name, palette_table)
  state.palettes[name] = palette_table
end

function M.get_palette(name)
  return deep_copy(state.palettes[name])
end

function M.set_active_palette(name)
  state.active_palette_name = name
end

function M.get_active_palette()
  if not state.active_palette_name then
    return nil
  end
  return deep_copy(state.palettes[state.active_palette_name])
end

function M.get_active_palette_name()
  return state.active_palette_name
end

function M.list_palettes()
  return vim.tbl_keys(state.palettes)
end

function M.palette_exists(name)
  return state.palettes[name] ~= nil
end

function M.register_plugin(name, highlight_fn)
  state.plugins[name] = highlight_fn
end

function M.unregister_plugin(name)
  state.plugins[name] = nil
end

function M.get_plugins()
  return deep_copy(state.plugins)
end

function M.has_plugin(name)
  return state.plugins[name] ~= nil
end

function M.mark_applied()
  state.applied = true
end

function M.is_applied()
  return state.applied
end

function M.reset()
  state.config = nil
  state.active_palette_name = nil
  state.palettes = {}
  state.plugins = {}
  state.applied = false
end

return M
```

**Step 2: Commit**

```bash
git add lua/voidpulse/registry.lua
git commit -m "feat: add registry module for centralized state management"
```

---

### Task 2: Create Config Module

**Files:**
- Create: `lua/voidpulse/config.lua`

**Step 1: Create the config module with defaults and resolve function**

```lua
local M = {}

M.defaults = {
  palette = "voidpulse",
  transparent = false,
  dim_inactive = false,

  styles = {
    comments  = { italic = true },
    keywords  = { bold = true },
    functions = { bold = true },
    variables = {},
    types     = {},
    strings   = {},
  },

  integrations = {
    treesitter = true,
    lsp        = true,
  },

  on_highlights = nil,
}

function M.resolve(opts)
  opts = opts or {}
  local config = vim.tbl_deep_extend("force", {}, M.defaults, opts)

  if config.on_highlights and type(config.on_highlights) ~= "function" then
    vim.notify("[voidpulse] on_highlights must be a function", vim.log.levels.WARN)
    config.on_highlights = nil
  end

  return config
end

return M
```

**Step 2: Commit**

```bash
git add lua/voidpulse/config.lua
git commit -m "feat: add config module with defaults and resolve function"
```

---

### Task 3: Create Palette with Semantic Layer

**Files:**
- Create: `lua/voidpulse/palettes/init.lua`
- Create: `lua/voidpulse/palettes/voidpulse.lua`

**Step 1: Create the palette definition with palette and semantic tables**

```lua
-- lua/voidpulse/palettes/voidpulse.lua
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
```

**Step 2: Create the palettes init module**

```lua
-- lua/voidpulse/palettes/init.lua
local M = {}

local registry = require("voidpulse.registry")

local builtin = {
  "voidpulse",
}

local required_palette_keys = {
  "bg", "bg_alt", "bg_float", "bg_dark", "bg_highlight", "cursorline",
  "fg", "fg_dim", "fg_dark",
  "blue", "cyan", "teal", "green", "yellow", "orange", "red",
  "pink", "magenta", "purple",
  "none",
}

local required_semantic_keys = {
  "bg", "fg", "border", "cursor", "cursor_line", "selection", "visual",
  "line_nr", "line_nr_cur", "statusline", "statusline_fg",
  "pmenu", "pmenu_sel", "pmenu_thumb", "search", "match",
  "keyword", "string", "number", "boolean", "constant", "func", "type",
  "variable", "parameter", "field", "property", "comment", "operator",
  "delimiter", "special", "character", "escape", "preproc", "include",
  "macro", "tag", "attribute",
  "error", "warning", "info", "hint",
  "git_add", "git_change", "git_delete",
  "diff_add", "diff_change", "diff_delete", "diff_text",
}

local function missing_keys(tbl, keys)
  local missing = {}
  for _, key in ipairs(keys) do
    if type(tbl[key]) ~= "string" then
      table.insert(missing, key)
    end
  end
  return missing
end

local function validate_palette(name, palette)
  if type(palette) ~= "table" then
    vim.notify(string.format("[voidpulse] Palette '%s' must return a table", name), vim.log.levels.ERROR)
    return false
  end
  if type(palette.palette) ~= "table" then
    vim.notify(string.format("[voidpulse] Palette '%s' is missing a palette table", name), vim.log.levels.ERROR)
    return false
  end
  if type(palette.semantic) ~= "table" then
    vim.notify(string.format("[voidpulse] Palette '%s' is missing a semantic table", name), vim.log.levels.ERROR)
    return false
  end

  local missing_palette = missing_keys(palette.palette, required_palette_keys)
  local missing_semantic = missing_keys(palette.semantic, required_semantic_keys)

  if #missing_palette > 0 or #missing_semantic > 0 then
    local parts = {}
    if #missing_palette > 0 then
      table.insert(parts, "palette keys: " .. table.concat(missing_palette, ", "))
    end
    if #missing_semantic > 0 then
      table.insert(parts, "semantic keys: " .. table.concat(missing_semantic, ", "))
    end
    vim.notify(
      string.format("[voidpulse] Palette '%s' is missing required %s", name, table.concat(parts, "; ")),
      vim.log.levels.ERROR
    )
    return false
  end

  return true
end

function M.load_builtin()
  for _, name in ipairs(builtin) do
    local ok, palette = pcall(require, "voidpulse.palettes." .. name)
    if ok and validate_palette(name, palette) then
      registry.register_palette(name, palette)
    end
  end
end

function M.load(name)
  local palette = registry.get_palette(name)
  if palette then
    if validate_palette(name, palette) then
      return palette
    end
    return nil
  end

  local ok, loaded = pcall(require, "voidpulse.palettes." .. name)
  if ok and validate_palette(name, loaded) then
    registry.register_palette(name, loaded)
    return loaded
  end

  return nil
end

function M.exists(name)
  if registry.palette_exists(name) then
    return validate_palette(name, registry.get_palette(name))
  end

  local ok, loaded = pcall(require, "voidpulse.palettes." .. name)
  return ok and validate_palette(name, loaded)
end

function M.list()
  return builtin
end

return M
```

**Step 3: Commit**

```bash
git add lua/voidpulse/palettes/
git commit -m "feat: add palettes module with two-tier color system"
```

---

### Task 4: Enhance Utils Module

**Files:**
- Modify: `lua/voidpulse/utils.lua`

**Step 1: Rewrite utils with enhanced highlight function and color manipulation**

```lua
local M = {}

function M.highlight(group, opts)
  if opts.link then
    vim.api.nvim_set_hl(0, group, { link = opts.link })
    return
  end

  local hl = {}

  if opts.fg then hl.fg = opts.fg end
  if opts.bg then hl.bg = opts.bg end
  if opts.sp then hl.sp = opts.sp end

  if opts.bold then hl.bold = true end
  if opts.italic then hl.italic = true end
  if opts.underline then hl.underline = true end
  if opts.undercurl then hl.undercurl = true end
  if opts.strikethrough then hl.strikethrough = true end

  vim.api.nvim_set_hl(0, group, hl)
end

function M.apply_highlights(groups)
  for group, opts in pairs(groups) do
    M.highlight(group, opts)
  end
end

local function normalize_hex(hex)
  if type(hex) ~= "string" then
    return nil
  end

  local stripped = hex:gsub("^#", "")
  if #stripped ~= 6 or stripped:find("[^0-9a-fA-F]") then
    return nil
  end

  return "#" .. stripped:lower()
end

local function clamp(value, min, max)
  if value < min then
    return min
  end
  if value > max then
    return max
  end
  return value
end

local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16),
         tonumber(hex:sub(3, 4), 16),
         tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x",
    math.floor(math.min(255, math.max(0, r))),
    math.floor(math.min(255, math.max(0, g))),
    math.floor(math.min(255, math.max(0, b)))
  )
end

function M.darken(hex, amount)
  local normalized = normalize_hex(hex)
  if not normalized then
    return hex
  end
  if type(amount) ~= "number" then
    return normalized
  end

  amount = clamp(amount, 0, 100)
  local r, g, b = hex_to_rgb(normalized)
  local factor = (100 - amount) / 100
  return rgb_to_hex(r * factor, g * factor, b * factor)
end

function M.lighten(hex, amount)
  local normalized = normalize_hex(hex)
  if not normalized then
    return hex
  end
  if type(amount) ~= "number" then
    return normalized
  end

  amount = clamp(amount, 0, 100)
  local r, g, b = hex_to_rgb(normalized)
  local factor = amount / 100
  return rgb_to_hex(
    r + (255 - r) * factor,
    g + (255 - g) * factor,
    b + (255 - b) * factor
  )
end

function M.blend(hex1, hex2, alpha)
  local normalized1 = normalize_hex(hex1)
  local normalized2 = normalize_hex(hex2)
  if not normalized1 or not normalized2 then
    return normalized1 or normalized2 or hex1
  end
  if type(alpha) ~= "number" then
    return normalized1
  end

  alpha = clamp(alpha, 0, 1)
  local r1, g1, b1 = hex_to_rgb(normalized1)
  local r2, g2, b2 = hex_to_rgb(normalized2)
  return rgb_to_hex(
    r1 * (1 - alpha) + r2 * alpha,
    g1 * (1 - alpha) + g2 * alpha,
    b1 * (1 - alpha) + b2 * alpha
  )
end

return M
```

**Step 2: Commit**

```bash
git add lua/voidpulse/utils.lua
git commit -m "feat: enhance utils with link support and color manipulation functions"
```

---

### Task 5: Create Loader Module

**Files:**
- Create: `lua/voidpulse/loader.lua`

**Step 1: Create the loader module that orchestrates colorscheme application**

```lua
local M = {}

local registry = require("voidpulse.registry")
local utils = require("voidpulse.utils")

function M.merge(base, additions)
  for k, v in pairs(additions) do
    base[k] = v
  end
end

function M.apply(highlights)
  utils.apply_highlights(highlights)
end

function M.apply_terminal(colors)
  if type(colors) ~= "table" or type(colors.palette) ~= "table" then
    vim.notify("[voidpulse] Terminal colors skipped; missing palette table", vim.log.levels.WARN)
    return
  end

  local p = colors.palette
  local required = {
    "bg_dark", "red", "green", "yellow", "blue", "magenta", "cyan",
    "fg", "fg_dim", "fg_dark",
  }
  local missing = {}
  for _, key in ipairs(required) do
    if type(p[key]) ~= "string" then
      table.insert(missing, key)
    end
  end

  if #missing > 0 then
    vim.notify(
      string.format("[voidpulse] Terminal colors skipped; missing palette keys: %s", table.concat(missing, ", ")),
      vim.log.levels.WARN
    )
    return
  end

  vim.g.terminal_color_0  = p.bg_dark
  vim.g.terminal_color_1  = p.red
  vim.g.terminal_color_2  = p.green
  vim.g.terminal_color_3  = p.yellow
  vim.g.terminal_color_4  = p.blue
  vim.g.terminal_color_5  = p.magenta
  vim.g.terminal_color_6  = p.cyan
  vim.g.terminal_color_7  = p.fg
  vim.g.terminal_color_8  = p.fg_dark
  vim.g.terminal_color_9  = p.red
  vim.g.terminal_color_10 = p.green
  vim.g.terminal_color_11 = p.yellow
  vim.g.terminal_color_12 = p.blue
  vim.g.terminal_color_13 = p.magenta
  vim.g.terminal_color_14 = p.cyan
  vim.g.terminal_color_15 = p.fg
end

function M.load()
  local config = registry.get_config()
  local palette = registry.get_active_palette()

  if not config then
    vim.notify("[voidpulse] Configuration missing; run setup() first", vim.log.levels.ERROR)
    return
  end
  if not palette then
    vim.notify("[voidpulse] No palette loaded", vim.log.levels.ERROR)
    return
  end
  if type(palette.palette) ~= "table" or type(palette.semantic) ~= "table" then
    vim.notify("[voidpulse] Palette missing required tables", vim.log.levels.ERROR)
    return
  end

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "voidpulse"

  local colors = {
    palette = palette.palette,
    semantic = palette.semantic,
  }

  local highlights = {}

  local hl_modules = require("voidpulse.highlights")
  M.merge(highlights, hl_modules.setup(colors, config))

  for name, fn in pairs(registry.get_plugins()) do
    local ok, plugin_hl = pcall(fn, colors, config)
    if ok and plugin_hl then
      M.merge(highlights, plugin_hl)
    elseif not ok then
      vim.notify(string.format("[voidpulse] Plugin '%s' error: %s", name, plugin_hl), vim.log.levels.WARN)
    end
  end

  if config.on_highlights then
    local ok, user_hl = pcall(config.on_highlights, colors, config)
    if ok and user_hl then
      M.merge(highlights, user_hl)
    end
  end

  M.apply(highlights)
  M.apply_terminal(colors)
  registry.mark_applied()
end

return M
```

**Step 2: Commit**

```bash
git add lua/voidpulse/loader.lua
git commit -m "feat: add loader module for colorscheme orchestration"
```

---

### Task 6: Rewrite Public API (init.lua)

**Files:**
- Modify: `lua/voidpulse/init.lua`

**Step 1: Rewrite init.lua with clean public API**

```lua
local M = {}

local registry = require("voidpulse.registry")
local config_module = require("voidpulse.config")
local palettes = require("voidpulse.palettes")
local loader = require("voidpulse.loader")

local function notify_failure(action, err)
  vim.notify(string.format("[voidpulse] %s failed: %s", action, err), vim.log.levels.ERROR)
end

function M.setup(opts)
  local ok, err = pcall(function()
    local config = config_module.resolve(opts)

    if not palettes.exists(config.palette) then
      vim.notify(
        string.format("[voidpulse] Unknown palette '%s', falling back to 'voidpulse'", config.palette),
        vim.log.levels.WARN
      )
      config.palette = "voidpulse"
    end

    registry.set_config(config)
    palettes.load_builtin()

    local palette = palettes.load(config.palette)
    if palette then
      registry.set_active_palette(config.palette)
      return
    end

    if config.palette ~= "voidpulse" then
      vim.notify(
        string.format("[voidpulse] Failed to load palette '%s', falling back to 'voidpulse'", config.palette),
        vim.log.levels.WARN
      )
      local fallback = palettes.load("voidpulse")
      if fallback then
        registry.set_active_palette("voidpulse")
      end
    end
  end)

  if not ok then
    notify_failure("setup", err)
  end
end

function M.load()
  local ok, err = pcall(function()
    local config = registry.get_config()
    if not config then
      M.setup({})
      config = registry.get_config()
      if not config then
        return
      end
    end
    loader.load()
  end)

  if not ok then
    notify_failure("load", err)
  end
end

function M.register_plugin(name, highlight_fn)
  registry.register_plugin(name, highlight_fn)

  if registry.is_applied() then
    local palette = registry.get_active_palette()
    local config = registry.get_config()
    local colors = {
      palette = palette.palette,
      semantic = palette.semantic,
    }
    local ok, highlights = pcall(highlight_fn, colors, config)
    if ok and highlights then
      loader.apply(highlights)
    end
  end
end

function M.unregister_plugin(name)
  registry.unregister_plugin(name)
end

function M.set_palette(name)
  local ok, err = pcall(function()
    if not palettes.exists(name) then
      vim.notify(string.format("[voidpulse] Unknown palette '%s'", name), vim.log.levels.ERROR)
      return
    end

    local palette = palettes.load(name)
    if palette then
      registry.set_active_palette(name)
      loader.load()
    else
      vim.notify(string.format("[voidpulse] Failed to load palette '%s'", name), vim.log.levels.ERROR)
    end
  end)

  if not ok then
    notify_failure("set_palette", err)
  end
end

function M.palettes()
  return palettes.list()
end

return M
```

**Step 2: Commit**

```bash
git add lua/voidpulse/init.lua
git commit -m "feat: rewrite init.lua with clean public API"
```

---

### Task 7: Create Core Highlight Modules

**Files:**
- Create: `lua/voidpulse/highlights/core/semantic.lua`
- Create: `lua/voidpulse/highlights/core/editor.lua`
- Create: `lua/voidpulse/highlights/core/syntax.lua`

**Step 1: Create semantic highlights module**

```lua
-- lua/voidpulse/highlights/core/semantic.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local styles = config.styles

  return {
    VoidpulseVariable        = vim.tbl_extend("force", { fg = c.variable }, styles.variables),
    VoidpulseVariableBuiltin = { fg = c.special },
    VoidpulseParameter       = { fg = c.parameter },
    VoidpulseField           = { fg = c.field },
    VoidpulseProperty        = { link = "VoidpulseField" },
    VoidpulseConstant        = { fg = c.constant },

    VoidpulseFunction        = vim.tbl_extend("force", { fg = c.func }, styles.functions),
    VoidpulseMacro           = { fg = c.macro },
    VoidpulseConstructor     = { fg = c.type },

    VoidpulseType            = vim.tbl_extend("force", { fg = c.type }, styles.types),
    VoidpulseAttribute       = { fg = c.attribute },

    VoidpulseKeyword         = vim.tbl_extend("force", { fg = c.keyword }, styles.keywords),
    VoidpulseOperator        = { fg = c.operator },
    VoidpulsePreproc         = { fg = c.preproc },
    VoidpulseInclude         = { fg = c.include },

    VoidpulseString          = vim.tbl_extend("force", { fg = c.string }, styles.strings),
    VoidpulseStringEscape    = { fg = c.escape },
    VoidpulseNumber          = { fg = c.number },
    VoidpulseBoolean         = { fg = c.boolean },
    VoidpulseCharacter       = { fg = c.character },

    VoidpulseDelimiter       = { fg = c.delimiter },
    VoidpulseSpecial         = { fg = c.special },
    VoidpulseTag             = { fg = c.tag },

    VoidpulseComment         = vim.tbl_extend("force", { fg = c.comment }, styles.comments),
    VoidpulseTodo            = { fg = c.info, bold = true },

    VoidpulseError           = { fg = c.error },
    VoidpulseWarning         = { fg = c.warning },
    VoidpulseInfo            = { fg = c.info },
    VoidpulseHint            = { fg = c.hint },

    VoidpulseAdded           = { fg = c.git_add },
    VoidpulseChanged         = { fg = c.git_change },
    VoidpulseRemoved         = { fg = c.git_delete },

    VoidpulseMarkupHeading   = { fg = c.func, bold = true },
    VoidpulseMarkupBold      = { bold = true },
    VoidpulseMarkupItalic    = { italic = true },
    VoidpulseMarkupLink      = { fg = c.info, underline = true },
    VoidpulseMarkupCode      = { fg = c.string },
    VoidpulseMarkupList      = { fg = c.special },
  }
end

return M
```

**Step 2: Create editor highlights module**

```lua
-- lua/voidpulse/highlights/core/editor.lua
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
```

**Step 3: Create syntax highlights module**

```lua
-- lua/voidpulse/highlights/core/syntax.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic

  return {
    Comment        = { link = "VoidpulseComment" },
    Constant       = { link = "VoidpulseConstant" },
    String         = { link = "VoidpulseString" },
    Character      = { link = "VoidpulseCharacter" },
    Number         = { link = "VoidpulseNumber" },
    Boolean        = { link = "VoidpulseBoolean" },
    Float          = { link = "VoidpulseNumber" },

    Identifier     = { link = "VoidpulseVariable" },
    Function       = { link = "VoidpulseFunction" },

    Statement      = { link = "VoidpulseKeyword" },
    Conditional    = { link = "VoidpulseKeyword" },
    Repeat         = { link = "VoidpulseKeyword" },
    Label          = { link = "VoidpulseKeyword" },
    Operator       = { link = "VoidpulseOperator" },
    Keyword        = { link = "VoidpulseKeyword" },
    Exception      = { link = "VoidpulseKeyword" },

    PreProc        = { link = "VoidpulsePreproc" },
    Include        = { link = "VoidpulseInclude" },
    Define         = { link = "VoidpulsePreproc" },
    Macro          = { link = "VoidpulseMacro" },
    PreCondit      = { link = "VoidpulsePreproc" },

    Type           = { link = "VoidpulseType" },
    StorageClass   = { link = "VoidpulseKeyword" },
    Structure      = { link = "VoidpulseType" },
    Typedef        = { link = "VoidpulseType" },

    Special        = { link = "VoidpulseSpecial" },
    SpecialChar    = { link = "VoidpulseStringEscape" },
    Tag            = { link = "VoidpulseTag" },
    Delimiter      = { link = "VoidpulseDelimiter" },
    SpecialComment = { fg = c.special, italic = true },
    Debug          = { fg = c.error },

    Underlined     = { fg = c.info, underline = true },
    Ignore         = { fg = c.comment },
    Error          = { link = "VoidpulseError" },
    Todo           = { link = "VoidpulseTodo" },

    Added          = { link = "VoidpulseAdded" },
    Changed        = { link = "VoidpulseChanged" },
    Removed        = { link = "VoidpulseRemoved" },
  }
end

return M
```

**Step 4: Commit**

```bash
git add lua/voidpulse/highlights/core/
git commit -m "feat: add core highlight modules (semantic, editor, syntax)"
```

---

### Task 8: Create Integration Highlight Modules

**Files:**
- Create: `lua/voidpulse/highlights/integrations/treesitter.lua`
- Create: `lua/voidpulse/highlights/integrations/lsp.lua`

**Step 1: Create treesitter highlights module (convert from existing)**

```lua
-- lua/voidpulse/highlights/integrations/treesitter.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic

  return {
    ["@variable"]                    = { link = "VoidpulseVariable" },
    ["@variable.builtin"]            = { link = "VoidpulseVariableBuiltin" },
    ["@variable.parameter"]          = { link = "VoidpulseParameter" },
    ["@variable.parameter.builtin"]  = { link = "VoidpulseParameter" },
    ["@variable.member"]             = { link = "VoidpulseField" },

    ["@constant"]                    = { link = "VoidpulseConstant" },
    ["@constant.builtin"]            = { link = "VoidpulseConstant" },
    ["@constant.macro"]              = { link = "VoidpulseMacro" },

    ["@module"]                      = { fg = c.fg },
    ["@module.builtin"]              = { link = "VoidpulseVariableBuiltin" },
    ["@label"]                       = { link = "VoidpulseKeyword" },

    ["@string"]                      = { link = "VoidpulseString" },
    ["@string.documentation"]        = { link = "VoidpulseString" },
    ["@string.regexp"]               = { fg = c.match },
    ["@string.escape"]               = { link = "VoidpulseStringEscape" },
    ["@string.special"]              = { link = "VoidpulseSpecial" },
    ["@string.special.symbol"]       = { link = "VoidpulseSpecial" },
    ["@string.special.url"]          = { link = "VoidpulseMarkupLink" },
    ["@string.special.path"]         = { link = "VoidpulseString" },

    ["@character"]                   = { link = "VoidpulseCharacter" },
    ["@character.special"]           = { link = "VoidpulseStringEscape" },

    ["@boolean"]                     = { link = "VoidpulseBoolean" },
    ["@number"]                      = { link = "VoidpulseNumber" },
    ["@number.float"]                = { link = "VoidpulseNumber" },

    ["@type"]                        = { link = "VoidpulseType" },
    ["@type.builtin"]                = { link = "VoidpulseType" },
    ["@type.definition"]             = { link = "VoidpulseType" },

    ["@attribute"]                   = { link = "VoidpulseAttribute" },
    ["@attribute.builtin"]           = { link = "VoidpulseAttribute" },
    ["@property"]                    = { link = "VoidpulseProperty" },

    ["@function"]                    = { link = "VoidpulseFunction" },
    ["@function.builtin"]            = { link = "VoidpulseFunction" },
    ["@function.call"]               = { link = "VoidpulseFunction" },
    ["@function.macro"]              = { link = "VoidpulseMacro" },
    ["@function.method"]             = { link = "VoidpulseFunction" },
    ["@function.method.call"]        = { link = "VoidpulseFunction" },

    ["@constructor"]                 = { link = "VoidpulseConstructor" },

    ["@operator"]                    = { link = "VoidpulseOperator" },

    ["@keyword"]                     = { link = "VoidpulseKeyword" },
    ["@keyword.coroutine"]           = { link = "VoidpulseKeyword" },
    ["@keyword.function"]            = { link = "VoidpulseKeyword" },
    ["@keyword.operator"]            = { link = "VoidpulseOperator" },
    ["@keyword.import"]              = { link = "VoidpulseInclude" },
    ["@keyword.type"]                = { link = "VoidpulseKeyword" },
    ["@keyword.modifier"]            = { link = "VoidpulseKeyword" },
    ["@keyword.repeat"]              = { link = "VoidpulseKeyword" },
    ["@keyword.return"]              = { link = "VoidpulseKeyword" },
    ["@keyword.debug"]               = { fg = c.error },
    ["@keyword.exception"]           = { link = "VoidpulseKeyword" },
    ["@keyword.conditional"]         = { link = "VoidpulseKeyword" },
    ["@keyword.conditional.ternary"] = { link = "VoidpulseOperator" },
    ["@keyword.directive"]           = { link = "VoidpulsePreproc" },
    ["@keyword.directive.define"]    = { link = "VoidpulsePreproc" },

    ["@punctuation.delimiter"]       = { link = "VoidpulseDelimiter" },
    ["@punctuation.bracket"]         = { link = "VoidpulseDelimiter" },
    ["@punctuation.special"]         = { link = "VoidpulseSpecial" },

    ["@comment"]                     = { link = "VoidpulseComment" },
    ["@comment.documentation"]       = { link = "VoidpulseComment" },
    ["@comment.error"]               = { fg = c.error, bold = true },
    ["@comment.warning"]             = { fg = c.warning, bold = true },
    ["@comment.todo"]                = { link = "VoidpulseTodo" },
    ["@comment.note"]                = { fg = c.info, bold = true },

    ["@markup.strong"]               = { link = "VoidpulseMarkupBold" },
    ["@markup.italic"]               = { link = "VoidpulseMarkupItalic" },
    ["@markup.strikethrough"]        = { strikethrough = true },
    ["@markup.underline"]            = { underline = true },

    ["@markup.heading"]              = { link = "VoidpulseMarkupHeading" },
    ["@markup.heading.1"]            = { fg = c.func, bold = true },
    ["@markup.heading.2"]            = { fg = c.func, bold = true },
    ["@markup.heading.3"]            = { fg = c.func, bold = true },
    ["@markup.heading.4"]            = { fg = c.func, bold = true },
    ["@markup.heading.5"]            = { fg = c.func, bold = true },
    ["@markup.heading.6"]            = { fg = c.func, bold = true },

    ["@markup.quote"]                = { fg = c.comment, italic = true },
    ["@markup.math"]                 = { fg = c.number },

    ["@markup.link"]                 = { link = "VoidpulseMarkupLink" },
    ["@markup.link.label"]           = { link = "VoidpulseMarkupLink" },
    ["@markup.link.url"]             = { fg = c.info, underline = true },

    ["@markup.raw"]                  = { link = "VoidpulseMarkupCode" },
    ["@markup.raw.block"]            = { link = "VoidpulseMarkupCode" },

    ["@markup.list"]                 = { link = "VoidpulseMarkupList" },
    ["@markup.list.checked"]         = { fg = c.git_add },
    ["@markup.list.unchecked"]       = { fg = c.comment },

    ["@diff.plus"]                   = { link = "VoidpulseAdded" },
    ["@diff.minus"]                  = { link = "VoidpulseRemoved" },
    ["@diff.delta"]                  = { link = "VoidpulseChanged" },

    ["@tag"]                         = { link = "VoidpulseTag" },
    ["@tag.attribute"]               = { link = "VoidpulseAttribute" },
    ["@tag.delimiter"]               = { link = "VoidpulseDelimiter" },
  }
end

return M
```

**Step 2: Create LSP highlights module (convert from existing)**

```lua
-- lua/voidpulse/highlights/integrations/lsp.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic

  return {
    DiagnosticError            = { fg = c.error },
    DiagnosticWarn             = { fg = c.warning },
    DiagnosticInfo             = { fg = c.info },
    DiagnosticHint             = { fg = c.hint },
    DiagnosticOk               = { fg = c.git_add },

    DiagnosticVirtualTextError = { fg = c.error, italic = true },
    DiagnosticVirtualTextWarn  = { fg = c.warning, italic = true },
    DiagnosticVirtualTextInfo  = { fg = c.info, italic = true },
    DiagnosticVirtualTextHint  = { fg = c.hint, italic = true },
    DiagnosticVirtualTextOk    = { fg = c.git_add, italic = true },

    DiagnosticUnderlineError   = { sp = c.error, undercurl = true },
    DiagnosticUnderlineWarn    = { sp = c.warning, undercurl = true },
    DiagnosticUnderlineInfo    = { sp = c.info, undercurl = true },
    DiagnosticUnderlineHint    = { sp = c.hint, undercurl = true },
    DiagnosticUnderlineOk      = { sp = c.git_add, undercurl = true },

    DiagnosticFloatingError    = { fg = c.error },
    DiagnosticFloatingWarn     = { fg = c.warning },
    DiagnosticFloatingInfo     = { fg = c.info },
    DiagnosticFloatingHint     = { fg = c.hint },
    DiagnosticFloatingOk       = { fg = c.git_add },

    DiagnosticSignError        = { fg = c.error },
    DiagnosticSignWarn         = { fg = c.warning },
    DiagnosticSignInfo         = { fg = c.info },
    DiagnosticSignHint         = { fg = c.hint },
    DiagnosticSignOk           = { fg = c.git_add },

    LspReferenceText           = { bg = c.selection },
    LspReferenceRead           = { bg = c.selection },
    LspReferenceWrite          = { bg = c.selection },

    LspSignatureActiveParameter = { fg = c.match, bold = true },

    LspCodeLens                = { fg = c.comment },
    LspCodeLensSeparator       = { fg = c.border },

    LspInlayHint               = { fg = c.comment, italic = true },

    ["@lsp.type.class"]         = { link = "VoidpulseType" },
    ["@lsp.type.comment"]       = { link = "VoidpulseComment" },
    ["@lsp.type.decorator"]     = { link = "VoidpulseAttribute" },
    ["@lsp.type.enum"]          = { link = "VoidpulseType" },
    ["@lsp.type.enumMember"]    = { link = "VoidpulseConstant" },
    ["@lsp.type.function"]      = { link = "VoidpulseFunction" },
    ["@lsp.type.interface"]     = { link = "VoidpulseType" },
    ["@lsp.type.keyword"]       = { link = "VoidpulseKeyword" },
    ["@lsp.type.macro"]         = { link = "VoidpulseMacro" },
    ["@lsp.type.method"]        = { link = "VoidpulseFunction" },
    ["@lsp.type.namespace"]     = { fg = c.fg },
    ["@lsp.type.number"]        = { link = "VoidpulseNumber" },
    ["@lsp.type.operator"]      = { link = "VoidpulseOperator" },
    ["@lsp.type.parameter"]     = { link = "VoidpulseParameter" },
    ["@lsp.type.property"]      = { link = "VoidpulseProperty" },
    ["@lsp.type.string"]        = { link = "VoidpulseString" },
    ["@lsp.type.struct"]        = { link = "VoidpulseType" },
    ["@lsp.type.type"]          = { link = "VoidpulseType" },
    ["@lsp.type.typeParameter"] = { link = "VoidpulseType" },
    ["@lsp.type.variable"]      = { link = "VoidpulseVariable" },

    ["@lsp.mod.deprecated"]     = { strikethrough = true },
    ["@lsp.mod.readonly"]       = { link = "VoidpulseConstant" },
    ["@lsp.mod.defaultLibrary"] = { link = "VoidpulseVariableBuiltin" },
  }
end

return M
```

**Step 3: Commit**

```bash
git add lua/voidpulse/highlights/integrations/
git commit -m "feat: add integration highlight modules (treesitter, lsp)"
```

---

### Task 9: Update Plugin Highlights to Return Pattern

**Files:**
- Modify: `lua/voidpulse/highlights/plugins/init.lua`
- Modify: `lua/voidpulse/highlights/plugins/telescope.lua`
- Modify: `lua/voidpulse/highlights/plugins/nvim-cmp.lua`
- Modify: `lua/voidpulse/highlights/plugins/gitsigns.lua`
- Modify: `lua/voidpulse/highlights/plugins/nvimtree.lua` → rename to `nvim-tree.lua`

**Step 1: Update plugins init.lua**

```lua
-- lua/voidpulse/highlights/plugins/init.lua
local M = {}

local bundled = {
  "telescope",
  "nvim-tree",
  "nvim-cmp",
  "gitsigns",
  "whichkey",
  "indent-blankline",
  "dashboard",
  "lazy",
  "flash",
  "mason",
  "noice",
  "mini",
  "leap",
  "notify",
}

function M.setup(colors, config)
  local highlights = {}

  for _, name in ipairs(bundled) do
    local ok, plugin = pcall(require, "voidpulse.highlights.plugins." .. name)
    if ok then
      local plugin_hl = plugin.setup(colors, config)
      for k, v in pairs(plugin_hl) do
        highlights[k] = v
      end
    end
  end

  return highlights
end

return M
```

**Step 2: Update telescope.lua**

```lua
-- lua/voidpulse/highlights/plugins/telescope.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    TelescopeNormal         = { fg = c.fg, bg = p.bg_float },
    TelescopeBorder         = { fg = c.border, bg = p.bg_float },
    TelescopePromptNormal   = { fg = c.fg, bg = p.bg_alt },
    TelescopePromptBorder   = { fg = c.border, bg = p.bg_alt },
    TelescopePromptTitle    = { fg = p.bg, bg = c.func, bold = true },
    TelescopePreviewTitle   = { fg = p.bg, bg = c.info, bold = true },
    TelescopeResultsTitle   = { fg = p.bg, bg = c.string, bold = true },
    TelescopeSelection      = { bg = c.selection, bold = true },
    TelescopeSelectionCaret = { fg = c.match },
    TelescopeMultiSelection = { bg = c.selection },
    TelescopeMultiIcon      = { fg = c.info },
    TelescopeMatching       = { fg = c.match, bold = true },
    TelescopePromptPrefix   = { fg = c.func },
    TelescopePromptCounter  = { fg = c.comment },
  }
end

return M
```

**Step 3: Update nvim-cmp.lua**

```lua
-- lua/voidpulse/highlights/plugins/nvim-cmp.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    CmpItemAbbr              = { fg = c.fg },
    CmpItemAbbrDeprecated    = { fg = c.comment, strikethrough = true },
    CmpItemAbbrMatch         = { fg = c.match, bold = true },
    CmpItemAbbrMatchFuzzy    = { fg = c.match, bold = true },
    CmpItemKind              = { fg = c.special },
    CmpItemMenu              = { fg = c.comment },

    CmpItemKindText          = { fg = c.fg },
    CmpItemKindMethod        = { fg = c.func },
    CmpItemKindFunction      = { fg = c.func },
    CmpItemKindConstructor   = { fg = c.type },
    CmpItemKindField         = { fg = c.field },
    CmpItemKindVariable      = { fg = c.variable },
    CmpItemKindClass         = { fg = c.type },
    CmpItemKindInterface     = { fg = c.type },
    CmpItemKindModule        = { fg = c.keyword },
    CmpItemKindProperty      = { fg = c.property },
    CmpItemKindUnit          = { fg = c.number },
    CmpItemKindValue         = { fg = c.constant },
    CmpItemKindEnum          = { fg = c.type },
    CmpItemKindKeyword       = { fg = c.keyword },
    CmpItemKindSnippet       = { fg = c.special },
    CmpItemKindColor         = { fg = c.special },
    CmpItemKindFile          = { fg = c.info },
    CmpItemKindReference     = { fg = c.info },
    CmpItemKindFolder        = { fg = c.info },
    CmpItemKindEnumMember    = { fg = c.constant },
    CmpItemKindConstant      = { fg = c.constant },
    CmpItemKindStruct        = { fg = c.type },
    CmpItemKindEvent         = { fg = c.special },
    CmpItemKindOperator      = { fg = c.operator },
    CmpItemKindTypeParameter = { fg = c.type },

    CmpDocumentation         = { fg = c.fg, bg = p.bg_float },
    CmpDocumentationBorder   = { fg = c.border, bg = p.bg_float },
  }
end

return M
```

**Step 4: Update gitsigns.lua**

```lua
-- lua/voidpulse/highlights/plugins/gitsigns.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic

  return {
    GitSignsAdd              = { fg = c.git_add },
    GitSignsChange           = { fg = c.git_change },
    GitSignsDelete           = { fg = c.git_delete },
    GitSignsAddNr            = { fg = c.git_add },
    GitSignsChangeNr         = { fg = c.git_change },
    GitSignsDeleteNr         = { fg = c.git_delete },
    GitSignsAddLn            = { bg = c.diff_add },
    GitSignsChangeLn         = { bg = c.diff_change },
    GitSignsDeleteLn         = { bg = c.diff_delete },
    GitSignsAddInline        = { bg = c.diff_add },
    GitSignsChangeInline     = { bg = c.diff_change },
    GitSignsDeleteInline     = { bg = c.diff_delete },
    GitSignsAddLnInline      = { bg = c.diff_add },
    GitSignsChangeLnInline   = { bg = c.diff_change },
    GitSignsDeleteLnInline   = { bg = c.diff_delete },
    GitSignsAddPreview       = { fg = c.git_add },
    GitSignsDeletePreview    = { fg = c.git_delete },
    GitSignsCurrentLineBlame = { fg = c.comment, italic = true },
    GitSignsAddVirtLn        = { fg = c.git_add },
    GitSignsChangeVirtLn     = { fg = c.git_change },
    GitSignsDeleteVirtLn     = { fg = c.git_delete },
  }
end

return M
```

**Step 5: Create nvim-tree.lua (rename from nvimtree.lua)**

```lua
-- lua/voidpulse/highlights/plugins/nvim-tree.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    NvimTreeNormal           = { fg = c.fg, bg = p.bg_alt },
    NvimTreeNormalNC         = { fg = c.fg, bg = p.bg_alt },
    NvimTreeWinSeparator     = { fg = c.border, bg = p.bg_alt },
    NvimTreeCursorLine       = { bg = c.cursor_line },
    NvimTreeCursorColumn     = { bg = c.cursor_line },

    NvimTreeRootFolder       = { fg = c.func, bold = true },
    NvimTreeFolderName       = { fg = c.func },
    NvimTreeFolderIcon       = { fg = c.func },
    NvimTreeOpenedFolderName = { fg = c.func, bold = true },
    NvimTreeEmptyFolderName  = { fg = c.comment },
    NvimTreeSymlinkFolderName = { fg = c.info },

    NvimTreeFileName         = { fg = c.fg },
    NvimTreeExecFile         = { fg = c.string, bold = true },
    NvimTreeSpecialFile      = { fg = c.special },
    NvimTreeImageFile        = { fg = c.special },
    NvimTreeSymlink          = { fg = c.info },

    NvimTreeIndentMarker     = { fg = c.border },
    NvimTreeBookmark         = { fg = c.match },

    NvimTreeGitDirty         = { fg = c.git_change },
    NvimTreeGitStaged        = { fg = c.git_add },
    NvimTreeGitMerge         = { fg = c.git_change },
    NvimTreeGitRenamed       = { fg = c.git_change },
    NvimTreeGitNew           = { fg = c.git_add },
    NvimTreeGitDeleted       = { fg = c.git_delete },
    NvimTreeGitIgnored       = { fg = c.comment },

    NvimTreeModifiedFile     = { fg = c.git_change },
  }
end

return M
```

**Step 6: Commit**

```bash
git rm lua/voidpulse/highlights/plugins/nvimtree.lua
git add lua/voidpulse/highlights/plugins/init.lua
git add lua/voidpulse/highlights/plugins/telescope.lua
git add lua/voidpulse/highlights/plugins/nvim-cmp.lua
git add lua/voidpulse/highlights/plugins/gitsigns.lua
git add lua/voidpulse/highlights/plugins/nvim-tree.lua
git commit -m "feat: update plugin highlights to return pattern"
```

---

### Task 10: Update Remaining Plugin Highlights

**Files:**
- Modify: All remaining plugin files in `lua/voidpulse/highlights/plugins/`

**Step 1: Update whichkey.lua**

```lua
-- lua/voidpulse/highlights/plugins/whichkey.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    WhichKey          = { fg = c.func },
    WhichKeyGroup     = { fg = c.keyword },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyDesc      = { fg = c.fg },
    WhichKeyValue     = { fg = c.comment },
    WhichKeyFloat     = { bg = p.bg_float },
    WhichKeyBorder    = { fg = c.border, bg = p.bg_float },
  }
end

return M
```

**Step 2: Update indent-blankline.lua**

```lua
-- lua/voidpulse/highlights/plugins/indent-blankline.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    IblIndent    = { fg = p.bg_highlight },
    IblWhitespace = { fg = p.bg_highlight },
    IblScope     = { fg = c.border },
    IndentBlanklineChar = { fg = p.bg_highlight },
    IndentBlanklineSpaceChar = { fg = p.bg_highlight },
    IndentBlanklineSpaceCharBlankline = { fg = p.bg_highlight },
    IndentBlanklineContextChar = { fg = c.border },
    IndentBlanklineContextStart = { sp = c.border, underline = true },
  }
end

return M
```

**Step 3: Update dashboard.lua**

```lua
-- lua/voidpulse/highlights/plugins/dashboard.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    DashboardHeader   = { fg = c.func },
    DashboardCenter   = { fg = c.info },
    DashboardShortCut = { fg = c.keyword },
    DashboardFooter   = { fg = c.comment, italic = true },
    DashboardKey      = { fg = c.match },
    DashboardDesc     = { fg = c.fg },
    DashboardIcon     = { fg = c.func },
  }
end

return M
```

**Step 4: Update lazy.lua**

```lua
-- lua/voidpulse/highlights/plugins/lazy.lua
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
```

**Step 5: Update flash.lua**

```lua
-- lua/voidpulse/highlights/plugins/flash.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    FlashBackdrop = { fg = c.comment },
    FlashLabel    = { fg = p.bg, bg = c.match, bold = true },
    FlashMatch    = { fg = c.match },
    FlashCurrent  = { fg = c.search },
    FlashCursor   = { fg = p.bg, bg = c.cursor },
  }
end

return M
```

**Step 6: Update mason.lua**

```lua
-- lua/voidpulse/highlights/plugins/mason.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    MasonHeader                    = { fg = p.bg, bg = c.func, bold = true },
    MasonHeaderSecondary           = { fg = p.bg, bg = c.info, bold = true },
    MasonHighlight                 = { fg = c.info },
    MasonHighlightBlock            = { fg = p.bg, bg = c.info },
    MasonHighlightBlockBold        = { fg = p.bg, bg = c.info, bold = true },
    MasonHighlightSecondary        = { fg = c.match },
    MasonHighlightBlockSecondary   = { fg = p.bg, bg = c.match },
    MasonHighlightBlockBoldSecondary = { fg = p.bg, bg = c.match, bold = true },
    MasonMuted                     = { fg = c.comment },
    MasonMutedBlock                = { fg = c.comment, bg = p.bg_alt },
    MasonError                     = { fg = c.error },
    MasonWarning                   = { fg = c.warning },
  }
end

return M
```

**Step 7: Update noice.lua**

```lua
-- lua/voidpulse/highlights/plugins/noice.lua
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
```

**Step 8: Update mini.lua**

```lua
-- lua/voidpulse/highlights/plugins/mini.lua
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
```

**Step 9: Update leap.lua**

```lua
-- lua/voidpulse/highlights/plugins/leap.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    LeapMatch         = { fg = c.match, bold = true },
    LeapLabelPrimary  = { fg = p.bg, bg = c.match, bold = true },
    LeapLabelSecondary = { fg = p.bg, bg = c.info, bold = true },
    LeapBackdrop      = { fg = c.comment },
  }
end

return M
```

**Step 10: Update notify.lua**

```lua
-- lua/voidpulse/highlights/plugins/notify.lua
local M = {}

function M.setup(colors, config)
  local c = colors.semantic
  local p = colors.palette

  return {
    NotifyERRORBorder = { fg = c.error },
    NotifyERRORIcon   = { fg = c.error },
    NotifyERRORTitle  = { fg = c.error, bold = true },
    NotifyERRORBody   = { fg = c.fg },

    NotifyWARNBorder  = { fg = c.warning },
    NotifyWARNIcon    = { fg = c.warning },
    NotifyWARNTitle   = { fg = c.warning, bold = true },
    NotifyWARNBody    = { fg = c.fg },

    NotifyINFOBorder  = { fg = c.info },
    NotifyINFOIcon    = { fg = c.info },
    NotifyINFOTitle   = { fg = c.info, bold = true },
    NotifyINFOBody    = { fg = c.fg },

    NotifyDEBUGBorder = { fg = c.comment },
    NotifyDEBUGIcon   = { fg = c.comment },
    NotifyDEBUGTitle  = { fg = c.comment, bold = true },
    NotifyDEBUGBody   = { fg = c.fg },

    NotifyTRACEBorder = { fg = c.hint },
    NotifyTRACEIcon   = { fg = c.hint },
    NotifyTRACETitle  = { fg = c.hint, bold = true },
    NotifyTRACEBody   = { fg = c.fg },

    NotifyBackground  = { bg = p.bg_float },
  }
end

return M
```

**Step 11: Commit**

```bash
git add lua/voidpulse/highlights/plugins/
git commit -m "feat: update remaining plugin highlights to return pattern"
```

---

### Task 11: Update Highlights Orchestrator

**Files:**
- Modify: `lua/voidpulse/highlights/init.lua`

**Step 1: Rewrite highlights init.lua as orchestrator**

```lua
local M = {}

function M.setup(colors, config)
  local highlights = {}

  local function safe_require(module_name, label)
    local ok, mod = pcall(require, module_name)
    if not ok then
      vim.notify(string.format("[voidpulse] Failed to load %s: %s", label or module_name, mod), vim.log.levels.WARN)
      return nil
    end
    return mod
  end

  local function safe_setup(module_name, label)
    local mod = safe_require(module_name, label)
    if not mod then
      return nil
    end

    local ok, result = pcall(mod.setup, colors, config)
    if not ok then
      vim.notify(string.format("[voidpulse] %s setup failed: %s", label or module_name, result), vim.log.levels.WARN)
      return nil
    end

    if type(result) ~= "table" then
      vim.notify(string.format("[voidpulse] %s setup returned no highlights", label or module_name), vim.log.levels.WARN)
      return nil
    end

    return result
  end

  local function merge(tbl)
    if type(tbl) ~= "table" then
      return
    end
    for k, v in pairs(tbl) do
      highlights[k] = v
    end
  end

  merge(safe_setup("voidpulse.highlights.core.semantic", "semantic highlights"))
  merge(safe_setup("voidpulse.highlights.core.editor", "core editor highlights"))
  merge(safe_setup("voidpulse.highlights.core.syntax", "core syntax highlights"))

  if config.integrations.treesitter then
    merge(safe_setup("voidpulse.highlights.integrations.treesitter", "treesitter highlights"))
  end

  if config.integrations.lsp then
    merge(safe_setup("voidpulse.highlights.integrations.lsp", "lsp highlights"))
  end

  local plugins = safe_setup("voidpulse.highlights.plugins", "plugin highlights")
  merge(plugins)

  return highlights
end

return M
```

**Step 2: Commit**

```bash
git add lua/voidpulse/highlights/init.lua
git commit -m "feat: rewrite highlights init as orchestrator"
```

---

### Task 12: Update Colors Entry Point & Cleanup

**Files:**
- Modify: `colors/voidpulse.lua`
- Delete: `lua/voidpulse/colors.lua`
- Delete: `lua/voidpulse/highlights/editor.lua`
- Delete: `lua/voidpulse/highlights/syntax.lua`
- Delete: `lua/voidpulse/highlights/treesitter.lua`
- Delete: `lua/voidpulse/highlights/lsp.lua`

**Step 1: Simplify colors/voidpulse.lua**

```lua
require("voidpulse").load()
```

**Step 2: Delete old files**

```bash
git rm lua/voidpulse/colors.lua
git rm lua/voidpulse/highlights/editor.lua
git rm lua/voidpulse/highlights/syntax.lua
git rm lua/voidpulse/highlights/treesitter.lua
git rm lua/voidpulse/highlights/lsp.lua
```

**Step 3: Commit**

```bash
git add colors/voidpulse.lua
git commit -m "chore: simplify colors entry point and remove old files"
```

---

### Task 13: Final Verification

**Step 1: Test the colorscheme loads without errors**

Run in Neovim:
```vim
:colorscheme voidpulse
:messages
```

Expected: No error messages, colorscheme applies correctly.

**Step 2: Test setup with options**

Run in Neovim:
```lua
require("voidpulse").setup({
  transparent = false,
  dim_inactive = true,
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
  },
})
:colorscheme voidpulse
```

Expected: Options apply correctly.

**Step 3: Test plugin registration**

Run in Neovim:
```lua
require("voidpulse").register_plugin("test", function(colors, config)
  return {
    TestHighlight = { fg = colors.semantic.error, bold = true },
  }
end)
:highlight TestHighlight
```

Expected: Shows `TestHighlight xxx ctermfg=... guifg=#FF6C91 gui=bold`

**Step 4: Commit final state**

```bash
git add -A
git commit -m "chore: final cleanup and verification"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | Registry module | +1 |
| 2 | Config module | +1 |
| 3 | Palette system | +2 |
| 4 | Enhanced utils | ~1 |
| 5 | Loader module | +1 |
| 6 | Public API rewrite | ~1 |
| 7 | Core highlight modules | +3 |
| 8 | Integration modules | +2 |
| 9 | Plugin highlights (first batch) | ~5 |
| 10 | Plugin highlights (remaining) | ~9 |
| 11 | Highlights orchestrator | ~1 |
| 12 | Cleanup | -5, ~1 |
| 13 | Verification | - |

**Total: +10 new files, ~18 modified files, -5 deleted files**
