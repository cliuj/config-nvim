local M = {}

function M.cmd_if(name)
    local cmd_name = name:match('^%S+')
    return function()
        if vim.fn.exists(':' .. cmd_name) == 2 then
            vim.cmd(name)
        else
            vim.notify(cmd_name .. ' not installed', vim.log.levels.WARN)
        end
    end
end

-- Command-line abbreviations for :find and friends.
-- Only expand at the start of an ex command, so they don't fire mid-line.
function M.cabbrev(lhs, rhs)
    vim.cmd(string.format(
        "cnoreabbrev <expr> %s (getcmdtype() == ':' && getcmdline() ==# '%s') ? '%s' : '%s'",
        lhs, lhs, rhs, lhs
    ))
end

return M
