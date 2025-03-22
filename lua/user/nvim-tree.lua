-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

-- local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
-- if not config_status_ok then
--     return
-- end
--
-- local tree_cb = nvim_tree_config.nvim_tree_callback
--
nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    renderer = {
        root_folder_modifier = ":t",
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            },
        },
    },

    update_cwd = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
--     update_focused_file = {
--         enable = true,
--         update_cwd = true,
--         ignore_list = {},
--     },
--     system_open = {
--         cmd = nil,
--         args = {},
--     },
--     filters = {
--         dotfiles = false,
--         custom = {},
--     },
--     git = {
--         enable = true,
--         ignore = true,
--         timeout = 500,
--     },
--     view = {
--         hide_root_folder = false,
--         side = "left",
--         adaptive_size = true,
--         mappings = {
--             custom_only = false,
--             list = {
--                 { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
--                 { key = "h", cb = tree_cb("close_node") },
--                 { key = "v", cb = tree_cb("vsplit") },
--             },
--         },
--         number = false,
--         relativenumber = false,
--     },
--     trash = {
--         cmd = "trash",
--         require_confirm = true,
--     }
})

--AUTO Close Feature workaround as it was removed from nvim-tree
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
