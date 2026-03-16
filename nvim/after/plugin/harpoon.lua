local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- Use Telescope to search the files
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require('telescope.pickers')
        .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
                results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
        })
        :find()
end

-- Add current file to Harpoon list
vim.keymap.set('n', '<leader>a', function()
    harpoon:list():add()
end, { desc = 'Harpoon: Add current file to list' })

-- Toggle Harpoon Telescope quick menu UI
vim.keymap.set('n', '<M-e>', function()
    toggle_telescope(harpoon:list())
end, { desc = 'Open harpoon telescope window' })

-- Toggle Harpoon quick menu UI
vim.keymap.set('n', '<leader>s,', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Open harpoon window' })

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
