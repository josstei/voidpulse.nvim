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
