require 'nvim-treesitter.install'.compilers = { "clang" }
-- This might be a problem, (https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)
-- https://stackoverflow.com/questions/66692772/nvim-treesitter-installation-on-windows
local status_ok, configs = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

-- configs.setup {}

-- required installs
-- require'nvim-treesitter'.install { 'lua', 'javascript', 'markdown', 'c', 'lua', 'latex'}

-- Highlighting Enable
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '<filetype>' },
      callback = function() vim.treesitter.start() end,
})
--folding
-- vim.cmd "set foldmethod=expr"
-- vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"
-- vim.cmd "set nofoldenable"
