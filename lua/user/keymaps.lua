local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-f>", "<C-w>o", opts) -- remove other splits except the focus

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Other Helpful Keymaps to keep cursor in the middle
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Change directory to current file
keymap("n", "<leader>cd", ":cd %:h<CR>", opts)

-- Insert --
-- Basic stuff from other editors
keymap("i", "<C-h>", "<C-w>", opts)
keymap("i", "<C-BS>", "<C-w>", opts)
keymap("i", "<C-CR>", "<Esc>A<CR>", opts)
keymap("i", "<C-s>", "<Esc>:w<CR>a", opts)
keymap("i", "<C-v>", "<C-r>+", opts)

-- spellchecking
keymap("i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap("t", "<C-v>", "<C-r>+", term_opts)

-- Command --
keymap("c", "<C-h>", "<C-w>", opts)
keymap("c", "<C-BS>", "<C-w>", opts)
keymap("c", "<C-v>", "<C-r>+", opts)

-- Plugins --
-- Nvimtree
keymap("n", "<leader>n", ":NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<cr>", opts)
keymap("n", "<C-g>", ":Telescope live_grep<cr>", opts)

-- nvim cmp
keymap("n", "<A-[>", ":lua require('cmp').setup.buffer { enabled = false }<CR>", opts)
keymap("n", "<A-]>", ":lua require('cmp').setup.buffer { enabled = true }<CR>", opts)
-- keymap("i", "<A-[>", "<Esc>:lua require('cmp').setup.buffer { enabled = false }", opts)

-- luasnip
keymap("i", "jk", "<Esc>:lua require('luasnip').expand_or_jump()<CR>", opts)

-- Easy Align
keymap("n", "ga", ":EasyAlign<CR>", opts)
keymap("x", "ga", ":EasyAlign<CR>", opts)

-- null-ls format
keymap("n", "<leader>ff", ":lua vim.lsp.buf.format()<CR>", opts)
-- vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = false } vim.cmd ":%retab!" end, bufopts) --async=false to enforce tabbing

-- lsp 
keymap("n", "<A-CR>", ":lua vim.lsp.buf.code_action()<CR>", opts)
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- keymap('n', '<leader>e', "vim.diagnostic.open_float", opts)
-- keymap('n', '[d', "vim.diagnostic.goto_prev", opts) -- already part of vim default
-- keymap('n', ']d', "vim.diagnostic.goto_next", opts)
-- keymap('n', '<leader>q', "vim.diagnostic.setloclist", opts)
-- *** MORE IN lsp file!!


-- undotree
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- DAP
keymap("n", "<F5>", ":lua require('dap').continue()<CR>", opts)
keymap("n", "<F10>", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<F11>", ":lua require('dap').step_into()<CR>", opts)
keymap("n", "<F12>", ":lua require('dap').step_out()<CR>", opts)
keymap("n", "<Leader>b", ":lua require('dap').toggle_breakpoint()<CR>", opts)
-- keymap('n', '<Leader>B', ":lua require('dap').set_breakpoint()<CR>", opts)
keymap("n", "<Leader>lp", ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap("n", "<Leader>dr", ":lua require('dap').repl.open()<CR>", opts)
keymap("n", "<Leader>dl", ":lua require('dap').run_last()<CR>", opts)
-- keymap({ 'n', 'v' }, '<Leader>dh', function()
--     require('dap.ui.widgets').hover()
-- end, opts)
-- keymap({ 'n', 'v' }, '<Leader>dp', function()
--     require('dap.ui.widgets').preview()
-- end, opts)
-- keymap('n', '<Leader>df', function()
--     local widgets = require('dap.ui.widgets')
--     widgets.centered_float(widgets.frames)
-- end, opts)
-- keymap('n', '<Leader>ds', function()
--     local widgets = require('dap.ui.widgets')
--     widgets.centered_float(widgets.scopes)
-- end, opts)
