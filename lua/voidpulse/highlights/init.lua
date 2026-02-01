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
