local M = {}

M.highlight = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

M.highlight_all = function(groups)
    for group, opts in pairs(groups) do
        M.highlight(group, opts)
    end
end

M.set_terminal_colors = function(colors)
    vim.g.terminal_color_0  = colors.bg0
    vim.g.terminal_color_1  = colors.red
    vim.g.terminal_color_2  = colors.green
    vim.g.terminal_color_3  = colors.yellow
    vim.g.terminal_color_4  = colors.blue
    vim.g.terminal_color_5  = colors.magenta
    vim.g.terminal_color_6  = colors.cyan
    vim.g.terminal_color_7  = colors.fg0
    vim.g.terminal_color_8  = colors.fg2
    vim.g.terminal_color_9  = colors.red
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_11 = colors.yellow
    vim.g.terminal_color_12 = colors.blue
    vim.g.terminal_color_13 = colors.magenta
    vim.g.terminal_color_14 = colors.cyan
    vim.g.terminal_color_15 = colors.fg0
end
return M
