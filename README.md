# voidpulse.nvim

### Inspired by black holes. Designed for focus.

Voidpulse is a deep space–inspired dark theme for Neovim. It features a vibrant, high-contrast palette built for readability in long coding sessions. With full support for LSPs, popular plugins, and easy customization, Voidpulse provides a consistent, calming experience across your workflow.

![Screenshot_Demo](https://github.com/user-attachments/assets/c2cdfabe-5874-4838-a610-de7cd6ea6794)

---

## ✨ Features

- **Modern Dark Design**: Deep space-inspired color palette with purples, blues, and vibrant accents.
- **Excellent Readability**: High-contrast for long coding sessions.
- **Comprehensive Plugin Support**: Built-in highlights for popular Neovim plugins.
- **LSP & Diagnostics**: Full support for LSP, diagnostics, and inlay hints.
- **Customizable**: Transparent background, dim inactive windows, and style overrides.
- **Integrated Terminal Colors**: Seamless look in Neovim's terminal.
- **Treesitter Ready**: Enhanced syntax support for modern Neovim setups.

---

## 📦 Installation

### Requirements

- Neovim 0.7 or newer
- Lua enabled in your config

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "josstei/voidpulse.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("voidpulse").setup()
    vim.cmd.colorscheme("voidpulse")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "josstei/voidpulse.nvim",
  config = function()
    require("voidpulse").setup()
    vim.cmd.colorscheme("voidpulse")
  end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'josstei/voidpulse.nvim'
```

Then in your `init.lua` or `init.vim`:

```lua
require("voidpulse").setup()
vim.cmd.colorscheme("voidpulse")
```

---

## ⚙️ Configuration

VoidPulse is highly customizable:

```lua
require("voidpulse").setup({
  transparent = false,      -- Enable transparent background
  dim_inactive = false,     -- Dim inactive windows

  styles = {
    comments = { italic = true },   -- Style for comments
    keywords = { bold = true },     -- Style for keywords
    functions = { bold = true },    -- Style for functions
  },
})
```

**Options:**

| Option               | Type    | Default            | Description                                  |
|----------------------|---------|--------------------|----------------------------------------------|
| `transparent`        | boolean | `false`            | Makes the background transparent             |
| `dim_inactive`       | boolean | `false`            | Dims inactive windows                        |
| `styles.comments`    | table   | `{ italic = true }`| Styling for comments                         |
| `styles.keywords`    | table   | `{ bold = true }`  | Styling for keywords                         |
| `styles.functions`   | table   | `{ bold = true }`  | Styling for functions                        |

**Transparent Background:**  
_This feature is a work in progress. Some window types may not yet support full transparency._

---

## 🎨 Color Palette

VoidPulse features a carefully curated color palette inspired by the depths of space:

- **Backgrounds**:  
  - Primary: `#0D1126`  
  - Secondary: `#141A35` to `#2A305E`  
  - Float: `#111729`  
  - Dark: `#09091F`
- **Foregrounds**:  
  - Primary: `#F8F8FF`  
  - Secondary: `#DCD6FF` to `#9B94E6`
- **Accents**:  
  - Blue: `#82AAFF`  
  - Cyan: `#5FFFD3`  
  - Green: `#A4FFB0`  
  - Purple: `#A97CFF`  
  - Magenta: `#C85CFF`  
  - Pink: `#FF3CCF`  
  - Red: `#FF6C91`  
  - Orange: `#FFB86C`  
  - Yellow: `#FFEA70`

---

## 🔌 Plugin Support

VoidPulse includes built-in highlights for many popular plugins:

- **LSP & Diagnostics**: Full support for diagnostics, references, code lens, inlay hints.
- **Treesitter**: Enhanced language support.
- **nvim-tree.lua**: File explorer with custom icons and Git indicators.
- **lazy.nvim**: Plugin manager UI.
- **nvim-notify**: Notification system with severity-based colors.
- **leap.nvim**: Motion plugin with distinct highlight groups.
- **dashboard-nvim**: Custom start screen.

---

## 🎯 Usage

### Set the Colorscheme

After installation:

```lua
vim.cmd.colorscheme("voidpulse")
```

### Access Colors Programmatically

```lua
local colors = require("voidpulse").get_colors()
print(colors.blue)  -- #82AAFF
```

### Check Current Configuration

```lua
local config = require("voidpulse").get_config()
print(vim.inspect(config))
```

---

## 🤝 Contributing

Contributions are welcome! You can:

- Add support for more plugins
- Improve highlight groups
- Fix color consistency
- Suggest new features

Open an issue or a pull request to get started.

---

## 📄 License

This theme is available under the MIT License. See the [LICENSE](LICENSE) file for details.

---

**Enjoy coding in the void! 🚀**
