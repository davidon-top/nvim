require('neodev').setup()
-- vim.lsp.ensure_installed({
--     "clangd",
--     "gopls",
--     "jdtls",
--     "eslint",
--     "tailwindcss",
--     "tsserver",
--     "cssmodules_ls",
--     "rome",
--     "jsonls",
--     "sumneko_lua",
--     "pylsp",
--     "rust_analyzer",
--     "stylelint_lsp",
-- })

local navic = require("nvim-navic")
navic.setup {
    icons = {
        File          = " ",
        Module        = " ",
        Namespace     = " ",
        Package       = " ",
        Class         = " ",
        Method        = " ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "練",
        Interface     = "練",
        Function      = " ",
        Variable      = " ",
        Constant      = " ",
        String        = " ",
        Number        = " ",
        Boolean       = "◩ ",
        Array         = " ",
        Object        = " ",
        Key           = " ",
        Null          = "ﳠ ",
        EnumMember    = " ",
        Struct        = " ",
        Event         = " ",
        Operator      = " ",
        TypeParameter = " ",
    },
    highlight = false,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true
}
local on_attach = function(client, bufnr)
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
  
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
        require("nvim-navbuddy").attach(client, bufnr)
    end

    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  
    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  
    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

local servers = {
    clangd = {},
    gopls = {},
    pyright = {},
    rust_analyzer = {},
    tsserver = {},
    -- sumneko_lua = {
    --     Lua = {
    --         workspace = { checkThirdParty = false },
    --         telemetry = { enable = false },
    --     },
    -- },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup()
require("mason-nvim-dap").setup({automatic_installation = true, handlers = {
    function (config)
        require("mason-nvim-dap").default_setup(config)
    end
}})
local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}
mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}

require("lspconfig").nimls.setup{
    cmd = {"nimlsp", "--log", "/tmp/nimlsp.log"},
    on_attach = on_attach,
}

-- lspinfo
require('fidget').setup()

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local cmp = require 'cmp'
local luasnip = require 'luasnip'



cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        -- ["<C-y>"] = cmp.mapping.confirm({ slelect = true}),
        ["<C-Space><C-Space>"] = cmp.mapping.complete({}),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
            cmp.select_next_item()
            -- elseif luasnip.expand_or_jumpable() then
            -- luasnip.expand_or_jump()
            else
            fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
            cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
            else
            fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = "crates" },
    },
}

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

vim.diagnostic.config({
    signs = true,
    underline = true,
    update_in_insert = true,
    virtual_text = true,
})

require("cmp").config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter,
    behavior = cmp.SelectBehavior.Select,
}

-- require('tabnine').setup({
--   disable_auto_comment=true,
--   accept_keymap="<Tab>",
--   dismiss_keymap = "<C-]>",
--   debounce_ms = 300,
--   suggestion_color = {gui = "#808080", cterm = 244},
--   execlude_filetypes = {"TelescopePrompt"}
-- })


require("aerial").setup({})

require("dap")

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
