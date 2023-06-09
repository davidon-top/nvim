vim.cmd [[packadd packer.nvim]]
return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- lsp
    use {
        "neovim/nvim-lspconfig",
        requires = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "j-hui/fidget.nvim",
            "folke/neodev.nvim",
        },
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        "jay-babu/mason-null-ls.nvim",
    }
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
        config = function()
            require("nvim-navic").setup({
                highlight = true,
            })
        end,
    }
    use {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require"lsp_signature".on_attach() end,
    }
    use {
      'stevearc/aerial.nvim',
      config = function() require('aerial').setup() end
    }

    -- cmp && snippets
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "rafamadriz/friendly-snippets"
        },
    }
    use { "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function ()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = "<M-K>",
                    }
                }
            })
        end
    }
    -- use {"mattn/emmet-vim"}
    use({
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
        end
    })

    -- syntax highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    }
    use "nvim-treesitter/playground"

    -- fzf Telescope
    use {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = {
            "nvim-lua/plenary.nvim"
        }
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        cond = vim.fn.executable "make" == 1
    }
    use "nvim-lua/popup.nvim"

    -- debugging
    use "mfussenegger/nvim-dap"
    use "jay-babu/mason-nvim-dap.nvim"
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap"
        },
        config = function()
            require("dapui").setup()
        end,
    }
    use "nvim-telescope/telescope-dap.nvim"

    -- git
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "lewis6991/gitsigns.nvim"

    -- misc
    -- use {"simrat39/inlay-hints.nvim",
    --     config = {
    --         require("inlay-hints").setup({
    --             renderer = "eol"
    --         })
    --     },
    -- }
    use {"lvimuser/lsp-inlayhints.nvim",
        config = {
            require("lsp-inlayhints").setup()
        }
    }
    use {"s1n7ax/nvim-window-picker"}
    use {"echasnovski/mini.nvim"}
    use {
      'stevearc/oil.nvim',
      config = function() require('oil').setup({
            columns = {
                "icon",
                "permissions",
                "size",
            },
            keymap = {
                ["<Esc>"] = "actions.close",
            },
            view_options = {
                show_hidden = true,
            },
        }) end
    }
    use {"ThePrimeagen/vim-be-good"}
    use 'kazhala/close-buffers.nvim'
    use {"VonHeikemen/fine-cmdline.nvim",
        requires = {{"MunifTanjim/nui.nvim"}},
        config = function()
            require("fine-cmdline").setup({
                cmdline = {
                    prompt = ">",
                }
            })
            vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
        end
    }
    use {'stevearc/dressing.nvim',
        config = function()
            require('dressing').setup()
        end
    }
    use {
      'stevearc/overseer.nvim',
      config = function()
            require('overseer').setup({
                strategy = "toggleterm",
            })
        end
    }
    use "itchyny/screensaver.vim"
        use "christoomey/vim-tmux-navigator"
    use { 'anuvyklack/pretty-fold.nvim',
       config = function()
          require('pretty-fold').setup()
       end
    }
    use 'eandrju/cellular-automaton.nvim'
    use {
        "ahmedkhalf/project.nvim",
        config = function()
          require("project_nvim").setup {
          }
        end
    }
    use "dhruvasagar/vim-table-mode"
    use "editorconfig/editorconfig-vim"
    use "andweeb/presence.nvim"
    use {
        "nacro90/numb.nvim",
        config = function ()
            require("numb").setup()
        end
    }
    use {"ellisonleao/glow.nvim",
        config = function ()
            require("glow").setup()
        end
    }
    use {"kylechui/nvim-surround",
        config = function ()
            require("nvim-surround").setup({})
        end
    }
    -- use {"tpope/vim-surround"}
    use {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
            -- vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
            -- vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
        end,
    }
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                filters = {
                    dotfiles = true,
                },
            })
        end,
    }

    -- misc editing
    use "tpope/vim-sleuth"
    use "mbbill/undotree"
    use {
        "windwp/nvim-autopairs",
        --config = function() require("nvim-autopairs").setup {} end
    }
    use {"windwp/nvim-ts-autotag",
        config = function ()
            require("nvim-ts-autotag").setup()
        end
    }
    use {"mg979/vim-visual-multi",
        config = function ()
            vim.cmd("let g:VM_leader='<Space>m'")
        end
    }

    -- mics visuals
    use { 'bennypowers/nvim-regexplainer',
      config = function() require'regexplainer'.setup() end,
      requires = {
        'nvim-treesitter/nvim-treesitter',
        'MunifTanjim/nui.nvim',
      } }
    use {"rcarriga/nvim-notify", 
        config = function ()
            vim.notify = require("notify")
        end
    }
    use {
      'nmac427/guess-indent.nvim',
      config = function() require('guess-indent').setup {} end,
    }
    use('mrjones2014/smart-splits.nvim')
    -- use 'glepnir/dashboard-nvim'
    use {"goolord/alpha-nvim", config = function () end}
    -- use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
    --use {"akinsho/bufferline.nvim", tag = "v3.*",}
    use "preservim/nerdtree"
    use {"nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    }
    use {"jistr/vim-nerdtree-tabs"}
    use {
        "kevinhwang91/nvim-bqf",
        event = { "BufRead", "BufNew" },
        config = function()
            require("bqf").setup({
                auto_enable = true,
                preview = {
                    win_height = 12,
                    win_vheight = 12,
                    delay_syntax = 80,
                    border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                },
                func_map = {
                    vsplit = "",
                    ptogglemode = "z,",
                    stoggleup = "",
                },
                filter = {
                    fzf = {
                        action_for = { ["ctrl-s"] = "split" },
                        extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                    },
                },
            })
        end,
      }
    use {"kyazdani42/nvim-web-devicons"}
    use {"ap/vim-css-color"}
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require('indent_blankline').setup {
                char = '┊',
                show_trailing_blankline_indent = false,
                filetype_exclude = {"dashboard"},
            }
        end,
    }
    use {
        "folke/which-key.nvim",
        config = function()
            local wk = require("which-key")
            wk.setup {
                popup_mappings = {
                    scroll_down = "<C-j>",
                    scroll_up = "<C-k>",
                },
                window = {
                    border = "single",
                },
            }
        end
    }
    use {"rebelot/heirline.nvim",
    }
    -- use "nvim-lualine/lualine.nvim"
    use {
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("toggleterm").setup{
                direction = "float",
                float_opts = {
                    border = "curved"
                },
            }
        end,
    }
    use {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require("neoscroll").setup({
                mappings = {"<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb"},
                hide_cursor = true,
                stop_eof = true,
                use_local_scrolloff = false,
                respect_scrolloff = false,
                cursor_scrolls_alone = true,
                easing_function = nil,
                pre_hook = nil,
                post_hook = nil,
            })
        end
    }
    use {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup{}
        end,
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "SmiteshP/nvim-navbuddy",
        requires = {"neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
        "numToStr/Comment.nvim",
        "nvim-telescope/telescope.nvim"},
        config = function ()
            require("nvim-navbuddy").setup({
                window = {border="rounded",},
            })
        end,
    }
    use {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    }
    use {
        "felipec/vim-sanegx",
        event = "BufRead",
    }
    use {
        "gelguy/wilder.nvim",
        config = function()
          vim.cmd('call wilder#setup({"modes": [":", "/", "?"]})')
          vim.cmd('call wilder#set_option("renderer", wilder#popupmenu_renderer({"highlighter": wilder#basic_highlighter(), "left": [ " ", wilder#popupmenu_devicons(), ], "right": [ " ", wilder#popupmenu_scrollbar(), ], "pumblend": 20}))')
          vim.cmd('call wilder#set_option("renderer", wilder#popupmenu_renderer(wilder#popupmenu_border_theme({"highlighter": wilder#basic_highlighter(), "min_width": "100%", "min_height": "50%", "reverse": 0, "highlights": {"border": "Normal",},"border": "rounded"})))')
        end,
      }

    -- lenguage specific
    -- nim
    use {"alaviss/nim.nvim"}
    -- use {"zah/nim.vim"}

    -- csv
    use {
        'cameron-wags/rainbow_csv.nvim',
        config = function()
            require 'rainbow_csv'.setup()
        end,
        -- optional lazy-loading below
        -- module = {
        --     'rainbow_csv',
        --     'rainbow_csv.fns'
        -- },
        -- ft = {
        --     'csv',
        --     'tsv',
        --     'csv_semicolon',
        --     'csv_whitespace',
        --     'csv_pipe',
        --     'rfc_csv',
        --     'rfc_semicolon'
        -- }
    }
    -- rust
    use {"racer-rust/vim-racer",
        config = function ()
            vim.cmd [[ let g:racer_cmd = "/usr/bin/racer"]]
        end
    }
    use "simrat39/rust-tools.nvim"
    use {
        "saecki/crates.nvim",
        tag = "v0.3.0",
        requires = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("crates").setup()
        end,
    }

    -- zig
    use "ziglang/zig.vim"
    use({
      "NTBBloodbath/zig-tools.nvim",
      -- Load zig-tools.nvim only in Zig buffers
      ft = "zig",
      config = function()
        -- Initialize with default config
        require("zig-tools").setup({
                integrations = {
                    zls = {
                        hints = true,
                    }
                }
            })
      end,
    })

    -- java
    use "mfussenegger/nvim-jdtls"

    -- c && c++ && cmake
    use { "igankevich/mesonic",
        config = function()
            vim.cmd[[
            let b:meson_command = 'meson'
            let b:meson_ninja_command = 'ninja'

            autocmd FileType c call ConsiderMesonForLinting()
            function ConsiderMesonForLinting()
                if filereadable('meson.build')
                    let g:syntastic_c_checkers = ['meson']
                endif
            endfunction
            ]]
        end
    }
    use "cdelledonne/vim-cmake"

    -- web
    use { "evanleck/vim-svelte" }
    use { "posva/vim-vue" }

    -- yuck
    use "elkowar/yuck.vim"

    -- themes
    use "xiyaowong/transparent.nvim"

    -- f#
    use {"adelarsq/neofsharp.vim"}
    use {"autozimu/LanguageClient-neovim", branch = "next", run = "bash install.sh"}
    use {"ionide/Ionide-vim"}


    use "sainnhe/gruvbox-material"
    use "shaunsingh/nord.nvim"
    use "projekt0n/github-nvim-theme"
    use "EdenEast/nightfox.nvim"
    use "Everblush/nvim"
    use "olimorris/onedarkpro.nvim"
    use "rmehri01/onenord.nvim"
    use "luisiacc/gruvbox-baby"
    use "tiagovla/tokyodark.nvim"
    use "cpea2506/one_monokai.nvim"
    use "yazeed1s/minimal.nvim"
    use "Mofiqul/adwaita.nvim"
    use "kvrohit/mellow.nvim"
    use "yazeed1s/oh-lucy.nvim"
    use "marko-cerovac/material.nvim"
    use "sainnhe/sonokai"
    use "rebelot/kanagawa.nvim"
    use { "catppuccin/nvim", as = "catppuccin", config = function ()
        require("catppuccin").setup({
            flavor = "macchiato",
            navic = {
                enabled = true,
                custom_bg = "NONE",
            },
            indent_blankline = {
                enabled = true,
                colored_indent_levels = true,
            },
            dap = {
                enabled = true,
                enable_ui = true,
            },
            integrations = {
                hop = true,
                cmp = true,
                telescope = true,
                which_key = true,
            },
            -- color_overrides = {
            --     macchiato = {
            --         base = "#000000",
            --         mantle = "#000000",
            --         crust = "#000000"
            --     }
            -- }
        })
        vim.cmd("colorscheme catppuccin")
    end }
end)
