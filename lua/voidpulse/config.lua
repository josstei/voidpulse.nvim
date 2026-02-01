local M = {}

M.defaults = {
  palette = "voidpulse",
  transparent = false,
  dim_inactive = false,

  styles = {
    comments  = { italic = true },
    keywords  = { bold = false },
    functions = { bold = false },
    variables = {},
    types     = {},
    strings   = {},
  },

  integrations = {
    treesitter = true,
    lsp        = true,
  },

  on_highlights = nil,
}

function M.resolve(opts)
  opts = opts or {}
  local config = vim.tbl_deep_extend("force", {}, M.defaults, opts)

  if config.on_highlights and type(config.on_highlights) ~= "function" then
    vim.notify("[voidpulse] on_highlights must be a function", vim.log.levels.WARN)
    config.on_highlights = nil
  end

  return config
end

return M
