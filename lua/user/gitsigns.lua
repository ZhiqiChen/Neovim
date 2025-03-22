local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    return
end

gitsigns.setup {
    signs = {
        add = {text = "▎"},
        change = { text = "▎"},
        delete = { text = "契"},
        topdelete = { text = "契"},
        changedelete = { text = "▎"},
    }
    ,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end
        -- Navigation
        map('n', ']h', function()
            if vim.wo.diff then
                vim.cmd.normal({']h', bang = true})
            else
                gitsigns.nav_hunk('next')
            end
        end)

        map('n', '[h', function()
            if vim.wo.diff then
                vim.cmd.normal({'[h', bang = true})
            else
                gitsigns.nav_hunk('prev')
            end
        end)

        -- Action
        map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map({'n', 'v'}, '<leader>hu', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hh', gs.preview_hunk)
        -- map('n', '<leader>hS', gs.stage_buffer)
        -- map('n', '<leader>hR', gs.reset_buffer)
        -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        -- map('n', '<leader>tb', gs.toggle_current_line_blame)
        -- map('n', '<leader>hd', gs.diffthis)
        -- map('n', '<leader>hD', function() gs.diffthis('~') end)
        -- map('n', '<leader>td', gs.toggle_deleted)
        --
        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

    end
}
