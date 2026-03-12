return {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('tokyonight').setup {
            styles = {
                comments = { italic = true },
            },
            transparent = true,
            on_highlights = function(hl, _)
                -- Make comments brighter
                hl.Comment = {
                    fg = '#6a75a3',
                    italic = true,
                }
            end,
        }

        -- Load the colorscheme here.
        -- Like many other themes, this one has different styles, and you could load
        -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.

        vim.cmd.colorscheme 'tokyonight-night'
    end,
}
