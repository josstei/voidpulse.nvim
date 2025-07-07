-- Main highlights coordinator
local M = {}

M.setup = function(colors, utils)
  -- Load all highlight modules
  require("voidpulse.highlights.editor").setup(colors, utils)
  require("voidpulse.highlights.syntax").setup(colors, utils)
  require("voidpulse.highlights.treesitter").setup(colors, utils)
  require("voidpulse.highlights.lsp").setup(colors, utils)
  require("voidpulse.highlights.plugins").setup(colors, utils)
end

return M
