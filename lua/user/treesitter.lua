-- require 'nvim-treesitter.install'.compilers = { "clang" }
-- This might be a problem, (https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)
-- https://stackoverflow.com/questions/66692772/nvim-treesitter-installation-on-windows
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    -- ensure_installed = { "c", "lua", "latex", "javascript" , "markdown"},
    --[[ ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages ]]
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
--folding
-- vim.cmd "set foldmethod=expr"
-- vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"
-- vim.cmd "set nofoldenable"
