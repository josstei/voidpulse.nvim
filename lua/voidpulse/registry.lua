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
