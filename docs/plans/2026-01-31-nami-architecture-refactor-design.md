# Voidpulse Architecture Refactor Design

Restructure voidpulse.nvim to mirror nami.nvim's architecture.

## Target File Structure

```
lua/voidpulse/
├── init.lua              # Public API: setup(), load(), register_plugin(), palettes()
├── config.lua            # Config defaults + resolve()
├── registry.lua          # Centralized state (config, palettes, plugins, applied flag)
├── loader.lua            # Colorscheme loading orchestrator + terminal colors
├── utils.lua             # Highlight utilities + color manipulation (darken, lighten, blend)
├── palettes/
│   ├── init.lua          # Palette validation, loading, builtin registration
│   └── voidpulse.lua     # Palette with palette{} + semantic{} tables
└── highlights/
    ├── init.lua          # Orchestrator that merges all highlight modules
    ├── core/
    │   ├── semantic.lua  # VoidpulseVariable, VoidpulseFunction, etc.
    │   ├── editor.lua    # Editor UI (Normal, Cursor, Pmenu, etc.)
    │   └── syntax.lua    # Traditional vim syntax groups
    ├── integrations/
    │   ├── treesitter.lua
    │   └── lsp.lua
    └── plugins/
        ├── init.lua
        ├── telescope.lua
        ├── nvim-cmp.lua
        ├── nvim-tree.lua
        ├── gitsigns.lua
        ├── whichkey.lua
        ├── indent-blankline.lua
        ├── dashboard.lua
        ├── lazy.lua
        ├── flash.lua
        ├── mason.lua
        ├── noice.lua
        ├── mini.lua
        ├── leap.lua
        └── notify.lua
colors/voidpulse.lua      # Just: require("voidpulse").load()
```

## Key Architectural Changes

### 1. Registry Module (Centralized State)

New file `registry.lua` manages all shared state:

- `config` - Resolved configuration
- `active_palette_name` - Currently active palette
- `palettes` - Registered palette tables
- `plugins` - Registered plugin highlight callbacks
- `applied` - Whether colorscheme has been applied

All getters return deep copies to prevent external mutation.

### 2. Two-Tier Palette System

Each palette exports two tables:

- `palette{}` - Raw hex colors (bg, fg, blue, red, etc.)
- `semantic{}` - Role mappings (keyword, string, func, error, etc.)

Highlight modules reference semantic colors, making it easy to create new palettes by remapping semantic to different raw colors.

### 3. Config Module

Separate file for configuration:

- `defaults` table with all options
- `resolve(opts)` merges user options with defaults
- Validates `on_highlights` callback type

Options include: `palette`, `transparent`, `dim_inactive`, `styles`, `integrations`, `on_highlights`.

### 4. Loader Module

Orchestrates colorscheme application:

1. Validate config and palette exist
2. Reset vim highlighting
3. Load core highlights (semantic, editor, syntax)
4. Load integration highlights (treesitter, lsp) based on config
5. Load bundled plugin highlights
6. Apply registered external plugin highlights
7. Apply user `on_highlights` overrides
8. Apply all highlights and terminal colors
9. Mark as applied

### 5. Public API (init.lua)

Clean public interface:

- `setup(opts)` - Configure and initialize
- `load()` - Load colorscheme (auto-calls setup if needed)
- `register_plugin(name, fn)` - Register external plugin highlights
- `unregister_plugin(name)` - Remove plugin registration
- `palettes()` - List available palettes

### 6. Semantic Highlights

New `core/semantic.lua` creates named highlight groups:

- `VoidpulseVariable`, `VoidpulseFunction`, `VoidpulseKeyword`, etc.
- Treesitter and other modules link to these groups
- Style changes (bold, italic) propagate automatically

### 7. Highlight Return Pattern

All highlight modules change from:

```lua
-- OLD: Apply directly
M.setup = function(colors, utils)
  utils.highlight_all({ Normal = { fg = c.fg } })
end
```

To:

```lua
-- NEW: Return table
function M.setup(colors, config)
  return { Normal = { fg = c.fg } }
end
```

### 8. Enhanced Utils

Add color manipulation functions:

- `darken(hex, amount)` - Darken by 0-100%
- `lighten(hex, amount)` - Lighten by 0-100%
- `blend(hex1, hex2, alpha)` - Mix colors (alpha 0-1)

### 9. Directory Reorganization

Highlights reorganized into:

- `core/` - Always loaded (semantic, editor, syntax)
- `integrations/` - Conditional (treesitter, lsp)
- `plugins/` - Bundled plugin support

## Files to Create

1. `lua/voidpulse/config.lua`
2. `lua/voidpulse/registry.lua`
3. `lua/voidpulse/loader.lua`
4. `lua/voidpulse/palettes/init.lua`
5. `lua/voidpulse/palettes/voidpulse.lua`
6. `lua/voidpulse/highlights/core/semantic.lua`
7. `lua/voidpulse/highlights/core/editor.lua` (move from highlights/)
8. `lua/voidpulse/highlights/core/syntax.lua` (move from highlights/)
9. `lua/voidpulse/highlights/integrations/treesitter.lua` (move from highlights/)
10. `lua/voidpulse/highlights/integrations/lsp.lua` (move from highlights/)

## Files to Modify

1. `lua/voidpulse/init.lua` - Complete rewrite
2. `lua/voidpulse/utils.lua` - Add color manipulation
3. `lua/voidpulse/highlights/init.lua` - Orchestrator pattern
4. `lua/voidpulse/highlights/plugins/init.lua` - Return pattern
5. `lua/voidpulse/highlights/plugins/*.lua` - Return pattern
6. `colors/voidpulse.lua` - Simplify to just `require("voidpulse").load()`

## Files to Delete

1. `lua/voidpulse/colors.lua` - Replaced by palettes/voidpulse.lua

## Migration Notes

- Existing color values from `colors.lua` move to `palettes/voidpulse.lua`
- All highlight modules updated to use `colors.semantic` and `colors.palette`
- Plugin file `nvimtree.lua` renamed to `nvim-tree.lua` for consistency
