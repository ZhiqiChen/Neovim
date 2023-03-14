local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end
local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- Mason setup
mason.setup({
})


mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "marksman", "ltex", "clangd", "jdtls", "tsserver", "jedi_language_server" },
})

--Automatic server setup
mason_lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,

    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end


    -- ["lua_ls"] = function ()
    --     require('tsserver').setup{
    --         on_attach = on_attach,
    --         flags = lsp_flags,
    --     }
    -- end
}

-- LIST OF LSP servers
-- AWK  awk_ls
-- Ada  als
-- Angular  angularls
-- Ansible  ansiblels
-- Antlers  antlersls
-- Apex     apex_ls
-- Arduino  arduino_language_server
-- Assembly (GAS/NASM, GO)  asm_lsp
-- Astro    astro
-- Bash     bashls
-- Beancount    beancount
-- Bicep    bicep
-- BrighterScript   bright_script
-- Buf  bufls
-- C    clangd
-- C#   csharp_ls
-- C# (docs)    omnisharp_mono
-- C# (docs)    omnisharp
-- C++  clangd
-- CMake    cmake
-- CMake    neocmake
-- CSS  cssls
-- CSS  cssmodules_ls
-- CSS  unocss
-- Clarity  clarity_lsp
-- Clojure  clojure_lsp
-- CodeQL   codeqlls
-- Crystal  crystalline
-- Cucumber     cucumber_language_server
-- Cue  dagger
-- Deno     denols
-- Dhall    dhall_lsp_server
-- Diagnostic (general purpose server)  diagnosticls
-- Dlang    serve_d
-- Docker   dockerls
-- Docker Compose   docker_compose_language_service
-- Dot  dotls
-- Drools   drools_lsp
-- EFM (general purpose server)     efm
-- ESLint   eslint
-- Elixir   elixirls
-- Elm  elmls
-- Ember    ember
-- Emmet    emmet_ls
-- Erg  erg_language_server
-- Erlang   erlangls
-- F#   fsautocomplete
-- Fennel   fennel_language_server
-- Flux     flux_lsp
-- Foam (OpenFOAM)  foam_ls
-- Fortran  fortls
-- Glint    glint
-- Go   golangci_lint_ls
-- Go   gopls
-- Gradle   gradle_ls
-- Grammarly    grammarly
-- GraphQL  graphql
-- Groovy   groovyls
-- HTML     html
-- Haskell  hls
-- Haxe     haxe_language_server
-- Hoon     hoon_ls
-- JSON     jsonls
-- Java     jdtls
-- JavaScript   quick_lint_js
-- JavaScript   tsserver
-- JavaScript   vtsls
-- Jsonnet  jsonnet_ls
-- Julia (docs)     julials
-- Kotlin   kotlin_language_server
-- LaTeX    ltex
-- LaTeX    texlab
-- Lelwel   lelwel_ls
-- Lua  lua_ls
-- Luau     luau_lsp
-- Markdown     marksman
-- Markdown     prosemd_lsp
-- Markdown     remark_ls
-- Markdown     zk
-- Metamath Zero    mm0_ls
-- Move     move_analyzer
-- Nickel   nickel_ls
-- Nim  nimls
-- Nix  nil_ls
-- Nix  rnix
-- OCaml    ocamllsp
-- OneScript, 1C:Enterprise     bsl_ls
-- OpenAPI  spectral
-- OpenCL   opencl_ls
-- OpenSCAD     openscad_lsp
-- PHP  intelephense
-- PHP  phpactor
-- PHP  psalm
-- Perl     perlnavigator
-- Powershell   powershell_es
-- Prisma   prismals
-- Puppet   puppet
-- PureScript   purescriptls
-- Python   jedi_language_server
-- Python   pyre
-- Python   pyright
-- Python   sourcery
-- Python (docs)    pylsp
-- Python   ruff_lsp
-- R    r_language_server
-- Raku     raku_navigator
-- ReScript     rescriptls
-- Reason   reason_ls
-- Robot Framework  robotframework_ls
-- Rome     rome
-- Ruby     ruby_ls
-- Ruby     solargraph
-- Ruby     sorbet
-- Ruby     standardrb
-- Rust     rust_analyzer
-- SQL  sqlls
-- SQL  sqls
-- Salt     salt_ls
-- Shopify Theme Check  theme_check
-- Slint    slint_lsp
-- Smithy   smithy_ls
-- Solidity     solang
-- Solidity     solc
-- Solidity     solidity
-- Sphinx   esbonio
-- Stylelint    stylelint_lsp
-- Svelte   svelte
-- SystemVerilog    svlangserver
-- SystemVerilog    svls
-- SystemVerilog    verible
-- TOML     taplo
-- Tailwind CSS     tailwindcss
-- Teal     teal_ls
-- Terraform    terraformls
-- Terraform (docs)     tflint
-- TypeScript   tsserver
-- TypeScript   vtsls
-- V    vls
-- Vala     vala_ls
-- Veryl    veryl_ls
-- VimL     vimls
-- Visualforce  visualforce_ls
-- Vue  volar
-- Vue  vuels
-- WGSL     wgsl_analyzer
-- XML  lemminx
-- YAML     yamlls
-- Zig  zls
