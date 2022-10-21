-- :help options
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.autoindent = true
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.number = true                           -- set numbered lines
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.smartcase = true                        -- smart case
vim.opt.incsearch = true
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.sidescrolloff = 8
-- vim.opt.colorcolumn = 80                        -- TODO
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time. For git and stuff
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
-- vim.opt.showtabline = 2                         -- always show tabs
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.guifont = "JetBrains Mono:h13"          -- the font used in graphical neovim applications, use :set guifont=* to display gui for selection
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.backup = false                          -- creates a backup file

vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.pumheight = 10                          -- pop up menu height

vim.cmd "colorscheme nordfox"
