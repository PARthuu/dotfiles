-- ╭──────────────────────────────────────────────────────────╮
-- │                   General Mappings                       │
-- ╰──────────────────────────────────────────────────────────╯

-- Open file explorer (netrw)
vim.keymap.set('n', '<C-q>', vim.cmd.Ex, { desc = 'Open file explorer (netrw)' })

-- Select all in normal mode
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all text in buffer' })

-- Switch to alternate file (last used buffer)
vim.keymap.set('n', '<C-z>', '<C-6>', { desc = 'Switch to alternate file' })

-- Disable search highlight
vim.cmd 'packadd! nohlsearch'
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

-- Restart LSP
vim.keymap.set('n', '<leader>zig', '<cmd>lsp restart<cr>', { desc = 'Restart LSP' })

-- Open diagnostics in location list
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- ╭──────────────────────────────────────────────────────────╮
-- │                  Visual Mode Enhancements                │
-- ╰──────────────────────────────────────────────────────────╯

-- Move selected lines up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Paste without overwriting register
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without replacing register' })

-- Copy to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank line to system clipboard' })

-- Delete without affecting register
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without yanking' })

-- ╭──────────────────────────────────────────────────────────╮
-- │                    Movement Tweaks                       │
-- ╰──────────────────────────────────────────────────────────╯

-- Join lines and keep cursor position
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines (keep cursor)' })

-- Scroll up/down and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up (centered)' })

-- Centered search navigation
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })

-- Format paragraph and return cursor
vim.keymap.set('n', '=ap', "ma=ap'a", { desc = 'Auto-format paragraph and return' })

-- ╭──────────────────────────────────────────────────────────╮
-- │                    Window Navigation                     │
-- ╰──────────────────────────────────────────────────────────╯

-- cd to the config directory
vim.keymap.set('n', '<leader>cc', function()
    vim.cmd('cd ' .. vim.fn.stdpath 'config')
    vim.cmd 'pwd'
end, { desc = 'CD to Config' })

-- Toggle back to the last directory
vim.keymap.set('n', '<leader>cC', ':cd -<CR>:pwd<CR>', { desc = 'CD Back to previous dir' })

-- Normal mode window navigation
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = 'Move to right window' })

-- Terminal & insert mode window navigation
vim.keymap.set({ 't', 'i' }, '<leader>h', '<C-\\><C-n><C-w>h', { desc = 'Terminal/Insert: Move left' })
vim.keymap.set({ 't', 'i' }, '<leader>j', '<C-\\><C-n><C-w>j', { desc = 'Terminal/Insert: Move down' })
vim.keymap.set({ 't', 'i' }, '<leader>k', '<C-\\><C-n><C-w>k', { desc = 'Terminal/Insert: Move up' })
vim.keymap.set({ 't', 'i' }, '<leader>l', '<C-\\><C-n><C-w>l', { desc = 'Terminal/Insert: Move right' })

-- ╭──────────────────────────────────────────────────────────╮
-- │                  Terminal Mode Mappings                  │
-- ╰──────────────────────────────────────────────────────────╯

-- Exit terminal mode using <Esc>
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Alternative terminal escape (Ctrl-c Ctrl-c)
vim.keymap.set('t', '<C-c><C-c>', '<C-\\><C-n>', { desc = 'Exit terminal (alternative)' })

-- ╭──────────────────────────────────────────────────────────╮
-- │                  Insert Mode Mappings                    │
-- ╰──────────────────────────────────────────────────────────╯

-- Forward delete (Delete key behavior)
vim.keymap.set('i', '<C-d>', '<Del>', { desc = 'Delete character under cursor (like forward delete)' })
