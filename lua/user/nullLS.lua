local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then
    return
end

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

mason_null_ls.setup({
    ensure_installed = {
        -- Opt to list sources here, when available in mason.
    },
    automatic_installation = false,
    automatic_setup = true,         -- Recommended, but optional
})
null_ls.setup({
    sources = {
        -- Anything not supported by mason.
    }
})

require 'mason-null-ls'.setup_handlers()                             -- If `automatic_setup` is true.

--                             Note: This is my personal preference.
