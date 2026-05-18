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

return M
