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
