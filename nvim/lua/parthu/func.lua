-- User Commands

vim.api.nvim_create_user_command('GitBlameLine', function()
    local line_number = vim.fn.line '.' -- Get the current line number. See `:h line()`
    local filename = vim.api.nvim_buf_get_name(0)
    print(vim.fn.system { 'git', 'blame', '-L', line_number .. ',+1', filename })
end, { desc = 'Print the git blame for the current line' })

function _G.AlignOn(delim)
    local start_pos = vim.fn.getpos 'v'
    local end_pos = vim.fn.getpos '.'

    local start_line = start_pos[2]
    local end_line = end_pos[2]

    -- fix reversed selection
    if start_line > end_line then
        start_line, end_line = end_line, start_line
    end

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'x', false)

    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
    if #lines == 0 then
        return
    end

    local max_width = 0
    local processed_lines = {}

    local escaped_delim = vim.pesc(delim)

    for i, line in ipairs(lines) do
        local left, right = line:match('^(.-)%s*' .. escaped_delim .. '%s*(.*)$')

        processed_lines[i] = { left, right }

        if left and right then
            local width = vim.fn.strdisplaywidth(left)
            max_width = math.max(max_width, width)
            processed_lines[i] = { left = left, right = right, has_delim = true }
            -- max = math.max(max, vim.fn.strdisplaywidth(left))
        else
            processed_lines[i] = { original = line, has_delim = false }
        end
    end

    for i, data in ipairs(processed_lines) do
        if data.has_delim then
            local padding = string.rep(' ', max_width - vim.fn.strdisplaywidth(data.left))
            lines[i] = data.left .. padding .. ' ' .. delim .. ' ' .. data.right
        else
            lines[i] = data.original
        end

        -- local left, right = data[1], data[2]
        --
        -- if left and right then
        --     lines[i] = left .. string.rep(' ', max - vim.fn.strdisplaywidth(left)) .. ' ' .. delim .. ' ' .. right
        -- end
    end

    vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
end

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
