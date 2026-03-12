return {
    'tpope/vim-fugitive',
    config = function()
        -- Open Fugitive Git status window
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Fugitive: Open Git status' })

        local Parthu_Fugitive = vim.api.nvim_create_augroup('Parthu_Fugitive', {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd('BufWinEnter', {
            group = Parthu_Fugitive,
            pattern = '*',
            callback = function()
                if vim.bo.ft ~= 'fugitive' then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }

                -- Push current branch
                vim.keymap.set('n', '<leader>p', function()
                    vim.cmd.Git 'push'
                end, vim.tbl_extend('force', opts, { desc = 'Fugitive: Git push' }))

                -- Pull with rebase
                vim.keymap.set('n', '<leader>P', function()
                    vim.cmd.Git { 'pull', '--rebase' }
                end, vim.tbl_extend('force', opts, { desc = 'Fugitive: Git pull --rebase' }))

                -- Push and set upstream to origin
                vim.keymap.set(
                    'n',
                    '<leader>t',
                    ':Git push -u origin ',
                    vim.tbl_extend('force', opts, {
                        desc = 'Fugitive: Git push -u origin (set upstream)',
                    })
                )
            end,
        })

        -- Get diff from left side (//2) during merge conflict
        vim.keymap.set('n', 'gu', '<cmd>diffget //2<CR>', { desc = 'Fugitive: Diffget from left (//2)' })

        -- Get diff from right side (//3) during merge conflict
        vim.keymap.set('n', 'gh', '<cmd>diffget //3<CR>', { desc = 'Fugitive: Diffget from right (//3)' })
    end,
}
