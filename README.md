# VoidPulse.nvim

A modern, elegant dark theme for Neovim with vibrant accent colors and excellent syntax highlighting support.

## ✨ Features

- **Modern Dark Design**: Deep space-inspired color palette with rich purples and blues
- **Excellent Readability**: Carefully crafted foreground/background contrast ratios
- **Comprehensive Plugin Support**: Built-in support for popular Neovim plugins
- **LSP Integration**: Full diagnostic and LSP highlighting support
- **Customizable**: Transparent background and styling options
- **Terminal Colors**: Integrated terminal color scheme
- **Treesitter Ready**: Optimized for modern syntax highlighting

## 📸 Screenshots

VoidPulse showcases its elegant dark color scheme with purple and blue tones:

![image1](image1)

> **Note on Images**: To keep the repository lightweight, screenshots and media files are stored in the `.media/` directory (excluded from git). For documentation purposes, consider using external image hosting services like GitHub releases, imgur, or other image hosting platforms to display screenshots without bloating the repository.

## 🎨 Color Palette

VoidPulse features a carefully curated color palette inspired by the depths of space:

### Background Colors
- **Primary Background**: `#0D1126` - Deep space blue
- **Secondary Backgrounds**: Gradual lightening from `#141A35` to `#2A305E`
- **Float Background**: `#111729` - For floating windows
- **Dark Background**: `#09091F` - For subtle elements

### Foreground Colors
- **Primary Text**: `#F8F8FF` - Pure white for maximum readability
- **Secondary Text**: Gradient from `#DCD6FF` to `#9B94E6`

### Accent Colors
- **Blue**: `#82AAFF` - Primary accent
- **Cyan**: `#5FFFD3` - Highlights and hints
- **Green**: `#A4FFB0` - Strings and success states
- **Purple**: `#A97CFF` - Keywords and special elements
- **Magenta**: `#C85CFF` - Functions and important elements
- **Pink**: `#FF3CCF` - Numbers and constants
- **Red**: `#FF6C91` - Errors and deletions
- **Orange**: `#FFB86C` - Warnings and booleans
- **Yellow**: `#FFEA70` - Search highlights and notes

## 📦 Installation

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

## ⚙️ Configuration

VoidPulse defaults can be customized to your preferences:

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

### Configuration Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `transparent` | boolean | `false` | Makes the background transparent |
| `dim_inactive` | boolean | `false` | Dims inactive windows |
| `styles.comments` | table | `{ italic = true }` | Styling for comments |
| `styles.keywords` | table | `{ bold = true }` | Styling for keywords |
| `styles.functions` | table | `{ bold = true }` | Styling for functions |

### Transparent Background - *** Work in Progress ***

For users who prefer a transparent background:

```lua
require("voidpulse").setup({
  transparent = true,
})
vim.cmd.colorscheme("voidpulse")
```

## 🔌 Plugin Support

VoidPulse includes support for popular Neovim plugins:

### Core Plugins
- **LSP & Diagnostics**: Full support for all LSP features including diagnostics, references, and code lenses
- **Treesitter**: Optimized syntax highlighting for all supported languages

### Supported Plugins
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**: File explorer with custom icons and Git integration
- **[lazy.nvim](https://github.com/folke/lazy.nvim)**: Plugin manager with progress indicators
- **[nvim-notify](https://github.com/rcarriga/nvim-notify)**: Notification system with severity-based colors
- **[leap.nvim](https://github.com/ggandor/leap.nvim)**: Motion plugin with distinct highlight groups
- **[dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)**: Start screen customization

### LSP Features
- Diagnostic signs and virtual text
- Error, warning, info, and hint highlighting
- Reference highlighting
- Inlay hints with subtle styling
- Code lens integration

## 🎯 Usage

### Basic Usage

After installation, simply set the colorscheme:

```lua
vim.cmd.colorscheme("voidpulse")
```

### Accessing Colors Programmatically

You can access the color palette in your own configurations:

```lua
local colors = require("voidpulse").get_colors()
print(colors.blue)  -- #82AAFF
```

### Checking Current Configuration

```lua
local config = require("voidpulse").get_config()
print(vim.inspect(config))
```

## 🤝 Contributing

Contributions are welcome! If you'd like to:

- Add support for new plugins
- Improve existing highlights
- Fix color inconsistencies
- Add new configuration options

Please feel free to open an issue or submit a pull request.

## 📄 License

This theme is available under the MIT License. See the LICENSE file for details.

---

**Enjoy coding in the void! 🚀**
