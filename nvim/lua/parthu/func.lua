-- User Commands

vim.api.nvim_create_user_command('GitBlameLine', function()
    local line_number = vim.fn.line '.' -- Get the current line number. See `:h line()`
    local filename = vim.api.nvim_buf_get_name(0)
    print(vim.fn.system { 'git', 'blame', '-L', line_number .. ',+1', filename })
end, { desc = 'Print the git blame for the current line' })

-- Schedule (Asynchronous execution)

-- Use system clipboard `+` for yank and paste
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

-- Auto Commands

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})
