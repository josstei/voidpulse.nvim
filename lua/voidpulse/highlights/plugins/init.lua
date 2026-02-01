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
