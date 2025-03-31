require "user.plugins"
require "user.options"
require "user.keymaps"
require "user.dashboard"
require "user.nvim-tree"
require "user.autopairs"
require "user.gitsigns"
require "user.bufferline"
require "user.lualine"
require "user.telescope"
require "user.lsp"
-- require "user.nullLS"
-- require "user.dap"
require "user.cmp"
require "user.treesitter" --install llvm and Clang

-- Notes for installation
-- packer install
-- clang and gcc install for treesitter 
--  (On windows install YOU MUST install visual studio and clang thro visual studio installer!)
--  Install the desktop dev C++ tools in the installer
--  in nodejs folder "npm install tree-sitter-cli"
--  Make sure to add env variables to path for LLVM and MSVC, tree-sitter-cli (the right version x64)
-- ripgrep for telescope
