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
