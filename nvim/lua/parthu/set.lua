vim.o.guicursor = ''

vim.o.relativenumber = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true
vim.o.scrolloff = 10

vim.o.list = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.have_nerd_font = true
vim.o.number = true
vim.opt.showmode = true
vim.opt.laststatus = 2

vim.o.breakindent = true
vim.o.undofile = true

vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.confirm = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.api.nvim_create_user_command('GitBlameLine', function()
    local line_number = vim.fn.line '.' -- Get the current line number. See `:h line()`
    local filename = vim.api.nvim_buf_get_name(0)
    print(vim.fn.system { 'git', 'blame', '-L', line_number .. ',+1', filename })
end, { desc = 'Print the git blame for the current line' })

vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown', 'md' },
    callback = function()
        vim.lsp.enable 'marksman'
    end,
})
