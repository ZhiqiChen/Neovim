local status_ok, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not status_ok then
    return
end

local status_ok, dap = pcall(require, "dap")
if not status_ok then
    return
end

mason_nvim_dap.setup({
    ensure_installed = {},
    automatic_setup = true,
    automatic_installation = false,
})

require("mason-nvim-dap").setup_handlers({})
-- List of Dap adapters
-- ['python'] = 'debugpy',
-- ['cppdbg'] = 'cpptools',
-- ['delve'] = 'delve',
-- ['node2'] = 'node-debug2-adapter',
-- ['chrome'] = 'chrome-debug-adapter',
-- ['firefox'] = 'firefox-debug-adapter',
-- ['php'] = 'php-debug-adapter',
-- ['coreclr'] = 'netcoredbg',
-- ['js'] = 'js-debug-adapter',
-- ['codelldb'] = 'codelldb',
-- ['bash'] = 'bash-debug-adapter',
-- ['javadbg'] = 'java-debug-adapter',
-- ['javatest'] = 'java-test',
-- ['mock'] = 'mockdebug',
-- ['puppet'] = 'puppet-editor-services',
-- ['elixir'] = 'elixir-ls',
-- ['kotlin'] = 'kotlin-debug-adapter',
-- ['dart'] = 'dart-debug-adapter',
