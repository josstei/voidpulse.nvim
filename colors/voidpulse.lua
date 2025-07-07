if vim.g.colors_name then
  vim.cmd("highlight clear")
end

vim.g.colors_name = "voidpulse"
vim.o.termguicolors = true

require("voidpulse").setup()
