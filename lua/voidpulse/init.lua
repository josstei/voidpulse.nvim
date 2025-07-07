-- Main voidpulse module
local M = {}

-- Default configuration
local default_config = {
  transparent = false,
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = { bold = true },
  },
}

local config = default_config

-- Setup function
M.setup = function(opts)
  -- Merge user config with defaults
  config = vim.tbl_deep_extend("force", default_config, opts or {})
  
  -- Clear any existing colorscheme
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  vim.g.colors_name = "voidpulse"
  vim.o.termguicolors = true
  
  -- Load components
  local colors = require("voidpulse.colors")
  local utils = require("voidpulse.utils")
  
  -- Apply transparency if enabled
  if config.transparent then
    colors.palette.bg0 = "NONE"
    colors.palette.bg_float = "NONE"
  end
  
  -- Setup highlights
  require("voidpulse.highlights").setup(colors, utils)
  
  -- Setup terminal colors
  utils.set_terminal_colors(colors.palette)
end

-- Get current colors (useful for statusline themes, etc.)
M.get_colors = function()
  return require("voidpulse.colors").palette
end

-- Get current config
M.get_config = function()
  return config
end

return M
