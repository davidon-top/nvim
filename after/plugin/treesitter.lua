vim.filetype.add({extension = {wgsl = "wgsl"}})

require"nvim-treesitter.configs".setup {
    ensure_installed = { "wgsl", "bash", "cmake", "cpp", "dockerfile", "gitignore", "glsl", "go", "graphql", "html", "java", "javascript", "json5", "kotlin", "markdown", "python", "rasi", "regex", "c", "lua", "rust", "scss", "sql", "sxhkdrc", "toml", "tsx", "typescript", "yaml"  },
    sync_install = false,
    auto_install = true,
    indent = { enable = true, disable = { 'python' } },
    highlight = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  }

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99 -- do not close folds when a buffer is opened
