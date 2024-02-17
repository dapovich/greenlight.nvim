local M = {}

function M.setup(opts)
    local set = vim.cmd
    local config = require "greenlight.config"
    local themes = require "greenlight.themes"

    if vim.g.colors_name then
        set.hi "clear"
    end

    if vim.fn.exists "syntax_on" then
        set.syntax "reset"
    end

    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = "greenlight"

    config:extend(opts)
    themes.load()

    if opts then
        set.colorscheme "greenlight"
    end
end

return M
