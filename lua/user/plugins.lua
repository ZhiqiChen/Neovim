local fn = vim.fn

-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return require('packer').startup(function(use)
    -- Background Plugins
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "nvim-tree/nvim-web-devicons" -- many plugins use this icon set
    use "akinsho/bufferline.nvim" -- tabs on the top
    use "moll/vim-bbye"
    use "nvim-lualine/lualine.nvim" -- info bar at the bottom
    use "EdenEast/nightfox.nvim" -- ColorScheme

    -- Language Specific
    -- LaTex
    use "lervag/vimtex"

    -- Functionalities
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use {
        "numToStr/Comment.nvim", -- Easily comment stuff
        config = function()
            require('Comment').setup()
        end
    }
    use "nvim-tree/nvim-tree.lua"
    -- use 'terryma/vim-multiple-cursors'
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "junegunn/vim-easy-align" -- [ga] aligning for markdown tables/matrices

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"  -- lsp completion

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim"
    -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    -- make sure you install ripgrep using a package manager

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    -- use "JoosepAlviste/nvim-ts-context-commentstring" different context comments jsx

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
