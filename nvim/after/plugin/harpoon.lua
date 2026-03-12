local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- Add current file to Harpoon list
vim.keymap.set('n', '<leader>a', function()
    harpoon:list():add()
end, { desc = 'Harpoon: Add current file to list' })

-- Toggle Harpoon quick menu UI
vim.keymap.set('n', '<M-e>', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Harpoon: Toggle quick menu' })

-- Navigate to Harpoon file 1
vim.keymap.set('n', '<M-1>', function()
    harpoon:list():select(1)
end, { desc = 'Harpoon: Go to file 1' })

-- Navigate to Harpoon file 2
vim.keymap.set('n', '<M-2>', function()
    harpoon:list():select(2)
end, { desc = 'Harpoon: Go to file 2' })

-- Navigate to Harpoon file 3
vim.keymap.set('n', '<M-3>', function()
    harpoon:list():select(3)
end, { desc = 'Harpoon: Go to file 3' })

-- Navigate to Harpoon file 4
vim.keymap.set('n', '<M-4>', function()
    harpoon:list():select(4)
end, { desc = 'Harpoon: Go to file 4' })

-- Navigate to previous file in Harpoon list
vim.keymap.set('n', '<M-,>', function()
    harpoon:list():prev()
end, { desc = 'Harpoon: Go to previous file in list' })

-- Navigate to next file in Harpoon list
vim.keymap.set('n', '<M-.>', function()
    harpoon:list():next()
end, { desc = 'Harpoon: Go to next file in list' })
