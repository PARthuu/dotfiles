-- User Commands

vim.api.nvim_create_user_command('GitBlameLine', function()
    local line_number = vim.fn.line '.' -- Get the current line number. See `:h line()`
    local filename = vim.api.nvim_buf_get_name(0)
    print(vim.fn.system { 'git', 'blame', '-L', line_number .. ',+1', filename })
end, { desc = 'Print the git blame for the current line' })

function _G.AlignOn(delim)
    local start_line = vim.fn.line "'<"
    local end_line = vim.fn.line "'>"

    -- fix reversed selection
    if start_line > end_line then
        start_line, end_line = end_line, start_line
    end

    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

    local max = 0
    local split = {}

    for i, line in ipairs(lines) do
        local left, right = line:match('^(.-)%s*' .. vim.pesc(delim) .. '%s*(.*)$')

        split[i] = { left, right }

        if left and right then
            max = math.max(max, vim.fn.strdisplaywidth(left))
        end
    end

    for i, parts in ipairs(split) do
        local left, right = parts[1], parts[2]

        if left and right then
            lines[i] = left .. string.rep(' ', max - vim.fn.strdisplaywidth(left)) .. ' ' .. delim .. ' ' .. right
        end
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
